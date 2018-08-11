package com.poc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poc.entity.Student;

@Repository
public class StudentDAOImpl implements StudentDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void saveStudentObj(Student studentObj) {
		sessionFactory.getCurrentSession().saveOrUpdate(studentObj);

	}

	@Override
	public List<Student> getAllStudents() {
		Session currentSession = sessionFactory.getCurrentSession();
		List<Student> allStudents = currentSession.createQuery("from Student").list();
		return allStudents;
	}

	@Override
	public Student getStudentObj(int theId) {
		Student studentObj = (Student) sessionFactory.getCurrentSession().get(Student.class, theId);
		return studentObj;
	}

	@Override
	public void removeStudentObj(int theId) {
		Student studentObj = (Student) sessionFactory.getCurrentSession().get(Student.class, theId);
		sessionFactory.getCurrentSession().delete(studentObj);
		
	}

}
