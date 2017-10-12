<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>


<script src="../js/home.js"></script>
<link rel="stylesheet" type="text/css" href="../css/home.css" />
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>MyBlog</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">

</head>
<body>
	<!-- 메뉴바 -->
	<nav class="navbar navbar-expand-lg navbar-dark" id="back">
		<a class="navbar-brand" href="#">Home</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item" onmouseover="menu_over(this);"
					onmouseout="menu_out(this);"><a class="nav-link"
					href="profile.html">소개<span class="sr-only">(current)</span></a></li>
				<li class="nav-item" onmouseover="menu_over(this);"
					onmouseout="menu_out(this);"><a class="nav-link"
					href="hobby.html">취미</a></li>
				<li class="nav-item" onmouseover="menu_over(this);"
					onmouseout="menu_out(this);"><a class="nav-link"
					href="dream.html">꿈</a></li>
			</ul>
			<ul class="my-2 my-lg-0" id="loginResult">
				<%
					if ("true".equals(request.getSession().getAttribute("logged_in"))) {
				%>
				<li class="nav-item"><a class="nav-link"
					href="/WebClass/bloglogout"> <%=request.getSession().getAttribute("name")%>
				</a></li>
				<%
					} else {
				%>
				<form class="form-inline" id="loginForm">
					<input class="form-control mr-sm-2" type="text" placeholder="ID"
						aria-label="ID" id="id" required> <input
						class="form-control mr-sm-2" type="password" placeholder="PWD"
						aria-label="PWD" id="pwd" required>
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
				</form>
				<form class="form-inline my-2 my-lg-0" id="signUpForm">

					<button class="btn btn-outline-success my-2 my-sm-0" type="button"
						onclick="location.href='signUp.html'">Sign up</button>

				</form>
				<%
					}
				%>
			</ul>
		</div>
	</nav>
	<!-- carousel slide -->
	<div id="carouselExampleSlidesOnly" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="../image/food.jpg" alt="Firstslide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="../image/nightview.jpg"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="../image/love.jpg" alt="Third slide">
			</div>
		</div>
	</div>

	<%@ include file="modal.jsp"%>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>

	<script>
		
	<%-- 회원 가입이 실패한 경우 처리 추가 --%>
		
	<%if ("error".equals(request.getAttribute("msg"))) {%>
		var myModal = $('#myModal');
		myModal.find('.modal-title').text('Sign Up Error');
		myModal.find('.modal-body').text('로그인 시 오류가 발생하였습니다.');
		myModal.modal();
	<%}%>
		
	</script>



</body>
</html>