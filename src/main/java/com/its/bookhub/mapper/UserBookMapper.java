package com.its.bookhub.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.its.bookhub.model.Book;

import io.micrometer.common.lang.Nullable;

public class UserBookMapper extends BookMapper{
	

	@Override
	public @Nullable Book mapRow(ResultSet rs, int rowNum) throws SQLException {
		Book book = super.mapRow(rs, rowNum);
		String read = rs.getString("READ");
		
		if(read != null)
			book.setRead(rs.getBoolean("READ"));
		else
			book.setRead(null);
		
		return book;
	}
}
