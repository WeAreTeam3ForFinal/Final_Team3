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
		}
		
		$(".kickButton").click(function()
		{
			if(confirm("해당 회원을 강퇴하시겠습니까?"))
				$(this).next().children().children("button").click();
			else
				return;
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
	
		<div class="col-4">
		</div>


		<div class="col-8 attendList mt-3 mb-3">
				
				<!-- 방장 프로필 영역 -->
				
				<c:forEach var="attendees" items="${attendees}" begin="0" end="0">
				
					<div class="partyMaster">
						<img src="assets/images/crown.png" alt="" id="crown"/>
						<div class="img-box" style="width: 100px; height: 100px;">
							<img src="assets/images/미오.jpg" alt="" class="profile"/>
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
								<div style="display: none;">
									<form action="kickout.kkini" method="post">
										<input type="text" name="userCode" value="${attendees.userCode }" />
										<input type="text" name="openCode" value="${attendees.openCode }" />
										<button type="submit"></button>
									</form>
								</div>
							</div>
							<div class="img-box">
								<img src="assets/images/카가미.png" alt="" class="profile" />
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
		</div>
		
		nop : ${nop } <br>
		count : ${count } <br>
		nickName : ${nickName }
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