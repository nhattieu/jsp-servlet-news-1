package com.example.service.impl;

import javax.inject.Inject;

import com.example.dao.IUserDAO;
import com.example.model.UserModel;
import com.example.service.IUserService;

public class UserService implements IUserService{

	@Inject
	private IUserDAO userDAO;
	
	@Override
	public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, int status) {
		return userDAO.findByUserNameAndPasswordAndStatus(userName, password, status);
	}

}
