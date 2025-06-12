package com.its.bookhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.its.bookhub.mapper.UserMapper;
import com.its.bookhub.model.User;

@Repository
public class UserRepository {

	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	
	 public Integer countUsers() {		
		 String query = "SELECT COUNT(*) FROM USER";
	     return jdbcTemplate.queryForObject(query, Integer.class);
	 }
	 
	 public int save(User user) {
		 	String query = "INSERT INTO USER(name, password) values(?,?)";
	        return jdbcTemplate.update(query,
	                				   user.getName(), user.getPassword());
	 }

	    
	 public int update(User user) {
		 String query = "UPDATE USER SET PASSWORD = ? WHERE ID = ?";
	        return jdbcTemplate.update(query,
	                                   user.getPassword(), "");
	 }
 
	 public List<User> findAll() {
		 	String query = "SELECT * USER";		 	
		 	List<User> users = jdbcTemplate.query(query,
	                                              new UserMapper());
		 	return users;
	 }
	 
	 public User findById(Long id) {
		 	String query = "SELECT * USER WHERE ID = ?";		 	
		 	User user = jdbcTemplate.queryForObject(query,
	                                                new UserMapper(),
	                                                new Object[]{id});
		 	return user;
	 }
	 
	 public int deleteById(Long id) {
		 	String query = "DELETE USER WHERE ID = ?";	
	        return jdbcTemplate.update(query,
	                                   id);
	 }
}
