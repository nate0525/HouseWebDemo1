package com.company.ssmdemo.controller;

import java.io.File;
import java.text.DecimalFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.company.ssmdemo.pojo.City;
import com.company.ssmdemo.pojo.House;
import com.company.ssmdemo.pojo.QueryVo;
import com.company.ssmdemo.pojo.User;
import com.company.ssmdemo.service.CityService;
import com.company.ssmdemo.service.HouseService;
import com.company.ssmdemo.service.UserService;
import com.company.ssmdemo.utils.Page;

@Controller
@RequestMapping("house")
public class HouseController {

	@Autowired
	private HouseService houseService;

	@Autowired
	private CityService cityService;

	@Autowired
	private UserService userServiceImpl;

	@RequestMapping("index")
	public String goIndex(Model model, QueryVo queryVo, String houseMoney1, String houseMoney2, String houseBig1,
			String houseBig2) {

		try {

			if (queryVo.getCityid() == null || queryVo.getCityid() == "") {
				queryVo.setCityid("guangzhou");
			}

			if (houseMoney1 != "" && houseMoney1 != null && queryVo.getHouse().getHousePrice() == 0) {
				if (houseMoney2 != "" && houseMoney2 != null) {
					queryVo.setMoney1(Float.parseFloat(houseMoney1));
					queryVo.setMoney2(Float.parseFloat(houseMoney2));
				} else {
					queryVo.setMoney1(Float.parseFloat(houseMoney1));
					queryVo.setMoney2(1000000000);
				}
				// 清空下拉条的值
				queryVo.getHouse().setHousePrice(0);
			}
			if (houseMoney2 != "" && houseMoney2 != null && queryVo.getHouse().getHousePrice() == 0) {
				if (houseMoney1 != "" && houseMoney1 != null) {
					queryVo.setMoney1(Float.parseFloat(houseMoney1));
					queryVo.setMoney2(Float.parseFloat(houseMoney2));
				} else {
					queryVo.setMoney1(0);
					queryVo.setMoney2(Float.parseFloat(houseMoney2));
				}
				// 清空下拉条的值
				queryVo.getHouse().setHousePrice(0);
			}

			if (houseBig1 != "" && houseBig1 != null && queryVo.getHouse().getHouseBig() == 0) {
				if (houseBig2 != "" && houseBig2 != null) {
					queryVo.setBig1(Float.parseFloat(houseBig1));
					queryVo.setBig2(Float.parseFloat(houseBig2));
				} else {
					queryVo.setBig1(Float.parseFloat(houseBig1));
					queryVo.setMoney2(1000000000);
				}
				// 清空下拉条的值
				queryVo.getHouse().setHouseBig(0);
			}

			if (houseBig2 != "" && houseBig2 != null && queryVo.getHouse().getHouseBig() == 0) {
				if (houseBig1 != "" && houseBig1 != null) {
					queryVo.setBig1(Float.parseFloat(houseBig1));
					queryVo.setBig2(Float.parseFloat(houseBig2));
				} else {
					queryVo.setBig2(Float.parseFloat(houseBig2));
					queryVo.setMoney1(0);
				}
				// 清空下拉条的值
				queryVo.getHouse().setHouseBig(0);
			}

			if (queryVo.getHouse() != null) {
				if (queryVo.getHouse().getHousePrice() <= 10001 && queryVo.getHouse().getHousePrice() != 0) {
					queryVo.getHouse().setRentalorsale("0");
				} else if (queryVo.getHouse().getHousePrice() > 10001
						&& queryVo.getHouse().getHousePrice() <= 3000001) {
					queryVo.getHouse().setRentalorsale("1");
				}
			}

			Page<House> page = houseService.getAllHouseByCity(queryVo);

			// 获得城市列表
			List<City> citylist = cityService.getAllCity();
			model.addAttribute("citylist", citylist);

			// page名字不能改,分页要用到
			model.addAttribute("page", page);

			model.addAttribute("queryVo", queryVo);

		} catch (Exception e) {

		}

		return "index";

	}

	@RequestMapping("randomHouse")
	public String getHouseByRandom(Model model, String cityid) {

		if (cityid == null || cityid == "") {
			cityid = "guangzhou";
		}

		QueryVo queryVo = new QueryVo();
		queryVo.setCityid(cityid);

		// 6是随机显示6条信息
		List<House> randomHouseList = houseService.getHouseByRandom(queryVo, 6);

		// 获得城市列表
		List<City> citylist = cityService.getAllCity();
		model.addAttribute("citylist", citylist);

		model.addAttribute("randomHouseList", randomHouseList);
		model.addAttribute("queryVo", queryVo);

		return "index";
	}

