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
<title>TravelPlanner</title>

<!-- Bootstrap core CSS -->
<link href="../../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<style>
/* city Search Loading by Justin 2013.04.02 */
.ui-autocomplete-loading {
	background: white
		url('http://f.goodkiss.co.kr/sample/images/waiting.gif') right center
		no-repeat;
}

.wrap {
	width: 1092px;
	margin: 0 auto;
	position: relative;
}

.col-lg-9{
	width: 100%;
	margin: 0 auto;
	position: relative;
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="../../resources/js/search.js"></script>
<script src="../../resources/js/common.js"></script>
<link rel="stylesheet" href="../../resources/css/search.css" />

<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="../../resources/js/_websocket.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/decorators/header.jsp" />

	<!-- Page Content -->
	<div class="container">
		<div class="search_area">
			<h1 style="color: white">나만의 여행 플래너 ! 쉽고 빠르게 여행을 계획하세요.</h1>
			<input id="autocomplete" type="text" />

			<h2 style="color: white">추천도시 :</h2>
		</div>
		<!-- 		<div class="wrap"> -->
		<!-- 		</div> -->

		<div class="row">
			<jsp:include page="/WEB-INF/jsp/decorators/headerMenu.jsp" />

			<div class="col-lg-9">
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox" width="900px"
						height="350px">
						<div class="carousel-item active">
							<img class="d-block img-fluid"
								src="../../resources/uploadImg/oZeYTj18dwTslK76ly1C7Y5cxsqbBQos.jpg"
								alt="First slide" width="900px" height="280px">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="../../resources/uploadImg/kBeqCF4cLjeobu7lrUVPJ2NYQDKhdvyq.jpg"
								alt="Second slide" width="900px" height="280px">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="../../resources/uploadImg/hSmDpJc4iTmNmamEGfSGTxR4bWojRfSA.jpg"
								alt="Third slide" width="900px" height="280px">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

				<div class="row">
					<c:forEach var="item" items="${itemList}">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"> <img class="card-img-top"
									src="../../resources/uploadImg/${item.fileName }" alt=""
									height="200px"></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="/detailItem?bno=${item.bno }">${item.subject }</a>
									</h4>
									<h5>${item.writer }</h5>
									<p class="card-text">${item.content }</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">4.5/5.0</small>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>

		<div id="contents">
			<div id="fixedbtn">
				<button id="connect">
					팝업창 열기
				</button>
			</div>
			<div id="chatRoom">
				<textarea id="textArea" rows="8" cols="100"></textarea>
<!-- 				<div id="textArea"></div> -->
				<!-- 				<a href="#">레이어 팝업이 제공되었습니다.</a> -->
				<button type="button" id="disconnect"
					style="position: fixed; bottom: 24%; left: 97%; width: 3%;">X</button>
				<form>
					<input id="chatName" type="text" placeholder="guest" 
					style="position: fixed; bottom: 1%; width: 7%; right:32%;"/>
					<input id="chatText" type="text" placeholder="채팅을 입력하세요."
						style="position: fixed; bottom: 1%; width: 30%; right:3%;" />
					<button id="send" type="submit" style="bg-color:gray; position: fixed; bottom: 1%; left: 95%; width:5%;">Send</button>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/jsp/decorators/footer.jsp" />
	<!-- 	<script src="../../resources/vendor/jquery/jquery.min.js"></script> -->
	<script
		src="../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
