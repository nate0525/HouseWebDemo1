<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
</head>
<body>
	<table width="100%">
		<tr
			style="background-image: url(${pageContext.request.contextPath}/img/banner.jpg);">
			<td>
				<form action="${pageContext.request.contextPath}/house/index.action"
					method="post">
					<table border="0" cellspacing="0" cellpadding="0" width="90%"
						align="center" height="300px" style="color: white;">
						<tr align="center" height="80px">
							<td width="35%">
								<h1>
									<a
										href="${pageContext.request.contextPath}/house/index.action?cityid=${queryVo.cityid}"
										class="logodiv">MY房网</a>
								</h1>
							</td>

							<td align="center">当前城市: <select id="changecity"
								name="cityid" style="color: black;">
									<c:forEach items="${citylist }" var="c">
										<c:if test="${queryVo.cityid == c.cityname2 }">
											<option value="${c.cityname2 }" selected="selected">${c.cityname }</option>
										</c:if>
										<c:if test="${queryVo.cityid != c.cityname2 }">
											<option value="${c.cityname2 }">${c.cityname }</option>
										</c:if>

									</c:forEach>
							</select></td>
							<td><c:if test="${empty user }">
									<a
										href="${pageContext.request.contextPath}/user/loginUI.action?cityid=${queryVo.cityid}"
										class="logindiv"><font size="4">用户登录/注册</font></a>
								</c:if> <c:if test="${not empty user }">
									<font size="4">${user.userName },你好!|<a
										href="${pageContext.request.contextPath}/house/seeMyHouse.action?cityid=${queryVo.cityid}"
										style="color: white;">我发布的房屋</a>|<a
										href="${pageContext.request.contextPath}/user/logOut.action?cityid=${queryVo.cityid}"
										style="color: white;">退出</a></font>
								</c:if></td>
						</tr>
						<tr height="230px">
							<td colspan="3" align="center">
								<table border="0" height="180px;">
									<tr>
										<td><input type="radio" id="searchByName"
											name="searchByWhat" checked="checked">搜索房屋名称 <input
											type="radio" style="margin-left: 25px" id="searchByGarden"
											name="searchByWhat"
											<c:if test="${not empty queryVo.house.gardenName }">checked="checked"</c:if>>搜索小区名称
											<input type="radio" style="margin-left: 25px"
											id="searchByInfo" name="searchByWhat"
											<c:if test="${not empty queryVo.house.houseInfo }"> checked="checked"</c:if>>搜索房屋信息
											<input type="radio" style="margin-left: 25px"
											id="searchByPublisher" name="searchByWhat"
											<c:if test="${not empty queryVo.house.publisher }"> checked="checked"</c:if>>搜索房屋发布人</td>
									</tr>
									<tr>
										<td><input type="text" id="searchText"
											name="house.houseName"
											style="width: 600px; height: 55px; color: black;"
											<c:if test="${not empty queryVo.house.houseName}">value='${queryVo.house.houseName  }'</c:if>
											<c:if test="${not empty queryVo.house.gardenName}">value='${queryVo.house.gardenName  }'</c:if>
											<c:if test="${not empty queryVo.house.houseInfo}">value='${queryVo.house.houseInfo  }'</c:if>
											<c:if test="${not empty queryVo.house.publisher}">value='${queryVo.house.publisher  }'</c:if>>
										</td>
										<td><input type="button" onclick="this.form.submit()"
											style="width: 100px; height: 55px; color: black;"
											value="开始找房"><a
											href="${pageContext.request.contextPath}/house/randomHouse.action?cityid=${queryVo.cityid}"><input
												type="button"
												style="width: 100px; height: 55px; color: black;"
												value="随机看房"></a></td>
									</tr>
									<tr>
										<td width="70px">
											<table>
												<tr>
													<td width="80px">房屋类型<br /> <input type="radio"
														name="house.rentalorsale" value="0" id="myradio1"
														<c:if test="${queryVo.house.rentalorsale == '0' }"> checked="checked"</c:if>>出租房<br />
														<input type="radio" name="house.rentalorsale" value="1"
														id="myradio2"
														<c:if test="${queryVo.house.rentalorsale == '1' }"> checked="checked"</c:if>>售卖房
													</td>
													<td width="80px">&nbsp;<br /> <input type="radio"
														name="house.neworold" value="0" id="myradio3"
														<c:if test="${queryVo.house.neworold == '0' }"> checked="checked"</c:if>>一手房<br />
														<input type="radio" name="house.neworold" value="1"
														id="myradio4"
														<c:if test="${queryVo.house.neworold == '1' }"> checked="checked"</c:if>>二手房
													</td>
													<td width="80px">&nbsp;<br /> <input type="radio"
														name="house.liveorwork" value="0" id="myradio5"
														<c:if test="${queryVo.house.liveorwork == '0' }"> checked="checked"</c:if>>居民房<br />
														<input type="radio" name="house.liveorwork" value="1"
														id="myradio6"
														<c:if test="${queryVo.house.liveorwork == '1' }"> checked="checked"</c:if>>商用房
													</td>
													<td width="220px" style="color: white;">房屋价格<br /> <select
														name="house.housePrice" id="housePrice"
														style="color: black; width: 182px;"><option
																value="0">无要求</option>

															<option value="2000"
																<c:if test="${queryVo.house.housePrice == 2000 }">selected="selected"</c:if>>2000￥以下/月</option>
															<option value="4000"
																<c:if test="${queryVo.house.housePrice == 4000 }">selected="selected"</c:if>>4000￥以下/月</option>
															<option value="6000"
																<c:if test="${queryVo.house.housePrice == 6000 }">selected="selected"</c:if>>6000￥以下/月</option>
															<option value="8000"
																<c:if test="${queryVo.house.housePrice == 8000 }">selected="selected"</c:if>>8000￥以下/月</option>
															<option value="10000"
																<c:if test="${queryVo.house.housePrice == 10000 }">selected="selected"</c:if>>10000￥以下/月</option>
															<option value="10001"
																<c:if test="${queryVo.house.housePrice == 10001 }">selected="selected"</c:if>>10000￥以上/月</option>
															<option value="1000000"
																<c:if test="${queryVo.house.housePrice == 1000000 }">selected="selected"</c:if>>一百万￥以下/一套</option>
															<option value="2000000"
																<c:if test="${queryVo.house.housePrice == 2000000 }">selected="selected"</c:if>>两百万￥以下/一套</option>
															<option value="3000000"
																<c:if test="${queryVo.house.housePrice == 3000000 }">selected="selected"</c:if>>三百万￥以下/一套</option>
															<option value="3000001"
																<c:if test="${queryVo.house.housePrice == 3000001 }">selected="selected"</c:if>>三百万￥以上/一套</option></select><br />
														<input type="text" style="width: 80px; color: black;"
														name="houseMoney1" id="houseMoney1"
														<c:if test="${not empty queryVo.money1 }">value='${queryVo.money1  }'</c:if>>￥~<input
														type="text" style="width: 80px; color: black;"
														name="houseMoney2" id="houseMoney2"
														<c:if test="${not empty queryVo.money2 }">value='${queryVo.money2  }'</c:if>>￥
													</td>
													<td width="175px" style="color: white;">房屋面积<br /> <select
														name="house.houseBig" id="houseBig"
														style="color: black; width: 124px;"><option
																value="0">无要求</option>
															<option value="50"
																<c:if test="${queryVo.house.houseBig == 50 }">selected="selected"</c:if>>50m²以下</option>
															<option value="75"
																<c:if test="${queryVo.house.houseBig == 75 }">selected="selected"</c:if>>75m²以下</option>
															<option value="100"
																<c:if test="${queryVo.house.houseBig == 100 }">selected="selected"</c:if>>100m²以下</option>
															<option value="150"
																<c:if test="${queryVo.house.houseBig == 150 }">selected="selected"</c:if>>150m²以下</option>
															<option value="200"
																<c:if test="${queryVo.house.houseBig == 200 }">selected="selected"</c:if>>200m²以下</option>
															<option value="201"
																<c:if test="${queryVo.house.houseBig == 201 }">selected="selected"</c:if>>200m²以上</option></select><br />
														<input type="text" style="width: 50px; color: black;"
														name="houseBig1" id="houseBig1"
														<c:if test="${not empty queryVo.big1 }">value='${queryVo.big1  }'</c:if>>m²~<input
														type="text" style="width: 50px; color: black;"
														name="houseBig2" id="houseBig2"
														<c:if test="${not empty queryVo.big2 }">value='${queryVo.big2  }'</c:if>>m²
													</td>
												</tr>
											</table>
										</td>
										<!-- <td><input id="clear" type="button" value="清空筛选条件"
											style="color: black; width: 100px; height: 65px;"><input
											id="hidden" type="button" value="隐藏筛选条件"
											style="color: black; width: 100px; height: 65px;"></td> -->

									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr height="20px">
			<td></td>
		</tr>
	</table>

