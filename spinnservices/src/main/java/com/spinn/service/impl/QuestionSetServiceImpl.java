package com.spinn.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spinn.db.dao.IQuestionSetDao;
import com.spinn.model.QuestionSet;
import com.spinn.service.IQuestionSetService;

@Service
@Transactional
public class QuestionSetServiceImpl implements IQuestionSetService {
	
	@Autowired
	private IQuestionSetDao questionSetDao;
	
    @Override
	public List<QuestionSet> findQuestionSetByArea(String area) {
    	return questionSetDao.findQuestionSetByAreaList(area);
    }
    
    @Override
	public List<QuestionSet> findQuestionSetByLevel(String level) {
    	return questionSetDao.findQuestionSetByLevel(level);
    }
	
    @Override
    public List<QuestionSet> findQuestionSetByNotAttemptedUser(String user) {
		return questionSetDao.findQuestionSetByNotAttemptedUser(user);
	}
	
    @Override
	public List<QuestionSet> findQuestionSetByAreaAndNotAttemptedUser(String area, String user) {
		return questionSetDao.findQuestionSetByAreaAndNotAttemptedUser(area, user);
	}

    @Override
	public List<QuestionSet> findQuestionByAreaLevelDeviceNotAttemptedByUser(String area, String level,String device, String user) {
		return questionSetDao.findQuestionByAreaLevelDeviceNotAttemptedByUser(area, level, device, user);
	}
	
	@Override
	public QuestionSet findOne(String id) {
		QuestionSet questionSet = null;
		Optional<QuestionSet> option = questionSetDao.findById(id);
		if(option.isPresent()) {
			questionSet = option.get();
		}
		return questionSet;
	}

	@Override
	public List<QuestionSet> findAll() {
		List<QuestionSet> questionSetList = questionSetDao.findAll();
		return questionSetList;
	}

	@Override
	public Page<QuestionSet> findPaginated(int page, int size) {
		return null;
	}

	@Override
	public QuestionSet create(QuestionSet questionSet) {
		return null;
	}

	@Override
	public QuestionSet update(QuestionSet questionSet) {
		return questionSetDao.save(questionSet);
	}

	@Override
	public void delete(QuestionSet questionSet) {
		
	}

	@Override
	public void deleteById(String id) {
		questionSetDao.deleteById(id);
	}


}
