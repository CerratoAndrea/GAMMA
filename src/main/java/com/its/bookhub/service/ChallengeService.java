package com.its.bookhub.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.its.bookhub.model.Book;
import com.its.bookhub.model.Challenge;
import com.its.bookhub.model.UserRank;
import com.its.bookhub.repository.BookRepository;
import com.its.bookhub.repository.ChallengeRepository;
import com.its.bookhub.repository.UserRepository;

@Service
public class ChallengeService {
	
	@Autowired
	ChallengeRepository challengeRepository;
	@Autowired
	UserRepository userRepository;
	@Autowired
	BookRepository bookRepository;
	
	public List<Challenge> getChallenges(Long user_id, String type) {
			
		switch (type) {
		case "tutte":
			return challengeRepository.getChallenges(user_id);
		case "mie":
			return challengeRepository.getUserChallenges(user_id);
		case "aperte":
			return challengeRepository.getOpenChallenges(user_id);
		case "chiuse":
			return challengeRepository.getClosedChallenges(user_id);
		default:
			return challengeRepository.getChallenges(user_id);
		}
			
			
	}
	public List<UserRank> findByChallenge(Long challenge_id){
		return userRepository.findByChallenge(challenge_id);
	}
	
	public int getUserPoints(Long user_id, Long ch_id){
		List<Book> books = bookRepository.getChallengeUserBooks(user_id, ch_id);
		int points = 0;
		for (Book book : books) {
			points += book.getPages();
		}
		
		return points;
	}
	public int getUserBooksRead(Long user_id, Long ch_id){
		List<Book> books = bookRepository.getChallengeUserBooks(user_id, ch_id);
		
		return books.size();
	}
	public int getReadBooks(Long user_id, Long ch_id) {
		List<Book> books = bookRepository.getChallengeUserBooks(user_id, ch_id);
		int booksRead = books.size();
		return booksRead;
	}
	
	 public Challenge findById (long Id) {
		 return challengeRepository.findById(Id);
		 
	 }
	 public void joinChallenge(Long user_id, Long ch_id ) {
		 
		 challengeRepository.joinChallenge(user_id, ch_id);
	 }
	 public void leaveChallenge(Long user_id, Long ch_id ) {
		 
		 challengeRepository.leaveChallenge(user_id, ch_id);
	 }
	 
	 public List<Book> findAll() {
		 return bookRepository.findAll();	 }
	 
	 public int createChallenge(String description, String title, Date endDate) {
		 return challengeRepository.create(description,title,endDate);	
	 }
	 
	 public int addBookChallenge( Long chId, Long bookId) {
		 return bookRepository.addBookChallenge(chId, bookId);
	 }
	 public Challenge findAfterCreation(String description, String title, Date endDate) {
		 return challengeRepository.findByAll(description,title,endDate);	
	 }
	 
	 public List<Book> findBookByChallenge(long userId, long chId) {
		 return bookRepository.findByChallenge(userId, chId);
	 }
	 
	 public Long findUserIdByChId(Long chId, Long idUser) {
		 return userRepository.findUserIdByChId(chId, idUser);
	 }
	 
	 public int deleteChallengeUserBooks(Long userId, Long chId) {
		 return challengeRepository.deleteChallengeUserBooks(chId, userId);	
	 }
	 public int addChallengeUserBook( Long chId, Long bookId, Long  userId) {
		 return challengeRepository.addChallengeUserBook(chId, bookId,userId);	
	 }
	 
	}
	



