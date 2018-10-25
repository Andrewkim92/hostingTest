<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <header> -->
<div id="flightHeader">
	<div>
		<h3>${fn:length(voList)}개의결과</h3>
	</div>
	<!-- <div>
		<h3>정렬 기준</h3>
		<select name="job">
			<option value="min">최저가순</option>
			<option value="rcmd">추천순</option>
		</select>
	</div> -->

	<!-- <div id="though">
		<h1>경유</h1>
		<div id="thoughContexts">
			<input type="checkbox" name="chk_info" value="HTML" checked>직항<br>111.111<br>
			<input type="checkbox" name="chk_info" value="HTML">1회 경유<br>111.222<br>
			<input type="checkbox" name="chk_info" value="HTML">2회 이상 경유<br>222.222<br>
		</div>
	</div>
	<div id="startTime">
		<h1>출발 시간</h1>
		<div id="startTimeContexts">
			<input type="checkbox" name="chk_info" value="HTML">직항<br>111.111<br>
		</div>
	</div>
	<div id="totalTime">
		<h1>총 소요시간</h1>
		<div id="totalTimeContexts">
			<input type="checkbox" name="chk_info" value="HTML">직항<br>111.111<br>
		</div>
	</div>
	<div>
		<table border="1">
			<tr>
				<th>추천순<br>110,000
				</th>
				<th>최저가<br>111,102
				</th>
				<th>최단여행시간<br>112,111
				</th>
			</tr>
		</table>
	</div> -->
</div>
<!-- </header> -->