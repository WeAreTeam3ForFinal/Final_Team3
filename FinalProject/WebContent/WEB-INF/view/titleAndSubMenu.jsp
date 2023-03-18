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
<title>마이페이지</title>
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
		<!-- page content area 테스트-->
	<div class="box01">
		<div class="dropdown">
			<button class="btn btn-warning dropdown-toggle" type="button"
				id="dropdownMenuButton1" data-bs-toggle="dropdown"
				aria-expanded="false" style="background-color: #ffe4b5;">내
				동아리</button>
				
			<c:choose>
					<c:when test="${sessionScope.nickName != null && sessionScope.userCode != null }">
					<p style="font-size: small; text-align: center;">참가중인 방이 없어요</p>
			
					</c:when>
					
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			
		</div>
	</div>
	<div class="box02">
		<div class="dropdown">
			<button class="btn btn-warning dropdown-toggle" type="button"
				id="dropdownMenuButton2" data-bs-toggle="dropdown"
				aria-expanded="false" style="background-color: #ffe4b5;">나의
				개설</button>

				<c:choose>
					<c:when test="${sessionScope.nickName != null && sessionScope.userCode != null }">
					
					<c:choose>
					
					<c:when test="${sessionScope.openroomList!=null }">
					
					<ul class="dropdown-menu dropdown5"
						aria-labelledby="dropdownMenuButton2"
						style="max-width: 190px; max-height: 155px;">
				
					<c:forEach var="openroomList" items="${sessionScope.openroomList }">
						<li>
							<div class="joinRoom">
								<span class="dropdown-item" style="font-size: small; cursor: pointer;">[${openroomList.restName}]
								${openroomList.visitDate} 마감 ${openroomList.deadline }, ${openroomList.openCode }
								</span>
							</div>
							<form action="mmjoinRoom.kkini">
								<input type="text" style="display:none;" name="openCode" value="${openroomList.openCode }"> <!-- value에는 각각의 개설코드 들어가야함  -->
								<button type="submit" style="display:none;"></button>
							</form>
						</li>
					</c:forEach>
				</ul>
			</c:when>
			
			<c:otherwise>
				<p style="font-size: small; text-align: center;">개설 중인 방이 없어요</p>
			</c:otherwise>
			</c:choose>
			
			
					</c:when>
					
					<c:otherwise>
					</c:otherwise>
					
				</c:choose>


		</div>
	</div>
	<div class="box03">
		<div class="dropdown">
			<button class="btn btn-warning dropdown-toggle" type="button"
				id="dropdownMenuButton3" data-bs-toggle="dropdown"
				aria-expanded="false" style="background-color: #ffe4b5;">식당
				방문 대기 목록</button>
			

				<!-- 로그인시 -->
				<c:choose>
					<c:when
						test="${sessionScope.nickName != null && sessionScope.userCode != null }">
					
					<c:choose>
					<c:when test="${sessionScope.roomList!=null }">
					<ul class="dropdown-menu dropdown5"
				aria-labelledby="dropdownMenuButton3"
				style="max-width: 190px; max-height: 155px;">
						<c:forEach var="roomList" items="${sessionScope.roomList}">
							<li>
								<div class="joinRoom">
									<span class="dropdown-item" style="font-size: small; cursor: pointer;">[${roomList.roomStatus}]
									${roomList.visitDate} ${roomList.restName }
									</span>
								</div>
								<form action="mmjoinRoom.kkini">
									<input type="text" style="display:none;" name="openCode" value="${roomList.openCode }"> <!-- value에는 각각의 개설코드 들어가야함  -->
									<button type="submit" style="display:none;"></button>
								</form>			
							</li>				
						</c:forEach>

			</ul>
			
			</c:when>
			<c:otherwise>
			<p style="font-size: small; text-align: center;">참가중인 방이 없어요</p>
			</c:otherwise>
			</c:choose>
			
					</c:when>


					<c:otherwise>
						
					</c:otherwise>
				</c:choose>

		</div>
	</div>
	<div class="box04">
		<div class="dropdown">
			<button class="btn btn-warning dropdown-toggle" type="button"
				id="dropdownMenuButton4" data-bs-toggle="dropdown"
				aria-expanded="false" style="background-color: #ffe4b5;">지원
				수락 대기중</button>
				
				<c:choose>
					<c:when test="${sessionScope.nickName != null && sessionScope.userCode != null }">
					<p style="font-size: small; text-align: center;">참가중인 방이 없어요</p>
			
					</c:when>
					
					<c:otherwise>
					</c:otherwise>
				</c:choose>
		</div>
	</div>


	<div class="pagewrap">
		<div class="head-wrapper">
			<!-- header section -->
			<header class="header theme-bg-white">

				<!-- 상단 좌측 로고 클래스 추가 생성 -->
				<div class="container headerMargin">

					<nav class="navbar navbar-expand-lg py-0 px-0">
						<a class="navbar-brand" href="mainPage.kkini"><img src="assets/images/logo1.png" alt="Brand Logo" title="Brand Logo" class="img-fluid"></a>
						<button class="navbar-toggler px-1 btn rounded-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<!-- 사이트 최상단 메뉴영역 부분 -->
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<!-- style 속성 추가 -->
							<!-- 상단 회원로고 우측으로 보내기 위한 margin-left 1100으로 조정 -->
							<ul class="navbar-nav page-menu mb-3 mb-lg-0"
								style="margin-left: 1100px;">

								<!-- user account  -->
								<li class="nav-item dropdown my-auto"><c:choose>

										<c:when test="${sessionScope.nickName!=null }">
											<!-- 로그인 성공했을시 -->


											<!-- user account  -->
											<li class="nav-item mx-4"><a href="#"
												class="nav-link d-inline-block position-relative"> <i
													class="bi bi-bell"></i> <span
													class="position-absolute translate-middle p-1 bg-success border border-light rounded-circle">
														<span class="visually-hidden">알림</span>
												</span>
											</a></li>
											<div class="dropdown-center">
												<a href="#" class="nav-link dropdown-toggle p-0 user"
													id="navbarDropdown3" data-bs-toggle="dropdown"
													aria-expanded="false"> <!-- 오렌지색 색깔 변경 --> <span
													class="d-inline-block p-2 theme-bg-primary rounded-circle lh-1"
													style="background-color: #FFA500;"><i
														class="bi bi-person"></i></span></a>
												<p class="dropdown-menu">
													출석점수 : ${attendScore} <br>
													<br> 매너점수 : ${mannerScore } <br>
													<br> 신뢰점수 : ${biasScore }
												</p>
											</div>
											<div class="dropdown">
												<a href="#" class="nav-link dropdown-toggle p-0 user"
													id="nickNameDropdown" data-bs-toggle="dropdown"
													aria-expanded="false"> <!-- 오렌지색 색깔 변경 --> <span
													class="d-inline-block p-2 lh-1">${sessionScope.nickName}</span></a>


												<ul class="dropdown-menu sub-menu"
													aria-labelledby="nickNameDropdown">
													<li style="font-size: small"><a class="dropdown-item"
														role="button" href="myPage.kkini">마이페이지</a> <!-- 내 정보 페이지 생성필요!!!!!!! -->
													</li>

													<li style="font-size: small"><a class="dropdown-item"
														href="logout.kkini">로그아웃</a></li>
												</ul>
											</div>



										</c:when>

										<c:otherwise>
											<!-- 로그인 안했을시 or 실패했을시 -->
											<li class="nav-item mx-4"></li>

											<ul class="list-group list-group-horizontal">
												<li class="list-group-item"
													style="padding: 0 !important; border: none;"><a
													data-bs-toggle="modal" data-bs-target="#loginModal"
													role="button">로그인&nbsp;&nbsp;</a> <!--  
                                        <a class="dropdown-item" data-toggle="modal" data-target="#loginmodal" role="button" id="login"
										opBtnHref="LoginForm.jsp" onclick="oneBtnPopOpen('#login')">로그인</a>-->
												</li>

												<li class="list-group-item"
													style="padding: 0 !important; border: none;"><a
													href="userRegiste.kkini">회원가입</a></li>
											</ul>


										</c:otherwise>

									</c:choose></li>
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