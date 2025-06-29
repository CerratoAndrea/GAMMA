package com.its.bookhub.repository;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.its.bookhub.mapper.ChallengeMapper;
import com.its.bookhub.mapper.ExtendedChallengeMapper;
import com.its.bookhub.model.Challenge;

@Repository
public class ChallengeRepository {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public List<Challenge> findAll(){
        String query = "SELECT * FROM CHALLENGES";
        return jdbcTemplate.query(query, new ChallengeMapper());
    }
    
    public List<Challenge> findByTitle(String title){
        String query = "SELECT * FROM CHALLENGES WHERE TITLE = ?";
        return jdbcTemplate.query(query, new ChallengeMapper(), title);
    }

    public List<Challenge> findByGenre(String genre){
        String query = "SELECT * FROM CHALLENGES WHERE GENRE = ?";
        return jdbcTemplate.query(query, new ChallengeMapper(), genre);
    }

    public List<Challenge> findByTitleAndGenre(String title, String genre) {
        String query = "SELECT * FROM CHALLENGES WHERE TITLE = ? AND GENRE = ?";
        return jdbcTemplate.query(query, new ChallengeMapper(), title, genre);
    }

    public Challenge findById (long Id) {
        String query = "SELECT * FROM CHALLENGES WHERE ID = ?";
        return jdbcTemplate.queryForObject(query, new ChallengeMapper(), Id);
    }

    /*public int save(Challenge challenge) {
        String query = "INSERT INTO CHALLENGES(TITLE, GENRE, NUM_PAGES) VALUES(?, ?, ?)";
        return jdbcTemplate.update(query, challenge.getTitle(), challenge.getGenre(), challenge.getNumPages());
    }

    public int update(Challenge challenge) {
        String query = "UPDATE CHALLENGES SET TITLE = ?, GENRE = ?, NUM_PAGES = ? WHERE ID = ?";
        return jdbcTemplate.update(query, challenge.getTitle(), challenge.getGenre(), challenge.getNumPages(), challenge.getId());
    }*/

    public int deleteById(Long id) {
        String query = "DELETE FROM CHALLENGES WHERE ID = ?";
        return jdbcTemplate.update(query, id);
    }
    
    public List<Challenge> getChallenges(long user_id) {
    	String query = "select "
    			+ "	c.*, "
    			+ "	ch_count.users, "
    			+ "	usch.user_id "
    			+ "from "
    			+ "	challenges as c "
    			+ "	left join ( "
    			+ "		select "
    			+ "			challenge_id, "
    			+ "			count(*) as users "
    			+ "		from "
    			+ "			user_challenge "
    			+ "		group by "
    			+ "			challenge_id "
    			+ "	) as ch_count on c.id = ch_count.challenge_id "
    			+ "	left join ( "
    			+ "		select "
    			+ "			* "
    			+ "		from "
    			+ "			user_challenge "
    			+ "		where "
    			+ "			user_id = ?"
    			+ "	) as usch on c.id = usch.challenge_id "
    			+ "ORDER BY c.id desc";		 	
	 	List<Challenge> challenges = jdbcTemplate.query(query,
                                              new ExtendedChallengeMapper(),
                                              new Object[]{user_id});
	 	return challenges;
	}
    
    public List<Challenge> getUserChallenges(long user_id) {
    	String query = "select "
    			+ "	c.*, "
    			+ "	ch_count.users, "
    			+ "	usch.user_id "
    			+ "from "
    			+ "	challenges as c "
    			+ "	left join ( "
    			+ "		select "
    			+ "			challenge_id, "
    			+ "			count(*) as users "
    			+ "		from "
    			+ "			user_challenge "
    			+ "		group by "
    			+ "			challenge_id "
    			+ "	) as ch_count on c.id = ch_count.challenge_id "
    			+ "	join ( "
    			+ "		select "
    			+ "			* "
    			+ "		from "
    			+ "			user_challenge "
    			+ "		where "
    			+ "			user_id = ?"
    			+ "	) as usch on c.id = usch.challenge_id "
    			+ "ORDER BY c.id desc";		 			 	
	 	List<Challenge> challenges = jdbcTemplate.query(query,
                                              new ExtendedChallengeMapper(),
                                              new Object[]{user_id});
	 	return challenges;
	}
    
