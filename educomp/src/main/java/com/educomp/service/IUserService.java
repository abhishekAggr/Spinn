package com.educomp.service;

import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.educomp.model.User;


public interface IUserService extends IBaseService<User> {
	
	  public User loadUserByUsername(String username) throws UsernameNotFoundException;

}
