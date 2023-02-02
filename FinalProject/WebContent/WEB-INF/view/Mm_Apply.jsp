<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<% 
   	request.setCharacterEncoding("UTF-8"); 
	String cp = request.getContextPath();
	
	String openCode = request.getParameter("openCode");
	request.setAttribute("openCode", openCode);
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="utf-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<meta name="description" content=""> 
<meta name="author" content="ThemesLay"> 
<title>MenuMate Apply</title>
<!-- Favicon icon --> 
<link rel="icon" type="image/png" sizes="80x80" href="assets/images/favicon.png"> 
<!-- Main CSS --> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" /> 
<link href="./assets/css/main.css" rel="stylesheet"> 
<!--구글폰트  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<!-- js file --> 
<script src="assets/js/bootstrap.bundle.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
<!-- Open2 CSS --> 
<link rel="stylesheet" type="text/css" href="assets/css/open2.css"> 
 
<title></title> 
 
<style type="text/css"> 
#localCheck, #restCheck, #datetimeCheck, #menuCheck, #menuPriceCheck, 
   #countCheck { 
   font-size: small; 
   color: red; 
   font-weight: bold; 
} 
 
#section { 
   font-weight: bold; 
} 

/* input 칸 가로 크기 줄임 */
.mm-input {
	width: 90%;
} 

/* 개설하기, 취소 버튼 크기 변경 및 위치 조정 */
.mm-btn {
	margin: 20px;
	width: 300px;
	font-weight: bold;
	font-size: x-large;
}
</style> 
 
<script type="text/javascript"> 

$(document).ready(function ()
		{
		   perPriceCal(); 
		   
		   // 지원하기 버튼 클릭 시, 실행되는 기능
		   $("#mm_open").click(function() { 
		      
		      // 세션에 회원코드가 담겨있지 않다면 (= 비로그인 상태일 때)
		      // 서버의 세션에 userCode가 저장되어 있으므로 해당 방식으로 가져와야한다.(jstl방식으로!)
		      // sessionStorage 는 웹페이지에 값이 저장되므로 session 과는 저장되는 곳이 다름
		      if ('${userCode}' == null)
		      {
		         // 지원하기 버튼의 속성 값들을 변경
		         this.attributes.opCtn.nodeValue = '로그인이 필요한 서비스입니다.';
		         this.attributes.opBtn.nodeValue = '확인';
		         this.attributes.opBtnHref.nodeValue = '';
		         
		         // 변경된 값 매핑 완료
		         oneBtnPopOpen('#mm_open');
		         
		         // 팝업을 부른 후 다시 원래값으로 복구
		         this.attributes.opCtn.nodeValue = '지원이 완료되었습니다.';
		         this.attributes.opBtn.nodeValue = '메인페이지로 돌아갑니다.';
		         this.attributes.opBtnHref.nodeValue = 'mainPage.kkini';
		         
		         // 팝업 내용 보여주기
		         $('#oneBtnPopup').modal('show');
		         
		      } else {
		         $.ajax({
		        	 		url : 'http://localhost:8090/FinalProject/getMemaApplyCheck.kkini', 
		              		data : $("#mmApplyform").serialize(), 
		              		type : 'POST', 
		              		success: function(data)
		              		{
		                 		if (data == 'yes')
		                 		{
		                    		$.ajax({ 
		                         				url : 'http://localhost:8090/FinalProject/memaApply.kkini', 
		                         				data : $("#mmApplyform").serialize(), 
		                         				type : 'POST', 
		                         				success: function(data) { 
		                            			oneBtnPopOpen('#mm_open');
		                            			$('#oneBtnPopup').modal('show');    /* show 는 부트스트랩 페이지 참조
		                                                         			 		https://getbootstrap.kr/docs/5.2/components/modal/
		                                                            				#%EB%8D%B0%EC%9D%B4%ED%84%B0-%EC%86%8D%EC%84%B1-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0
		                                                       						*/
		                         				} 
		                      				});
		                 		} else {
		                	 		alert("이미 소속된 방에는 지원할 수 없습니다.");
		                 		}
		                 
		              		} 
		      			});
				}
		      
	}) ;
		    
});


