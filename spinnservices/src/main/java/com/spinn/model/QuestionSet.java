package com.spinn.model;


import io.swagger.annotations.ApiModelProperty;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.PersistenceConstructor;
import org.springframework.data.mongodb.core.index.IndexDirection;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import com.querydsl.core.annotations.QueryEntity;

@QueryEntity
@Document(collection = "questionset")
public class QuestionSet {

    @Id
    @ApiModelProperty(notes = "The database generated  ID")
    private String id;
    
    @Indexed(direction = IndexDirection.ASCENDING)
    @ApiModelProperty(notes = "QuesDesc", required = false)
    private String quesDesc;
    
    @ApiModelProperty(notes = "Level", required = true)
    private String level;
    
    @ApiModelProperty(notes = "Device", required = false)
    private String device;

    @ApiModelProperty(notes = "option1", required = false)
    private String option1;
    
    @ApiModelProperty(notes = "option2", required = false)
    private String option2;
    
    @ApiModelProperty(notes = "option3", required = false)
    private String option3;
    
    @ApiModelProperty(notes = "option4", required = false)
    private String option4;
    
    @ApiModelProperty(notes = "answer", required = false)
    private String answer;
    
    @ApiModelProperty(notes = "answerRef", required = false)
    private String answerRef;
    
    private List<Attempt> attempt;
    
    private List<AreaList> arealist;

    public QuestionSet() {}
 
    @PersistenceConstructor
    public QuestionSet(String id, String quesDesc, String level,
			String device, String option1, String option2, String option3,
			String option4, String answer, String answerRef, List<Attempt> attempt, List<AreaList> arealist) {
		super();
		this.id = id;
		this.quesDesc = quesDesc;
		this.level = level;
		this.device = device;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.answer = answer;
		this.answerRef = answerRef;
		this.attempt = attempt;
		this.arealist = arealist;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the quesDesc
	 */
	public String getQuesDesc() {
		return quesDesc;
	}

	/**
	 * @param quesDesc the quesDesc to set
	 */
	public void setQuesDesc(String quesDesc) {
		this.quesDesc = quesDesc;
	}

	/**
	 * @return the level
	 */
	public String getLevel() {
		return level;
	}

	/**
	 * @param level the level to set
	 */
	public void setLevel(String level) {
		this.level = level;
	}

	/**
	 * @return the device
	 */
	public String getDevice() {
		return device;
	}

	/**
	 * @param device the device to set
	 */
	public void setDevice(String device) {
		this.device = device;
	}

	/**
	 * @return the option1
	 */
	public String getOption1() {
		return option1;
	}

	/**
	 * @param option1 the option1 to set
	 */
	public void setOption1(String option1) {
		this.option1 = option1;
	}

	/**
	 * @return the option2
	 */
	public String getOption2() {
		return option2;
	}

	/**
	 * @param option2 the option2 to set
	 */
	public void setOption2(String option2) {
		this.option2 = option2;
	}

	/**
	 * @return the option3
	 */
	public String getOption3() {
		return option3;
	}

	/**
	 * @param option3 the option3 to set
	 */
	public void setOption3(String option3) {
		this.option3 = option3;
	}

	/**
	 * @return the option4
	 */
	public String getOption4() {
		return option4;
	}

	/**
	 * @param option4 the option4 to set
	 */
	public void setOption4(String option4) {
		this.option4 = option4;
	}

	/**
	 * @return the answer
	 */
	public String getAnswer() {
		return answer;
	}

	/**
	 * @param answer the answer to set
	 */
	public void setAnswer(String answer) {
		this.answer = answer;
	}

	/**
	 * @return the answerRef
	 */
	public String getAnswerRef() {
		return answerRef;
	}

	/**
	 * @param answerRef the answerRef to set
	 */
	public void setAnswerRef(String answerRef) {
		this.answerRef = answerRef;
	}

	/**
	 * @return the attempt
	 */
	public List<Attempt> getAttempt() {
		return attempt;
	}

	/**
	 * @param attempt the attempt to set
	 */
	public void setAttempt(List<Attempt> attempt) {
		this.attempt = attempt;
	}

	/**
	 * @return the areaList
	 */
	public List<AreaList> getArealist() {
		return arealist;
	}

	/**
	 * @param areaList the areaList to set
	 */
	public void setArealist(List<AreaList> arealist) {
		this.arealist = arealist;
	}

}
