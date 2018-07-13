package com.spinn.service;

import java.util.List;

import com.spinn.model.QuestionSet;

public interface IQuestionSetService extends IBaseService<QuestionSet> {

	List<QuestionSet> findQuestionSetByArea(String area);
	
	List<QuestionSet> findQuestionSetByNotAttemptedUser(String user);
	
	List<QuestionSet> findQuestionSetByAreaAndNotAttemptedUser(String area, String user);
	
	List<QuestionSet> findQuestionByAreaLevelDeviceNotAttemptedByUser(String area, String level,String device, String user);
}
