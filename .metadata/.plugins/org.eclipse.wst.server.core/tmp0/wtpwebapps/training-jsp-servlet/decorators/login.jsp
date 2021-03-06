<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><decorator:title default="Đăng nhập"></decorator:title></title>

<!-- css -->
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css" />
<link href="<c:url value='/template/login/css/login.css' />"
	rel="stylesheet" type="text/css" media="all" />

</head>
<body>

	<div class="container">
		<decorator:body></decorator:body>
	</div>

	<!-- jquery -->
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script
		src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
</body>
</html>