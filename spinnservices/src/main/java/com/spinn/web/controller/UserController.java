package com.spinn.web.controller;

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

import com.spinn.model.User;
import com.spinn.service.IUserService;
import com.spinn.web.util.RestPreconditions;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private IUserService userService;
	

//	@GetMapping( "/{id}")
//	@ResponseBody
//	public User findById(@PathVariable("id") final String id, final HttpServletResponse response) {
//		final User resourceById = RestPreconditions.checkFound(userService.findOne(id));
//		return resourceById;
//	}
	
	@GetMapping( "/authenticateUser")
	@ResponseBody
	public String authenticateUser(@PathVariable("id") final String id, final HttpServletResponse response) {
		//final User resourceById = RestPreconditions.checkFound(userService.findOne(id));
		return "TBD";
	}

	@GetMapping("/listUsers")
	@ResponseBody
	public List<User> listUsers(final HttpServletResponse response) {
		final List<User> resourceById = RestPreconditions.checkFound(userService.findAll());
		return resourceById;

	}

	@DeleteMapping("/deleteUser/{id}")
	@ResponseBody
	public void deleteUser(@PathVariable("id") final String id, final HttpServletResponse response) {
		userService.deleteById(id);

	}
	
    @PostMapping("/registerUser")
    @ResponseBody
    public  User registerUser(@RequestBody final User userPayload,final HttpServletResponse response) {
    	//userPayload.setPassword(bCryptPasswordEncoder.encode(userPayload.getPassword()));
        final User user = RestPreconditions.checkFound( userService.create(userPayload));
		return user;
    }
    
    @PostMapping("/activateUser")
    @ResponseBody
    public  String activateUser(@RequestBody final User userPayload,final HttpServletResponse response) {
    	//userPayload.setPassword(bCryptPasswordEncoder.encode(userPayload.getPassword()));
//        final User user = RestPreconditions.checkFound( userService.create(userPayload));
    	return "TBD";
    }
    
    @PostMapping("/forgotPassword")
    @ResponseBody
    public  String forgotPassword(@RequestBody final User userPayload,final HttpServletResponse response) {
    	//userPayload.setPassword(bCryptPasswordEncoder.encode(userPayload.getPassword()));
//        final User user = RestPreconditions.checkFound( userService.create(userPayload));
    	return "TBD";
    }
}
