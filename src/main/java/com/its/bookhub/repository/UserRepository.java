package com.its.bookhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.its.bookhub.BookHubApplication;
import com.its.bookhub.mapper.UserIdMapper;
import com.its.bookhub.mapper.UserMapper;
import com.its.bookhub.mapper.UserRankMapper;
import com.its.bookhub.model.User;
import com.its.bookhub.model.UserRank;

@Repository
public class UserRepository {

    private final BookHubApplication bookHubApplication;

	@Autowired
    private JdbcTemplate jdbcTemplate;


    UserRepository(BookHubApplication bookHubApplication) {
        this.bookHubApplication = bookHubApplication;
    }
	
	
	 public Integer countUsers() {		
		 String query = "SELECT COUNT(*) FROM USERS";
	     return jdbcTemplate.queryForObject(query, Integer.class);
	 }
	 
	 public int save(User user) {
		 	String query = "INSERT INTO users ( username, password, email) values(?,?,?)";
	        return jdbcTemplate.update(query,
	                				   user.getName(), user.getPassword(), user.getEmail());
	 }

	    
	 public int update(User user) {
		 String query = "UPDATE USERS SET PASSWORD = ?, USERNAME = ?, EMAIL = ? WHERE ID = ?";
	        return jdbcTemplate.update(query,
	                                   user.getPassword(), user.getName(), user.getEmail(), user.getId());
	 }
 
	 public List<User> findAll() {
		 	String query = "SELECT * FROM USERS";		 	
		 	List<User> users = jdbcTemplate.query(query,
	                                              new UserMapper());
		 	return users;
	 }
	 
	 public User findById(Long id) {
		 	String query = "SELECT * FROM USERS WHERE ID = ?";		 	
		 	User user = jdbcTemplate.queryForObject(query,
	                                                new UserMapper(),
	                                                new Object[]{id});
		 	return user;
	 }
	 
	 public int deleteById(Long id) {
		 	String query = "DELETE USERS WHERE ID = ?";	
	        return jdbcTemplate.update(query,
	                                   id);
	 }
	 
	 public User findByNameAndpassowrd(String name, String password ) {
		 System.out.println(name+' '+password);
		 	String query = "SELECT * FROM USERS WHERE USERNAME = ? AND PASSWORD = ?";		 
		 	try {
		 		User user = jdbcTemplate.queryForObject(query,
                        new UserMapper(),
                        new Object[]{name, password});
		 		return user;
			} catch (Exception e) {
				System.out.println(e.getMessage());
				return null;
			}
	 }
	 
	 public List<UserRank> findByChallenge(Long ch_id) {
		 	String query = "SELECT * FROM USERS JOIN USER_CHALLENGE ON id = user_id "
		 				 + "WHERE challenge_id = ? ";		 	
		 	List<UserRank> users = jdbcTemplate.query(query,
	                                              new UserRankMapper(),
	                                              new Object[]{ch_id});
		 	return users;
	 }
	 
	 public Long findUserIdByChId(Long chId, Long idUser) {
		 try {
			 String query = "SELECT USER_ID FROM user_challenge WHERE challenge_id = ? and user_id = ?";
			 Long userId = jdbcTemplate.queryForObject(query,
	                 new UserIdMapper(),
	                 new Object[]{chId, idUser});
			 return userId;
		} catch (Exception e) {
			return null;
		}
		
	 }
}
