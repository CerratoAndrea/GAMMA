package com.its.bookhub.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.its.bookhub.model.Book;

import io.micrometer.common.lang.Nullable;

public class BookChallengeMapper extends BookMapper{
	

	@Override
	public @Nullable Book mapRow(ResultSet rs, int rowNum) throws SQLException {
		Book book = super.mapRow(rs, rowNum);
		String userId = rs.getString("USER_ID");
		
		if(userId != null)
			book.setRead(true);
		else
			book.setRead(false);
		
		return book;
	}
}
