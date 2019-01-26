<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />
<title>用户登录</title>
<script>
	function showtips(spanID, msg) {
		var tips = document.getElementById(spanID);
		tips.innerHTML = msg;
	}

	function checkname() {
		var name = document.getElementById("username").value;
		var tips = document.getElementById("nametips");
		if (name.trim().length < 2 || name.trim().length > 8) {
			tips.innerHTML = "<font color='red' class='formtips onSuccess'>×</font>";
		} else {
			tips.innerHTML = "<font color='blue'>↓</font>";
		}
	}

	function checkpassword() {
		var firstpass = document.getElementById("password").value;
		var firsttips = document.getElementById("1passwordtips");
		var scoendpass = document.getElementById("password2").value;
		var scoendtips = document.getElementById("2passwordtips");
		if (firstpass.trim().length < 6 || firstpass.trim().length > 12) {
			firsttips.innerHTML = "<font color='red'  class='error'>×</font>";
			scoendtips.innerHTML = "";
			return false;
		} else {
			firsttips.innerHTML = "<font color='blue'>↓</font>";
			if (firstpass == scoendpass) {
				if (firstpass.trim().length >= 6) {
					scoendtips.innerHTML = "<font color='blue'>↓</font>";
					return true;
				} else {
					return false;
				}
			} else {
				document.getElementById("password2").value = "";
				scoendtips.innerHTML = "";
			}
		}

	}

	function checkpassword2() {
		var firstpass = document.getElementById("password").value;
		var pass = document.getElementById("password2").value;
		var tips = document.getElementById("2passwordtips");
		if (pass == firstpass) {
			if (pass.trim().length >= 6) {
				tips.innerHTML = "<font color='blue'>↓</font>";
				return true;
			} else {
				tips.innerHTML = "<font color='red'  class='error'>×</font>";
				return false;
			}
		} else {
			tips.innerHTML = "<font color='red'  class='error'>×</font>";
			return false;
		}
	}

	function checkphone() {
		var tel = document.getElementById("phonenum").value;
		var tips = document.getElementById("teltips");
		if (!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel))) {
			tips.innerHTML = "<font color='lightgreen'  class='error'>×</font>";
			return false;
		} else {
			tips.innerHTML = "<font color='blue'>↓</font>";
			return true;
		}
	}

	function resetbut() {
		var tipsname = document.getElementById("nametips");
		var firsttips = document.getElementById("1passwordtips");
		var scoendtips = document.getElementById("2passwordtips");
		var tipstel = document.getElementById("teltips");
		var tipsemail = document.getElementById("emailtips");
		tipsname.innerHTML = "";
		firsttips.innerHTML = "";
		scoendtips.innerHTML = "";
		tipstel.innerHTML = "";
		tipsemail.innerHTML = "";
	}

	function checkForm() {
		var flag = checkname() && checkpassword() && checkpassword2()
				&& checkphone();
		return flag;
	}
</script>
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
						<td></td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>${msg }</td>
		</tr>
		<tr>
			<td width="50%" align="center"><table border="1" width="95%"
					align="center" height="500px;">
					<tr>
						<td><form
								action="${pageContext.request.contextPath }/user/register.action"
								method="post">
								<table border="0" width="100%" height="500px;">
									<tr height="100px">
										<td align="center"><h2>
												<b>用户注册</b>
											</h2></td>
										<td colspan="2">${registerInfo }</td>
									</tr>
									<tr>
										<td align="right" width="20%">用户名:</td>
										<td><input type="text" name="userName"
											style="width: 300px; height: 30px;" id="username"
											onfocus="showtips('nametips','用户名不得小于3位大于8位')"
											onblur="checkname()" onkeyup="checkname()"></td>
										<td width="200px"><div id="nametips"></div></td>
									</tr>
									<tr>
										<td align="right">密码:</td>
										<td><input type="password" name="userPassWord"
											style="width: 300px; height: 30px;" id="password"
											onfocus="showtips('1passwordtips','密码不得小于6位大于12位')"
											onblur="checkpassword()" onkeyup="checkpassword()"></td>
										<td><div id="1passwordtips"></div></td>
									</tr>
									<tr>
										<td align="right">确认密码:</td>
										<td><input type="password"
											style="width: 300px; height: 30px;" id="password2"
											onfocus="showtips('2passwordtips','密码必须与上面密码一致')"
											onblur="checkpassword2()" onkeyup="checkpassword2()"></td>
										<td><div id="2passwordtips"></div></td>
									</tr>
									<tr>
										<td align="right">手机号:</td>
										<td><input id="phonenum" type="text" name="userPhone"
											style="width: 300px; height: 30px;" id="phone"
											onfocus="showtips('teltips','11位手机号码')" onblur="checkphone()"
											onkeyup="checkphone()" value="15728412469"></td>
										<td><div id="teltips"></div></td>
									</tr>
									<tr>
										<td colspan="2" align="center"><input type="submit"
											value="注册" style="height: 45px; width: 90px;"
											onclick="checkForm()">&nbsp;&nbsp;<input type="reset"
											value="重置" onclick="resetbut()"
											style="height: 45px; width: 90px;" /></td>
									</tr>
								</table>
							</form></td>
					</tr>
				</table></td>
			<td width="50%" align="center"><table border="1" width="95%"
					align="center" height="500px;">
					<tr>
						<td><form
								action="${pageContext.request.contextPath }/user/login.action">
								<input type="hidden" name="cityid" value="${cityid }">
								<table border="0" width="100%" align="center" height="500px;">
									<tr height="100px">
										<td align="center"><h2>
												<b>用户登录</b>
											</h2></td>
										<td>${loginErreo }</td>
									</tr>
									<tr>
										<td align="right" width="30%">用户名:</td>
										<td><input type="text" name="userName"
											style="width: 300px; height: 30px;" value="1234"></td>
									</tr>
									<tr>
										<td align="right">密码名:</td>
										<td><input type="password" name="userPassWord"
											style="width: 300px; height: 30px;"></td>
									</tr>
									<tr>
										<td colspan="2" align="center"><input type="submit"
											value="登录" style="height: 45px; width: 90px;"></td>
									</tr>
								</table>
							</form></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>