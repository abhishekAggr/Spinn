package com.educomp.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.educomp.db.dao.IUserDao;
import com.educomp.model.User;
import com.educomp.service.IUserService;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

	
	@Autowired
	private IUserDao userDao;
	
	@Override
	public User findOne(String id) {
		User user = null;
		Optional<User> option = userDao.findById(id);
		if(option.isPresent()) {
			user = option.get();
		}
		return user;
	}

	@Override
	public List<User> findAll() {
		List<User> userList = userDao.findAll();
		return userList;
	}

	@Override
	public Page<User> findPaginated(int page, int size) {

		return null;
	}

	@Override
	public User create(User user) {
		User usr =userDao.save(user);
		return usr;
	}

	@Override
	public User update(User user) {

		return null;
	}

	@Override
	public void delete(User user) {
		userDao.delete(user);
	}

	@Override
	public void deleteById(String id) {
		userDao.deleteById(id);

	}


    @Override
    public User loadUserByUsername(String emailAddress) throws Exception {
    	User user = userDao.findByemailAddress(emailAddress);
        if (user == null) {
            throw new Exception(emailAddress);
        }
        return user;
    }

}
