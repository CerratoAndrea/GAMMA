package com.its.bookhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.its.bookhub.mapper.ChallengeMapper;
import com.its.bookhub.model.Challenge;

@Repository
public class ChallengeRepository {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public List<Challenge> findAll(){
        String query = "SELECT * FROM CHALLENGE";
        return jdbcTemplate.query(query, new ChallengeMapper());
    }
    
    public List<Challenge> findByTitle(String title){
        String query = "SELECT * FROM CHALLENGE WHERE TITLE = ?";
        return jdbcTemplate.query(query, new ChallengeMapper(), title);
    }

    public List<Challenge> findByGenre(String genre){
        String query = "SELECT * FROM CHALLENGE WHERE GENRE = ?";
        return jdbcTemplate.query(query, new ChallengeMapper(), genre);
    }

    public List<Challenge> findByTitleAndGenre(String title, String genre) {
        String query = "SELECT * FROM CHALLENGE WHERE TITLE = ? AND GENRE = ?";
        return jdbcTemplate.query(query, new ChallengeMapper(), title, genre);
    }

    public List<Challenge> findById (long Id) {
        String query = "SELECT * FROM CHALLENGE WHERE ID = ?";
        return jdbcTemplate.query(query, new ChallengeMapper(), Id);
    }

    public int save(Challenge challenge) {
        String query = "INSERT INTO CHALLENGE(TITLE, GENRE, NUM_PAGES) VALUES(?, ?, ?)";
        return jdbcTemplate.update(query, challenge.getTitle(), challenge.getGenre(), challenge.getNumPages());
    }

    public int update(Challenge challenge) {
        String query = "UPDATE CHALLENGE SET TITLE = ?, GENRE = ?, NUM_PAGES = ? WHERE ID = ?";
        return jdbcTemplate.update(query, challenge.getTitle(), challenge.getGenre(), challenge.getNumPages(), challenge.getId());
    }

    public int deleteById(Long id) {
        String query = "DELETE FROM CHALLENGE WHERE ID = ?";
        return jdbcTemplate.update(query, id);
    }
}