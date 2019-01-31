var stompClient = null;

function setConnected(connected) {
//    $("#connect").prop("disabled", connected);
//    $("#disconnect").prop("disabled", !connected);
//    if (connected) {
//        $("#conversation").show();
//    }
//    else {
//        $("#conversation").hide();
//    }
    $("#textArea").html("");
}

function connect(e) {
//	alert('connect!');
    var socket = new SockJS('/gs-guide-websocket');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/greetings', function (greeting) {
        	writeText(JSON.parse(greeting.body).content);
        });
    });
//    e.preventDefault();
}

function disconnect(e) {
//	alert("disconnected")
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
//    e.preventDefault();
}

function sendName() {
	let text = $("#chatText").val();
	//텍스트는 잘 읽음
//	alert(text);
    stompClient.send("/app/hello", {}, JSON.stringify({'name': text}));
    $("#chatText").val("");
}

function writeText(message) {
    $("#textArea").append(message + "&#10;");
    
}

$(function () {
    $("form").on('submit', function (e) {
        e.preventDefault();
    });
    $( "#connect" ).click(function() { connect(); });
    $( "#disconnect" ).click(function() { disconnect(); });
    $( "#send" ).click(function() { sendName(); });
});