package com.its.bookhub.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.its.bookhub.model.Book;
import com.its.bookhub.model.Challenge;

import io.micrometer.common.lang.Nullable;

public class ExtendedChallengeMapper extends ChallengeMapper{
	
	@Override
	public @Nullable Challenge mapRow(ResultSet rs, int rowNum) throws SQLException {
		Challenge challenge = super.mapRow(rs, rowNum);
		Integer numUsers = rs.getInt("USERS");
		String userPart = rs.getString("USER_ID");
		
		//if(numUsers == null)
		//	numUsers = 0;
		
		challenge.setNumUsers(numUsers);
		
		if(userPart == null)
			challenge.setChPartecipation(false);
		else
			challenge.setChPartecipation(true);
		
		return challenge;
	}
}
