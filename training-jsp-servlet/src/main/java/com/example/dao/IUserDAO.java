package com.example.dao;

import com.example.model.UserModel;

public interface IUserDAO extends GenericDAO<UserModel> {

	UserModel findByUserNameAndPasswordAndStatus(String userName, String password, int status);
	
}
