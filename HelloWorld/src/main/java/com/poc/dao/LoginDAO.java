package com.poc.dao;

import com.poc.entity.User;

public interface LoginDAO {

	public String authenticateUser(User userObj);

}
