package com.company.ssmdemo.service;

import java.util.List;

import com.company.ssmdemo.pojo.House;
import com.company.ssmdemo.pojo.QueryVo;
import com.company.ssmdemo.utils.Page;

public interface HouseService {

	Page<House> getAllHouseByCity(QueryVo queryVo);

	House findHouseByHouseCode(QueryVo queryVo);

	List<House> getHouseByRandom(QueryVo queryVo, int rows);

	void delete(QueryVo queryVo);

	int updateHouse(QueryVo queryVo);
	
	int insertHouse(QueryVo queryVo);
	
	int getMaxCode(QueryVo queryVo);
}
