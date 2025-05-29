package com.its.readchallenge.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.jspecify.annotations.Nullable;
import org.springframework.jdbc.core.RowMapper;

import com.its.readchallenge.model.Book;

public class BookMapper implements RowMapper<Book>{

	@Override
	public @Nullable Book mapRow(ResultSet rs, int rowNum) throws SQLException {
		Book book = new Book();
		book.setAuthor(rs.getString("AUTHOR"));
		book.setTitle(rs.getString("TITLE"));
		book.setId(rs.getInt("ID"));
		
		return book;
	}

}
