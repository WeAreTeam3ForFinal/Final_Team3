<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="ThemesLay">
<title>RoundTours - Tours and Travel Landing Page</title>
<!-- js file -->
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 데이트 피커 -->
<link rel="stylesheet" type="text/css" href="datetimepicker/jquery.datetimepicker.css">
<script src="datetimepicker/jquery.js"></script>
<script src="datetimepicker/build/jquery.datetimepicker.full.min.js"></script>
<!-- Open CSS -->
<link rel="stylesheet" type="text/css" href="assets/css/open.css">
<!--카카오맵 API APP KEY  -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=73ce8ac5774ecbf47e6474dc618e62f2"></script>

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

/* 리스트 위에 가면 마우스 포인터 모양 변경 */
/* .selectInfo {
	cursor:pointer;
} */
</style>

<script type="text/javascript">

/*개설키워드 js */
document.addEventListener('DOMContentLoaded',function() {
	//sessionStorage.setItem('userCode', 'UC00000001'); // 세션에 로그인된 userCode 임의로 입력(더미 데이터)
	$("#userCode").val(sessionStorage.getItem('userCode'));	// 세션에 저장된 userCode 가져오기
    let itemList = [];
    let addBtn = document.querySelector('.add_btn');

    addBtn.addEventListener('click',addList);

    function addList() {
        let item = document.querySelector('.item');

        if(item.value !=null) {
            itemList.push(item.value);
            item.value='';
            item.focus;
        }
        showList();
    }

    function showList() {
        let list = '<ul>';
            for(let i=0;i<itemList.length;i++) {
                list += '<li>' + itemList[i] + '<span class="close" id=' + '>X</span></li>';
            }
            list += '</ul>';
            document.querySelector('.item_list').innerHTML = list;
            let remove = document.querySelectorAll('.close');
			
            $("#keyWord").val(itemList.join(","));
            for(let i=0;i<remove.length;i++) {
                remove[i].addEventListener('click',removeList);
            }
    }

    function removeList() {
        let id = this.getAttribute('id');
        itemList.splice(id,1);
        showList();
    }
});
/*개설키워드 js 끝*/


<!-- 데이트피커 js -->
$(function() {
	$.datetimepicker.setLocale('ko');
    $("#datetime").datetimepicker(
    		{
    			format:'Y-m-d H:i',
    			lang: 'ko',
    			 allowTimes:[
    				 '24:30','01:00', '01:30', '02:00', '02:30', '03:00', '03:30', '04:00', '04:30', '05:00', '05:30', '06:00', '06:30', '07:00', '07:30', '08:00', '08:30', '09:00', '09:30', '10:00', '10:30', '11:00',
    				 '11:30', '12:00', '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', '18:00', '18:30', '19:00',
    				 '19:30', '20:00', '20:30', '21:00', '21:30', '22:00', '22:30', '23:00', '24:00'  
    				 ]
    		}); 
           
    /* $(document).on("click", ".selectInfo",function() {
        $(this).next().children('button').click();
      }); */
});
<!-- 데이트피커 js 끝-->

/* 카카오맵 API 팝업창 띄우기 */
 function openPopUp(url, name){

  var options = 'width=500, height=600, top=30, left=30, resizable=no, scrollbars=no, location=no';
  window.open(url, name, options);

}


/* 메인메뉴 가격에 따른 인당예상 가격 자동입력 함수  */
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
	
	
	/* 모집희망 인원수 2인~15인 조건 추가 예정  
	if(peopleCount<2 || peopleCount > 15)
	{
		document.getElementById("peopleCountCheck").style.display = "block";
		return;
	} 
	*/
	
	//숫자 3자리마다 콤마 찍는 정규식  
	let result = perPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	document.getElementById("perPrice").value = result;
}


/* 입력값 유효성 검사  */
function checkUp()
{
    var local = $('#local').val();   
	var restautant = $('#restautant').val();   
	var datetime = $('#datetime').val();   
	var mainMenu = $('#mainMenu').val();   
	var mainMenuPrice = $('#mainMenuPrice').val(); 
	var count = $('#count').val(); 
	
	
	if(datetime==null || datetime =="" || local==null || local =="" || restautant==null || restautant =="" 
		|| mainMenu==null || mainMenu =="" || mainMenuPrice==null || mainMenuPrice =="" || count==null || count =="" )
	{
	    var check = document.getElementById("Check");
        check.style.display = "block";
        return false;
			
	}	
		 
}

