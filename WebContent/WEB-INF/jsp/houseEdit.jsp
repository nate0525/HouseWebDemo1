<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<style>
.td {
	border-bottom: 1px solid black;
}
</style>
<title>MY房网--${queryVo.house.houseName }</title>
</head>
<body>

	<c:if test="${empty uploadUI }">
		<form action="${pageContext.request.contextPath}/house/editHouse.action"
			method="post" enctype="multipart/form-data">
			<table width="100%" align="center" border="0">
				<tr style="background-color: aliceblue;">
					<td colspan="3">
						<table align="center" width="90%">
							<tr height="100px">
								<td align="center" class="td">
									<h2>
										<a
											href="${pageContext.request.contextPath}/house/index.action?cityid=${queryVo.cityid}"
											class="mya">MY房网</a> <input type="hidden" name="cityid"
											value="${queryVo.cityid}"> <input type="hidden"
											name="house.houseCode" value="${queryVo.house.houseCode}">
									</h2>
								</td>
							</tr>
							<tr height="110px">
								<td>房屋名称:<input type="text" name="house.houseName"
									value="${queryVo.house.houseName }" style="width: 500px;">
								</td>
							</tr>
							<tr>
								<td>房屋简介:<input type="text" name="house.houseInfo"
									value="${queryVo.house.houseInfo }" style="width: 600px;"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<table align="center" width="70%" border="0">
							<tr>
								<td width="1%" style="border: 1px solid black;"><img
									src="${pageContext.request.contextPath }/${queryVo.house.houseImg}"
									width="500px" /> 可修改图片路径:<input type="text"
									name="house.houseImg" value="${queryVo.house.houseImg }"
									style="width: 300px;"><br /> 可上传图片:<input type="file"
									name="pic"></td>
								<td align="center">
									<table border="0" width="80%" align="center" height="500px">
										<tr>
											<td colspan="2">房屋类型:<select name="house.rentalorsale"
												id="rentalorsale"><option value="0"
														<c:if test="${queryVo.house.rentalorsale==0}">selected="selected"</c:if>>出租房</option>
													<option value="1"
														<c:if test="${queryVo.house.rentalorsale==1}">selected="selected"</c:if>>售卖房</option></select>
												<select name="house.neworold"><option value="0"
														<c:if test="${queryVo.house.neworold==0}">selected="selected"</c:if>>一手房</option>
													<option value="1"
														<c:if test="${queryVo.house.neworold==1}">selected="selected"</c:if>>二手房</option></select>
												<select name="house.liveorwork"><option value="0"
														<c:if test="${queryVo.house.liveorwork==0}">selected="selected"</c:if>>居民房</option>
													<option value="1"
														<c:if test="${queryVo.house.liveorwork==1}">selected="selected"</c:if>>工作房</option></select>
											</td>
										</tr>
										<tr>
											<!-- 出租房的情况 -->
											<c:if test="${queryVo.house.rentalorsale == 0 }">
												<td><font size="6" color="red"><b><input
															type="text" name="house.housePrice"
															value="${queryVo.house.housePrice }"></b></font><div id="div1">￥/月</div></td>
											</c:if>
											<c:if test="${queryVo.house.rentalorsale == 1 }">
												<td><font size="6" color="red"><b><input
															type="text" name="house.housePrice"
															value="${queryVo.house.housePrice }"></b></font><div id="div1">￥/套</div></td>
											</c:if>

											<td><c:if test="${queryVo.house.rentalorsale==1 }">
											${PriceAndBig }￥/m²<br />
												</c:if> 房屋发布人: ${queryVo.house.publisher }<input
												type="hidden" name="house.publisher"
												value="${queryVo.house.publisher }" readonly="readonly"></td>


										</tr>
										<tr>
											<td><font size="2" color="gray">${queryVo.house.houseInfo }</font>
											</td>
											<td><font size="2" color="gray"><input
													type="text" name="house.houseBig"
													value="${queryVo.house.houseBig }">平米</font></td>
										</tr>
										<tr>
											<td><font size="2" color="gray">小区名称:</font></td>
											<td><font size="2" color="gray"><input
													type="text" name="house.gardenName"
													value="${queryVo.house.gardenName }"> </font></td>
										</tr>
										<tr>
											<td><font size="2" color="gray">所在城市:</font></td>
											<td><font size="2" color="gray"><a
													href="${pageContext.request.contextPath}/house/index.action?cityid=${queryVo.cityid}"
													target="_blank">${queryVo.cityid }</a></font></td>
										</tr>
										<tr>
											<td><font size="2" color="gray">看房时间:</font></td>
											<td><font size="2" color="gray">提前<u>预约</u>随时可看
											</font></td>
										</tr>
										<tr>
											<td><font size="2" color="gray">MY房房屋编号:</font></td>
											<td><font size="2" color="gray">${queryVo.cityid }-${queryVo.house.houseCode }</font></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr height="100px;">
					<td align="right" width="40%"><input type="submit" value="提交"
						style="width: 90px; height: 60px;"></td>
					<td align="center" width="20%"><a
						href="javascript:history.back(-1)"><input type="button"
							value="返回" style="width: 90px; height: 60px;" /></a></td>
					<td align="left" width="40%"><input type="button" name="close"
						value="关闭" onclick="window.close();"
						style="width: 90px; height: 60px;" /></td>
				</tr>
			</table>
		</form>
	</c:if>

	<c:if test="${not empty uploadUI }">
		<form action="${pageContext.request.contextPath}/house/upload.action"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="cityid" value="${queryVo.cityid}">
			<table width="100%" align="center" border="0">
				<tr style="background-color: aliceblue;">
					<td colspan="3">
						<table align="center" width="90%">
							<tr height="100px">
								<td align="center" class="td">
									<h2>
										<a
											href="${pageContext.request.contextPath}/house/index.action?cityid=${queryVo.cityid}"
											class="mya">MY房网</a>
									</h2>
								</td>
							</tr>
							<tr height="110px">
								<td>房屋名称:<input type="text" name="house.houseName"
									style="width: 500px;" value="123">
								</td>
							</tr>
							<tr>
								<td>房屋简介:<input type="text" name="house.houseInfo"
									style="width: 600px;" value="123"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<table align="center" width="70%" border="0">
							<tr>
								<td width="1%" style="border: 1px solid black;"><input
									type="file" name="pictureFile"></td>
								<td align="center">
									<table border="0" width="80%" align="center" height="500px">
										<tr>
											<td colspan="2">房屋类型:<select name="house.rentalorsale"
												id="rentalorsale"><option value="0">出租房</option>
													<option value="1">售卖房</option></select> <select
												name="house.neworold"><option value="0">一手房</option>
													<option value="1">二手房</option></select> <select
												name="house.liveorwork"><option value="0">居民房</option>
													<option value="1">工作房</option></select>
											</td>
										</tr>
										<tr>
											<td><input type="text" name="house.housePrice"
												value="123"> <b id="div1">￥/月</b></td>
											<td><font size="2" color="gray"><input
													type="text" name="house.houseBig" value="123">平米</font></td>
										</tr>
										<tr>
											<td><font size="2" color="gray">小区名称:</font></td>
											<td><font size="2" color="gray"><input
													type="text" name="house.gardenName" value="123"> </font></td>
										</tr>
										<tr>
											<td><font size="2" color="gray">发布者:</font></td>
											<td><font size="2" color="gray">${user.userName }<input
													type="hidden" name="house.publisher"
													value="${user.userName }" readonly="readonly"></font></td>
										</tr>
										<tr>
											<td><font size="2" color="gray">所在城市:</font></td>
											<td><font size="2" color="gray">${queryVo.cityid }</font></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr height="100px;">
					<td align="right" width="40%"><input type="submit" value="提交"
						style="width: 90px; height: 60px;"></td>
					<td align="center" width="20%"><a
						href="javascript:history.back(-1)"><input type="button"
							value="返回" style="width: 90px; height: 60px;" /></a></td>
					<td align="left" width="40%"><input type="button" name="close"
						value="关闭" onclick="window.close();"
						style="width: 90px; height: 60px;" /></td>
				</tr>
			</table>
		</form>
	</c:if>

	<%@ include file="/WEB-INF/jsp/footer.jsp"%>

</body>
<script type="text/javascript">
	$("#rentalorsale").on("change", function() {
		if ($("#rentalorsale").val() == 0) {
			$("#div1").html("￥/月");
		} else if ($("#rentalorsale").val() == 1) {
			$("#div1").html("￥/套");
		}
	});
</script>
</html>