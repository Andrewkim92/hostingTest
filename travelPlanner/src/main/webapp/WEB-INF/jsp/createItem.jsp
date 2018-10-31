<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Shop Homepage - CreateItem</title>

<!-- Bootstrap core CSS -->
<link href="../../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Custom styles for this template -->
<!-- <link href="../../resources/css/shop-homepage.css" rel="stylesheet"> -->

<script src="../../resources/vendor/jquery/jquery.min.js"></script>
<script src="../../resources/js/common.js"></script>
<style>
.modal-footer {
	border-top: 0px;
}

iframe {
	width: 0px;
	height: 0px;
	border: 0px
}
</style>
</head>
<script>
	fileDrop();
	
	getReplyList();
</script>

<body>

	<jsp:include page="/WEB-INF/jsp/decorators/header.jsp" />

	<div class="container">
		<jsp:include page="/WEB-INF/jsp/decorators/headerMenu.jsp" />

		<!-- /.col-lg-3 -->
		<table class="table table-bordered">
			<tbody>
				<div id="formDiv" style="width: 700px">
					<form action="/createItem" id="fileUpload" name="fileUpload"
						method="post" enctype="multipart/form-data">
						주제 : <input type="text" name="subject" id="subject" value="${vo.subject }"> 
						내용 : <input type="text" name="content" id="content" value="${vo.content }"> 
						글쓴이 : <input type="text" name="writer" id="writer" value="${vo.writer }">
						<input type="file" name="file"> 
						<input type="hidden" id="bno" name="bno" value="${vo.bno }">
						<button type="submit" class="btn btn-primary">upload</button>
					</form>
				</div>
			</tbody>
		</table>

	
		<div id="deleteButton">
			<button id="a" onclick="deleteItem('fileUpload');">삭제</button>
		</div>

		<br>
		<div id="replyArea">
			<table class="table table-bordered">
				<c:forEach var="item" items="${ReplyList}">
					<td>${item.reply}</td>
					<td>${item.replyWriter}</td>
					<p>
					</p>
				</c:forEach>
			</table>
			<table class="table table-bordered">
				<tbody>
					<form action="/createReply" id="replyForm" name="replyForm"
						method="post" enctype="multipart/form-data">
						<input type="text" name="reply" id="reply" value="reply">
						<input type="text" name="replyWriter" id="replyWriter"
							value="replyWriter" readOnly> <input type="hidden"
							id="bno2" name="bno" value="${vo.bno }">
						<button type="submit" class="btn btn-primary">Write</button>
					</form>
				</tbody>
			</table>
			
			<button type="button" class="btn btn-primary" onclick="createReplyAjax();">WriteAjax</button>
		</div>
	</div>
	
	<ul id="replies">
		
	</ul>

	<jsp:include page="/WEB-INF/jsp/decorators/footer.jsp" />

	<script
		src="../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
