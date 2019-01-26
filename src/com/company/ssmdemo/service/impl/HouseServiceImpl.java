package com.company.ssmdemo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.ssmdemo.mapper.HouseMapper;
import com.company.ssmdemo.pojo.House;
import com.company.ssmdemo.pojo.QueryVo;
import com.company.ssmdemo.service.HouseService;
import com.company.ssmdemo.utils.Page;

@Service
public class HouseServiceImpl implements HouseService {

	@Autowired
	private HouseMapper houseMapper;

	@Override
	public Page<House> getAllHouseByCity(QueryVo queryVo) {

		queryVo.setStart((queryVo.getPage() - 1) * queryVo.getRows());

		queryVo.setRows(4);

		int total = houseMapper.getCountHouseByCity(queryVo);

		List<House> list = houseMapper.getAllHouseByCityOfPage(queryVo);

		// 包装分页数据
		Page<House> page = new Page<House>(total, queryVo.getPage(), queryVo.getRows(), list);

		return page;

	}

	@Override
	public House findHouseByHouseCode(QueryVo queryVo) {
		return houseMapper.findHouseByHouseCode(queryVo);
	}

	@Override
	public List<House> getHouseByRandom(QueryVo queryVo, int rows) {
		return houseMapper.getHouseByRandom(queryVo, rows);
	}

	@Override
	public void delete(QueryVo queryVo) {
		houseMapper.delete(queryVo);
	}

	public int updateHouse(QueryVo queryVo) {
		try {
			houseMapper.updateHouse(queryVo);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

	public int insertHouse(QueryVo queryVo) {
		int housecode = houseMapper.getMaxCode(queryVo.getCityid());
		queryVo.getHouse().setHouseCode(housecode);
		return houseMapper.insertHouse(queryVo);
	}

	public int getMaxCode(QueryVo queryVo) {
		return houseMapper.getMaxCode(queryVo.getCityid());
	}

}
