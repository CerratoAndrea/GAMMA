package com.its.bookhub.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.its.bookhub.model.User;

public class UserMapper implements RowMapper<User> {
    
	@Override
    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
    	User user = new User();
    	user.setId(rs.getLong("ID"));
    	user.setName(rs.getString("USERNAME"));
    	user.setPassword(rs.getString("PASSWORD"));
    	user.setEmail(rs.getString("EMAIL"));
        return user;
    }
}
