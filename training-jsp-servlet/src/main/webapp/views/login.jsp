<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	<div class="login-container">
		<div id="output"></div>
		<div class="avatar"></div>
		<div class="form-box ${alert}">
			<form action="<c:url value='/dang-nhap?action=login'/>" method="post">
				<input name="userName" type="text" placeholder="tài khoản"> 
				<input name="password" type="password" placeholder="mật khẩu">
				<input type="hidden" name="action" value="login">
				<div class="text__message text__${alert}">
					<p>${message}</p>
				</div>
				<button class="btn btn-info btn-block login" type="submit">đăng nhập</button>
			</form>
		</div>
	</div>
</body>
</html>