/* 버튼 1개인 팝업창 열기(범용)*/
//여기저기 그대로 가져다 쓰기 가능
function oneBtnPopOpen(cond){

let Pcontent = $(cond).attr("opCtn");
let Pbtn = $(cond).attr("opBtn");
let Phref = $(cond).attr("opBtnHref");
Phref = Phref == "" ? "#" : Phref;

$("#onePopContents").html(Pcontent);
$("#onePopBtn").html(Pbtn);
$("#onePopBtn").next().attr("href", Phref);
}

</script>
</head>
<body>
	<c:import url="titleAndSubMenu.jsp"></c:import>

	<div class="title_box">
		<!--부트스트랩 테두리 색상 추가  -->
		<p class="title border border-secondary border border-3 bg-transparent text-dark">메뉴 메이트 개설</p>
	</div>

	<!--부트스트랩 테두리 색상 추가  -->

	<section id="section" class=" border border-secondary border border-3 bg-transparent text-dark">
		<form action="memaopen.kkini" method="post">
			<p class="input01">※는 필수입력 사항입니다.</p>
			<p class="input02">※는 자동입력 사항입니다.</p>


			<!-- 회원가입, 로그인 기능 구현 후 , 추가 구성 예정  -->
			<div class="sub_title">
				<div class="sub01">
					<span class="blue">※</span> <span>개설자 연령대 : </span> <span>&nbsp;20대</span>
				</div>

				<div class="sub02">
					<span class="blue">※</span> <span>개설자 출석점수 : </span> <span>&nbsp;출석왕★</span>
				</div>

				<div class="sub03">
					<span class="blue">※</span> <span>개설자 매너점수 : </span>
					<div class="bar"></div>
					<span>보통</span>
				</div>
			</div>
			<!--sub_title-->
			<br>

			<div class="main row g-2">
				<div class="col-md-6">
					<span class="red">※</span> <label for="validationDefault01" class="form-label">방문예정 일시</label> <input type="text" class="form-control form-control-date" id="datetime" name="mmVisitDate" placeholder="클릭하여 선택해주세요." required>
					<!-- 공백란 경고문구 부분 -->
					<span id="datetimeCheck"></span>
				</div>

				<!--카카오맵 api 기능 구현 후 추가 작업 예정  -->
				<div class="col-md-6">
					<span class="red">※</span> <label for="validationDefault01" class="form-label">방문예정 지역</label> <input type="text" class="form-control" id="local" onclick="openPopUp('kakaomap.kkini','나는카카오맵')" placeholder="방문예정지역을 입력해주세요" required>
					<!-- 공백란 경고문구 부분 -->
					<span id="localCheck"></span>
				</div>


				<div class="col-md-12">
					<span class="red">※</span> <label for="validationDefault01" class="form-label">방문예정 식당</label> <input type="text" class="form-control" id="restautant" value="RESC000001" name="mmRestName" placeholder="식당명을 입력해주세요" required>
					<!-- 공백란 경고문구 부분 -->
					<span id="restCheck"></span>
				</div>

				<div class="col-md-6">
					<span class="red">※</span> <label for="validationDefault04" class="form-label">모집 희망 성별</label> <select class="form-select" id="gender" name="mmGenderCode" required>
						<option selected disabled value="" >==선택==</option>
						<c:forEach var="genderList" items="${genderList }">
							<option value="${genderList.GENDER_CODE}">${genderList.GENDER_CTG}</option>
						</c:forEach>
					</select>
				</div>
				
				<div class=" col-md-6">
					<span class="red">※</span> <label for="validationDefault04" class="form-label">모집 희망 연령대</label> <select class="form-select" id="AgeGroup" name="mmAgeGroupCode" required>
						<option selected disabled value="">==선택==</option>
						<c:forEach var="ageGroupList" items="${ageGroupList }">
							<option value="${ageGroupList.AGE_GROUP_CODE}">${ageGroupList.AGE_GROUP_CASE}</option>
						</c:forEach>
					</select>
				</div>

				<div class=" col-md-6">
					<span class="red">※</span> <label for="validationDefault04" class="form-label">음식 종류</label> <select class="form-select" id="foodCategory" name="mmFoodCtgCode" required>
						<option selected disabled value="">==선택==</option>
						<c:forEach var="foodCtgList" items="${foodCtgList }">
							<option value="${foodCtgList.FOOD_CTG_CODE}">${foodCtgList.FOOD_CASE}</option>
						</c:forEach>
					</select>
				</div>

				<div class="col-md-6">
					<span class="red">※</span> <label for="validationDefault01" class="form-label">메인 메뉴명</label> <input type="text" class="form-control" id="mainMenu" name="mmMenu" placeholder="내용을 입력해주세요" required>
					<!-- 공백란 경고문구 부분 -->
					<span id="menuCheck"></span>
				</div>
				<div class="col-md-4">
					<span class="red">※</span> <label for="validationDefault01" class="form-label">메인 메뉴 가격</label> <input type="text" class="form-control" onkeyup="perPriceCal()" id="mainMenuPrice" name="mmMenuPrice" placeholder="내용을 입력해주세요">(원)
				</div>
				<div class="col-md-4">
					<span class="red">※</span> <label for="validationDefault01" class="form-label">모집 인원수(본인포함)</label> <input type="text" class="form-control" onkeyup="perPriceCal()" id="peopleCount"  name="mmNop" placeholder="내용을 입력해주세요">(명)
					<!-- <span id="peopleCountCheck" style="display: none; font-size: small; color: red; font-weight: bold;">인원수는 2인~15인으로 제한됩니다.</span> -->
				</div>
				<div class="col-md-4">
					<span class="blue">※</span> <label for="validationDefault01" class="form-label">인당 예상 가격</label> <input type="text" class="form-control" readonly="readonly" id="perPrice" placeholder="내용을 입력해주세요">(원)
				</div>
				<br>
				<div class="col-md-12">
					<span class="red">※</span> <span>개설 키워드(최대 3개) : </span>					
						<input type="text" class="form-control item" autofocus>
						<button type="button" class="add_btn">추가</button>					
					<hr>
					<div class="item_list"></div>
				</div>
				<input style="display:none;" type="text" name="mmUserCode" id="userCode" value="${sessionScope.userCode}">
				<input style="display:none;" type="text" name="mmOpenKeyWord" id="keyWord">
				<span id="Check" class="red" style="text-align: center; display: none;">※항목은 필수입력값입니다.</span>
			</div>
			 <div class="button_box">
				<button type="submit"  class="btn btn-warning">개설하기</button>
			</div> 
			<!--main-->
		</form>
	</section>

	<!--  <div class="button_box">
		<button type="submit"  id="openBtn" class="btn btn-warning">개설하기</button>
	</div> 
 -->
	<!-- 	<div class="button_box">
		<button id="mm_open" type="submit" class="btn btn-warning"
			opCtn="개설이 완료되었습니다." opBtn="메인페이지로 돌아갑니다." opBtnHref="MainPage.jsp"
			data-bs-toggle="modal" data-bs-target="#oneBtnPopup"
			onclick="oneBtnPopOpen('#mm_open')">개설하기</button>
		<button id="cancel" type="button" class="btn btn-dark"
			opCtn="취소되었습니다." opBtn="메인페이지로 돌아갑니다." opBtnHref="MainPage.jsp"
			data-bs-toggle="modal" data-bs-target="#oneBtnPopup"
			onclick="oneBtnPopOpen('#cancel') ">취소</button>
	</div> -->

	<!--
    opCtn 에는 팝업에 들어갈 내용을 적고 opBtn에는 팝업의 버튼에 들어갈 내용을 적는다.
    opBtnHref 에는 버튼 클릭 시 이동하고자 하는 페이지의 주소를 적는다.
    data-bs-toggle, data-bs-target 은 부트스트랩의 attribute 이고
    data-bs-target 는 열릴 팝업의 아이디를 적으면 된다. 
    onclick의 oneBtnPopOpen함수의 매개변수에는 현재 버튼의 id를 입력해주면 된다.
