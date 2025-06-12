package com.its.bookhub.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.its.bookhub.model.Book;

import io.micrometer.common.lang.Nullable;

public class BookMapper implements RowMapper<Book>{

	@Override
	public @Nullable Book mapRow(ResultSet rs, int rowNum) throws SQLException {
		Book book = new Book();
		book.setAuthor(rs.getString("AUTHOR"));
		book.setTitle(rs.getString("TITLE"));
		book.setId(rs.getLong("ID"));
		
		return book;
	}

}
