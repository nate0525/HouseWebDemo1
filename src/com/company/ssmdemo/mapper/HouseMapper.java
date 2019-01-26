package com.company.ssmdemo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.company.ssmdemo.pojo.House;
import com.company.ssmdemo.pojo.QueryVo;

public interface HouseMapper {
	
	List<House> getAllHouseByCityOfPage(@Param(value="queryVo")QueryVo queryVo);
	
	int getCountHouseByCity(@Param(value="queryVo")QueryVo queryVo);
	
	House findHouseByHouseCode(@Param(value="queryVo")QueryVo queryVo);
	
	List<House> getHouseByRandom(@Param(value="queryVo")QueryVo queryVo,@Param(value="rows")int rows);
	
	void delete(@Param(value="queryVo")QueryVo queryVo);
	
	void updateHouse(@Param(value="queryVo")QueryVo queryVo);
	
	int getMaxCode(@Param(value="cityid")String cityid);
	
	int insertHouse(@Param(value="queryVo")QueryVo queryVo);
	
}
