package com.spinn.service;

import com.spinn.model.User;


public interface IUserService extends IBaseService<User> {
	
	  public User loadUserByUsername(String username) throws Exception;

}
