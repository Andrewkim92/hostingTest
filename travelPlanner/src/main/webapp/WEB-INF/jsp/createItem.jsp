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

<title>CreateItem</title>

<!-- Bootstrap core CSS -->
<link href="../../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<link href="../../resources/css/naver.css" rel="stylesheet">
<link href="../../resources/css/naver2.css" rel="stylesheet">
<link href="../../resources/css/okky.css" rel="stylesheet">
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
	var bno = ${vo.bno};
	
	if(bno==null){
		bno = 0;
	}
	getReplyList(bno);

	$("#replies").on("click", ".replyLi button", function() {
		var reply = $(this).parent();
		var rno = reply.attr("data-rno");
		var reply = reply.text();

	})
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
						<h2>주제 :</h2>
						<input type="text" name="subject" id="subject"
							value="${vo.subject }"> 내용 : <input type="text" name="content" id="content" value="${vo.content }"> 
							글쓴이 :
						<input type="text" name="writer" id="writer" value="${vo.writer }">
						<input type="file" name="files">
						<c:choose>
							<c:when test="${vo.bno == null}">
								<input type="hidden" id="bno" name="bno" value='0'>	
							</c:when>
							<c:otherwise>
								<input type="hidden" id="bno" name="bno" value="${vo.bno }">
							</c:otherwise>
						</c:choose>
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
				<tbody>
					<form action="/createReply" id="replyForm" name="replyForm"
						method="post" enctype="multipart/form-data">
						<input type="text" name="reply" id="reply" value="reply">
						<input type="text" name="replyWriter" id="replyWriter"
							value="replyWriter" readOnly> <input type="hidden"
							id="bno2" name="bno" value="${vo.bno }">
						<!-- 						<button type="submit" class="btn btn-primary">Write</button> -->
					</form>
				</tbody>
			</table>

			<button type="button" class="btn btn-primary"
				onclick="createReplyAjax();">WriteAjax</button>
		</div>
	</div>

	<ul class="list-group">
		<li id="note-title" class="list-group-item note-title">
			<h3 class="panel-title">
				댓글 <span id="note-count">${replyList.cnt }</span>
			</h3>
		</li>
		<div id="replyTemplateArea">
			<li class="list-group-item note-item clearfix" id="note-1">
				<div class="content-body panel-body pull-left" style="width: 1500px">
					<div class="avatar avatar-medium clearfix">
						<div class="avatar-info">
							<a class="nickname" href="zz" title="aaa">사용자 ID</a>
						</div>
						<div class="date-created">
							<span class="timeago" title="2018-10-31 16:33:06.0">2018-10-31
								16:33:06.0</span>
						</div>
						<fieldset class="form">
							<article id="note-text-1" class="list-group-item-text note-text">
							<p>댓글.</p>
							<p>
								<br>
							</p>
							</article>
						</fieldset>
					</div>
				</div> <!-- 			추천 부분  -->
				<div class="content-function pull-right text-center">
					<!-- 			<h1>bbb</h1> -->
					<button id="update">update</button>
					<button id="delete">delete</button>
					<button id="plus">plus</button>
					<button id="minus">minus</button>
					<!-- 					<div class="content-function-group"> -->
					<!-- 						<div class="note-evaluate-wrapper"> -->
					<!-- 							<a href="#" class="note-vote-btn" role="button"></a> <i id="a" -->
					<!-- 								class="fa fa-angle-up note-evaluate-assent-assent" -->
					<!-- 								data-placement="left" data-toggle="tooltip" title -->
					<!-- 								data-original-title="추천"> </i> -->
					<!-- 							<div id="content-vote-count-1549482" class="content-eval-count">0</div> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
				</div>
				<div id="content-function-cog-1461082" class="content-function-cog">
					<!-- 				<button id="update">AAAA</button> -->
				</div>
			</li>
		</div>
	</ul>
	<!-- 	<button id="update">AAAA</button> -->
	<jsp:include page="/WEB-INF/jsp/decorators/footer.jsp" />

	<script
		src="../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