</body>
<script type="text/javascript">
	/* 在houseMoney1的值发生改变后把housePrice下拉条的value改为0(无选择) */
	$("#houseMoney1").on("change", function() {
		$(" #housePrice").val(0);
	});
	$("#houseMoney2").on("change", function() {
		$(" #housePrice").val(0);
	});
	$("#houseBig1").on("change", function() {
		$(" #houseBig").val(0);
	});
	$("#houseBig2").on("change", function() {
		$(" #houseBig").val(0);
	});

	$("#clear").click(function() {
		$(" #houseMoney1").val("");
		$(" #houseMoney2").val("");
		$(" #houseBig1").val("");
		$(" #houseBig2").val("");
		$(" #searchText").val("");
	});

	$("#housePrice").on("change", function() {
		$(" #houseMoney1").val("");
		$(" #houseMoney2").val("");
	});

	$("#houseBig").on("change", function() {
		$(" #houseBig1").val("");
		$(" #houseBig2").val("");
	});

	/* 更换城市事件 */
	$("#changecity").change(function() {
		var opt = $("#changecity").val();
		if (confirm("确定更改城市吗?")) {
			window.location.href = "/mySSMdemo1/house/index.action?cityid=" + opt;
		}
	});
	/* 搜索条件radio(searchByName)点击事件和被选中事件 */
	$("#searchByName").click(function() {
		var name = document.getElementById("searchText").name;
		name = "house.houseName";
		document.getElementById("searchText").name = name;
	});
	if ($("#searchByName").is(':checked')) {
		var name = document.getElementById("searchText").name;
		name = "house.houseName";
		document.getElementById("searchText").name = name;
	}
	/* 搜索条件radio(searchByGarden)点击事件和被选中事件 */
	$("#searchByGarden").click(function() {
		var name = document.getElementById("searchText").name;
		name = "house.gardenName";
		document.getElementById("searchText").name = name;
	});
	if ($("#searchByGarden").is(':checked')) {
		var name = document.getElementById("searchText").name;
		name = "house.gardenName";
		document.getElementById("searchText").name = name;
	}
	/* 搜索条件radio(searchByInfo)点击事件和被选中事件 */
	$("#searchByInfo").click(function() {
		var name = document.getElementById("searchText").name;
		name = "house.houseInfo";
		document.getElementById("searchText").name = name;
	});
	if ($("#searchByInfo").is(':checked')) {
		var name = document.getElementById("searchText").name;
		name = "house.houseInfo";
		document.getElementById("searchText").name = name;
	}
	/* 搜索条件radio(searchByPublisher)点击事件和被选中事件 */
	$("#searchByPublisher").click(function() {
		var name = document.getElementById("searchText").name;
		name = "house.publisher";
		document.getElementById("searchText").name = name;
	});
	if ($("#searchByPublisher").is(':checked')) {
		var name = document.getElementById("searchText").name;
		name = "house.publisher";
		document.getElementById("searchText").name = name;
	}
	/* 筛选条件radio(单机选中再次单击取消选中)事件 */
	$(function() {
		/*鼠标点击下去的时候，决定是否选中*/
		$("#myradio1").bind("mousedown", function(event) {
			var radioChecked = $(this).prop("checked");
			$(this).prop('checked', !radioChecked);
			return false;
		});

		/*阻止click事件默认行为*/
		$("#myradio1").click(function(event) {
			return false;
		});

		/*鼠标点击下去的时候，决定是否选中*/
		$("#myradio2").bind("mousedown", function(event) {
			var radioChecked = $(this).prop("checked");
			$(this).prop('checked', !radioChecked);
			return false;
		});

		/*阻止click事件默认行为*/
		$("#myradio2").click(function(event) {
			return false;
		});
		/*鼠标点击下去的时候，决定是否选中*/
		$("#myradio3").bind("mousedown", function(event) {
			var radioChecked = $(this).prop("checked");
			$(this).prop('checked', !radioChecked);
			return false;
		});

		/*阻止click事件默认行为*/
		$("#myradio3").click(function(event) {
			return false;
		});
		/*鼠标点击下去的时候，决定是否选中*/
		$("#myradio4").bind("mousedown", function(event) {
			var radioChecked = $(this).prop("checked");
			$(this).prop('checked', !radioChecked);
			return false;
		});

		/*阻止click事件默认行为*/
		$("#myradio4").click(function(event) {
			return false;
		});
		/*鼠标点击下去的时候，决定是否选中*/
		$("#myradio5").bind("mousedown", function(event) {
			var radioChecked = $(this).prop("checked");
			$(this).prop('checked', !radioChecked);
			return false;
		});

		/*阻止click事件默认行为*/
		$("#myradio5").click(function(event) {
			return false;
		});
		/*鼠标点击下去的时候，决定是否选中*/
		$("#myradio6").bind("mousedown", function(event) {
			var radioChecked = $(this).prop("checked");
			$(this).prop('checked', !radioChecked);
			return false;
		});

		/*阻止click事件默认行为*/
		$("#myradio6").click(function(event) {
			return false;
		});
	});
</script>
</html>