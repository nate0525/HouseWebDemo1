package com.company.ssmdemo.mapper;

import org.apache.ibatis.annotations.Param;

import com.company.ssmdemo.pojo.User;

public interface UserMapper {

	User loginByUser(@Param(value = "user") User user);

	void registerByUser(@Param(value = "user") User user);

	int getMaxId();

	int checkName(@Param(value = "user") User user);

	int checkPhone(@Param(value = "user") User user);
	
	User findUserByUserName(@Param(value = "userName") String userName);

}
