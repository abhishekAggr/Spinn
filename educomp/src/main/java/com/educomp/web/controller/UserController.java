package com.educomp.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.educomp.model.User;
import com.educomp.service.IUserService;
import com.educomp.web.util.RestPreconditions;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private IUserService userService;
	

	@GetMapping( "/{id}")
	@ResponseBody
	public User findById(@PathVariable("id") final String id, final HttpServletResponse response) {
		final User resourceById = RestPreconditions.checkFound(userService.findOne(id));
		return resourceById;

	}

	@GetMapping("/")
	@ResponseBody
	public List<User> findAll(final HttpServletResponse response) {
		final List<User> resourceById = RestPreconditions.checkFound(userService.findAll());
		return resourceById;

	}

	@DeleteMapping("/{id}")
	@ResponseBody
	public void deleteById(@PathVariable("id") final String id, final HttpServletResponse response) {
		userService.deleteById(id);

	}

	
   @PostMapping("/sign-up")
    @ResponseBody
    public  User signUp(@RequestBody final User userPayload,final HttpServletResponse response) {
    	//userPayload.setPassword(bCryptPasswordEncoder.encode(userPayload.getPassword()));
        final User user = RestPreconditions.checkFound( userService.create(userPayload));
		return user;
    }
}
