package com.its.readchallenge.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.its.readchallenge.mapper.UserMapper;
import com.its.readchallenge.model.User;

@Repository

public class UserRepository {

	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	 public Integer countUsers() {		
		 String query = "SELECT COUNT(*) FROM USERS";
	     return jdbcTemplate.queryForObject(query, Integer.class);
	 }

	 public int insert(User user) {
		 	String query = "INSERT INTO USERS(name, password, email) values(?,?,?)";
	        return jdbcTemplate.update(query,
	                				   user.getUsername(), user.getPassword(), user.getEmail());
	 }

	 public int update(User user) {
		 String query = "UPDATE USERS SET NAME = ?, PASSWORD = ?, EMAIL = ? WHERE ID = ?";
	     return jdbcTemplate.update(query,
	                                  user.getUsername() ,user.getPassword(), user.getEmail(), user.getId() );
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
		 	String query = "DELETE FROM USERS WHERE ID = ?";	
	        return jdbcTemplate.update(query,
	                                   id);
	 }
	 
	 public User findByusernamePassword(String username, String password){
		 
		 String query = "SELECT * FROM USERS WHERE NAME = ? AND PASSWORD = ?";
		 User user = jdbcTemplate.queryForObject(query,
                 new UserMapper(),
                 new Object[]{username, password});
		 return user;
	 }
	 
}