// 메인메뉴 가격에 따른 인당예상 가격 자동입력 함수
function perPriceCal() 
{ 
   var peopleCount = document.getElementById("peopleCount").value; 
   var mainMenuPrice = document.getElementById("mainMenuPrice").value;    
   var perPrice = Math.floor(parseInt(mainMenuPrice) / parseInt(peopleCount)); 
    
   // 메인메뉴 가격이나 모집희망 인원수에 값이 없을 경우 NaN -> 0 처리하겠다 
   if(isNaN(perPrice)) 
   { 
      perPrice = 0; 
   } 
 
   // 숫자 3자리마다 콤마 찍는 정규식   
   let result = perPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); 
   document.getElementById("perPrice").value = result + '원'; 
} 
 

/* 버튼 1개인 팝업창 열기(범용) */ 
// 여기저기 그대로 가져다 쓰기 가능 
function oneBtnPopOpen(cond)
{ 
 	let Pcontent = $(cond).attr("opCtn"); 
	let Pbtn = $(cond).attr("opBtn"); 
	let Phref = $(cond).attr("opBtnHref"); 
	Phref = Phref == "" ? "#" : Phref; 
 
	// 실질적으로 팝업창에 값들을 입력해주는 부분
	$("#onePopContents").html(Pcontent); 
	$("#onePopBtn").html(Pbtn); 
	$("#onePopBtn").next().attr("href", Phref); 
}
 
</script>
</head>

