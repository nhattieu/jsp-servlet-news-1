<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="newsAPI" value="/api/v1/admin/news"></c:url>
<c:url var="newsURL" value="/admin-news">
	<c:param name="type" value="list"></c:param>
	<c:param name="currentPage" value="1"></c:param>
	<c:param name="pageItems" value="5"></c:param>
	<c:param name="sortName" value="title"></c:param>
	<c:param name="sortBy" value="desc"></c:param>
</c:url>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa bài viết</title>
</head>

<body>


        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800 text-uppercase">${title}</h1>
        </div>
        
        
        
        <hr />

        <!-- Content Row -->
        <div class="row">
            <div class="col-md-12">
				<form id="submitForm">
				  <div class="form-group">
				    <label for="">Tên bài viết</label>
				    <input type="text" class="form-control" id="titleNews" name="title" value="${model.title}">
				  </div>
				  <div class="form-group">
				    <label for="1">Thể loại</label>
				    <select class="form-control" id="categoryCode" name="categoryCode">
				    	
				    	<c:if test="${empty model.categoryCode}">
				    		<option value="">Chọn loại bài viết</option>
					    	<c:forEach var="category" items="${categories}">
								<option value="${category.code}">${category.name}</option>
					    	</c:forEach>
				    	</c:if>
				    	<c:if test="${not empty model.categoryCode}">
				    		<option value="">Chọn loại bài viết</option>
				    		<c:forEach var="category" items="${categories}">
				    			<option value="${category.code}" 
				    				<c:if test="${category.code == model.categoryCode}">selected="selected"
				    				</c:if>>${category.name}
				    			</option>
					    	</c:forEach>
				    	</c:if>

				    </select>
				  </div>
				  <div class="form-group">
				    <label for="">Hình ảnh</label>
				    <input type="text" class="form-control" id="thumbnailNews" name="thumbnail" value="${model.thumbnail}">
				  </div>
				  <div class="form-group">
				    <label for="">Mô tả</label>
				    <input type="text" class="form-control" id="shortDescriptionNews" name="shortDescription" value="${model.shortDescription}">
				  </div>
				  <div class="form-group">
				    <label for="">Nội dung</label>
				    <textarea class="form-control" id="contentNews" name="content" rows="6">${model.content}</textarea>
				  </div>
				  <div class="mx-auto">
				  
			  		<c:if test="${empty model.id}">
			  			<button type="button" class="btn btn-success mx-auto" id="btnAddOrUpdateNews">Thêm mới</button>
			  		</c:if>
			  		<c:if test="${not empty model.id}">
			  			<button type="button" class="btn btn-success mx-auto" id="btnAddOrUpdateNews">Cập nhật</button>
			  		</c:if>

				  </div>
				  
				    <input type="hidden" class="form-control" id="id" name="id" value="${model.id}">

				</form>
            </div>

        </div>

        <script type="text/javascript">
        	var editor = '';
        	$(document).ready(function() {
        		editor = CKEDITOR.replace('contentNews');
        	});
        	
       		$('#btnAddOrUpdateNews').click(function(e) {
       			e.preventDefault();
       			var data = {};
       			var dataForm = $('#submitForm').serializeArray();
       			console.log(dataForm);
       			$.each(dataForm, function(index, item) {
       				data["" + item.name + ""] = item.value;
       			});
       			data["content"] = editor.getData();
       			var id = $('#id').val();
       			if(id == "") {
       				addNew(data);
       			} else {
       				updateNew(data);
       			}
       		});
        	
        	function addNew(data) {
        		$.ajax({
        			url: "${newsAPI}",
        			contentType: "application/json",
        			type: "POST",
        			data: JSON.stringify(data),
        			dataType: 'json',
        			success: function(result) {
        				window.location.href = "${newsURL}&alert=success&message=add_success";
        			},
        			error: function(result) {
        				window.location.href = "${newsURL}&alert=danger&message=add_fail";
        			},
        		});
        	}
        	
        	function updateNew(data) {
        		$.ajax({
        			url: "${newsAPI}",
        			contentType: "application/json",
        			type: "PUT",
        			data: JSON.stringify(data),
        			dataType: 'json',
        			success: function(result) {
        				window.location.href = "${newsURL}&alert=success&message=update_success";
        			},
        			error: function(result) {
        				window.location.href = "${newsURL}&alert=danger&message=update_fail";
        			},
        		});
        	}
        	
        	
		</script>

</body>

</html>