-->

				<!-- 메인에서 메메리스트 만들 때, foreach문 안에 들어갈 리스트 형식 (유지 바람) -->
					<!-- <div class="col-12 col-md-6 col-lg-3 h-50 mb-4 mb-lg-3 me-3 border border-warning" style="width: 280px;">
	                	div 스타일 속성 추가. div영역 넘어가는 해시태그 ... 처리
						<div style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;" class="selectInfo">
							<p id="club-list-title" class="text-center fw-bold h4 mt-4">11</p>
							<div class="border"></div>
							<i class="bi bi-geo-alt-fill ms-3 me-3"></i><span id="club-list-region">22</span><br>
							<i class="bi bi-heart-fill ms-3 me-3"></i><span id="club-list-foodCtg">33</span><br>
							<i class="bi bi-people-fill ms-3 me-3"></i><span id="club-list-memberCount">44</span><br>
							<div class="border"></div>
							<i class="bi bi-tag-fill ms-3 me-3"></i><span id="club-list-tags" class="text-muted">55</span>
						</div>
						<form action="getMemaApplyInfo.kkini" method="post">
							<input type="text" style="display:none;" name="mm_open_code" value="MOC0000030"> value에는 각각의 개설코드 들어가야함 
							<button type="submit" style="display:none;"></button>
						</form>                	
	                </div> -->
</body>
<body>
	<jsp:include page="oneButtonPopup.html"></jsp:include>

</body>

</html>