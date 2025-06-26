package com.its.bookhub.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.its.bookhub.model.Challenge;

import io.micrometer.common.lang.Nullable;

public class ChallengeMapper implements RowMapper<Challenge> {

    @Override
    public @Nullable Challenge mapRow(ResultSet rs, int rowNum) throws SQLException {
        Challenge challenge = new Challenge();
        challenge.setId(rs.getLong("ID"));
        challenge.setTitle(rs.getString("TITLE"));
        challenge.setDescription(rs.getString("DESCRIPTION"));
        challenge.setStartDate(rs.getDate("START_DATE"));
        challenge.setEndDate(rs.getDate("END_DATE"));
        
        return challenge;
    }
}