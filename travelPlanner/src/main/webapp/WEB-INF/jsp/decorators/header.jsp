<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
.modal-footer {
	border-top: 0px;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}
.signInbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #01DF01;
}

.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
	padding-top: 60px;
}

.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	border: 1px solid #888;
	width: 50%;
}

.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
	.signInbtn {
		width: 100%;
	}
}
</style>
<script> 
  
var modal = document.getElementById('id01'); 
window.onclick = function(event) { 
    if (event.target == modal) { 
        modal.style.display = "none"; 
    } 
} 
</script> 

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="/">여행 Advisor</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Services</a>
					<a class="dropdown-item" href="portfolio-1-col.html">1 Column Portfolio</a>
              </a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
				<li class="nav-item"><a class="nav-link" href="#" onclick="document.getElementById('id01').style.display='block'"
			style="width: auto;">Login
				</a></li>
			</ul>
		</div>
	</div>
	</nav>

<div id="id01" class="modal">
	<form class="modal-content animate" action="/loginPost" method="post">
		<div class="imgcontainer">
			<span onclick="document.getElementById('id01').style.display='none'"
				class="close" title="Close Modal">×</span> 
				<img src="/img_avatar2.png" alt="Avatar" class="avatar">
		</div>

		<div class="container">
			<label><b>Username</b></label> <input type="text"
				placeholder="Enter Username" name="uname" required> <label><b>Password</b></label>
			<input type="password" placeholder="Enter Password" name="psw"
				required>

			<button type="submit">Login</button>
			<input type="checkbox" checked="checked"> Remember me
		</div>

		<div class="container" style="background-color: #f1f1f1">
			<button type="button"
				onclick="document.getElementById('id01').style.display='none'"
				class="cancelbtn">Cancel</button>
			<button type="button"
				onclick="document.getElementById('signIn').style.display='block'"
				class="signInbtn">Sign up</button>

			<span class="psw">Forgot <a href="#">password?</a></span>
		</div>
	</form>
</div>

<div id="signIn" class="modal">
	<form class="modal-content animate" action="/signUp" method="post">
		<div class="imgcontainer">
			<span onclick="document.getElementById('signIn').style.display='none'"
				class="close" title="Close Modal">×</span> <img
				src="img_avatar2.png" alt="Avatar" class="avatar">
		</div>

		<div class="container">
			<label><b>Username</b></label> <input type="text"
				placeholder="Enter Username" name="uname" required> <label><b>Password</b></label>
			<input type="password" placeholder="Enter Password" name="psw"
				required>
			<label><b>Password again</b></label>
			<input type="password" placeholder="Enter Password again" name="psw2"
				required>
			<label><b>gender</b></label>	
			<input type="radio" name="gender" value="male" checked>남자
    		<input type="radio" name="gender" value="female">여자
    		<br><label><b>birthday</b></label>
    		<input type="date" name="Bd">
			<button type="submit">Sign up</button>
		</div>

		<div class="container" style="background-color: #f1f1f1">
			<button type="button"
				onclick="document.getElementById('signIn').style.display='none'"
				class="cancelbtn">Cancel</button>
		</div>
	</form>
</div>


