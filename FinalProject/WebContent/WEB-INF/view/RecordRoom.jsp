<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
String openCode = request.getParameter("openCode");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임방 제목</title>

<style type="text/css">
.attendList {
	border: 1px solid black;
}

.img-box {
	border: 1px solid gray;
	width: 80px;
	height: 80px;
	margin: 0 auto;
	border-radius: 100%;
	overflow: hidden;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
	overflow: hidden;
}

.partyMaster {
	padding-top: 9%;
	padding-bottom: 9%;
	width: 150px;
	height: 100%;
	overflow: hidden;
	text-align: center;
	float: left;
	margin-right: 3%;
}

.img-box:hover {
	border: 2px solid green;
}

.attendee {
	margin-top: 3%;
	margin-right: 10px;
	width: 110px;
	overflow: hidden;
	text-align: center;
	float: left;
}

.nickName-Master {
	font-size: 20pt;
	font-weight: bold;
	font-family: 휴먼편지체;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.info-title {
	font-size: 15pt;
	font-weight: bold;
	font-family: 휴먼편지체;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.info-detail {
	font-size: 13pt;
	font-weight: bold;
	font-family: 휴먼편지체;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.nickName-Attendee {
	font-size: 11pt;
	font-weight: bold;
	font-family: 맑은고딕;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

#crown {
	width: 50px;
	position: relative;
}

.kickButton {
	width: 20px;
	left: 90px;
	bottom: 2px;
	position: relative;
	cursor: pointer;
	display: none;
}

.readyMark {
	width: 20px;
	bottom: 2px;
	position: relative;
}

#out {
	position: relative;
	bottom: 1160px;
	width: 100%;
	height: 100%;
	border-radius: 10%;
	font-weight: bold;
	font-family: 맑은고딕;
	font-size: 17pt;
	border: 2px solid black;
	left: 150px;
}

#ready, #unReady {
	position: relative;
	bottom: 1160px;
	width: 100%;
	height: 100%;
	border-radius: 10%;
	font-weight: bold;
	font-family: 맑은고딕;
	font-size: 17pt;
	border: 2px solid black;
	bottom: 1230px;
	right: 150px;
}
</style>

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

<script>
	$(document).ready(function()
	{
		if ($(".nickName-Master").text() == $("#masterCheck").text())
		{
			$(".kickButton").css("display", "inline");
			$("#out").css("display", "none");
			$("#unReady").css("display", "none");
			$(".readyMark").css("bottom", "25px");
		} else
		{

		}

		$(".feedback").click(function()
		{
			var nickName = $("#nickName").text();
			$(".modal-title").text(nickName + " 님의 점수");
			$(".callModal").click();
		});

	
	
	$("#feedBack-complete").click(function()
	{
		$("#feedBackForm").submit();
		
	});

	});
	
	
	function check_yes(obj)
	{
		$(obj).attr("src", "assets/images/icons/check-green.png");
		$(obj).next().attr("src","assets/images/icons/x-black.png");
		$(obj).next().next().attr("name","attend");
		
	}
	
	function check_no(obj)
	{
		$(obj).attr("src", "assets/images/icons/x-red.png");
		$(obj).prev().attr("src","assets/images/icons/check-black.png");
		$(obj).next().attr("name","absent");
		
	}
	
	function friendSend(obj)
	{
		//alert($(obj).text());
		$(obj).next().css("display","none");
		$(obj).css("width","110px");
		$(obj).removeClass("btn-success");
		$(obj).addClass("btn-primary");
		$(obj).text("친구요청 전송");
		
	}
	
	function blockSend(obj)
	{
		$(obj).prev().css("display","none");
		$(obj).css("width","90px");
		$(obj).text("차단 완료");
		
	}
	
</script>





</head>
<body>

	<div>
		<jsp:include page="titleAndSubMenu.jsp"></jsp:include>
	</div>

	<div class="container">

		<!--  -->

		<div class="row">

			<div class="col-4 info">
				<br> <br> <br> <span class="info-title">방문 예정
					식당</span> <br> <span class="info-detail">:
					${roomInfo.restName}</span> <br> <br> <span class="info-title">방문
					예정 일시</span> <br> <span class="info-detail">:
					${roomInfo.visitDate }</span> <br> <br> <span class="info-title">방문
					예정 지역</span> <br> <span class="info-detail">:
					${roomInfo.restLocation }</span> <br>
				<div id="mapArea" style="width: 400px; height: 300px;"></div>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b0adb6cf684c4c502462a6673bf822bf&libraries=services"></script>
				<script type="text/javascript">
					var mapContainer = document.getElementById('mapArea'), // 지도를 표시할 div 
					mapOption =
					{
						center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption);

					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();

					// 주소로 좌표를 검색합니다
					geocoder
							.addressSearch(
									'${roomInfo.restLocation}',
									function(result, status)
									{

										// 정상적으로 검색이 완료됐으면 
										if (status === kakao.maps.services.Status.OK)
										{

											var coords = new kakao.maps.LatLng(
													result[0].y, result[0].x);
											//			var location = "${roomInfo.restName}"+","+result[0].x+","+result[0].y;
											var location = "${roomInfo.restName},"
													+ result[0].x
													+ ","
													+ result[0].y;

											// 결과값으로 받은 위치를 마커로 표시합니다
											var marker = new kakao.maps.Marker(
											{
												map : map,
												position : coords
											});

											// 인포윈도우로 장소에 대한 설명을 표시합니다
											var infowindow = new kakao.maps.InfoWindow(
													{
														content : '<div style="width:150px;text-align:center;padding:6px 0;">${roomInfo.restName}'
																+ '</div>'

													});
											infowindow.open(map, marker);

											map.setCenter(coords);
										}
									});
				</script>


				<br> <span class="info-title">모집 연령대</span> <br> <span
					class="info-detail">: ${roomInfo.ageGroup }</span> <br> <br>

				<span class="info-title">모집 성별</span> <br> <span
					class="info-detail">: ${roomInfo.genderCtg }</span> <br> <br>

				<span class="info-title">메인메뉴</span> <br> <span
					class="info-detail">: ${roomInfo.mainMenu }</span> <br> <br>


				<span class="info-title">음식 종류</span> <br> <span
					class="info-detail">: ${roomInfo.foodCtg }</span> <br> <br>

				<span class="info-title">인당 예상지출</span> <br> <span
					class="info-detail">: ${roomInfo.personalPrice }</span> <br> <br>

				<span class="info-title">현재인원/모집인원</span> <br> <span
					class="info-detail">: ${roomInfo.nopCurrent } /
					${roomInfo.nopHope }</span> <br> <br> <span class="info-title">개설
					키워드</span> <br> <span class="info-detail">:
					${roomInfo.openKeyword }</span> <br> <br>


			</div>




			<!-- 모달 코드 영역 -->
			<div class="modal fade" id="miniProfile" tabindex="-1"
				data-bs-backdrop="static" aria-labelledby="miniProfileLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="miniProfileLabel"></h5>
							<button class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="feedBack.kkini" method="post" id="feedBackForm">
							<input type="hidden" value="<%=openCode %>" name="openCode">
							<div style="display: flex; flex-direction: row; height: 200px;">
								<div style="flex-grow: 1; width: 30%;">
								<br>
									<c:forEach var="attendees" items="${attendees}">

										<c:choose>

											<c:when
												test="${attendees.userCode eq sessionScope.userCode }">
												<input type="hidden" style="display: none;" name="applyCodeU" value="${attendees.applyCode}">
												
											</c:when>

											<c:otherwise>
												<c:choose>
													<c:when test="${attendees.grade != '일반' }">
														<img src="assets/images/crown.png" alt=""
															style="width: 25px;" id="crown" />
														<img src="assets/images/tmp.jpg" alt=""
															style="width: 50px; height: 50px;" class="profile" />
												${attendees.attendee}    
												<br>
													</c:when>

													<c:otherwise>
														<img src="assets/images/tmp1.jpg" alt=""
															style="width: 50px; height: 50px;" class="profile" />
												${attendees.attendee}
												  <br>
														<!-- 해야할거 차단은 바로 들어가게 불참투표도 바로 들어가게 바꾸고 불참 처리된 인원은 피드백 불가능하게 교체
												이후 의의신청도 만들어야 할듯  div 세로분할 알아보기 -->
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>


									</c:forEach>

									<!-- 해야할거 차단은 바로 들어가게 불참투표도 바로 들어가게 바꾸고 불참 처리된 인원은 피드백 불가능하게 교체
												이후 의의신청도 만들어야 할듯  div 세로분할 알아보기 -->
								</div>


								<div style="flex-grow: 1;">
								<span style="font-size: small; font-weight: bold;">출석 여부</span>
								<br>
									<c:forEach var="attendees" items="${attendees}">

										<c:choose>
											<c:when
												test="${attendees.userCode eq sessionScope.userCode }">

											</c:when>

											<c:otherwise>
												<img src="assets/images/icons/check-black.png" alt=""
													style="width: 25px;" onclick="check_yes(this)">
												<img src="assets/images/icons/x-black.png" alt=""
													style="width: 25px;" onclick="check_no(this)">
												<input type="hidden" value="${attendees.applyCode}">


												<span style="line-height: 290%;"><br></span>
											</c:otherwise>
										</c:choose>

									</c:forEach>

								</div>


								<div style="flex-grow: 1;">
								<br>
									<c:forEach var="attendees" items="${attendees}">
										<c:choose>
											<c:when
												test="${attendees.userCode eq sessionScope.userCode }">

											</c:when>

											<c:otherwise>

												<button class="btn btn-success" type="button"
													style="width: 90px; height: 38px; font-size: small;"
													onclick="friendSend(this)">친구요청</button>
												<button class="btn btn-danger" type="button"
													style="width: 60px; height: 38px; font-size: small;"
													onclick="blockSend(this)">차단</button>
												<input type="hidden" value="${attendees.userCode}">

												<span style="line-height: 290%;"><br></span>

											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
							</div>
						</form>
						</div>
						<div class="modal-footer">
							<button class="btn btn-danger" data-bs-dismiss="modal" id="feedBack-complete">확인</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 모달 코드 영역 종료 -->









			<div class="col-8 attendList mt-3 mb-3">

				<!-- 방장 프로필 영역 -->

				<c:forEach var="attendees" items="${attendees}" begin="0" end="0">

					<div class="partyMaster">
						<img src="assets/images/crown.png" alt="" id="crown" />
						<div class="img-box" style="width: 100px; height: 100px;">
							<img src="assets/images/tmp.jpg" alt="" class="profile" />
							<!-- 모달 호출 버튼 -->
							<button id="modalTest" class="btn btn-primary callModal"
								data-bs-toggle="modal" data-bs-target="#miniProfile"
								style="display: none;"></button>

							<div style="display: none;">
								<c:forEach var="scores" items="${scores }">
									<c:if test="${scores.user_nickname eq attendees.attendee }">
										<div class="img-box">
											<img src="assets/images/tmp.jpg" alt="" class="profile" />
										</div>
										<span id="nickName" style="display: none;">
											${attendees.attendee }</span>
										<span id="attendScore"> 참가점수 : ${scores.attendScore } </span>
										<br>
										<span id="mannerScore"> 매너점수 : ${scores.mannerScore } </span>
										<br>
										<span id="biasScore"> 신뢰점수 : ${scores.biasScore } </span>
										<br>
									</c:if>
								</c:forEach>
							</div>

						</div>
						<span class="nickName-Master">${attendees.attendee }</span> <span
							id="masterCheck" style="display: none;">${sessionScope.nickName }</span>
					</div>
				</c:forEach>

				<!-- 참가자 프로필 영역 -->
				<!-- 참가자 리스트 반복문 -->
				<c:set var="count" value="1"></c:set>

				<c:forEach var="attendees" items="${attendees}">
					<c:if test="${attendees.grade eq '일반' }">
						<div class="attendee">
							<div style="width: 0px; height: 0px;">
								<div style="display: none;">
									<form action="kickout.kkini" method="post">
										<input type="text" name="userCode"
											value="${attendees.userCode }" /> <input type="text"
											name="openCode" value="${attendees.openCode }" />
										<button type="submit"></button>
									</form>
								</div>
							</div>
							<div class="img-box">
								<img src="assets/images/tmp1.jpg" alt="" class="profile" />

								<!-- 모달 호출 버튼 -->
								<button id="modalTest" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#miniProfile"
									style="display: none;">${attendees.attendee }</button>

								<div style="display: none;">
									<c:forEach var="scores" items="${scores }">
										<c:if test="${scores.user_nickname eq attendees.attendee }">
											<div class="img-box">
												<img src="assets/images/tmp1.jpg" alt="" class="profile" />
											</div>
											<span id="nickName" style="display: none;">
												${attendees.attendee }</span>
											<span id="attendScore"> 참가점수 : ${scores.attendScore }
											</span>
											<br>
											<span id="mannerScore"> 매너점수 : ${scores.mannerScore }
											</span>
											<br>
											<span id="biasScore"> 신뢰점수 : ${scores.biasScore } </span>
											<br>
										</c:if>
									</c:forEach>
								</div>


							</div>
							<span class="nickName-Attendee">${attendees.attendee }</span>







						</div>

						<c:set var="count" value="${count+1 }"></c:set>
					</c:if>
				</c:forEach>

				<!-- 빈자리 반복문 -->

				<!-- 참가자가 아무도 없다면 카운트 1 증가 -->

				<c:choose>
					<c:when test="${count == 1 }">
						<c:forEach begin="1" end="${nop-1 }">
							<div class="attendee">
								<div class="img-box"></div>
								<span class="nickName-Attendee">빈자리</span>
							</div>
						</c:forEach>
					</c:when>

					<c:otherwise>
						<c:forEach begin="1" end="${nop-count }">
							<div class="attendee">
								<div class="img-box"></div>
								<span class="nickName-Attendee">빈자리</span>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>

				<c:forEach begin="${nop }" end="14">
					<div class="attendee">
						<div class="img-box">
							<img src="assets/images/금지.png" alt="" class="profile" />
						</div>
						<span class="nickName-Attendee">막힘</span>
					</div>
				</c:forEach>

				<button class="btn btn-primary feedback"
					style="width: 200px; height: 70px; position: absolute ; top: 60%; left: 58%; border-radius: 10%; text-align: center;">출석
					확인</button>
			</div>

			<%-- 	nop : ${nop } <br>
		count : ${count } <br>
		nickName : ${nickName } --%>
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
			<br /> <br /> <br /> <br />

		</div>


	</div>


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