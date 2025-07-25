package com.its.bookhub.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.its.bookhub.model.Book;
import com.its.bookhub.model.Challenge;
import com.its.bookhub.model.User;
import com.its.bookhub.model.UserRank;
import com.its.bookhub.service.BookService;
import com.its.bookhub.service.ChallengeService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ChallengeController {

	@Autowired
	ChallengeService challengeService;
	
	@Autowired
	BookService bookService;
	
	@PostMapping("/joinChallenge")
    public String joinChallenge(ModelMap model, HttpSession session, 
    		                    @RequestParam(required = false) Long ch_id){
		Challenge challenge = challengeService.findById(ch_id);
		Date nowDate = new Date();
	    if(challenge.getEndDate().after(nowDate)) {
	       	User user = (User)session.getAttribute("user");
	   		challengeService.joinChallenge(user.getId(), ch_id);
	    }
	    
		return visChallenge(model, session ,ch_id);
	}
	
	@PostMapping("/leaveChallenge")
    public String leaveChallenge(ModelMap model, HttpSession session, 
    		                    @RequestParam(required = false) Long ch_id){
		Challenge challenge = challengeService.findById(ch_id);
		Date nowDate = new Date();
	    if(challenge.getEndDate().after(nowDate)) {
	       	User user = (User)session.getAttribute("user");
	   		challengeService.leaveChallenge(user.getId(), ch_id);
	    }
	    
		return challenge(model, session, null, null);
	}
	
	@GetMapping("/challenge")
    public String challenge(ModelMap model,
    						HttpSession session, 
    		                @RequestParam(required = false) Long ch_id,
    		                @RequestParam (required = false) String type){
		
		
		System.out.println("ch type "+type);
		
		if(type == null || type.trim().equals(""))
			type = "tutte";
		model.put("filtro", type);
		
		
		System.out.println("ch_id "+ch_id);
		User user = (User)session.getAttribute("user");
		UserRank userRank = new UserRank();
		userRank.setUsername(user.getName());
		
		List<Challenge> challenges = challengeService.getChallenges(user.getId(), type);
		for(Challenge challenge :challenges) {
			System.out.println("ch_id "+challenge.getId());
			System.out.println("bool "+challenge.getChPartecipation());
		}
		
		model.put("Challenges", challenges);
		
		if(ch_id == null) {
			if(challenges != null && !challenges.isEmpty()) {
				List<UserRank> users = returnRankingByChallenge(challenges.get(0).getId());
				model.put("Users", users);
				model.put("ChallengeName", challenges.get(0).getTitle());
			}
		}
		else {
			List<UserRank> users = returnRankingByChallenge(ch_id);
			model.put("Users", users);
			model.put("ChallengeName", challengeService.findById(ch_id).getTitle());
		}
		
		return "listaChallenge";
	}
	
    @GetMapping("/createChallenge")
    public String createChallenge(ModelMap model, 
    							  HttpSession session){
    	
    	List<Book> books = challengeService.findAll();  
        
        model.put("libBooks", books);
         
        return "createChallenge";
    }
    
    @GetMapping("/visChallenge")
    public String visChallenge(ModelMap model,
    						   HttpSession session,
    		                   @RequestParam(required = true) Long id){
    	
    	User user = (User)session.getAttribute("user");
    	
    	Challenge challenge = challengeService.findById(id);
        model.put("challenge", challenge);
         
        List<Book> books = challengeService.findBookByChallenge(user.getId(), id);
        model.put("libBooks", books);        
        
        Long userId = challengeService.findUserIdByChId(id, user.getId());
        Date nowDate = new Date();
        if(userId != null && challenge.getEndDate().after(nowDate))
        	model.put("readOnly", false);
        else
        	model.put("readOnly", true);
        
        return "visChallenge";
    }
    
    private List<UserRank> returnRankingByChallenge(Long ch_id){
    	
    	List<UserRank> users = challengeService.findByChallenge(ch_id);
    	for (UserRank user : users) {
			int points = challengeService.getUserPoints(user.getId(), ch_id);
			
			user.setPoints(points);
			user.setBooksRead(challengeService.getReadBooks(user.getId(), ch_id));
		}
    	users.sort(Comparator.comparing(UserRank::getPoints).reversed());
		
    	return users;
    }
    
    @PostMapping("/saveChallenge")
    public String saveChallenge(ModelMap model,
    							HttpSession session,
    							@RequestParam String name, 
    							@RequestParam String endDate, 
    							@RequestParam String desc, 
    							@RequestParam List<Long> book ){
    
    	System.out.println(endDate);
    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    	Date endDateParsed = null;
    	try {
			endDateParsed = formatter.parse(endDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	
    	challengeService.createChallenge(desc, name, endDateParsed);
    	Challenge challenge = challengeService.findAfterCreation(desc,name,endDateParsed);
    	
    	for(Long b : book)
    		challengeService.addBookChallenge(challenge.getId(), b);
    		
  	return challenge(model, session, null, null);
    }
    
    @PostMapping("/updateChallenge")
    public String updateChallenge(ModelMap model,
    							  HttpSession session,
    							  @RequestParam Long id,
    							  @RequestParam(required = false) List<Long> book ){
    	
    	User user = (User)session.getAttribute("user");
    	System.out.println("delete user id "+user.getId());
    	System.out.println("delete ch id "+id);
    	
    	int deleted = challengeService.deleteChallengeUserBooks(user.getId(), id);
    	System.out.println("Book deleted "+deleted);
    	
    	if( book != null)
    		for(Long b : book)
    			challengeService.addChallengeUserBook(id, b, user.getId());
    	
    	List<Book> userBooks = bookService.findByUser(user.getId());
    	List<Long> userBookIds = new ArrayList<Long>();
    	for(Book ub : userBooks)
    		userBookIds.add((long) ub.getId());
    	
    	if( book != null)
    		for(Long b : book)
    			if(!userBookIds.contains(b))
    				bookService.insertBookReading(user.getId(), b , true);
    	
    	return challenge(model, session, null, null);

    }

}
