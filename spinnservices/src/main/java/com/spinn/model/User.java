package com.spinn.model;


import java.util.Date;

import javax.jdo.annotations.Unique;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.PersistenceConstructor;
import org.springframework.data.mongodb.core.index.IndexDirection;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import com.querydsl.core.annotations.QueryEntity;

import io.swagger.annotations.ApiModelProperty;

@QueryEntity
@Document(collection = "users")
public class User {

    @Id
    @ApiModelProperty(notes = "The database generated  ID")
    private String id;
    
    @Indexed(direction = IndexDirection.ASCENDING)
    @ApiModelProperty(notes = "User's Name", required = false)
    private String name;
    
    @ApiModelProperty(notes = "User's Name", required = true)
    @Unique
    private Long mobileNumber;
    
    @ApiModelProperty(notes = "User's Name", required = true)
    private String password;
    
    @ApiModelProperty(notes = "User's Email Address", required = false)
    private String emailAddress;

    @ApiModelProperty(notes = "User's Date of birth", required = false)
    private Date dateofbirth;

    public User() {
    }
 
    @PersistenceConstructor
    public User(String name, String emailAddress, Date dateofbirth, Long mobileNumber,String password ) {
        this.name = name;
        this.emailAddress = emailAddress;
        this.dateofbirth = dateofbirth;
        this.mobileNumber = mobileNumber;
        this.password = password;
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
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}


	/**
	 * @return the emailAddress
	 */
	public String getEmailAddress() {
		return emailAddress;
	}

	/**
	 * @param emailAddress the emailAddress to set
	 */
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	/**
	 * @return the dateofbirth
	 */
	public Date getDateofbirth() {
		return dateofbirth;
	}

	/**
	 * @param dateofbirth the dateofbirth to set
	 */
	public void setDateofbirth(Date dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	/**
	 * @return the mobileNumber
	 */
	public Long getMobileNumber() {
		return mobileNumber;
	}

	/**
	 * @param mobileNumber the mobileNumber to set
	 */
	public void setMobileNumber(Long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}


}
