package com.company.ssmdemo.service;

import com.company.ssmdemo.pojo.User;

public interface UserService {
	User loginByUser(User user);
	
	int registerByUser(User user);
	
	int getMaxId();
	
	int checkUserByUser(User user);
	
	User findUserByUserName(String userName);
}
