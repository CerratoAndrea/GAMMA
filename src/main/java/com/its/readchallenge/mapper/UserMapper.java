package com.its.readchallenge.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.its.readchallenge.model.User;

public class UserMapper implements RowMapper<User> {
	
	@Override
    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
    	User user = new User();    	
    	user.setUsername(rs.getString("NAME"));
    	user.setPassword(rs.getString("PASSWORD"));
    	user.setEmail(rs.getString("EMAIL"));
    	user.setId(rs.getLong("ID"));
        return user;

    }

}

