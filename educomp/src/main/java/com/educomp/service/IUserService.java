package com.educomp.service;

import com.educomp.model.User;


public interface IUserService extends IBaseService<User> {
	
	  public User loadUserByUsername(String username) throws Exception;

}
