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
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../../resources/js/search.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/decorators/header.jsp" />

	<!-- Page Content -->
	<div class="container">

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
					<div class="carousel-inner" role="listbox" width="900px" height="350px">
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="../../resources/uploadImg/oZeYTj18dwTslK76ly1C7Y5cxsqbBQos.jpg"
								alt="First slide" width="900px" height="280px">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="../../resources/uploadImg/kBeqCF4cLjeobu7lrUVPJ2NYQDKhdvyq.jpg"
								alt="Second slide" width="900px" height="280px">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="../../resources/uploadImg/hSmDpJc4iTmNmamEGfSGTxR4bWojRfSA.jpg"
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
				<div class="search_area">
					<p>자동완성기능</p>
					<input id="autocomplete" type="text" />
				</div>

				<div class="row">
					<c:forEach var="item" items="${itemList}">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"> <img class="card-img-top"
									src="../../resources/uploadImg/${item.fileName }" alt="" height="200px"></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="/detailItem?bno=${item.bno }">${item.subject }</a>
									</h4>
									<h5>${item.writer }</h5>
									<p class="card-text">${item.content }</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">3.2/5.0</small>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/jsp/decorators/footer.jsp" />

	<!-- 	<script src="../../resources/vendor/jquery/jquery.min.js"></script> -->
	<script
		src="../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
