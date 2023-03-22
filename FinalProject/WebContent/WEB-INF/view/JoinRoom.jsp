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
<title>~~모임방 제목</title>

<style type="text/css">


	.attendList
	{
		border: 1px solid black; 
	}
	
	.img-box
	{
		border: 1px solid gray; 
		width: 80px; 
		height: 80px; 
		margin: 0 auto;
		border-radius: 100%;
		overflow: hidden;
	}
	
	.profile
	{
		width: 100%;
		height: 100%;
		object-fit: cover;
		overflow: hidden;
	}
	
	.partyMaster
	{
		padding-top: 9%;
		padding-bottom: 9%;
		width: 150px;
		height: 100%;
		overflow: hidden;
		text-align: center;
		float: left;
		margin-right: 3%;
	}
	
	.img-box:hover
	{
		border: 2px solid green;
	}
	
	.attendee
	{
		margin-top: 3%; 
		margin-right: 10px;
		width: 110px;
		overflow: hidden;
		text-align: center;
		float: left;
	}
	
	.nickName-Master
	{
		font-size: 20pt;
		font-weight: bold;
		font-family: 휴먼편지체;
		overflow: hidden;
		white-space: nowrap; 
		text-overflow: ellipsis;
	}
	
	.info-title
	{
	    font-size: 15pt;
		font-weight: bold;
		font-family: 휴먼편지체;
		overflow: hidden;
		white-space: nowrap; 
		text-overflow: ellipsis;
	}
	
	.info-detail
	{
		font-size: 13pt;
		font-weight: bold;
		font-family: 휴먼편지체;
		overflow: hidden;
		white-space: nowrap; 
		text-overflow: ellipsis;
	
	}
	
	.nickName-Attendee
	{
		font-size: 11pt;
		font-weight: bold;
		font-family: 맑은고딕;
		overflow: hidden;
		white-space: nowrap; 
		text-overflow: ellipsis;
	}
	
	#crown
	{
		width: 50px;
		position: relative;
	}
	
	.kickButton
	{
		width: 20px;
		left: 90px;
		bottom: 2px;
		position: relative;
		cursor: pointer;
		display: none;
	}
	
	.readyMark
	{
		width: 20px;
		bottom: 2px;
		position: relative;
	}
	
	#out
	{
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
	
	#ready, #unReady
	{
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
		if($(".nickName-Master").text() == $("#masterCheck").text())
		{
			$(".kickButton").css("display","inline");
			$("#out").css("display","none");
			$("#unReady").css("display","none");
			$(".readyMark").css("bottom","25px");
		}
		else
		{
			
		}
		
		$(".kickButton").click(function()
		{
			if(confirm("해당 회원을 강퇴하시겠습니까?"))
				$(this).next().children().children("button").click();
			else
				return;
		});
		
		
		$("#Update").click(function()  //수정버튼 클릭시 데이터 전송
		{
			location.href = "mmRoomUpdateForm.kkini?openCode=<%=openCode %>";
		});
		
		$("#Delete").click(function()
		{
			$(this).next().children().children("button").click();
		});
		
		// 퇴장 기능
		$("#out").click(function()
		{
			
			// 퇴장여부 재확인
			
			if(confirm("현재 참가 중인 방에서 나가시겠습니까?"))
			{
				// 로그인한 회원코드
				var userCode = $("#loginUcode").text();
				
				// 참가한 방 오픈코드 받아오기
				var openCode = document.getElementsByName("openCode")[0].value;
				
				// 강퇴 처리를 위해 유저코드 파라미터 넘기기
				var url = "mmOut.kkini?userCode=" + userCode + "&openCode=" + openCode; 
				// out 버튼 부모(Form 태그) action 속성에 url 대입
				$(this).parent().attr("action", url);
				
				// 서브밋
				$(this).parent().submit();
			}
			else
				return;
			
		});
		
		
		// 레디 기능
		$("#ready").click(function()
		{
			
				// 로그인한 회원코드
				var userCode = $("#loginUcode").text();
				
				// 참가한 방 오픈코드 받아오기
				var openCode = document.getElementsByName("openCode")[0].value;
				
				// 강퇴 처리를 위해 유저코드 파라미터 넘기기
				var url = "mmSetReady.kkini?userCode=" + userCode + "&openCode=" + openCode + "&set=" + $(this).attr("id"); 
				// out 버튼 부모(Form 태그) action 속성에 url 대입
				$(this).parent().attr("action", url);
				
				// 서브밋
				$(this).parent().submit();
			
		});
		
		// 레디 해제 기능
		$("#unReady").click(function()
		{
			
				// 로그인한 회원코드
				var userCode = $("#loginUcode").text();
				
				// 참가한 방 오픈코드 받아오기
				var openCode = document.getElementsByName("openCode")[0].value;
				
				// 강퇴 처리를 위해 유저코드 파라미터 넘기기
				var url = "mmSetReady.kkini?userCode=" + userCode + "&openCode=" + openCode + "&set=" + $(this).attr("id"); 
				// out 버튼 부모(Form 태그) action 속성에 url 대입
				$(this).parent().attr("action", url);
				
				// 서브밋
				$(this).parent().submit();
			
		});
		
		$(".profile").click(function()
		{
			var nickName = $(this).next("button").next().children("#nickName").text();
			var attend = $(this).next("button").next().children("#attend").text();
			var manner = $(this).next("button").next().children("#manner").text();
			var bias = $(this).next("button").next().children("#bias").text();
			
			$(".modal-title").text(nickName + " 님의 점수");
			$(".modal-body").html($(this).next("button").next().html());
			
			$(this).next("button").click();
						
		});
	});
	
	

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
		<br><br><br>
		<span class="info-title">방문 예정 식당</span>
		<br>
		<span class="info-detail">: ${roomInfo.restName}</span>
		<br>
		<br>
		
		<span class="info-title">방문 예정 일시</span>
		<br>
		<span class="info-detail">: ${roomInfo.visitDate }</span>
		<br>
		<br>
		
		<span class="info-title">방문 예정 지역</span>
		<br>
		<span class="info-detail">: ${roomInfo.restLocation }</span>
		<br>
		<div id="mapArea" style="width:400px; height:300px;">
		</div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b0adb6cf684c4c502462a6673bf822bf&libraries=services"></script>
		<script type="text/javascript">
		
		
		
		var mapContainer = document.getElementById('mapArea'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${roomInfo.restLocation}', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
//			var location = "${roomInfo.restName}"+","+result[0].x+","+result[0].y;
			var location = "${roomInfo.restName},"+result[0].x+","+result[0].y;
			
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${roomInfo.restName}'
	            		+ '</div>'
	            
	            //result[0] = [object Object]
	            //result[0].address_name = 서울 용산구 이태원동 79-44            
	            
	            /*
	            JSON.stringify(result[0]) 의 결과
	            [{"address":{"address_name":"서울 용산구 이태원동 79-44","b_code":"1117013000","h_code":"1117065000","main_address_no":"79","mountain_yn":"N","region_1depth_name":"서울"
	            	,"region_2depth_name":"용산구","region_3depth_h_name":"이태원1동","region_3depth_name":"이태원동","sub_address_no":"44","x":"126.9928233877","y":"37.5324983211659"}
	            ,"address_name":"서울 용산구 이태원동 79-44","address_type":"REGION_ADDR","road_address":{"address_name":"서울 용산구 녹사평대로26가길 24","building_name":""
	            	,"main_building_no":"24","region_1depth_name":"서울","region_2depth_name":"용산구","region_3depth_name":"이태원동","road_name":"녹사평대로26가길","sub_building_no":""
	            	,"underground_yn":"N","x":"126.992826894903","y":"37.5324993124802","zone_no":"04391"},"x":"126.9928233877","y":"37.5324983211659"}]
	            */
	            
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
</script>
		
		
		<br>
		<span class="info-title">모집 연령대</span>
		<br>
		<span class="info-detail">: ${roomInfo.ageGroup }</span>
		<br>
		<br>
		
		<span class="info-title">모집 성별</span>
		<br>
		<span class="info-detail">: ${roomInfo.genderCtg }</span>
		<br>
		<br>
		
		<span class="info-title">메인메뉴</span>
		<br>
		<span class="info-detail">: ${roomInfo.mainMenu }</span>
		<br>
		<br>
		
		
		<span class="info-title">음식 종류</span>
		<br>
		<span class="info-detail">: ${roomInfo.foodCtg }</span>
		<br>
		<br>
		
		<span class="info-title">인당 예상지출</span>
		<br>
		<span class="info-detail">: ${roomInfo.personalPrice }</span>
		<br>
		<br>
		
		<span class="info-title">현재인원/모집인원</span>
		<br>
		<span class="info-detail">: ${roomInfo.nopCurrent } / ${roomInfo.nopHope }</span>
		<br>
		<br>
		
		
		<span class="info-title">개설 키워드</span>
		<br>
		<span class="info-detail">: ${roomInfo.openKeyword }</span>
		
		<br>
		<br>
		

		<!-- 방장이라면 수정/삭제가 보이게 -->
		<c:if test="${sessionScope.nickName == roomInfo.chief_nickName}">
		<button type="button" id="Update" class="btn btn-primary">수정</button>
		<button type="button" id="Delete" class="btn btn-danger">삭제</button>
		<div style="display: none;">
		<form action="deleteMM.kkini" method="post">
		<input type="text" name="openCode" value="<%=openCode%>">
		<input type="text" name="checkType" value="삭제">
		<button type="submit"></button>
		</form>
		</div>
		</c:if>
		
		</div>
		
		
		
									
									<!-- 모달 코드 영역 -->
									<div class="modal fade" id="miniProfile" tabindex="-1" aria-labelledby="miniProfileLabel" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="miniProfileLabel"></h5>
													<button class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
							
												</div>
												<div class="modal-footer">
													<button class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
												</div>
											</div>
										</div>
									</div>
									<!-- 모달 코드 영역 종료 -->
		
		
		
		
		
		
		


		<div class="col-8 attendList mt-3 mb-3">
				
				<!-- 방장 프로필 영역 -->
				
				<c:forEach var="attendees" items="${attendees}" begin="0" end="0">
				
					<div class="partyMaster">
						<img src="assets/images/crown.png" alt="" id="crown"/>
						<div class="img-box" style="width: 100px; height: 100px;">
							<img src="assets/images/tmp.jpg" alt="" class="profile"/>
								<!-- 모달 호출 버튼 -->
								<button id="modalTest" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#miniProfile" style="display: none;"></button>
								
								<div style="display: none;">
										<c:forEach var="scores" items="${scores }">
											<c:if test="${scores.user_nickname eq attendees.attendee }">
												<div class="img-box">
													<img src="assets/images/tmp.jpg" alt="" class="profile" />
												</div>
													<span id="nickName" style="display: none;"> ${attendees.attendee }</span>
													<span id="attendScore"> 참가점수 : ${scores.attendScore } </span> <br>
													<span id="mannerScore"> 매너점수 : ${scores.mannerScore } </span> <br>
													<span id="biasScore"> 신뢰점수 : ${scores.biasScore } </span> <br>
											</c:if>
										</c:forEach>
								</div>
								
						</div>
						<span class="nickName-Master">${attendees.attendee }</span>
						<span id="masterCheck" style="display: none;">${sessionScope.nickName }</span>
					</div>
				</c:forEach>
				
				<!-- 참가자 프로필 영역 -->
				<!-- 참가자 리스트 반복문 -->
				<c:set var="count" value="1"></c:set>
				
				<c:forEach var="attendees" items="${attendees}" >
					<c:if test="${attendees.grade eq '일반' }">
						<div class="attendee">
							<div style="width: 0px; height: 0px;">
								<img src="assets/images/x버튼.png" alt="" class="kickButton"/>
								<c:if test="${not empty attendees.readyDate}">
									<img src="assets/images/ready.png" alt="" class="readyMark"/>
								</c:if>
								<div style="display: none;">
									<form action="kickout.kkini" method="post">
										<input type="text" name="userCode" value="${attendees.userCode }" />
										<input type="text" name="openCode" value="${attendees.openCode }" />
										<button type="submit"></button>
									</form>
								</div>
							</div>
							<div class="img-box">
								<img src="assets/images/tmp1.jpg" alt="" class="profile" />
									
									<!-- 모달 호출 버튼 -->
									<button id="modalTest" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#miniProfile" style="display: none;">${attendees.attendee }</button>
									
									<div style="display: none;">
										<c:forEach var="scores" items="${scores }">
											<c:if test="${scores.user_nickname eq attendees.attendee }">
												<div class="img-box">
													<img src="assets/images/tmp1.jpg" alt="" class="profile" />
												</div>
													<span id="nickName" style="display: none;"> ${attendees.attendee }</span>
													<span id="attendScore"> 참가점수 : ${scores.attendScore } </span> <br>
													<span id="mannerScore"> 매너점수 : ${scores.mannerScore } </span> <br>
													<span id="biasScore"> 신뢰점수 : ${scores.biasScore } </span> <br>
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
						<c:forEach begin="1" end="${nop-1 }" >
									<div class="attendee">
										<div class="img-box">
										</div>
										<span class="nickName-Attendee">빈자리</span>
									</div>
						</c:forEach>
					</c:when>
					
					<c:otherwise>
						<c:forEach begin="1" end="${nop-count }" >
									<div class="attendee">
										<div class="img-box">
										</div>
										<span class="nickName-Attendee">빈자리</span>
									</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
					
				<c:forEach begin="${nop }" end="14" >
					<div class="attendee">
						<div class="img-box">
							<img src="assets/images/금지.png" alt="" class="profile" />
						</div>
						<span class="nickName-Attendee">막힘</span>
					</div>
				</c:forEach>
				
				<form action="" method="post" style="width: 200px; height: 70px; position: relative; top: 38%; left: 38%; border-radius: 10%; text-align: center;">
					<button class="btn btn-danger" type="button" id="out">
						퇴장하기
						<span id="loginUcode" style="display: none;">${sessionScope.userCode }</span>
					</button>
					
					<c:choose>
						<c:when test="${isReady == 0 }">
							<button class="btn btn-success" type="button" id="ready">
								레디하기
							</button>
						</c:when>
						
						<c:otherwise>
							<button class="btn btn-secondary" type="button" id="unReady">
								레디해제
							</button>
						</c:otherwise>
					</c:choose>
					
				</form>
		</div>
		
	<%-- 	nop : ${nop } <br>
		count : ${count } <br>
		nickName : ${nickName } --%>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	
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