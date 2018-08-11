package com.poc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poc.entity.Student;
import com.poc.entity.User;

@Repository
public class LoginDAOImpl implements LoginDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public String authenticateUser(User userObj) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		List<User> allUsers = currentSession.createQuery("from User").list();
		String message = null;
		for (User user : allUsers) {
			if(user.getUsername().equals(userObj.getUsername())) {
				if(user.getPassword().equals(userObj.getPassword())) {
					message = "Authenticated";
					break;
				}
				else {
					message = "Invalid Password !";
				}
			}
			else {
				message = "Invalid User !";
			}
		}
		
		System.out.println(message);
		
		return message;
	}

}
