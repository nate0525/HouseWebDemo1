<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page isELIgnored="false"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.td {
	border-bottom: 1px solid black;
}
</style>
<title>MY房网--${queryVo.house.houseName }</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
</head>
<body>
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
						<td>
							<h1>
								<b>${queryVo.house.houseName }</b>
							</h1>
						</td>
					</tr>
					<tr>
						<td><font color="darkgray" size="5">${queryVo.house.houseInfo }</font></td>
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
							width="500px" /></td>
						<td align="center">
							<table border="0" width="80%" align="center" height="500px">
								<tr>
									<!-- 出租房的情况 -->
									<c:if test="${queryVo.house.rentalorsale == 0 }">
										<td><font size="6" color="red"><b>${queryVo.house.housePrice }</b></font>￥/月</td>
										<td>
											<%-- ${PriceAndBig }￥/m²<br /> --%>押金或其他情况请咨询房屋发布人:<a
											href="${pageContext.request.contextPath}/house/index.action?cityid=${queryVo.cityid}&house.publisher=${queryVo.house.publisher}"
											target="_blank">${queryVo.house.publisher }</a>
										</td>
									</c:if>
									<!-- 售卖房的情况 -->
									<c:if test="${queryVo.house.rentalorsale == 1 }">
										<td><font size="6" color="red"><b>${queryVo.house.housePrice }</b></font>￥/一套</td>
										<td>${PriceAndBig }￥/m²<br />押金或贷款情况请咨询房屋发布人:<a
											href="${pageContext.request.contextPath}/house/index.action?cityid=${queryVo.cityid}&house.publisher=${queryVo.house.publisher}"
											target="_blank">${queryVo.house.publisher }</a></td>
									</c:if>

								</tr>
								<tr>
									<td><font size="2" color="gray">${queryVo.house.houseInfo }</font>
									</td>
									<td><font size="2" color="gray">${queryVo.house.houseBig }平米</font>
									</td>
								</tr>
								<tr>
									<td><font size="2" color="gray">房屋类型:</font></td>
									<td><font size="2" color="gray"><a
											href="${pageContext.request.contextPath}/house/index.action?cityid=${queryVo.cityid}&house.liveorwork=${queryVo.house.liveorwork}"
											target="_blank"> <c:if
													test="${queryVo.house.liveorwork==0 }">
											居民房
											</c:if> <c:if test="${queryVo.house.liveorwork==1 }">
											商用房
											</c:if>
										</a> &nbsp; <a
											href="${pageContext.request.contextPath}/house/index.action?cityid=${queryVo.cityid}&house.neworold=${queryVo.house.neworold}"
											target="_blank"> <c:if
													test="${queryVo.house.neworold==0 }">
											一手房
											</c:if> <c:if test="${queryVo.house.neworold==1 }">
											二手房
											</c:if>
										</a> </font></td>
								</tr>
								<tr>
									<td><font size="2" color="gray">小区名称:</font></td>
									<td><font size="2" color="gray"><a
											href="${pageContext.request.contextPath}/house/index.action?cityid=${queryVo.cityid}&house.gardenName=${queryVo.house.gardenName}"
											target="_blank">${queryVo.house.gardenName }</a></font></td>
								</tr>
								<tr>
									<td><font size="2" color="gray">所在城市:</font></td>
									<td><font size="2" color="gray"><a
											href="${pageContext.request.contextPath}/house/index.action?cityid=${queryVo.cityid}"
											target="_blank">${queryVo.cityid }</a></font></td>
								</tr>
								<tr height="50px">
									<td><font size="2" color="gray">看房时间:</font></td>
									<td valign="top"><font size="2" color="gray">提前<u
											id="booking">预约</u>随时可看<input type="hidden" id="bookinger"
											name="bookinger" value="${houseUser.userPhone}"><br />
									</font>
										<div id="tips" style="color: gray;">&nbsp;</div></td>
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
			<td width="40%;" align="center"><a
				href="javascript:window.opener=null;window.open('','_self');window.close();"><input
					type="button" value="关闭" style="width: 90px; height: 45px;"></a></td>
			<td>
			
			
				<c:if
					test="${user.userLevel==1}">
					<a
						href="${pageContext.request.contextPath }/house/edit.action?cityid=${queryVo.cityid}&house.houseCode=${queryVo.house.houseCode}">
						<input type="button" value="编辑" style="width: 90px; height: 45px;">
					</a>
				</c:if>
				
				<c:if
					test="${user.userLevel==0 and user.userName==queryVo.house.publisher }">
					<a
						href="${pageContext.request.contextPath }/house/editOfMyHouse.action?cityid=${queryVo.cityid}&house.houseCode=${queryVo.house.houseCode}">
						<input type="button" value="编辑" style="width: 90px; height: 45px;">
					</a>
				</c:if>
				
				
				</td>
			<td></td>
		</tr>
	</table>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#booking").mouseover(function() {
			var bookinger = $("#bookinger").val();
			if (bookinger == null || bookinger == '') {
				$("#tips").html("该发布者未注册,请联系工作人员");
			} else {
				$("#tips").html("房屋发布者手机号码:" + bookinger);
			}
		});
		$("#booking").mouseout(function() {
			$("#tips").html(" ");
		});
	});
</script>
</html>