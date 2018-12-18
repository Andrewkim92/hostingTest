
function fileDrop() {

	$(".fileDrop").on(
			"drop",
			function(event) {
				event.preventDefualt();

				$.ajax({
					url : '/uploadAjax',
					data : formData,
					dataType : 'text',
					precessData : false,
					contentType : false,
					type : 'POST',
					success : function(data) {
						var str = "";

						if (checkImageType(data)) {
							str = "<div>" + "<img src='displayFile?fileName="
									+ data + "'/>'" + data + "</div>";
						} else {
							str = "<div>" + data + "</div>";
						}
						$(".uploadedList").append(str);
					}
				});

			});
}

function getReplyList(bno){
	
	$.getJSON("/replies/all/"+bno, function(data){
		var str="";
		
		$(data).each(
				function(){
					str +="<li class='list-group-item note-item clearfix' id='note-1'>" 
						+ "<div class='content-body panel-body pull-left' style='width:1500px'>" 
						+ "<div class='avatar-info'><a class='nickname' href='#' title='"+this.replyWriter+"'>"
						+ this.replyWriter + "</a></div>" 
						+ "<div class='date-created'><span class='timeago' title='"+this.timestamp+"'>"+this.timestamp
						+ "</span>" 
						+ "</div>"
						+ "<fieldset class='form'><article id='note-text-1' class='list-group-item-text note-text'>" 
						+ "<p id='replyArea-"+this.rno+"' text='"+this.reply+"'>"+this.reply+"</p><p><br></p></article></fieldset></div></div>"
						+ "<div class='content-function pull-right text-center'>"
						+ "<button id='delete-'"+this.rno+" onclick='deleteReply("+this.rno+")'>delete</button>"
						+ "<button id='update-'"+this.rno+" onclick='updateReply("+this.rno+")'>update</button>";
				});
		
		$("#replyTemplateArea").html(str);
		
	});
}

function updateReply(rno){
	
//	ulObj.removeChild(liObjs[1]);
	var exReply = $("#replyArea-"+rno).text();
	
	var str="<input type='text' id='updateReply' value='"+exReply+"'></input>";
	var str2= "<button id='update' onclick='updateReplyDO("+rno+")'>update</button>";
	
	str= str+str2;
	$("#replyArea-"+rno).empty();
	$("#replyArea-"+rno).html(str);
}

function updateReplyDO(rno){
	
	let bno = parseInt($("#bno").val());
	let reply = $("#updateReply").val();
	
	$.ajax({
		url : "/replies/"+rno,
		type : "PUT",
		headers : {
			"Content-Type" : "application/json"
		},
		dataType: "text",
		data : JSON.stringify({
			rno: rno,
			reply:reply
		}),
		// dataType: 'json',
		success : function(res) {
			if (res == 'SUCCESS') {
				alert("updated");
				getReplyList(bno);
			} else {
				alert("error");
			}
		}
	});
}

function deleteReply(rno){
	
	let bno = $("#bno").val();
	
	$.ajax({
		url : "/replies/"+rno,
		type : "delete",
		headers : {
			"Content-Type" : "application/json"
		},
		dataType: "text",
		data : JSON.stringify({
			rno: rno
		}),
		// dataType: 'json',
		success : function(res) {
			if (res == 'SUCCESS') {
				alert("deleted");
				getReplyList(bno);
			} else {
				alert("error");
			}
		}
	});
}

function createReplyAjax(){
	
	let reply = $("#reply").val();
	let replyWriter = $("#replyWriter").val();
	let bno = $("#bno").val();
	
	$.ajax({
		url : "/replies",
		type : "post",
		headers : {
			"Content-Type" : "application/json"
//			"X-HTTP-Method-Override" : "POST"
		},
		dataType: "text",
		data : JSON.stringify({
			bno: bno,
			replyWriter :replyWriter,
			reply : reply
		}),
		// dataType: 'json',
		success : function(res) {
			if (res == 'SUCCESS') {
				alert("registered");
				getReplyList(bno);
			} else {
				alert("error");
			}
		}
	});
}

// jpg,gif,png,jpeg 확장자 찾는 함수
function checkImageType(data) {

	var pattern = /jpg|gif|png|jpeg/i;

	return fileName.match(pattern);
}

function addFilePath(msg) {
	alert(msg);
	document.getElementById("form1").reset();
}

