package com.earth.gahyun.dao;

import java.sql.SQLException;

import com.earth.gahyun.dto.User;



public interface UserDao {

	User selectUser(String id);
	int deleteUser(String id);
	void deleteAll() throws SQLException;
	int updateUser(User user);
	int insertUser(User user);
}
