package com.company.ssmdemo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.ssmdemo.mapper.UserMapper;
import com.company.ssmdemo.pojo.User;
import com.company.ssmdemo.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	public User loginByUser(User user) {
		return userMapper.loginByUser(user);
	}

	@Override
	public int registerByUser(User user) {
		try {
			user.setUserId(userMapper.getMaxId());
			user.setUserLevel(0);
			userMapper.registerByUser(user);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int getMaxId() {
		return userMapper.getMaxId();
	}

	@Override
	public int checkUserByUser(User user) {
		int i1 = userMapper.checkName(user);
		int i2 = userMapper.checkPhone(user);
		if (i1 == 0) {
			if(i2==0){
				return 1;
			}else{
				return -2;
			}
		} else {
			return -1;
		}
	}

	@Override
	public User findUserByUserName(String userName) {
		return userMapper.findUserByUserName(userName);
	}

}
