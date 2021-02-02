<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><decorator:title default="Dashboard"></decorator:title></title>

<!-- css -->
<link
	href="<c:url value='/template/admin/vendor/fontawesome-free/css/all.min.css' />"
	rel="stylesheet" type="text/css" media="all" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<link href="<c:url value='/template/admin/css/sb-admin-2.min.css' />"
	rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript"
	src="<c:url value='/template/admin/vendor/jquery/jquery.min.js'/>"></script>
<!-- Bootstrap core JavaScript-->
<script type="text/javascript"
	src="<c:url value='/template/admin/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

<!-- Core plugin JavaScript-->
<script type="text/javascript"
	src="<c:url value='/template/admin/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

<!-- Custom scripts for all pages-->
<script type="text/javascript"
	src="<c:url value='/template/admin/js/sb-admin-2.min.js'/>"></script>

<!-- Page level plugins -->
<script type="text/javascript"
	src="<c:url value='/template/admin/vendor/chart.js/Chart.min.js'/>"></script>

<!-- Page level custom scripts -->
<script type="text/javascript"
	src="<c:url value='/template/admin/js/demo/chart-area-demo.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/template/admin/js/demo/chart-pie-demo.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/template/paging/jquery.twbsPagination.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/ckeditor/ckeditor.js'/>"></script>


</head>
<body id="page-top">

	<div id="wrapper">

		<!-- sidebar -->
		<%@ include file="/common/admin/sidebar.jsp"%>
		<!-- sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@ include file="/common/admin/topbar.jsp"%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<decorator:body></decorator:body>
				</div>
				<!-- /.container-fluid -->

			</div>

			<!-- End of Main Content -->



			<!-- footer -->
			<%@ include file="/common/admin/footer.jsp"%>
			<!-- footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->








</body>
</html>