package com.its.bookhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.its.bookhub.model.Book;
import com.its.bookhub.model.Challenge;
import com.its.bookhub.model.UserRank;
import com.its.bookhub.repository.BookRepository;
import com.its.bookhub.repository.ChallengeRepository;
import com.its.bookhub.repository.UserRepository;

@Service
public class ChallengeService {
	
	@Autowired
	ChallengeRepository challengeRepository;
	@Autowired
	UserRepository userRepository;
	@Autowired
	BookRepository bookRepository;
	
	public List<Challenge> getChallenges(Long user_id) {
		return challengeRepository.getChallenges(user_id);
	}
	public List<UserRank> findByChallenge(Long challenge_id){
		return userRepository.findByChallenge(challenge_id);
	}
	
	public int getUserPoints(Long user_id, Long ch_id){
		List<Book> books = bookRepository.getChallengeUserBooks(user_id, ch_id);
		int points = 0;
		for (Book book : books) {
			points += book.getPages();
		}
		
		return points;
	}
	public int getUserBooksRead(Long user_id, Long ch_id){
		List<Book> books = bookRepository.getChallengeUserBooks(user_id, ch_id);
		
		return books.size();
	}
	public int getReadBooks(Long user_id, Long ch_id) {
		List<Book> books = bookRepository.getChallengeUserBooks(user_id, ch_id);
		int booksRead = books.size();
		return booksRead;
	}
	
	 public Challenge findById (long Id) {
		 return challengeRepository.findById(Id);
		 
	 }
	 public void joinChallenge(Long user_id, Long ch_id ) {
		 
		 challengeRepository.joinChallenge(user_id, ch_id);
	 }
	 public void leaveChallenge(Long user_id, Long ch_id ) {
		 
		 challengeRepository.leaveChallenge(user_id, ch_id);
	 }
}
