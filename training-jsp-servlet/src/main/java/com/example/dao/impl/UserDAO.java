package com.example.dao.impl;

import java.util.List;

import com.example.dao.IUserDAO;
import com.example.mapper.UserMapper;
import com.example.model.UserModel;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO{

	@Override
	public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, int status) {
		StringBuilder sql = new StringBuilder("SELECT * FROM user AS u");
		sql.append(" INNER JOIN role AS r ON u.roleid = r.id");
		sql.append(" WHERE u.username = ? AND u.password = ? AND u.status = ?");
		List<UserModel> list = query(sql.toString(), new UserMapper(), userName, password, status);
		return list.isEmpty() ? null : list.get(0);
	}

}