	@RequestMapping("houseInfo")
	public String findHouseByHouseCode(Model model, QueryVo queryVo) {

		if (queryVo.getCityid() == null || queryVo.getCityid() == "") {
			queryVo.setCityid("guangzhou");
		}

		House house = houseService.findHouseByHouseCode(queryVo);

		queryVo.setHouse(house);

		float houseMoney = house.getHousePrice() / house.getHouseBig();

		DecimalFormat decimalFormat = new DecimalFormat(".00");// 构造方法的字符格式这里如果小数不足2位,会以0补足.

		String PriceAndBig = decimalFormat.format(houseMoney);// format 返回的是字符串

		model.addAttribute("queryVo", queryVo);

		model.addAttribute("PriceAndBig", PriceAndBig);

		// 把发布者的信息传导页面
		User user = userServiceImpl.findUserByUserName(house.getPublisher());
		if (user != null) {
			model.addAttribute("houseUser", user);
		}
		return "houseInfo";
	}

	@RequestMapping("loan")
	public String loanMath(Model model, QueryVo queryVo, String houseMoney1, String houseMoney2, String houseBig1,
			String houseBig2) {

		try {
			double money = queryVo.getLoan().getMoney() * 10000;
			int year = queryVo.getLoan().getYear();
			double rate = queryVo.getLoan().getRate();
			double monthpay = ((money * rate) / Math.abs(1 - (1 / (1 + rate) * year * 12)) * 2);// 公式是错的
			monthpay = (double) Math.round(monthpay * 100) / 100;// 四舍五入保留两位小数点
			queryVo.getLoan().setMonthpay(monthpay);
		} catch (Exception e) {

		}

		goIndex(model, queryVo, houseMoney1, houseMoney2, houseBig1, houseBig2);

		model.addAttribute("queryVo", queryVo);

		return "index";

	}

	@RequestMapping("editUI")
	public String editUI(Model model, QueryVo queryVo, String houseMoney1, String houseMoney2, String houseBig1,
			String houseBig2, String edit) {

		if (edit.equals("true")) {
			model.addAttribute("edit", "false");
		} else {
			model.addAttribute("edit", "true");
		}
		goIndex(model, queryVo, houseMoney1, houseMoney2, houseBig1, houseBig2);
		model.addAttribute("queryVo", queryVo);
		return "index";

	}

	@RequestMapping("delete")
	public String delete(Model model, QueryVo queryVo, String houseMoney1, String houseMoney2, String houseBig1,
			String houseBig2, String edit) {

		if (queryVo.getCityid() == null || queryVo.getCityid() == "") {
			queryVo.setCityid("guangzhou");
		}
		houseService.delete(queryVo);
		// 保持编辑状态
		model.addAttribute("edit", "false");
		goIndex(model, queryVo, houseMoney1, houseMoney2, houseBig1, houseBig2);
		model.addAttribute("queryVo", queryVo);
		return "index";

	}

	@RequestMapping("edit")
	public String edit(QueryVo queryVo, Model model) {

		House house = houseService.findHouseByHouseCode(queryVo);

		queryVo.setHouse(house);

		float houseMoney = house.getHousePrice() / house.getHouseBig();

		DecimalFormat decimalFormat = new DecimalFormat(".00");// 构造方法的字符格式这里如果小数不足2位,会以0补足.

		String PriceAndBig = decimalFormat.format(houseMoney);// format 返回的是字符串

		model.addAttribute("queryVo", queryVo);

		model.addAttribute("PriceAndBig", PriceAndBig);

		model.addAttribute("queryVo", queryVo);

		model.addAttribute("PriceAndBig", PriceAndBig);

		return "houseEdit";

	}
	
	@RequestMapping("editOfMyHouse")
	public String editOfMyHouse(QueryVo queryVo, Model model) {

		House house = houseService.findHouseByHouseCode(queryVo);

		queryVo.setHouse(house);

		float houseMoney = house.getHousePrice() / house.getHouseBig();

		DecimalFormat decimalFormat = new DecimalFormat(".00");// 构造方法的字符格式这里如果小数不足2位,会以0补足.

		String PriceAndBig = decimalFormat.format(houseMoney);// format 返回的是字符串

		model.addAttribute("queryVo", queryVo);

		model.addAttribute("PriceAndBig", PriceAndBig);

		model.addAttribute("queryVo", queryVo);

		model.addAttribute("PriceAndBig", PriceAndBig);

		return "houseEdit";

	}

