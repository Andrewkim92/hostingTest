<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%> --%>
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

<!-- Custom styles for this template -->
<!-- <link href="../../resources/css/shop-homepage.css" rel="stylesheet"> -->



<link href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" rel="Stylesheet"></link>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src='https://cdn.rawgit.com/pguso/jquery-plugin-circliful/master/js/jquery.circliful.min.js'></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script>

<script src="../../resources/js/search.js"></script>


<!-- <link href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" rel="Stylesheet"></link>

<script src="YourJquery source path"></script>
<script src="../../resources/js/search.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script> -->


<!-- <link rel="stylesheet" -->
<!-- 	href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" /> -->

<!-- <style>
.ui-autocomplete-loading {
	background: white
		url('http://f.goodkiss.co.kr/sample/images/waiting.gif') right center
		no-repeat;
}
</style> -->
<!-- <script>
$(document).ready(function() {
	testSearch();

})
</script> -->

<script>
	$(function() {
		var availableTags = [ "ActionScript", "AppleScript", "Asp", "BASIC",
				"C", "C++", "Clojure", "COBOL", "ColdFusion", "Erlang",
				"Fortran", "Groovy", "Haskell", "Java", "JavaScript", "Lisp",
				"Perl", "PHP", "Python", "Ruby", "Scala", "Scheme" ];
		$("#tags").autocomplete({
			source : availableTags
		});
	});
</script>

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
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="http://placehold.it/900x350"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="http://placehold.it/900x350"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="http://placehold.it/900x350"
								alt="Third slide">
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
					<!-- 					<div class="ui-widget"> -->
					<!-- 						<label for="city">Input City:</label> <input id="cityNm" /> -->
					<!-- 					</div> -->
					<!-- 					<div class="ui-widget" style="margin-top: 2em; font-family: Arial;"> -->
					<!-- 						Result: -->
					<!-- 						<div id="cityResult" -->
					<!-- 							style="height: 200px; width: 300px; overflow: auto;" -->
					<!-- 							class="ui-widget-content"></div> -->
					<!-- 					</div> -->
					<p>자동완성기능</p>
					<input id="autocomplete" type="text" />
					<div class="ui-widget">
						<label for="tags">Tags: </label> <input id="tags">
					</div>
					<!-- 					<input -->
					<!-- 						class="search_input" id="city_search" placeholder="국가명, 도시명으로 검색" -->
					<!-- 						style="background: url(&quot;/res/img/area/area_search_ico.gif&quot;) right center no-repeat white;"> -->
					<!-- 					<div id="city_autocomplete" style="display: none;"></div> -->
				</div>

				<div class="row">
					<c:forEach var="item" items="${itemList}">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="http://placehold.it/700x400" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="/detailItem?bno=${item.bno }">${item.subject }</a>
									</h4>
									<h5>$333.99</h5>
									<p class="card-text">${item.content }</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#9734;</small>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
				<!-- /.col-lg-9 -->
			</div>
			<!-- /.row -->

		</div>
		<!-- /.container -->
	</div>

	<jsp:include page="/WEB-INF/jsp/decorators/footer.jsp" />

	<script src="../../resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