function searchFlight() {

	// 입력정보확인 (출발 , 도착 , 기간 (출발/도착), 인원)
	// ajax 통신
	// 결과 확인 및 페이지 이동
	location.href = "flight";
}

function goFlightTimeInfo(formId) {
	// var formDataObj = $("#" + formId).serializeObject();
	var formDataObj = $("#" + formId).serialize();
	location.href = "flight?" + formDataObj;
}

function getDFlightInfo(formId) {
	// var formDataObj = $("#" + formId).serializeObject();
	var formDataObj = $("#" + formId).serialize();
	location.href = "dFlightSchList?" + formDataObj;
}

function getFlightTimeInfo(formId) {
	var formDataObj = $("#" + formId).serialize();
	location.href = "flightInfo?" + formDataObj;
}

function deleteItem(formId) {

	var form = document.createElement('form');
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "deleteItem");
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "bno");
	var bno = $("#bno").val();
	hiddenField.setAttribute("value", bno);
	form.appendChild(hiddenField);
	document.body.appendChild(form);
	form.submit();
}

function getFlightTimeInfo2(formId) {

	var formDataObj = $("#" + formId).serializeObject();

	if ($("#domestic").is(":checked") == true) {
		formDataObj.schLineType = "D";
	} else {
		formDataObj.schLineType = "I";
	}

	if ($("#start").is(":checked") == true) {
		formDataObj.schIOType = "I";
	} else {
		formDataObj.schIOType = "O";
	}

	$.ajax({
		url : "/getFlightTimeInfo",
		type : "get",
		data : formDataObj,
		// dataType: 'json',
		success : function(res) {
			if (res == null) {
				alert('no data');
			} else {
				// 1. 영역에 데이터 뿌리기
				// 1-1. 데이터 개수 확인
				// 1-2. 데이터 개수에 맞게 뿌리기
			}
		}
	});
}

function drawChart() {
	let a = 1;

	$.ajax({
		url : "/drawChart",
		type : "get",
		data : null,
		// dataType: 'json',
		success : function(res) {
			if (res == null) {
				alert('no data');
			} else {
				res.int1;
				res.int2;
			}
		}
	});
}

jQuery.fn.serializeObject = function() {
	var obj = null;
	try {
		if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
			var arr = this.serializeArray();
			if (arr) {
				obj = {};
				jQuery.each(arr, function() {
					obj[this.name] = this.value;
				});
			}
		}
	} catch (e) {
		alert(e.message);
	} finally {
	}
	return obj;
}

function drawColColors() {
	var data = new google.visualization.DataTable();
	data.addColumn('timeofday', 'Time of Day');
	data.addColumn('number', 'Motivation Level');
	data.addColumn('number', 'Energy Level');

	data.addRows([ [ {
		v : [ 8, 0, 0 ],
		f : '8 am'
	}, 1, .25 ], [ {
		v : [ 9, 0, 0 ],
		f : '9 am'
	}, 2, .5 ], [ {
		v : [ 10, 0, 0 ],
		f : '10 am'
	}, 3, 1 ], [ {
		v : [ 11, 0, 0 ],
		f : '11 am'
	}, 4, 2.25 ], [ {
		v : [ 12, 0, 0 ],
		f : '12 pm'
	}, 5, 2.25 ], [ {
		v : [ 13, 0, 0 ],
		f : '1 pm'
	}, 6, 3 ], [ {
		v : [ 14, 0, 0 ],
		f : '2 pm'
	}, 7, 4 ], [ {
		v : [ 15, 0, 0 ],
		f : '3 pm'
	}, 8, 5.25 ], [ {
		v : [ 16, 0, 0 ],
		f : '4 pm'
	}, 9, 7.5 ], [ {
		v : [ 17, 0, 0 ],
		f : '5 pm'
	}, 10, 10 ], ]);

	var options = {
		title : 'Airport CODE',
		colors : [ '#9575cd', '#33ac71' ],
		hAxis : {
			title : 'Airport CODE',
			// format : 'h:mm a',
			viewWindow : {
				min : [ 7, 30, 0 ],
				max : [ 17, 30, 0 ]
			}
		},
		vAxis : {
			title : 'Rating (scale of 1-10)'
		}
	};

	var chart = new google.visualization.ColumnChart(document
			.getElementById('chartDiv2'));
	chart.draw(data, options);
}
