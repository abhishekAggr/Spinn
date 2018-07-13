package com.spinn.db.dao;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import com.spinn.model.QuestionSet;

public interface IQuestionSetDao extends MongoRepository<QuestionSet, String> {
  
	@Query("{ 'area' : ?0 }")
    List<QuestionSet> findQuestionSetByArea(String area);
	
	@Query("{ 'attempt.userid' : { $nin: [?0] }}")
	List<QuestionSet> findQuestionSetByNotAttemptedUser(String user);
	
	@Query("{ 'area' : ?0 , 'attempt.userid' : { $nin: [?1] }}")
	List<QuestionSet> findQuestionSetByAreaAndNotAttemptedUser(String area, String user);

	@Query("{ 'area' : ?0, 'level' : ?1, 'device' : ?2, 'attempt.userid' : { $nin: [?3] }}")
	List<QuestionSet> findQuestionByAreaLevelDeviceNotAttemptedByUser(String area, String level,String device, String user);
	
}
