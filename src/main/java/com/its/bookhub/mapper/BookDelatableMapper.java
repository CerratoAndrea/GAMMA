package com.its.bookhub.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.its.bookhub.model.Book;

import io.micrometer.common.lang.Nullable;

public class BookDelatableMapper extends BookMapper{
	
	@Override
	public @Nullable Book mapRow(ResultSet rs, int rowNum) throws SQLException {
		Book book = super.mapRow(rs, rowNum);
		
		String book_id = rs.getString("BOOK_ID");
		
		if(book_id == null)
			book.setDeletable(true);
		else
			book.setDeletable(false);
		
		return book;
	}
}
