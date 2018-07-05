package com.educomp.db.dao;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import com.educomp.model.User;

public interface IUserDao extends MongoRepository<User, String> {
  
	@Query("{ 'name' : ?0 }")
    List<User> findUsersByName(String name);
	
	public User findByemailAddress(String emailAddress);
	
	public User findBymobileNumber(Integer mobileNumber);



}