    public List<Challenge> getClosedChallenges(long user_id) {
    	String query = "select "
    			+ "	c.*, "
    			+ "	ch_count.users, "
    			+ "	usch.user_id "
    			+ "from "
    			+ "	challenges as c "
    			+ "	left join ( "
    			+ "		select "
    			+ "			challenge_id, "
    			+ "			count(*) as users "
    			+ "		from "
    			+ "			user_challenge "
    			+ "		group by "
    			+ "			challenge_id "
    			+ "	) as ch_count on c.id = ch_count.challenge_id "
    			+ "	left join ( "
    			+ "		select "
    			+ "			* "
    			+ "		from "
    			+ "			user_challenge "
    			+ "		where "
    			+ "			user_id = ?"
    			+ "	) as usch on c.id = usch.challenge_id "
    			+ "Where c.end_date < current_date "	
    	 		+ "ORDER BY c.id desc";		 	
	 	List<Challenge> challenges = jdbcTemplate.query(query,
                                              new ExtendedChallengeMapper(),
                                              new Object[]{user_id});
	 	return challenges;
	}
    
    public List<Challenge> getOpenChallenges(long user_id) {
    	String query = "select "
    			+ "	c.*, "
    			+ "	ch_count.users, "
    			+ "	usch.user_id "
    			+ "from "
    			+ "	challenges as c "
    			+ "	left join ( "
    			+ "		select "
    			+ "			challenge_id, "
    			+ "			count(*) as users "
    			+ "		from "
    			+ "			user_challenge "
    			+ "		group by "
    			+ "			challenge_id "
    			+ "	) as ch_count on c.id = ch_count.challenge_id "
    			+ "	left join ( "
    			+ "		select "
    			+ "			* "
    			+ "		from "
    			+ "			user_challenge "
    			+ "		where "
    			+ "			user_id = ?"
    			+ "	) as usch on c.id = usch.challenge_id "
    			+ "Where c.end_date >= current_date "
    	      	+ "ORDER BY c.id desc";		 	
	 	List<Challenge> challenges = jdbcTemplate.query(query,
                                              new ExtendedChallengeMapper(),
                                              new Object[]{user_id});
	 	return challenges;
	}
    
    
    
    
    public int joinChallenge(Long user_id, Long ch_id) {
        String query = "INSERT INTO user_challenge(user_id, challenge_id) VALUES(?, ?)";
        return jdbcTemplate.update(query, user_id,ch_id);
    }
    public int leaveChallenge(Long user_id, Long ch_id) {
        String query = "DELETE FROM user_challenge WHERE challenge_id = ? AND user_id = ?;";
        return jdbcTemplate.update(query, ch_id, user_id);
    }
    
    public int create(String description, String title, Date endDate) {
        String query = "INSERT INTO challenges(description, title, end_date) VALUES (?,?,?)";
       
        return jdbcTemplate.update(query,
        		description, title, endDate);
    }
    
    public Challenge findByAll(String description, String title, Date endDate) {
        String query = "SELECT * FROM CHALLENGES WHERE description = ? and title = ? and end_date = ?;";
       
        return jdbcTemplate.queryForObject(query, new ChallengeMapper(), description, title, endDate);
    }
    
    public int deleteChallengeUserBooks(Long chId, Long userId) {
        String query = "delete from challenge_book_user WHERE challenge_id = ? and user_id = ?";
       
        return jdbcTemplate.update(query,
        		chId, userId);
    }
    public int addChallengeUserBook( Long chId, Long bookId, Long  userId) {
		String query = "INSERT INTO challenge_book_user(challenge_id, book_id, user_id) VALUES (?, ?, ?)";
		 return jdbcTemplate.update(query,
				 					chId, bookId, userId);
	}	
    
}