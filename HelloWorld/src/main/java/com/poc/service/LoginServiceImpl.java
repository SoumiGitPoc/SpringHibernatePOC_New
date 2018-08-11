package com.poc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.poc.dao.LoginDAO;
import com.poc.entity.User;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDAO loginDAO;
	
	@Override
	@Transactional
	public String authenticateUser(User userObj) {
		return loginDAO.authenticateUser(userObj);
	}

}
