package com.its.bookhub.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.its.bookhub.model.UserRank;

import io.micrometer.common.lang.Nullable;

public class UserIdMapper  implements RowMapper<Long>{

	@Override
	public @Nullable Long mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		
		return rs.getLong("USER_ID");
	}
}
