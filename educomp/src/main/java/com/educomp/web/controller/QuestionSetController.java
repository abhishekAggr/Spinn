package com.educomp.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.educomp.model.Attempt;
import com.educomp.model.QuestionSet;
import com.educomp.service.IQuestionSetService;
import com.educomp.web.util.RestPreconditions;

@Controller
@RequestMapping("/questionset")
public class QuestionSetController {
	
	@Autowired
	private IQuestionSetService questionSetService;
	

	@GetMapping( "/{area}")
	@ResponseBody
	public List<QuestionSet> findById(@PathVariable("area") final String area, final HttpServletResponse response) {
		final List<QuestionSet> resourceByArea = RestPreconditions.checkFound(questionSetService.findQuestionSetByArea(area));
		return resourceByArea;

	}
	
	@GetMapping( "/notattemptedbyuser/{user}")
	@ResponseBody
	public List<QuestionSet> findByUserNotAttempted(@PathVariable("user") final String user, final HttpServletResponse response) {
		final List<QuestionSet> resourceByArea = RestPreconditions.checkFound(questionSetService.findQuestionSetByNotAttemptedUser(user));
		return resourceByArea;

	}
	
	
	@GetMapping( "/{area}/notattemptedbyuser/{user}")
	@ResponseBody
	public List<QuestionSet> findByAreaNotAttemptedByUser(@PathVariable("area") final String area, @PathVariable("user") final String user, final HttpServletResponse response) {
		final List<QuestionSet> resourceByArea = RestPreconditions.checkFound(questionSetService.findQuestionSetByAreaAndNotAttemptedUser(area, user));
		return resourceByArea;

	}

	@GetMapping( "/area/{area}/level/{level}/device/{device}/user/{user}")
	@ResponseBody
	public List<QuestionSet> getNextQuestion(
			@PathVariable("area") final String area, 
			@PathVariable("level") final String level, 
			@PathVariable("device") final String device, 
			@PathVariable("user") final String user,			
			final HttpServletResponse response) {
		
		final List<QuestionSet> resourceByArea = RestPreconditions.checkFound(questionSetService.findQuestionByAreaLevelDeviceNotAttemptedByUser(area, level, device, user));
		
		List<QuestionSet> resultList = new ArrayList<QuestionSet>(1);
		
		int size = resourceByArea.size();
		Double randomIndex = Math.floor(Math.random() * size);
		resultList.add(resourceByArea.get(randomIndex.intValue()));
		
		return resultList;
	}
	
	@PostMapping("/saveQuestionAttempt")
    @ResponseBody
    public  List<QuestionSet> signUp(
    		@RequestParam(value = "questionId", required = true) final String questionId, 
    		@RequestParam(value = "userId", required = true) final String userId, 
    		@RequestParam(value = "answer", required = true) final String answer, 
    		@RequestParam(value = "area", required = false) final String area, 
    		@RequestParam(value = "device", required = false) final String device,
    		@RequestParam(value = "level", required = false) final String level, 
    		@RequestParam(value = "timeConsumed", required = false) final String timeConsumed, 
    		final HttpServletResponse response) {
        
		QuestionSet savedQuestionSet = questionSetService.findOne(questionId);
		List<Attempt> attemptList = savedQuestionSet.getAttempt();
		
		Attempt attempt = new Attempt();
		attempt.setAnswer(answer);
		attempt.setAttemptdatetime(new Date().toString());
		attempt.setDevice(device);
		attempt.setLevel(level);
		attempt.setTimeconsumed(Long.valueOf(timeConsumed));
		attempt.setUserid(userId);
		
		attemptList.add(attempt);
		
		savedQuestionSet.setAttempt(attemptList);
		
		questionSetService.update(savedQuestionSet);
		
		List<QuestionSet> nextQuestionSet = this.getNextQuestion(area, level, device, userId, response);
		
		return nextQuestionSet;
    }
}
