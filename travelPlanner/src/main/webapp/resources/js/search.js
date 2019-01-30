$(document).ready(function() {
//	console.log('1');
	$(function() {
		$("#autocomplete").autocomplete({
			source : function(request, response) {
				$.ajax({
					url : '/search/getLocationList',
					type : 'post',
					headers : {
						"Content-Type" : "application/json; charset=utf-8;"
					// "X-HTTP-Method-Override" : "POST"
					},
					data : $("#autocomplete").val(),
					dataType : "json",
					success : function(data) {
						// 서버에서 json 데이터 response 후 목록에
						// 뿌려주기 위함
						response($.map(data, function(item) {
							return {
								label : item.name,
								value : item.name
							}
						}));
					}
				});
			}
//			// 조회를 위한 최소글자수
//			minLength : 2,
//			select : function(event, ui) {
//				// 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
//			}
		})
	})
})

function getSearchDataAjax(request, response) {
	$.ajax({
		url : '/search/getLocationList',
		type : 'post',
		headers : {
			"Content-Type" : "application/json; charset=utf-8;"
		// "X-HTTP-Method-Override" : "POST"
		},
		data : $("#autocomplete").val(),
		dataType : "json",
		success : function(data) {
			// 서버에서 json 데이터 response 후 목록에
			// 뿌려주기 위함
			response($.map(data, function(item) {
				return {
					label : item.data,
					value : item.data
				}
			}));
		}
	});
}
