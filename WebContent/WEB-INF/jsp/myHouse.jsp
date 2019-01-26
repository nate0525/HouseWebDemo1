<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的发布</title>
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
	<table width="100%" border="0" height="700px">
		<tr
			style="background-image: url(${pageContext.request.contextPath}/img/banner.jpg);"
			height="300px">
			<td colspan="2">
				<table border="0" cellspacing="0" cellpadding="0" width="90%"
					align="center" height="300px" style="color: white;">
					<tr align="center" height="80px" valign="top">
						<td width="35%">
							<h1>
								<a
									href="${pageContext.request.contextPath}/house/index.action?cityid=${queryVo.cityid}"
									class="logodiv">MY房网</a>
							</h1>
						</td>
						<td><h4 style="color: white;">发布城市:${queryVo.cityid}</h4></td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">${msg }
				<div class="container-fluid" align="center">
					<div class="col-md-12" align="center">
						<c:forEach items="${page.rows }" var="p">
							<div class="col-md-3 yes-right-border"
								style="text-align: center; height: 400px; padding: 10px 0px; border: 1px solid black;">
								<a
									href="${pageContext.request.contextPath}/house/houseInfo.action?house.houseCode=${p.houseCode}&cityid=${queryVo.cityid}"
									target="_blank" class="a"><img
									src="${pageContext.request.contextPath }/${p.houseImg}"
									width="300px" />
									<h4>${p.houseName }</h4>${p.houseInfo }</a><br /> <a
									href="${pageContext.request.contextPath}/house/deleteOfMyHouse.action?house.houseCode=${p.houseCode}&cityid=${queryVo.cityid}&page=${page.page }&rows=${page.size}"
									style="color: black;">删除</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center"><itcast:page
					url="${pageContext.request.contextPath}/house/seeMyHouse.action" /></td>
		</tr>
		<tr>
			<td><%@ include file="/WEB-INF/jsp/footer.jsp"%></td>
		</tr>
	</table>

</body>
</html>