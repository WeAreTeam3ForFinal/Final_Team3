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
<title>Insert title here</title>
<link rel="styleSheet" type="text/css" href="<%=cp %>/css/style.css">
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#tab-area").find("span").css("cursor","pointer");
		
		$(document).on("click", ".selectInfo", function()
		{
			$(this).next().children('button').click();
		});
		
		$(document).on("click", ".joinRoom", function()
		{
			$(this).next().children('button').click();
		});
		
		// 자기소개 수정 버튼 클릭
		$("#updateIntroduce").click(function()
		{
			
			// 자기소개 글자수
			tmp = $("#introduce").text();
			count = tmp.length;
			
			$("#current").text(count);
			
			// 자기소개 클릭하면 외곽선 색강조
			$("#introduce").focus(function()
			{
				$("#introduce").css("border","3px solid #FFA500");
			});
			
			// 다른영역 클릭 시 색강조 취소
			$("#introduce").blur(function()
			{
				$("#introduce").css("border","2px solid black");
			});
			
			// 수정 & 취소 버튼 보이기
			$("#finish").css("display","inline");
			$("#cancel").css("display","inline");
			
			// 자기소개 읽기전용 해제
			$("#introduce").removeAttr("readonly");
			$("#introduce").focus();
			
			// 글자수 카운트
			$(document).keyup(function()
			{
				
				tmp = $("#introduce").val();
				count = tmp.length;
					
				if (count > 300)
				{
					alert("자기소개는 300글자 이하만 작성 가능합니다.")
					$("#introduce").val($("#introduce").val().substring(0,300));
					count = 300;
				}				
				$("#current").text(count);
			});
			
			// 글자 수 보이기
			$("#current").parent().css("display","inline");
		});
		
		// 취소버튼 클릭
		$("#cancel").click(function()
		{
			var introduce = $("#introduce").text();
			$("#current").parent().css("display","none");
			$("#introduce").val(introduce);
			$("#finish").css("display","none");
			$("#cancel").css("display","none");
			$("#introduce").attr("readonly","readonly");
			
			// 색강조 기능 제거
			$("#introduce").focus(function()
			{
				$("#introduce").css("border","2px solid black");
			});
		});
		
		$("#privateInfo").click(function()
		{
			$("#privateForm").submit();
		});
	});
	
		
</script>

</head>
<body>

	<!-- 타이틀 메뉴 -->
	<c:import url="titleAndSubMenu.jsp">
	</c:import>
	
	<div class="container">
		<div class="row">
		
				<!-- 현재 페이지 -->
				<span class="fw-bold mb-0 mt-5 theme-text-shadow display-6" id="currentPage" style="color: #FFA500;">
					마이 페이지
				</span>
				
				<!-- 메뉴 목록 -->
				<div id="tab-area" style="border-bottom: 2px solid black; margin-top: 40px; margin-bottom: 20px; margin-left: 5px;  width: 100%;">
					<div class="tabs fw-bold" style="font-size: 17pt; margin-bottom: 10px;">
						<span>내 정보</span>
					</div>
				</div>
				
				<!-- 정보 표시 영역 -->
				<div style="font-weight: bold; font-size: 12pt;">
					<form action="checkpw.kkini" method="get" id="privateForm">
						<h5 class="fw-bold mb-2" style="color: #FFA500">개인정보 <i style="color: #FFA500; cursor: pointer;" id="privateInfo" class="bi bi-gear-fill"></i></h5>
						<i class="bi bi-person"></i> ${sessionScope.nickName } <br> <input type="text" name="nickName" value="${sessionScope.nickName }" style="display: none;"/>
						<i class="bi bi-envelope"></i> ${userInfo.user_id } <br> <input type="text" name="user_id" value="${userInfo.user_id }" style="display: none;"/>
						<i class="bi bi-phone"></i> ${userInfo.user_phonenumber } <br> <input type="text" name="user_phonenumber" value="${userInfo.user_phonenumber }" style="display: none;"/>
						<i class="bi bi-geo-alt"></i> ${userInfo.user_addr } <br> <input type="text" name="user_addr" value="${userInfo.user_addr }" style="display: none;"/>
						<i class="bi bi-binoculars"></i> ${intregions }<br> <input type="text" name="intregions" value="${intregions }" style="display: none;"/>
					</form>
					<br>
					
					<form action="">
						<h5 class="fw-bold mb-2" style="color: #FFA500">식사성향 <i style="color: #FFA500; cursor: pointer;" id="matchingInfo" class="bi bi-gear-fill"></i></h5> 
						<i class="bi bi-emoji-smile"></i> ${userCha } <br>
						<i class="bi bi-chat-heart"></i> ${userInt } <br>
						<i class="bi bi-clock"></i> ${userSpeed } <br>
						<i class="bi bi-chat-dots"></i> ${userTalk } <br>
					</form>
					<br>
					
					<form action="updateIntroduce.kkini" method="post">
						<h5 class="fw-bold mb-2" style="color: #FFA500">자기소개 <i style="color: #FFA500; cursor: pointer;" id="updateIntroduce" class="bi bi-gear-fill"></i></h5>
						<textarea rows="6" cols="60" id="introduce" name="introduce" style="resize: none; border: 2px solid black;" readonly="readonly">${userInfo.user_introduce }</textarea>
						<br>
						<div style="display: none;">
							<span id="current"></span> / 300
						</div>
						<br>
						<button id="finish" class="btn btn-primary" type="submit" style="font-weight: bold; display: none;">완료</button>
						<button id="cancel" class="btn btn-danger" style="font-weight: bold; display: none;">취소</button>
					</form>
					<br><br> 
				</div>
				
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