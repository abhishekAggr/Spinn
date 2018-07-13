package com.spinn.model;


import io.swagger.annotations.ApiModelProperty;

import org.springframework.data.annotation.PersistenceConstructor;
import org.springframework.data.mongodb.core.index.IndexDirection;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import com.querydsl.core.annotations.QueryEntity;

@QueryEntity
@Document(collection = "attempt")
public class Attempt {

    @Indexed(direction = IndexDirection.ASCENDING)
    @ApiModelProperty(notes = "userid", required = false)
    private String userid;
    
    @ApiModelProperty(notes = "level", required = false)
    private String level;
    
    @ApiModelProperty(notes = "device", required = false)
    private String device;
    
    @ApiModelProperty(notes = "answer", required = true)
    private String answer;
    
    @ApiModelProperty(notes = "attemptdatetime", required = true)
    private String attemptdatetime;
        
    @ApiModelProperty(notes = "timeconsumed", required = false)
    private Long timeconsumed;

    public Attempt() {}
 
    @PersistenceConstructor
	public Attempt(String userid, String level, String device, String answer,
			String attemptdatetime, Long timeconsumed) {
		super();
		this.userid = userid;
		this.level = level;
		this.device = device;
		this.answer = answer;
		this.attemptdatetime = attemptdatetime;
		this.timeconsumed = timeconsumed;
	}

	/**
	 * @return the userid
	 */
	public String getUserid() {
		return userid;
	}

	/**
	 * @param userid the userid to set
	 */
	public void setUserid(String userid) {
		this.userid = userid;
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
	 * @return the attemptdatetime
	 */
	public String getAttemptdatetime() {
		return attemptdatetime;
	}

	/**
	 * @param attemptdatetime the attemptdatetime to set
	 */
	public void setAttemptdatetime(String attemptdatetime) {
		this.attemptdatetime = attemptdatetime;
	}

	/**
	 * @return the timeconsumed
	 */
	public Long getTimeconsumed() {
		return timeconsumed;
	}

	/**
	 * @param timeconsumed the timeconsumed to set
	 */
	public void setTimeconsumed(Long timeconsumed) {
		this.timeconsumed = timeconsumed;
	}
    
    
}
