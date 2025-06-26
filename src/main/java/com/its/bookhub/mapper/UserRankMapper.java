package com.its.bookhub.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.its.bookhub.model.UserRank;

import io.micrometer.common.lang.Nullable;

public class UserRankMapper  implements RowMapper<UserRank>{

	@Override
	public @Nullable UserRank mapRow(ResultSet rs, int rowNum) throws SQLException {
		UserRank userRank = new UserRank();
		
		userRank.setUsername(rs.getString("USERNAME"));
		userRank.setId(rs.getLong("ID"));
		userRank.setPoints(0);
		userRank.setBooksRead(0);
		
		return userRank;
	}
}
