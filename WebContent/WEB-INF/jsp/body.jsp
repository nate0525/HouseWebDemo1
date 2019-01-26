<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/index.css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/dataTables.bootstrap.css"
	rel="stylesheet">
</head>
<body style="width: 99%;">

	<!-- 房屋列表 -->
	<c:if test="${not empty page && empty randomHouseList}">
		<table border="00" width="80%" align="center">
			<tr>
				<td width="75%">
					<table border="00" width="100%" align="center">
						<tr>
							<td colspan="2" height="30px">共有:${page.total }条信息</td>
							<td align="right">
								<!-- 已登录才可以上传和修改房屋 --> <c:if test="${not empty user }">
									<a
										href="${pageContext.request.contextPath }/house/uploadUI.action?cityid=${queryVo.cityid}"><input
										type="button" value="上传房屋"></a>

									<c:if test="${user.userLevel==1}">
										<c:if test="${empty edit || edit == 'true' }">
											<form
												action="${pageContext.request.contextPath }/house/editUI.action?edit=true&cityid=${queryVo.cityid}"
												method="post">

												<input type="submit" value="编辑">
												<c:if test="${not empty queryVo.moneyAndBig }">
													<input type="hidden" name="moneyAndBig"
														value="${queryVo.moneyAndBig }">
												</c:if>
												<c:if test="${not empty queryVo.page }">
													<input type="hidden" name="page" value="${queryVo.page }">
												</c:if>
												<c:if test="${not empty queryVo.start }">
													<input type="hidden" name="start" value="${queryVo.start }">
												</c:if>
												<c:if test="${not empty queryVo.rows }">
													<input type="hidden" name="rows" value="${queryVo.rows }">
												</c:if>
												<c:if test="${not empty queryVo.money1 }">
													<input type="hidden" name="Money1"
														value="${queryVo.money1 }">
												</c:if>
												<c:if test="${not empty queryVo.money2 }">
													<input type="hidden" name="Money2"
														value="${queryVo.money2 }">
												</c:if>
												<c:if test="${not empty queryVo.big1 }">
													<input type="hidden" name="Big1" value="${queryVo.big1 }">
												</c:if>
												<c:if test="${not empty queryVo.big2 }">
													<input type="hidden" name="Big2" value="${queryVo.big2 }">
												</c:if>
												<c:if test="${not empty queryVo.house.rentalorsale }">
													<input type="hidden" name="house.rentalorsale"
														value="${queryVo.house.rentalorsale }">
												</c:if>
												<c:if test="${not empty queryVo.house.neworold }">
													<input type="hidden" name="house.neworold"
														value="${queryVo.house.neworold }">
												</c:if>
												<c:if test="${not empty queryVo.house.liveorwork }">
													<input type="hidden" name="house.liveorwork"
														value="${queryVo.house.liveorwork }">
												</c:if>
												<c:if test="${not empty queryVo.house.gardenName }">
													<input type="hidden" name="house.gardenName"
														value="${queryVo.house.gardenName }">
												</c:if>
												<c:if test="${not empty queryVo.house.houseCode }">
													<input type="hidden" name="house.houseCode"
														value="${queryVo.house.houseCode }">
												</c:if>
												<c:if test="${not empty queryVo.house.houseName }">
													<input type="hidden" name="house.houseName"
														value="${queryVo.house.houseName }">
												</c:if>
												<c:if test="${not empty queryVo.house.housePrice }">
													<input type="hidden" name="house.housePrice"
														value="${queryVo.house.housePrice }">
												</c:if>
												<c:if test="${not empty queryVo.house.houseBig }">
													<input type="hidden" name="house.houseBig"
														value="${queryVo.house.houseBig }">
												</c:if>
												<c:if test="${not empty queryVo.house.houseInfo }">
													<input type="hidden" name="house.houseInfo"
														value="${queryVo.house.houseInfo }">
												</c:if>
												<c:if test="${not empty queryVo.house.publisher }">
													<input type="hidden" name="house.publisher"
														value="${queryVo.house.publisher }">
												</c:if>
												<c:if test="${not empty queryVo.house.houseImg }">
													<input type="hidden" name="house.houseImg"
														value="${queryVo.house.houseImg }">
												</c:if>
												<c:if test="${not empty queryVo.loan.rate }">
													<input type="hidden" name="loan.rate"
														value="${queryVo.loan.rate }">
												</c:if>
												<c:if test="${not empty queryVo.loan.year }">
													<input type="hidden" name="loan.year"
														value="${queryVo.loan.year }">
												</c:if>
												<c:if test="${not empty queryVo.loan.money }">
													<input type="hidden" name="loan.money"
														value="${queryVo.loan.money }">
												</c:if>
												<c:if test="${not empty queryVo.loan.monthpay }">
													<input type="hidden" name="loan.monthpay"
														value="${queryVo.loan.monthpay }">
												</c:if>
											</form>
										</c:if>

										<c:if test="${edit == 'false' }">
											<form
												action="${pageContext.request.contextPath }/house/editUI.action?edit=false&cityid=${queryVo.cityid}"
												method="post">

												<input type="submit" value="取消编辑">
												<c:if test="${not empty queryVo.moneyAndBig }">
													<input type="hidden" name="moneyAndBig"
														value="${queryVo.moneyAndBig }">
												</c:if>
												<c:if test="${not empty queryVo.page }">
													<input type="hidden" name="page" value="${queryVo.page }">
												</c:if>
												<c:if test="${not empty queryVo.start }">
													<input type="hidden" name="start" value="${queryVo.start }">
												</c:if>
												<c:if test="${not empty queryVo.rows }">
													<input type="hidden" name="rows" value="${queryVo.rows }">
												</c:if>
												<c:if test="${not empty queryVo.money1 }">
													<input type="hidden" name="Money1"
														value="${queryVo.money1 }">
												</c:if>
												<c:if test="${not empty queryVo.money2 }">
													<input type="hidden" name="Money2"
														value="${queryVo.money2 }">
												</c:if>
												<c:if test="${not empty queryVo.big1 }">
													<input type="hidden" name="Big1" value="${queryVo.big1 }">
												</c:if>
												<c:if test="${not empty queryVo.big2 }">
													<input type="hidden" name="Big2" value="${queryVo.big2 }">
												</c:if>
												<c:if test="${not empty queryVo.house.rentalorsale }">
													<input type="hidden" name="house.rentalorsale"
														value="${queryVo.house.rentalorsale }">
												</c:if>
												<c:if test="${not empty queryVo.house.neworold }">
													<input type="hidden" name="house.neworold"
														value="${queryVo.house.neworold }">
												</c:if>
												<c:if test="${not empty queryVo.house.liveorwork }">
													<input type="hidden" name="house.liveorwork"
														value="${queryVo.house.liveorwork }">
												</c:if>
												<c:if test="${not empty queryVo.house.gardenName }">
													<input type="hidden" name="house.gardenName"
														value="${queryVo.house.gardenName }">
												</c:if>
												<c:if test="${not empty queryVo.house.houseCode }">
													<input type="hidden" name="house.houseCode"
														value="${queryVo.house.houseCode }">
												</c:if>
												<c:if test="${not empty queryVo.house.houseName }">
													<input type="hidden" name="house.houseName"
														value="${queryVo.house.houseName }">
												</c:if>
												<c:if test="${not empty queryVo.house.housePrice }">
													<input type="hidden" name="house.housePrice"
														value="${queryVo.house.housePrice }">
												</c:if>
												<c:if test="${not empty queryVo.house.houseBig }">
													<input type="hidden" name="house.houseBig"
														value="${queryVo.house.houseBig }">
												</c:if>
												<c:if test="${not empty queryVo.house.houseInfo }">
													<input type="hidden" name="house.houseInfo"
														value="${queryVo.house.houseInfo }">
												</c:if>
												<c:if test="${not empty queryVo.house.publisher }">
													<input type="hidden" name="house.publisher"
														value="${queryVo.house.publisher }">
												</c:if>
												<c:if test="${not empty queryVo.house.houseImg }">
													<input type="hidden" name="house.houseImg"
														value="${queryVo.house.houseImg }">
												</c:if>
												<c:if test="${not empty queryVo.loan.rate }">
													<input type="hidden" name="loan.rate"
														value="${queryVo.loan.rate }">
												</c:if>
												<c:if test="${not empty queryVo.loan.year }">
													<input type="hidden" name="loan.year"
														value="${queryVo.loan.year }">
												</c:if>
												<c:if test="${not empty queryVo.loan.money }">
													<input type="hidden" name="loan.money"
														value="${queryVo.loan.money }">
												</c:if>
												<c:if test="${not empty queryVo.loan.monthpay }">
													<input type="hidden" name="loan.monthpay"
														value="${queryVo.loan.monthpay }">
												</c:if>
											</form>
										</c:if>
									</c:if>

								</c:if>
							</td>

							<td align="center" width="25%" rowspan="${page.size+2 }"
								style="background-color: #F5FFFA;" valign="top">
								<table border="00px;" width="300px" style="margin-top: 30px;">
									<tr height="450px" valign="top">
										<td><form
												action="${pageContext.request.contextPath }/house/loan.action"
												method="post">
												<table border="01" height="400px" width="300px"
													align="center">
													<tr>
														<td colspan="3" class="mytd"><font size="4">房贷计算器(月支付款)</font></td>
													</tr>
													<tr align="center">
														<td>贷款金额<br />(万元)
														</td>
														<td>贷款期限<br />(一年十二期)
														</td>
														<td>月利率<br />(%)
														</td>
													</tr>
													<tr align="center">
														<td><input name="loan.money" type="text"
															style="width: 60px;"
															<c:if test="${not empty queryVo.loan.money }">value="${queryVo.loan.money }"</c:if>
															<c:if test="${empty queryVo.loan.money }">value="100.0"</c:if>>万</td>
														<td><input name="loan.year" type="text"
															style="width: 60px;"
															<c:if test="${not empty queryVo.loan.year }">value="${queryVo.loan.year }"</c:if>
															<c:if test="${empty queryVo.loan.year }">value="10"</c:if>>年</td>
														<td><input name="loan.rate" type="text"
															style="width: 60px;"
															<c:if test="${not empty queryVo.loan.rate }">value="${queryVo.loan.rate }"</c:if>
															<c:if test="${empty queryVo.loan.rate }">value="0.49"</c:if>>%</td>
													</tr>
													<tr align="center">
														<td><input type="submit" value="="
															style="width: 40px; height: 40px;"></td>
														<td colspan="2">您每个月需要还贷款:<br /> <c:if
																test="${not empty queryVo.loan.monthpay }">${queryVo.loan.monthpay }</c:if>
															<c:if test="${empty queryVo.loan.monthpay }">12321.32</c:if>￥<br />
															<b></b>(结果仅供参考,一切以银行为准)
														</td>
													</tr>
												</table>
											</form></td>
									</tr>
									<tr height="50px">
										<td class="mytd"><font size="4">大家都在问?</font></td>
									</tr>
									<tr height="50px">
										<td><u><font size="3">What Is MY房网?</font></u></td>
									</tr>
								</table>

							</td>
						</tr>
						<c:forEach items="${page.rows }" var="p">
							<tr height="280px">
								<td width="1%" class="mytd" style="padding-right: 20px;"><a
									href="${pageContext.request.contextPath }/house/houseInfo.action?house.houseCode=${p.houseCode}&cityid=${queryVo.cityid}"
									target="_blank" class="mya"><img
										src="${pageContext.request.contextPath }/${p.houseImg}"
										width="300px" /></a></td>
								<td width="40%" class="mytd"><a
									href="${pageContext.request.contextPath }/house/houseInfo.action?house.houseCode=${p.houseCode}&cityid=${queryVo.cityid}"
									target="_blank" class="mya"><div>
											<h3>${p.houseName }</h3>
											<h4>${p.houseInfo }</h4>
										</div></a></td>
								<td width="15%" align="right" id="houseright" class="mytd3"
									style="padding-right: 20px;"><div
										style="height: 60px; width: 100px;">
										<c:if test="${edit == 'false' }">
											<div>
												<form
													action="${pageContext.request.contextPath }/house/delete.action">
													<input type="submit" value="删除"
														style="width: 50px; height: 25px;" id="delete"> <input
														type="hidden" name="cityid" value="${queryVo.cityid}">
													<input type="hidden" name="house.houseCode"
														value="${p.houseCode}">

												</form>
												<!-- 修改 -->
												<a
													href="${pageContext.request.contextPath }/house/edit.action?cityid=${queryVo.cityid}&house.houseCode=${p.houseCode}"
													target="_blank"> <input type="button" value="编辑"
													style="width: 50px; height: 25px;">
												</a>

											</div>
										</c:if>
										&nbsp;
									</div> <c:if test="${p.rentalorsale==0 }">
										<h4 style="color: red;">出租房</h4>
										<h3 style="color: red;">${p.housePrice }元/月</h3>
									</c:if> <c:if test="${p.rentalorsale==1 }">
										<h4 style="color: green;">售卖房</h4>
										<h3 style="color: red;">${p.housePrice }元</h3>
									</c:if> <c:if test="${p.neworold==0 }">
										<h4>一手房</h4>
									</c:if> <c:if test="${p.neworold==1 }">
										<h4>二手房</h4>
									</c:if> <c:if test="${p.liveorwork==0 }">
										<h4>家居房</h4>
									</c:if> <c:if test="${p.liveorwork==1 }">
										<h4>商用房</h4>
									</c:if>
									<p>${p.houseBig }m²</p></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="3"><itcast:page
									url="${pageContext.request.contextPath }/house/index.action" /></td>
						</tr>
					</table>
		</table>

	</c:if>

	<!-- 随机看房 -->
	<c:if test="${not empty randomHouseList && empty page}">
		<table width="90%" border="00" cellspacing="0" cellpadding="0"
			align="center">
			<tr height="50px">
				<td colspan="2">推荐房源</td>
				<td align="right"><a
					href="${pageContext.request.contextPath}/house/randomHouse.action?cityid=${queryVo.cityid}"
					class="a">换一批</a></td>
			</tr>
			<tr>
				<td colspan="3">
					<div class="container-fluid">
						<div class="col-md-12">
							<c:forEach items="${randomHouseList }" var="p" begin="0" end="3">
								<a
									href="${pageContext.request.contextPath }/house/houseInfo.action?house.houseCode=${p.houseCode}&cityid=${queryVo.cityid}"
									target="_blank" class="a">
									<div class="col-md-3 yes-right-border"
										style="text-align: center; height: 400px; padding: 10px 0px; border: 1px solid black;">
										<img src="${pageContext.request.contextPath }/${p.houseImg}"
											width="300px" />
										<h4>${p.houseName }</h4>${p.houseInfo }

									</div>
								</a>
							</c:forEach>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</c:if>

</body>
</html>