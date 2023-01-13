<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="ThemesLay">
<title>RoundTours - Tours and Travel Landing Page</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="80x80" href="assets/images/favicon.png">
<!-- Main CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<link href="./assets/css/main.css" rel="stylesheet">
<!-- js file -->
<!-- memaOpenForm.jsp 에서 해당파일 import 시 js 충돌로 인해 주석처리 함  -->
<!-- <script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>  -->
</head>
<body>
<!-- 좌측 드롭다운 4 개 추가-->
	<div class="box01">
		<div class="dropdown">
			<button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #ffe4b5;">내 동아리</button>
			<ul class="dropdown-menu dropdown3" aria-labelledby="dropdownMenuButton1">
				<li><a class="dropdown-item" href="#" style="font-size: small;">고만 먹자(고기만 먹자..)</a></li>
				<li><a class="dropdown-item" hreFf="#" style="font-size: small;">안 고독한 사람들</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="#" style="font-size: small;">한국의 고독한 미식가</a></li>
			</ul>
		</div>
	</div>
	<div class="box02">
		<div class="dropdown">
			<button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #ffe4b5;">나의 개설</button>
			<ul class="dropdown-menu dropdown5" aria-labelledby="dropdownMenuButton2" style="max-width: 190px; max-height: 155px;">
				<li><a class="dropdown-item" href="#" style="font-size: small;">[메메][창고43] 12/13 마감 2시간 전</a></li>
				<li><a class="dropdown-item" href="#" style="font-size: small;">[끼메][오목집] 1/5 마감 7시간 전</a></li>
				<li><a class="dropdown-item" href="#" style="font-size: small;">[끼메][오목집] 1/5 마감 7시간 전</a></li>
				<li><a class="dropdown-item" href="#" style="font-size: small;">[끼메][오목집] 1/5 마감 7시간 전</a></li>
				<li><a class="dropdown-item" href="#" style="font-size: small;">[끼메][오목집] 1/5 마감 7시간 전</a></li>
				<li><a class="dropdown-item" href="#" style="font-size: small;">[끼메][오목집] 1/5 마감 7시간 전</a></li>
			</ul>
		</div>
	</div>
	<div class="box03">
		<div class="dropdown">
			<button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton3" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #ffe4b5;">식당 방문 대기 목록</button>
			<ul class="dropdown-menu dropdown5" aria-labelledby="dropdownMenuButton3" style="max-width: 190px; max-height: 155px;">
				<li><a class="dropdown-item" href="#" style="font-size: small;">[확정] [22/12/24 16:00] 음음</a></li>
				<li><a class="dropdown-item" href="#" style="font-size: small;">[확정] [22/12/25 18:00] 아웃백</a></li>
				<li><a class="dropdown-item" href="#" style="font-size: small;">[확정] [22/12/25 18:00] 아웃백</a></li>
				<li><a class="dropdown-item" href="#" style="font-size: small;">[확정] [22/12/25 18:00] 아웃백</a></li>
				<li><a class="dropdown-item" href="#" style="font-size: small;">[확정] [22/12/25 18:00] 아웃백</a></li>
				<li><a class="dropdown-item" href="#" style="font-size: small;">[확정] [22/12/25 18:00] 아웃백</a></li>
			</ul>
		</div>
	</div>
	<div class="box04">
		<div class="dropdown">
			<button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton4" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #ffe4b5;">지원 수락 대기중</button>
			<ul class="dropdown-menu dropdown5" aria-labelledby="dropdownMenuButton4" style="max-width: 190px; max-height: 155px;">
				<li><a class="dropdown-item" href="#" style="font-size: small;">[X] [22/12/27 18:00] 해운대암소갈비</a></li>
				<li><a class="dropdown-item" href="#" style="font-size: small;">[△] [22/12/31 18:00]링링</a></li>
				<li><a class="dropdown-item" href="#" style="font-size: small;">[△] [22/12/31 18:00]링링</a></li>
				<li><a class="dropdown-item" href="#" style="font-size: small;">[△] [22/12/31 18:00]링링</a></li>
				<li><a class="dropdown-item" href="#" style="font-size: small;">[△] [22/12/31 18:00]링링</a></li>
				<li><a class="dropdown-item" href="#" style="font-size: small;">[△] [22/12/31 18:00]링링</a></li>
			</ul>
		</div>
	</div>


	<div class="pagewrap">
		<div class="head-wrapper">
			<!-- header section -->
			<header class="header theme-bg-white">

				<!-- 상단 좌측 로고 클래스 추가 생성 -->
				<div class="container headerMargin">

					<nav class="navbar navbar-expand-lg py-0 px-0">
						<a class="navbar-brand" href="MainPage.jsp"><img src="assets/images/logoo.png" alt="Brand Logo" title="Brand Logo" class="img-fluid"></a>
						<button class="navbar-toggler px-1 btn rounded-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<!-- 사이트 최상단 메뉴영역 부분 -->
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<!-- style 속성 추가 -->
							<!-- 상단 회원로고 우측으로 보내기 위한 margin-left 1100으로 조정 -->
							<ul class="navbar-nav page-menu mb-3 mb-lg-0" style="margin-left: 1100px;">
								<!-- user account  -->
								<li class="nasv-item mx-4"><a href="#" class="nav-link d-inline-block position-relative"> <i class="bi bi-bell"></i> <span class="position-absolute translate-middle p-1 bg-success border border-light rounded-circle"> <span class="visually-hidden">New alerts</span>
									</span>
								</a></li>
								<!-- user account  -->
								<li class="nav-item dropdown my-auto"><a href="#" class="nav-link dropdown-toggle p-0 user" id="navbarDropdown3" data-bs-toggle="dropdown" aria-expanded="false"> <!-- 오렌지색 색깔 변경 --> <span class="d-inline-block p-2 theme-bg-primary rounded-circle lh-1" style="background-color: #FFA500;"><i class="bi bi-person"></i></span></a>
									<ul class="dropdown-menu dropdown-menu-end sub-menu" aria-labelledby="navbarDropdown3">
										<li><a class="dropdown-item" href="#">로그인</a></li>
										<li><a class="dropdown-item" href="#">회원가입</a></li>
									</ul></li>
							</ul>
						</div>
						<button type="button" class="btn btn-warning btn-sm" onclick="location.href='MyPage.html'" style="float: right;">나의이력</button>
					</nav>
				</div>

			</header>
		</div>
	</div>
</body>
</html>