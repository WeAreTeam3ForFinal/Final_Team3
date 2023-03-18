<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="ThemesLay">
<title>끼리끼니</title>
<!-- font-awsome v5.8.2 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="80x80"
	href="assets/images/favicon.png">
<!-- Main CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<link href="./assets/css/main.css" rel="stylesheet">
<!-- js file -->
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 데이트 피커 -->
<link rel="stylesheet" type="text/css"
	href="datetimepicker/jquery.datetimepicker.css">
<script src="datetimepicker/jquery.js"></script>
<script src="datetimepicker/build/jquery.datetimepicker.full.min.js"></script>
<script>
	// Scroll Top 
	$(document).ready(
			function()
			{
				var ScrollTop = $(".scrollToTop");
				$(window).on('scroll', function()
				{
					if ($(this).scrollTop() < 500)
					{
						ScrollTop.removeClass("active");
					} else
					{
						ScrollTop.addClass("active");
					}
				});

				$('.scrollToTop').on('click', function()
				{
					$('html, body').animate(
					{
						scrollTop : 0
					}, 500);
					return false;
				});

				$.datetimepicker.setLocale('ko');

				$("#datetime-start").datetimepicker(
						{
							format : 'Y.m.d H:i',
							lang : 'ko',
							allowTimes : [ '24:30', '01:00', '01:30', '02:00',
									'02:30', '03:00', '03:30', '04:00',
									'04:30', '05:00', '05:30', '06:00',
									'06:30', '07:00', '07:30', '08:00',
									'08:30', '09:00', '09:30', '10:00',
									'10:30', '11:00', '11:30', '12:00',
									'12:30', '13:00', '13:30', '14:00',
									'14:30', '15:00', '15:30', '16:00',
									'16:30', '17:00', '17:30', '18:00',
									'18:30', '19:00', '19:30', '20:00',
									'20:30', '21:00', '21:30', '22:00',
									'22:30', '23:00', '24:00' ]
						});

				$("#datetime-end").datetimepicker(
						{
							format : 'Y.m.d H:i',
							lang : 'ko',
							allowTimes : [ '24:30', '01:00', '01:30', '02:00',
									'02:30', '03:00', '03:30', '04:00',
									'04:30', '05:00', '05:30', '06:00',
									'06:30', '07:00', '07:30', '08:00',
									'08:30', '09:00', '09:30', '10:00',
									'10:30', '11:00', '11:30', '12:00',
									'12:30', '13:00', '13:30', '14:00',
									'14:30', '15:00', '15:30', '16:00',
									'16:30', '17:00', '17:30', '18:00',
									'18:30', '19:00', '19:30', '20:00',
									'20:30', '21:00', '21:30', '22:00',
									'22:30', '23:00', '24:00' ]
						});

				// 동아리 리스트 출력 Ajax 구문
				$("#club-tab").click(function()
				{
					// 기존 구현한 마이바티스 기능 Ajax 처리
					$.ajax(
					{
						// 전송방식은 SELECT 구문이므로 GET으로 통일
						type : "GET",
						url : "clubList.kkini",
						success : function(args)
						{
							$("#resultDiv").html(args);
						}
						//, beforeSend : showRequest
						,
						error : function(e)
						{
							alert(e.responseText);
						}
					});
				});

				// 메뉴메이트 리스트 출력 Ajax 구문
				$("#mema-tab").click(function()
				{
					// 기존 구현한 마이바티스 기능 Ajax 처리
					$.ajax(
					{
						// 전송방식은 SELECT 구문이므로 GET으로 통일
						type : "GET",
						url : "memaList.kkini",
						success : function(args)
						{
							$("#resultDiv").html(args);
						}
						//, beforeSend : showRequest
						,
						error : function(e)
						{
							alert(e.responseText);
						}
					});
				});
				
				// 메뉴메이트 검색 리스트 Ajax
				$("#searchMema").click(function()
				{
					
					var param = "memaKeyword=" + $("#memaKeyword").val() + "&mm-age-boundary=" + $("#mm-age-boundary").val()
							  + "&mm-gender-boundary=" + $("#mm-gender-boundary").val() + "&mm-food-category=" + $("#mm-food-category").val()
							  + "&datetime-start=" + $("#datetime-start").val() + ("&datetime-end=") + $("#datetime-end").val();
					alert(param);
					
					// 기존 구현한 마이바티스 기능 Ajax 처리
					$.ajax(
					{
						// 전송방식은 SELECT 구문이므로 GET으로 통일
						type : "GET",
						url : "searchMema.kkini",
						data : param,
						success : function(args)
						{
							$("#resultDiv").html(args);
						}
						//, beforeSend : showRequest
						,
						error : function(e)
						{
							alert(e.responseText);
						}
					});
				});

				/*
				function showRequest()
				{
					alert("현재 선택된 탭은 동아리탭 입니다.");
				}
				 */

				// 기존 마이바티스 구문 주석처리
				/*
				$("#club-tab").click(function()
				{
					$("#tab-form").attr("action","clubList.kkini");
					$("#tab-form").submit();
				});
				 */

				// ajax로 불러온 엘리먼트의 이벤트가 정상 작동하지 않을 떄는
				// 아래 코드와 같이 제이쿼리 작성 필요
				$(document).on("click", "#sortList > li > a", function()
				{
					// alert("확인");
					url = $(this).attr("href");

					$.ajax(
					{
						// 전송방식은 SELECT 구문이므로 GET으로 통일
						type : "GET",
						url : url,
						success : function(args)
						{
							$("#resultDiv").html(args);

							var sortBy = $("#sortBy").val();

							if (sortBy == "clubDate")
								sortBy = "<b>개설일순</b>";
							else if (sortBy == "clubMemUp")
								sortBy = "<b>동아리원 오름차순</b>";
							else if (sortBy == "clubMemDown")
								sortBy = "<b>동아리원 내림차순</b>";
							else if (sortBy == "memaDate")
								sortBy = "<b>개설일순</b>";
							else if (sortBy == "memaClose")
								sortBy = "<b>마감임박순</b>";

							$("#selectedSort").html(sortBy);
						},
						error : function(e)
						{
							alert(e.responseText);
						}
					});

				});

				$(document).on("click", ".selectInfo", function()
				{
					$(this).next().children('button').click();
				});
				
				$(document).on("click", ".joinRoom", function()
				{
					$(this).next().children('button').click();
				});
			});

	function initialList()
	{
		$.ajax(
		{
			// 전송방식은 SELECT 구문이므로 GET으로 통일
			type : "GET",
			url : "memaList.kkini",
			success : function(args)
			{
				$("#resultDiv").html(args);
			}
			//, beforeSend : showRequest
			,
			error : function(e)
			{
				alert(e.responseText);
			}
		});
	}
	
	/* 회원이 개설하기 버튼 클릭 시  */
	function member_open()
	{
		// 개설폼으로 이동
		window.location.href = 'memaopenform.kkini';
	}
	
	/* 비회원이 개설하기 버튼 클릭 시  */
	function unmember_open()
	{
		// 로그인 경고창 띄워주기
	    alert("로그인이 필요한 서비스입니다. 로그인 후 이용해주세요!");
		
	}