	@RequestMapping("editHouse")
	public String editHouse(QueryVo queryVo, Model model, MultipartFile pic, HttpServletResponse response)
			throws Exception {

		if (queryVo.getCityid() == null || queryVo.getCityid() == "") {
			queryVo.setCityid("guangzhou");
		}

		if (pic.getSize() > 0) {

			String newName = UUID.randomUUID().toString();

			String oldName = pic.getOriginalFilename();

			String sux = oldName.substring(oldName.lastIndexOf("."));

			File file = new File("E:\\Eclipse_Mars\\workspace\\mySSMdemo1\\WebContent\\img\\house\\"
					+ queryVo.getCityid() + "\\" + newName + sux);

			pic.transferTo(file);

			queryVo.getHouse().setHouseImg("img/house/" + queryVo.getCityid() + "/" + newName + sux);

		}

		// 修改房屋信息
		int i = houseService.updateHouse(queryVo);

		System.out.println(i);

		House house = houseService.findHouseByHouseCode(queryVo);

		queryVo.setHouse(house);

		float houseMoney = house.getHousePrice() / house.getHouseBig();

		DecimalFormat decimalFormat = new DecimalFormat(".00");// 构造方法的字符格式这里如果小数不足2位,会以0补足.

		String PriceAndBig = decimalFormat.format(houseMoney);// format 返回的是字符串

		model.addAttribute("queryVo", queryVo);

		model.addAttribute("PriceAndBig", PriceAndBig);

		model.addAttribute("queryVo", queryVo);

		model.addAttribute("PriceAndBig", PriceAndBig);

		// response.sendRedirect("/mySSMdemo1/houseInfo.action?cityid="+queryVo.getCityid()+"house.houseCode="+queryVo.getHouse().getHouseCode());

		return "houseInfo";

	}
	
	@RequestMapping("uploadUI")
	public String uploadUI(QueryVo queryVo, Model model) {
		model.addAttribute("queryVo", queryVo);
		model.addAttribute("uploadUI", "uploadUI");
		return "houseEdit";
	}

	@RequestMapping("upload")
	public String upload(QueryVo queryVo, Model model, HttpServletResponse response, MultipartFile pictureFile)
			throws Exception {

		if (queryVo.getCityid() == null || queryVo.getCityid() == "") {
			queryVo.setCityid("guangzhou");
		}

		if (pictureFile.getSize() > 0) {

			// houseCode和图片名称
			int i = houseService.getMaxCode(queryVo);

			String newName = String.valueOf(i);

			String oldName = pictureFile.getOriginalFilename();

			String sux = oldName.substring(oldName.lastIndexOf("."));

			File file = new File("E:\\Eclipse_Mars\\workspace\\mySSMdemo1\\WebContent\\img\\house\\"
					+ queryVo.getCityid() + "\\" + newName + sux);

			pictureFile.transferTo(file);

			queryVo.getHouse().setHouseImg("img/house/" + queryVo.getCityid() + "/" + newName + sux);
		}
		houseService.insertHouse(queryVo);

		response.sendRedirect("/mySSMdemo1/house/index.action?cityid=" + queryVo.getCityid());

		return null;

	}

	@RequestMapping("seeMyHouse")
	public String seeMyHouse(QueryVo queryVo, HttpServletRequest request, Model model) {

		User user = (User) request.getSession().getAttribute("user");

		String userName = user.getUserName();

		if (queryVo.getCityid() == null) {
			queryVo.setCityid("guangzhou");
		}

		String cityid = queryVo.getCityid();

		queryVo.setCityid(cityid);

		House house = new House();
		house.setPublisher(userName);
		queryVo.setHouse(house);

		Page<House> page = houseService.getAllHouseByCity(queryVo);

		if (page.getTotal() == 0) {
			model.addAttribute("msg", "您暂无任何发布信息");
		}

		model.addAttribute("page", page);
		model.addAttribute("queryVo", queryVo);

		return "myHouse";
	}

	@RequestMapping("deleteOfMyHouse")
	public void deleteOfMyHouse(Model model, QueryVo queryVo, HttpServletResponse response) throws Exception {

		if (queryVo.getCityid() == null || queryVo.getCityid() == "") {
			queryVo.setCityid("guangzhou");
		}
		houseService.delete(queryVo);

		model.addAttribute("queryVo", queryVo);

		response.sendRedirect("/mySSMdemo1/house/seeMyHouse.action?cityid=" + queryVo.getCityid() + "&page="
				+ queryVo.getPage() + "&rows=" + queryVo.getRows());

	}

}
