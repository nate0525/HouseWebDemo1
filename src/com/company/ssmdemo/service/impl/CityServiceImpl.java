package com.company.ssmdemo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.ssmdemo.mapper.CityMapper;
import com.company.ssmdemo.pojo.City;
import com.company.ssmdemo.service.CityService;

@Service
public class CityServiceImpl implements CityService {
	
	@Autowired
	private CityMapper cityMapper;
	
	@Override
	public List<City> getAllCity() {
		return cityMapper.getAllCity();
	}

}