</script>
</head>

<body onload="initialList()">
	<div>
		<jsp:include page="LoginForm.jsp"></jsp:include>
	</div>
	<!-- page content area 테스트-->
	<div class="box01">
		<div class="dropdown">
			<button class="btn btn-warning dropdown-toggle" type="button"
				id="dropdownMenuButton1" data-bs-toggle="dropdown"
				aria-expanded="false" style="background-color: #ffe4b5;">내
				동아리</button>
				
			<c:choose>
					<c:when test="${sessionScope.nickName != null && sessionScope.userCode != null }">
					<p style="font-size: small; text-align: center;">참가 중인 방이 없어요</p>
			
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
					
					<c:when test="${openroomList!=null }">
					
					<ul class="dropdown-menu dropdown5"
						aria-labelledby="dropdownMenuButton2"
						style="max-width: 190px; max-height: 155px;">
				
					<c:forEach var="openroomList" items="${openroomList }">
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
					<c:when test="${roomList!=null }">
					<ul class="dropdown-menu dropdown5"
				aria-labelledby="dropdownMenuButton3"
				style="max-width: 190px; max-height: 155px;">
						<c:forEach var="roomList" items="${roomList}">
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
			<p style="font-size: small; text-align: center;">참가 중인 방이 없어요</p>
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
					<p style="font-size: small; text-align: center;">참가 중인 방이 없어요</p>
			
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
						<a class="navbar-brand" href="mainPage.kkini"><img
							src="assets/images/logo1.png" alt="Brand Logo" title="Brand Logo"
							class="img-fluid"></a>
						<button class="navbar-toggler px-1 btn rounded-0" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
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

						<button type="button" class="btn btn-warning btn-sm" 
							onclick="location.href='MyRecord.kkini'" style="float: right;">나의이력</button>
					</nav>
				</div>
				<!-- <button type="button" class="btn btn-warning btn-sm" onclick="location.href='MyPage.html'" style="float: right;">나의이력</button> -->
			</header>


			<!-- search engine section-->
			<div class="search-engine">
				<div class="container">
					<div class="row">
						<div class="col-12 col-lg-12 mb-5 text-center position-relative">
							<h1 class="display-3 fw-bold mb-4 theme-text-shadow"
								style="color: #FFA500;">끼리끼니~?</h1>
							<p class="fw-bold mb-0" style="color: #FFA500;">맛있는 끼니 끼리끼리
								먹자!</p>
						</div>
					</div>
					<!-- search engine tabs -->
					<div class="row mt-0 mt-lg-5"></div>

					<div class="row mt-0 mt-lg-5">
						<div
							class="col-12 col-lg-10 offset-lg-1 mb-5 text-center position-relative">
							<!-- product main tab list -->
							<form action="" method="get" id="tab-form">
								<ul
									class="nav nav-tabs d-flex justify-content-center border-0 cust-tab"
									id="myTab" role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="flight-tab" data-bs-toggle="tab"
											data-bs-target="#recommend-tab-pane" type="button" role="tab"
											aria-controls="recommend-tab-pane" aria-selected="false">추천</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="mema-tab"
											data-bs-toggle="tab" data-bs-target="#flight-tab-pane"
											type="button" role="tab" aria-controls="flight-tab-pane"
											aria-selected="true">메뉴메이트</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="kima-tab" data-bs-toggle="tab"
											data-bs-target="#hotel-tab-pane" type="button" role="tab"
											aria-controls="hotel-tab-pane" aria-selected="false">끼니메이트</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="club-tab" data-bs-toggle="tab"
											data-bs-target="#holiday-tab-pane" type="button" role="tab"
											aria-controls="holiday-tab-pane" aria-selected="false">동아리</button>
									</li>
								</ul>
							</form>
							<!-- product main tab content -->
							<div class="tab-content mt-3" id="myTabContent">

								<!-- 추천 -->
								<div class="tab-pane fade" id="recommend-tab-pane"
									role="tabpanel" aria-labelledby="recommend-tab" tabindex="0">

								</div>

								<!-- 추천 끝 -->


								<!-- 메뉴메이트 시작-->
								<div class="tab-pane fade show active" id="flight-tab-pane"
									role="tabpanel" aria-labelledby="flight-tab" tabindex="0">

									<!-- one way search -->
									<div class="row">
									<!-- <form action="return false" method="get"> -->
											<!-- action 추가 필요  -->
											<div class="col-12">
												<div class="search-pan row mx-0 theme-border-radius">
													<div
														class="col-12 col-lg-4 col-xl-4 ps-0 mb-2 mb-xl-4 mt-xl-2 pe-0 pe-lg-2">
														<div class="form-group">

															<label for="memaKeyword" class="form-label">검색어 <i
																class="bi bi-caret-down-fill small"></i>
															</label>
															<!-- 입력창 & 검색어 추천 -->
															<input class="form-control ps-lg-4 mt-xl-3"
																list="RestaurantRec" id="memaKeyword" name="memaKeyword"
																style="font-size: 15pt; color: black; font-weight: bold;">
															<datalist id="RestaurantRec">
																<option value="소림 커피">
																<option value="New York">
																<option value="Seattle">
																<option value="Los Angeles">
																<option value="Chicago">
															</datalist>
															<!-- 입력창 & 검색어 추천 end -->
														</div>
													</div>

													<div class="col-12 col-lg-6 col-xl-2 px-0">
														<button type="submit" class="btn btn-search" id="searchMema">
															<span class="fw-bold"><i class="bi bi-search me-2"></i>Search</span>
														</button>
													</div>
													<div class="col-xl-4"></div>
													<div class="col-xl-1"></div>
													<div
														style="border: 1px solid #dddddd; margin-bottom: 15px;"></div>

													<!-- 연령대 select box -->
													<div
														class="col-12 col-lg-4 col-xl-3 ps-1 mb-2 mb-xl-0 pe-0 pe-lg-2">
														<div class="form-group">
															<label for="mm-age-boundary" class="form-label"
																style="text-align: center;">연령대 <i
																class="bi bi-caret-down-fill small"></i>
															</label> <select id="mm-age-boundary" name="mm-age-boundary">
																<c:forEach var="age" items="${age }">
																	<option value="${age.ageCode }">${age.ageGroup }</option>
																</c:forEach>
															</select> <label>초<input name="mm-age-detail" type="radio"
																value=""></label> <label>중<input
																name="Age-detail" type="radio" value=""></label> <label>후<input
																name="Age-detail" type="radio" value=""></label>
														</div>
													</div>

													<!-- 연령대 select box end -->

													<!--  성별 select box -->
													<div class="col-sm-2 ps-0 mb-2 mb-xl-0 pe-0 pe-lg-2">
														<div class="form-group ">
															<label for="mm-gender-boundary" class="form-label">성별
																<i class="bi bi-caret-down-fill small"></i>
															</label> <select id="mm-gender-boundary" name="mm-gender-boundary">
																<c:forEach var="gender" items="${gender }">
																	<option value="${gender.genderCode }">${gender.gender }</option>
																</c:forEach>
																<!-- 검색자의 성별 -->
															</select>

														</div>

													</div>

													<!-- 성별 select box end -->

													<!--  음식종류 select box -->
													<div class="col-sm-2 ps-0 mb-2 mb-xl-0 pe-0 pe-lg-2">
														<div class="form-group">
															<label for="mm-food-category" class="form-label">음식
																카테고리 <i class="bi bi-caret-down-fill small"></i>
															</label> <select id="mm-food-category" name="mm-food-category">
																<c:forEach var="food" items="${food }">
																	<option value="${food.foodCode }">${food.foodctg }</option>
																</c:forEach>
															</select>

														</div>

													</div>

													<!-- 음식종류 select box end -->

													<!-- 날짜 범위 선택 -->
													<div class="col-4  ps-0 mb-2 mb-xl-0 pe-0 pe-lg-0 pe-xl-2">
														<div class="form-group border-0">
															<label class="form-label" style="text-align: center;">방문
																가능 시간대</label> <input type="text" class="form-control-date"
																id="datetime-start" style="width: 150px; border: none;" readonly="readonly">
															-<input type="text" class="form-control-date"
																id="datetime-end" style="width: 150px; border: none;" readonly="readonly">

														</div>
													</div>
													<!-- 날짜 범위 선택 끝  -->
												</div>
											</div>
									</div>
									<!-- 메뉴메이트 개설하기 버튼 추가  -->
									<br>
									<c:choose>
										<c:when test="${sessionScope.nickName!=null }"> <!--회원 로그인 상태일 시 -->
										<button class="btn btn-warning"
											style="color: #ffffff; background-color:#FFA500; width: 270px; margin: auto; border-radius: 50px; font-size: 25px; font-weight: bold;"
											onclick="member_open()">메뉴메이트 개설하기!</button>
										</c:when>	
										<c:when test="${sessionScope.nickName==null }"> <!--비회원 상태일 시 -->
											<button class="btn btn-warning"
											style=" color: #ffffff; background-color:#FFA500; width: 270px; margin: auto; border-radius: 50px; font-size: 25px; font-weight: bold;"
											onclick="unmember_open()">메뉴메이트 개설하기!</button>
										</c:when>	
									</c:choose>
								</div>

								<!-- 메뉴메이트 끝 -->



								<!-- 끼니메이트 -->
								<div class="tab-pane fade" id="hotel-tab-pane" role="tabpanel"
									aria-labelledby="hotel-tab" tabindex="0">
									<!-- one way search -->
									<div class="row">
										<form action="Test01.jsp" method="get">
											<!-- action 추가 필요  -->
											<div class="col-12">
												<div class="search-pan row mx-0 theme-border-radius">
													<div
														class="col-12 col-lg-4 col-xl-4 ps-0 mb-2 mb-xl-4 mt-xl-2 pe-0 pe-lg-2">
														<div class="form-group">

															<label for="KeyWord" class="form-label">검색어 <i
																class="bi bi-caret-down-fill small"></i>
															</label>
															<!-- 입력창 & 검색어 추천 -->
															<input class="form-control ps-lg-4 mt-xl-3"
																list="RestaurantRec" id="KeyWord" name="KeyWord"
																style="font-size: 15pt; color: black; font-weight: bold;">
															<datalist id="RestaurantRec">
																<option value="소림 커피">
																<option value="New York">
																<option value="Seattle">
																<option value="Los Angeles">
																<option value="Chicago">
															</datalist>
															<!-- 입력창 & 검색어 추천 end -->
														</div>
													</div>

													<div class="col-12 col-lg-6 col-xl-2 px-0">
														<button type="submit" class="btn btn-search"
															onclick="window.location.href='flight-listing-oneway.html';">
															<span class="fw-bold"><i class="bi bi-search me-2"></i>Search</span>
														</button>
													</div>
													<div class="col-xl-4"></div>
													<div class="col-xl-1"></div>
													<div
														style="border: 1px solid #dddddd; margin-bottom: 15px;"></div>

													<!-- 연령대 select box -->
													<div
														class="col-12 col-lg-4 col-xl-3 ps-1 mb-2 mb-xl-0 pe-0 pe-lg-2">
														<div class="form-group">
															<label for="Age-boundary" class="form-label"
																style="text-align: center;">연령대 <i
																class="bi bi-caret-down-fill small"></i>
															</label> <select id="Age-boundary" name="Age-boundary">
																<option>20대</option>
																<option>30대</option>
																<option>40대</option>
																<option></option>
																<option></option>
															</select> <label>초<input name="Age-detail" type="radio"
																value=""></label> <label>중<input
																name="Age-detail" type="radio" value=""></label> <label>후<input
																name="Age-detail" type="radio" value=""></label>
														</div>
													</div>

													<!-- 연령대 select box end -->

													<!--  성별 select box -->
													<div class="col-sm-2 ps-0 mb-2 mb-xl-0 pe-0 pe-lg-2">
														<div class="form-group ">
															<label for="gender-boundary" class="form-label">성별
																<i class="bi bi-caret-down-fill small"></i>
															</label> <select id="gender-boundary" name="gender-boundary">
																<option>무관</option>
																<option>남/여</option>
																<!-- 검색자의 성별 -->
															</select>

														</div>

													</div>

													<!-- 성별 select box end -->

													<!--  음식종류 select box -->
													<div class="col-sm-2 ps-0 mb-2 mb-xl-0 pe-0 pe-lg-2">
														<div class="form-group">
															<label for="food-category" class="form-label">음식
																카테고리 <i class="bi bi-caret-down-fill small"></i>
															</label> <select id="food-category" name="food-category">
																<option>한식</option>
																<option>양식</option>
																<option>일식</option>
															</select>

														</div>

													</div>

													<!-- 음식종류 select box end -->

													<!-- 날짜 범위 선택 -->
													<div class="col-4  ps-0 mb-2 mb-xl-0 pe-0 pe-lg-0 pe-xl-2">
														<div class="form-group border-0">
															<label class="form-label" style="text-align: center;">방문
																가능 시간대</label> <input type="text" class="form-control-date"
																id="datetime-start" style="width: 100px; border: none;">
															-<input type="text" class="form-control-date"
																id="datetime-end" style="width: 100px; border: none;">

														</div>
													</div>
													<!-- 날짜 범위 선택 끝  -->
												</div>
											</div>
										</form>

									</div>
								</div>
								<!-- 끼니메이트 끝 -->

								<!-- 동아리 -->
								<div class="tab-pane fade" id="holiday-tab-pane" role="tabpanel"
									aria-labelledby="holiday-tab" tabindex="0">

									<!-- one way search -->
									<div class="row justify-content-center">
										<div class="col-8">
											<div class="search-pan row mx-0 theme-border-radius">
												<div
													class="col-12 col-lg-4 col-xl-3 ps-0 mb-2 mb-xl-0 pe-0 pe-lg-2">
													<div class="form-group">
														<label for="exampleDataList7" class="form-label">검색어
															<i class="bi bi-caret-down-fill small"></i>
														</label> <input class="form-control" list="datalistOptions15"
															id="exampleDataList7" placeholder="India">
														<datalist id="datalistOptions15">
															<option value="San Francisco">
															<option value="New York">
															<option value="Seattle">
															<option value="Los Angeles">
															<option value="Chicago">
														</datalist>
													</div>
												</div>
												<!--  음식종류 select box -->
												<div class="col-2 ps-0 mb-2 mb-xl-0 pe-0 pe-lg-2">
													<div class="form-group">
														<label for="food-category" class="form-label">카테고리
															<i class="bi bi-caret-down-fill small"></i>
														</label> <select id="food-category" name="food-category">
															<option>한식</option>
															<option>양식</option>
															<option>일식</option>
														</select>

													</div>

												</div>

												<!-- 음식종류 select box end -->

												<div class="col-12 col-lg-6 col-xl-2 px-0">
													<button type="submit" class="btn btn-search"
														onclick="window.location.href='flight-listing-oneway.html';">
														<span class="fw-bold"><i class="bi bi-search me-2"></i>Search</span>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 동아리 끝 -->



							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /flight tab end -->
		</div>
	</div>
	<!-- recommended section -->
	<!-- 
    <section class="recommended" id="deals">
        <div class="container">
        
            <div class="row">
                <div class="col-12 col-lg-6">
                    <h4 class="fs-2 fw-bold theme-text-secondary mb-0">Recommended</h4>
                    <p class="mb-0 theme-text-accent-one">International & Domestic fames ac ante ipsum</p>
                </div>
                <div class="col-12 col-lg-6 align-self-center justify-content-end d-flex">
                    <div class="d-flex">
                        <div class="dropdown-center">
                            <button class="btn btn-secondary dropdown-toggle recomended-btn" type="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                Hotels
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">등록순</a></li>
                                <li><a class="dropdown-item" href="#">마감임박순</a></li>
                                <li><a class="dropdown-item" href="#">Holidays</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            
            recomended tours card
            <div class="row mt-5">
                <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0">
                    <div class="card-wrap">
                        <div class="con-img-wrap m-auto">
                            <img src="assets/images/recommended/offers01.png" class="img-fluid mx-auto d-block"
                                alt="product picture">
                            <div class="offer-tag bg-warning">Best Deal</div>
                            <span class="wishlist-tag"><i class="bi bi-heart"></i></span>
                        </div>
                        <div class="con-wrap mt-4">
                            <h2 class="fs-6 mt-4 fw-bold text-truncate">The Montcalm At Brewery London City</h2>
                            <p class="mb-2 theme-text-accent-two small">Westminster Borough, London</p>
                            <div class="d-flex bottom mb-2">
                                <div class="rating-cover">
                                    <span class="p-1 small rounded-1 bg-warning theme-text-white">4.8</span>
                                    <span class="me-2 small theme-text-accent-one">Exceptional</span>
                                    <span class="small">3,014 reviews</span>
                                </div>
                            </div>
                            <p class="mb-0 theme-text-accent-one">Starting from US$72</p>
                        </div>
                    </div>
                </div>
                repetable
                <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0">
                    <div class="card-wrap">
                        <div class="con-img-wrap m-auto">
                            <img src="assets/images/recommended/offers02.png" class="img-fluid mx-auto d-block"
                                alt="product picture">
                            <div class="offer-tag  bg-info">Best Deal</div>
                            <span class="wishlist-tag"><i class="bi bi-heart"></i></span>
                        </div>
                        <div class="con-wrap mt-4">
                            <h2 class="fs-6 mt-4 fw-bold text-truncate">Flying Over Bali</h2>
                            <p class="mb-2 theme-text-accent-two small">Beautiful Lands, Indonasia</p>
                            <div class="d-flex bottom mb-2">
                                <div class="rating-cover">
                                    <span class="p-1 small rounded-1 bg-danger theme-text-white">4.7</span>
                                    <span class="me-2 small theme-text-accent-one">Exceptional</span>
                                    <span class="small">4,114 reviews</span>
                                </div>
                            </div>
                            <p class="mb-0 theme-text-accent-one">Starting from US$89</p>
                        </div>
                    </div>
                </div>
                repetable
                <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0">
                    <div class="card-wrap">
                        <div class="con-img-wrap m-auto">
                            <img src="assets/images/recommended/offers03.png" class="img-fluid mx-auto d-block"
                                alt="product picture">
                            <div class="offer-tag bg-success">Best Deal</div>
                            <span class="wishlist-tag"><i class="bi bi-heart"></i></span>
                        </div>
                        <div class="con-wrap mt-4">
                            <h2 class="fs-6 mt-4 fw-bold text-truncate">American Landscapes</h2>
                            <p class="mb-2 theme-text-accent-two small">Pestminster Worough, USA</p>
                            <div class="d-flex bottom mb-2">
                                <div class="rating-cover">
                                    <span class="p-1 small rounded-1 bg-success theme-text-white">4.9</span>
                                    <span class="me-2 small theme-text-accent-one">Exceptional</span>
                                    <span class="small">3,894 reviews</span>
                                </div>
                            </div>
                            <p class="mb-0 theme-text-accent-one">Starting from US$88</p>
                        </div>
                    </div>
                </div>
                repetable
                <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0">
                    <div class="card-wrap">
                        <div class="con-img-wrap m-auto">
                            <img src="assets/images/recommended/offers04.png" class="img-fluid mx-auto d-block"
                                alt="product picture">
                            <div class="offer-tag">Best Deal</div>
                            <span class="wishlist-tag"><i class="bi bi-heart"></i></span>
                        </div>
                        <div class="con-wrap mt-4">
                            <h2 class="fs-6 mt-4 fw-bold text-truncate">The Beauty of Scotland</h2>
                            <p class="mb-2 theme-text-accent-two small">Mestminster Gorough, UK</p>
                            <div class="d-flex bottom mb-2">
                                <div class="rating-cover">
                                    <span class="p-1 small rounded-1 bg-info theme-text-white">4.5</span>
                                    <span class="me-2 small theme-text-accent-one">Exceptional</span>
                                    <span class="small">2,914 reviews</span>
                                </div>
                            </div>
                            <p class="mb-0 theme-text-accent-one">Starting from US$69</p>
                        </div>
                    </div>
                </div>
                repetable
                
                <div id="resultDiv">
                	ㅇㅇ
                </div>
            </div>
        </div>
    </section>
    
     -->

	<div id="resultDiv"></div>

	<!-- footer section-->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-12 col-sm-6 col-lg-3 mb-5 mb-lg-0">
					<h5 class="mb-5 fs-6">Contact Us</h5>
					<div class="flex-grow-1">
						Customer Care<br> <span class="fs-5 theme-text-primary">+(1)
							123 456 7890</span>
					</div>
					<div class="flex-grow-1 mt-3">
						Need live support?<br> <a href="#"
							class="fs-5 theme-text-primary">hi@example.com</a>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-lg-2 mb-5 mb-lg-0">
					<div class="d-flex">
						<h5 class="mb-5 fs-6">Company</h5>
					</div>
					<div class="d-flex">
						<ul class="fl-menu">
							<li class="nav-item"><a href="javascript:void(0)">About
									Us</a></li>
							<li class="nav-item"><a href="javascript:void(0)">Careers</a></li>
							<li class="nav-item"><a href="javascript:void(0)">Blog</a></li>
							<li class="nav-item"><a href="javascript:void(0)">Press</a></li>
							<li class="nav-item"><a href="javascript:void(0)">Offers</a></li>
							<li class="nav-item"><a href="javascript:void(0)">Deals</a></li>
						</ul>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-lg-2 mb-5 mb-lg-0">
					<h5 class="mb-5 fs-6">Support</h5>
					<div class="mt-5">
						<ul class="fl-menu">
							<li class="nav-item"><a href="javascript:void(0)">Contact</a></li>
							<li class="nav-item"><a href="javascript:void(0)">Legal
									Notice</a></li>
							<li class="nav-item"><a href="javascript:void(0)">Privacy
									Policy</a></li>
							<li class="nav-item"><a href="javascript:void(0)">Terms
									and Conditions</a></li>
							<li class="nav-item"><a href="javascript:void(0)">Sitemap</a></li>
						</ul>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-lg-3 mb-5 mb-lg-0">
					<div class="d-flex justify-content-lg-center">
						<h5 class="mb-5 fs-6">Other Services</h5>
					</div>
					<div class="d-flex justify-content-lg-center">
						<ul class="fl-menu">
							<li class="nav-item"><a href="javascript:void(0)">Bus</a></li>
							<li class="nav-item"><a href="javascript:void(0)">Activity
									Finder</a></li>
							<li class="nav-item"><a href="javascript:void(0)">Tour
									List</a></li>
							<li class="nav-item"><a href="javascript:void(0)">Flight
									Search</a></li>
							<li class="nav-item"><a href="javascript:void(0)">Cruise
									Ticket</a></li>
							<li class="nav-item"><a href="javascript:void(0)">Holidays</a></li>
							<li class="nav-item"><a href="javascript:void(0)">Travel
									Agents</a></li>
						</ul>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-lg-2 mb-5 mb-lg-0">
					<h5 class="mb-5 fs-6">Download App</h5>
					<a href="javascript:void(0)"
						class="d-inline-flex align-items-center border px-3 py-2 theme-border-radius min-w-150">
						<div class="flex-shrink-0">
							<img src="assets/images/icons/play-icon.png" class="img-fluid"
								alt="Google-Play" title="Google-Play">
						</div>
						<div class="flex-grow-1 ms-2">
							<p class="mb-0 small theme-text-accent-two">Get it on</p>
							<p class="mb-0 small theme-text-accent-one fw-bold">Google
								Play</p>
						</div>
					</a> <a href="javascript:void(0)"
						class="d-inline-flex align-items-center border px-3 py-2 theme-border-radius mt-2 min-w-150">
						<div class="flex-shrink-0">
							<img src="assets/images/icons/apple.png" class="img-fluid"
								alt="apple" title="apple">
						</div>
						<div class="flex-grow-1 ms-2">
							<p class="mb-0 small theme-text-accent-two">Get it on</p>
							<p class="mb-0 small theme-text-accent-one fw-bold">App Store</p>
						</div>
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col-12 col-lg-3 mt-lg-5">
					<p class="pt-2 mb-0 small theme-text-accent-one">&copy; 2022
						AFA Tourism All rights reserved.</p>
				</div>
				<div class="col-12 col-lg-6 mt-5">
					<ul
						class="footer-link d-flex flex-row flex-wrap justify-content-lg-center align-items-center">
						<li><a href="javascript:void(0)">Privacy</a></li>
						<li><a href="javascript:void(0)">Terms</a></li>
						<li><a href="javascript:void(0)">Site Map</a></li>
					</ul>
				</div>
				<div class="col-12 col-lg-3 mt-5">
					<div class="d-flex social justify-content-lg-end">
						<a href="javascript:void(0)" class="fs-4 pe-3"><i
							class="bi bi-facebook"></i></a> <a href="javascript:void(0)"
							class="fs-4 pe-3"><i class="bi bi-twitter"></i></a> <a
							href="javascript:void(0)" class="fs-4 pe-3"><i
							class="bi bi-linkedin"></i></a> <a href="javascript:void(0)"
							class="fs-4 pe-3"><i class="bi bi-instagram"></i></a> <a
							href="javascript:void(0)" class="fs-4"><i
							class="bi bi-whatsapp"></i></a>
					</div>
				</div>
			</div>
		</div>
		<!-- Scroll To Top Start-->
		<a href="javascript:void(0)" class="scrollToTop"><i
			class="bi bi-chevron-double-up"></i></a>
	</footer>


</body>
</html>