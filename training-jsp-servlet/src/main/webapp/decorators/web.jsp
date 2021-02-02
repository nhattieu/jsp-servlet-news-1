<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><decorator:title default="Trang Chủ"></decorator:title></title>

<!-- css -->
<link
	href="<c:url value='/template/web/vendor/bootstrap/css/bootstrap.min.css' />"
	rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value='/template/web/css/shop-homepage.css' />"
	rel="stylesheet" type="text/css" media="all" />

 
</head>
<body>

	<!-- header -->
	<%@ include file="/common/web/header.jsp"%>
	<!-- header -->

	<div class="container">
		<decorator:body></decorator:body>
	</div>

	<!-- footer -->
	<%@ include file="/common/web/footer.jsp"%>
	<!-- footer -->

	<!-- jquery -->
	<script type="text/javascript"
		src="<c:url value='/template/web/vendor/jquery/jquery.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/template/web/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

</body>
</html>