<body>
	<!-- 좌측 드롭다운 4개 추가 -->
	<%-- <c:import url="titleAndSubMenu.jsp"></c:import> --%>
 
 	<!-- 부트스트랩 테두리 색상 추가 -->
 	<!-- 
 	<div class="title_box">
 		<p class="title border border-secondary border border-3 bg-transparent text-dark">메뉴 메이트 모집정보</p>
 	</div>
 	-->
 	<!-- 부트스트랩 테두리 색상 추가 -->
 	<!--
 	<section id="section" class=" border border-secondary border border-3 bg-transparent text-dark"> 
 	-->
 	
	<!-- 끼리끼니 로고 -->
	<div class="logo">
		<img alt="로고" src="./assets/images/logo.jpeg" style="width: 300px;">
	</div>
 	
	<!-- 방 클릭 시 보여질 모집정보  -->
	<div class="openBox">
		<div class="content">
		<p class="infoText">
			회원님이 클릭하신 방의 <span class="mm">모집정보</span>입니다!
		</p>
		<hr>
 	
		<div class="sub_title">
			<div class="sub01">
				<span>개설자 연령대 : </span> <span>&nbsp;20대</span>
			</div> 
			<div class="sub02">
				<span>개설자 출석점수 : </span> <span>&nbsp;출석왕★</span>
			</div> 
			<div class="sub03">
					<span>개설자 매너점수 : </span>
				<!-- <div class="bar"></div> -->
				<span>&nbsp;보통</span>
			</div>
		</div>
		<!-- sub_title -->
		<br> 
    
    		<!--
    			SELECT RESTNAME, REGION, FOODCTG, AGEGROUP, GENDER, MAINMENU, MENUPRICE, VISITDATE, DEADLINE,
    			PARTYMEMBERCOUNT, NOP, PARTYMASTER, ATTENDSCORE, ISCLOSED, OPENKEYWORD
    			FROM MM_LIST_VIEW
    		-->
    
    	<div>
    		<label for="validationDefault01" class="form-label">방문예정 일시</label>
    			<input type="text" readonly class="mm-input form-control form-control-date" value="${dto[0].VISITDATE}">
    	</div>
    	<br>
    	<div> 
    		<label for="validationDefault01" class="form-label">자동마감 일시</label>
    			<input type="text" class="mm-input form-control" readonly value="${dto[0].DEADLINE}">
    	</div>
    	<br>
    	<div>
    		<label for="validationDefault01" class="form-label">방문예정 지역</label>
    			<input type="text" class="mm-input form-control" readonly value="${dto[0].REGION}">
    	</div>
    	<br>
    	<div>
    		<label for="validationDefault01" class="form-label">방문예정 식당</label>
    			<input type="text" class="mm-input form-control" readonly value="${dto[0].RESTNAME}">
    	</div>
    	<br>
    	<div>
    		<label for="validationDefault04" class="form-label">모집 희망 성별</label>
    			<input type="text" class="mm-input form-control" readonly value="${dto[0].GENDER}">
    	</div>
    	<br>
    	<div>
    		<label for="validationDefault04" class="form-label">모집 희망 연령대</label>
    			<input type="text" class="mm-input form-control" readonly value="${dto[0].AGEGROUP}">
    	</div>
    	<br>
        <div>
        	<label for="validationDefault04" class="form-label">참가 인원</label>
        		<input type="text" class="mm-input form-control" readonly value="${dto[0].PARTYMEMBERCOUNT}">
        </div>
        <br>
        <div>
        	<label for="validationDefault04" class="form-label">음식 종류</label>
        		<input type="text" class="mm-input form-control" readonly value="${dto[0].FOODCTG}">
        </div>
        <br>
        <div>
        	<label for="validationDefault01" class="form-label">메인 메뉴명</label>
        		<input type="text" class="mm-input form-control" readonly value="${dto[0].MAINMENU}">
        </div>
        <br>
        <div>
        	<label for="validationDefault01" class="form-label">메인 메뉴 가격</label>
        		<input type="text" class="mm-input form-control" id="mainMenuPrice" onkeyup="perPriceCal()" readonly value="${dto[0].MENUPRICE}원">
        </div>
        <br>
        <div>
        	<label for="validationDefault01" class="form-label">모집 인원수(본인포함)</label>
        		<input type="text" class="mm-input form-control" id="peopleCount" onkeyup="perPriceCal()" readonly value="${dto[0].NOP}명">
        </div>
        <br>
        <div>
        	<label for="validationDefault01" class="form-label">인당 예상 가격</label>
        		<input type="text" class="mm-input form-control" id="perPrice" readonly="readonly"  value="">
        </div>
        <br>
        <div>
        	<span>개설 키워드(최대 3개) </span>
       		<ul>
       			<c:forEach var="tag" items="${tagList }">
       				<li><span>#</span>${tag }</li>
       			</c:forEach>
       		</ul>
       		<hr>
        </div>
        <br>
    </div>
    <!-- </section> -->
    
    </div>
	<!-- </end openBox> -->
    
    <!-- openCode 를 자바컨트롤러에 보내기 위해 form 태그로 감싸둠 -->
    <form id="mmApplyform">
    	<input type="text" style="display:none;" name="openCode" value="<%=openCode%>">
    </form>
    
    <div class="button_box">
    	<button id="mm_open" type="button" class="btn btn-warning mm-btn" opCtn="지원이 완료되었습니다." opBtn="메인페이지로 돌아갑니다." opBtnHref="mainPage.kkini">지원하기</button>
    	<button id="cancel" type="button" class="btn btn-dark mm-btn" opCtn="취소되었습니다." opBtn="메인페이지로 돌아갑니다." opBtnHref="mainPage.kkini" data-bs-toggle="modal" data-bs-target="#oneBtnPopup" onclick="oneBtnPopOpen('#cancel') ">취소</button>
    </div>  
    
    <!-- 
    	opCtn 에는 팝업에 들어갈 내용을 적고 opBtn에는 팝업의 버튼에 들어갈 내용을 적는다. 
    	opBtnHref 에는 버튼 클릭 시 이동하고자 하는 페이지의 주소를 적는다. 
    	data-bs-toggle, data-bs-target 은 부트스트랩의 attribute 이고 
    	data-bs-target 는 열릴 팝업의 아이디를 적으면 된다.  
    	onclick의 oneBtnPopOpen함수의 매개변수에는 현재 버튼의 id를 입력해주면 된다.
    -->
    
    <jsp:include page="oneButtonPopup.html"></jsp:include> 

</body> 
 
</html>