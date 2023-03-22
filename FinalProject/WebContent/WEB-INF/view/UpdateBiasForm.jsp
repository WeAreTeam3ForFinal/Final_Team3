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
<title>식사성향 수정</title>
</head>
<link rel="stylesheet" type="text/css" href="./assets/css/register.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
	
<script type="text/javascript">

	$().ready(function()
	{
		//alert("확인");
		
		
	});
	
	$(window).on("load",function()
	{
		// 유저의 기존 식사 속도
		var speed = $("#userSpeed").text();
		
		// 각 라벨 텍스트 값을 이용해 기존 스피드 checked 속성 부여
		var speeds = document.getElementsByName("user_eatSpeed");
		
		for (var i = 0; i < speeds.length; i++)
		{
			// 임시로 속도 속성명을 담아둘 변수 (비교대상용)
			var tmp = $(speeds[i]).next().text();	
			
			// 기존 속도와 임시 변수에 담아둔 속도가 같으면 클릭
			if(speed == tmp)
				$(speeds[i]).click();
		}
		
		// 유저의 기존 대화량
		var talk = $("#userTalk").text();
		
		var talks = document.getElementsByName("user_talk");
		
		for (var i = 0; i < talks.length; i++)
		{
			var tmp = $(talks[i]).next().text();	
			
			if(talk == tmp)
				$(talks[i]).click();
		}
		
		// 유저 기존 성격 유형
		var chaArr = $("#userCha").text().split(", ");
		
		var chas = document.getElementsByName("user_characters");
		
		for (var i = 0; i < chaArr.length; i++)
		{
			var tmp = chaArr[i];
			
			for (var j = 0; j < chas.length; j++)
			{
				var tmp2 = $(chas[j]).next().text();
				
				if(tmp == tmp2)
					$(chas[j]).click();
			}
		}
		
		// 유저의 기존 관심사
		var intArr = $("#userInt").text().split(", ");
		
		var ints = document.getElementsByName("user_interests");
		
		for (var i = 0; i < intArr.length; i++)
		{
			var tmp = intArr[i];
			
			for (var j = 0; j < ints.length; j++)
			{
				var tmp2 = $(ints[j]).next().text();
				
				if(tmp == tmp2)
					$(ints[j]).click();
			}
		}
		
		$("#cancel").click(function()
		{
			$(location).attr('href',"myPage.kkini");
		});
		
		$("#update").click(function()
		{
			$("#updateBias").submit();
		});
		
		
		
		
	});
	
</script>	

<body>

	<section class="h-100 h-custom">
		<div class="container py-5 h-100">
			<div class="row d-flex justify-content-center h-100">
				<div class="col-12">
					<div class="card card-registration card-registration-2"
						style="border-radius: 15px;">

						<div class="card-body p-0">
							<div class="row g-0" style="justify-content: center;">
								<div class="col-lg-10 bg-indigo text-white">
									<div class="px-5 pt-5 pb-1">
									<form action="updatebias.kkini" method="post" id="updateBias">
										<h3 class="fw-normal mb-5">성향 입력</h3>

										<!-- 식사속도 -->
										<div class="col-md-7 mb-4">

											<h6 class="mb-2 pb-1">밥을 얼마나 빨리드시나요?</h6>
											<c:forEach var="speedList" items="${speedList }">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="user_eatSpeed" id="${speedList.CODE}" value="${speedList.CODE}"
													/> <label class="form-check-label"
													for="${speedList.CODE}">${speedList.U_SPEED}</label>
											</div>
											</c:forEach>
										</div>
										
										<!-- 식사중 대화량 -->
										<div class="col-md-7 mb-4">

											<h6 class="mb-2 pb-1">식사중 대화는 얼마나 하세요?</h6>
											<c:forEach var="talkList" items="${talkList }">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="user_talk" id="${talkList.CODE}" value="${talkList.CODE}"
													 /> <label class="form-check-label"
													for="${talkList.CODE}">${talkList.AMOUNT}</label>
											</div>

										   </c:forEach>
										</div>

										<!-- 성격유형 -->
										<div class="col-md-7 mb-4">
										<h6 class="mb-2 pb-1">성격유형</h6>
										<c:forEach var="chaList" items="${chaList }">
										<div class="form-check form-check-inline">
												<input class="form-check-input" type="checkbox"
													name="user_characters" id="${chaList.CHA_TYPE_CODE}" value="${chaList.CHA_TYPE_CODE}" />
												<label class="form-check-label" for="${chaList.CHA_TYPE_CODE}">${chaList.CHA}</label>
											</div>
										
										</c:forEach>
										</div>
										
										<!-- 관심사 -->
										<!-- 전체선택 필요한가? -->
										<div class="col-md-7 mb-4">
										<h6 class="mb-2 pb-1">관심사</h6>
										<c:forEach var="intList" items="${intList }">
										<div class="form-check form-check-inline">
												<input class="form-check-input" type="checkbox"
													name="user_interests" id="${intList.CODE}" value="${intList.CODE}" />
												<label class="form-check-label" for="${intList.CODE}">${intList.INTER}</label>
											</div>
										
										</c:forEach>
										</div>
										
										<div style="margin-left: 40%;">
										<button class="btn btn-primary" id="update" type="button">수정</button>
										<button class="btn btn-danger" id="cancel" type="button">취소</button>
										</div>
										
										<span hidden="hidden" id="userCha">${userCha }</span>
										<span hidden="hidden" id="userInt">${userInt }</span>
										<span hidden="hidden" id="userSpeed">${userSpeed }</span>
										<span hidden="hidden" id="userTalk">${userTalk }</span>
										
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>