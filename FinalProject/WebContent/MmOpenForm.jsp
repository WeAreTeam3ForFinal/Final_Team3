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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
<!-- 데이트 피커 -->
<link rel="stylesheet" type="text/css"
	href="datetimepicker/jquery.datetimepicker.css">
<script src="datetimepicker/jquery.js"></script>
<script src="datetimepicker/build/jquery.datetimepicker.full.min.js"></script>
<!-- Open CSS -->
<link rel="stylesheet" type="text/css" href="assets/css/open.css">
<!--카카오맵 API APP KEY  -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=73ce8ac5774ecbf47e6474dc618e62f2"></script>

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
</style>

<script type="text/javascript">

/*개설키워드 js */
document.addEventListener('DOMContentLoaded',()=>{
    let itemList = []
    let addBtn = document.querySelector('.add_btn')

    addBtn.addEventListener('click',addList)

    function addList() {
        let item = document.querySelector('.item')

        if(item.value !=null) {
            itemList.push(item.value)
            item.value=''
            item.focus
        }
        showList()
    }

    function showList() {
        let list = '<ul>'
            for(let i=0;i<itemList.length;i++) {
                list += '<li>' + itemList[i] + '<span class="close" id=' + '>X</span></li>'
            }
            list += '</ul>'
            document.querySelector('.item_list').innerHTML = list
            let remove = document.querySelectorAll('.close')

            for(let i=0;i<remove.length;i++) {
                remove[i].addEventListener('click',removeList)
            }
    }

    function removeList() {
        let id = this.getAttribute('id')
        itemList.splice(id,1)
        showList()
    }
})
/*개설키워드 js 끝*/


<!--데이트피커 js -->
$(document).ready(function () {
	$.datetimepicker.setLocale('ko');
           $("#datetime").datetimepicker(
           		{
           			format:'Y.m.d H:i',
           			lang: 'ko',
           			 allowTimes:[
           				 '24:30','01:00', '01:30', '02:00', '02:30', '03:00', '03:30', '04:00', '04:30', '05:00', '05:30', '06:00', '06:30', '07:00', '07:30', '08:00', '08:30', '09:00', '09:30', '10:00', '10:30', '11:00',
           				 '11:30', '12:00', '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', '18:00', '18:30', '19:00',
           				 '19:30', '20:00', '20:30', '21:00', '21:30', '22:00', '22:30', '23:00', '24:00'  
           				 ]
           		});          
});
<!--데이트피커 js 끝-->

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
	
	
   if(local==null || local =="")
	{
		//alert("방문지역을 입력해주세요.");
		$('#localCheck').html('[방문예정지역은 필수값입니다.]');
		$('#local').focus();
		return false;
	}

   if(restautant==null || restautant =="")
	{
		$('#restCheck').html('[방문예정식당은 필수값입니다.]');
		$('#restautant').focus();
		return false;
	}

	if(datetime==null || datetime =="")
	{
		$('#datetimeCheck').html('[방문예정일시를 선택해주세요.]')
		$('#datetime').focus();
		return false;
	}

	if(mainMenu==null || mainMenu =="")
	{
		$('#menuCheck').html('[메인메뉴명은 필수값입니다.]');
		$('#mainMenu').focus();
		return false;
	}

	if(mainMenuPrice==null || mainMenuPrice =="")
	{
		$('#menuPriceCheck').html('[메인메뉴가격은 필수값입니다.]');
		$('#mainMenuPrice').focus();
		return false;
	}

	if(count==null || count =="")
	{
		$('#countCheck').html('[모집희망인원수은 필수값입니다.]');
		$('#count').focus();
		return false;
	} 
	
	 
}

/* 버튼 1개인 팝업창 열기(범용)*/
//여기저기 그대로 가져다 쓰기 가능
function oneBtnPopOpen(cond){
	
 	/* var local = $('#local').val();   
	var restautant = $('#restautant').val();   
	var datetime = $('#datetime').val();   
	var mainMenu = $('#mainMenu').val();   
	var mainMenuPrice = $('#mainMenuPrice').val(); 
	var count = $('#count').val(); 
	
	
   if(local==null || local =="")
	{
		//alert("방문지역을 입력해주세요.");
		$('#localCheck').html('[방문예정지역은 필수값입니다.]');
		$('#local').focus();
		return false;
	}

   if(restautant==null || restautant =="")
	{
		$('#restCheck').html('[방문예정식당은 필수값입니다.]');
		$('#restautant').focus();
		return false;
	}

	if(datetime==null || datetime =="")
	{
		$('#datetimeCheck').html('[방문예정일시를 선택해주세요.]')
		$('#datetime').focus();
		return false;
	}

	if(mainMenu==null || mainMenu =="")
	{
		$('#menuCheck').html('[메인메뉴명은 필수값입니다.]');
		$('#mainMenu').focus();
		return false;
	}

	if(mainMenuPrice==null || mainMenuPrice =="")
	{
		$('#menuPriceCheck').html('[메인메뉴가격은 필수값입니다.]');
		$('#mainMenuPrice').focus();
		return false;
	}

	if(count==null || count =="")
	{
		$('#countCheck').html('[모집희망인원수은 필수값입니다.]');
		$('#count').focus();
		return false;
	} 
	
	 */
	
	
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
		<p
			class="title border border-secondary border border-3 bg-transparent text-dark">메뉴
			메이트 개설</p>
	</div>

	<!--부트스트랩 테두리 색상 추가  -->

	<section id="section"
		class=" border border-secondary border border-3 bg-transparent text-dark">
		<form action="memaopen.action" method="post">
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
					<span class="red">※</span> <label for="validationDefault01"
						class="form-label">방문예정 일자</label> <input type="text"
						class="form-control form-control-date" id="datetime"
						placeholder="클릭하여 선택해주세요." required>
					<!-- 공백란 경고문구 부분 -->
					<span id="datetimeCheck"></span>
				</div>
				
				<!--카카오맵 api 기능 구현 후 추가 작업 예정  -->
				<div class="col-md-6">
					<span class="red">※</span> <label for="validationDefault01"
						class="form-label">방문예정 지역</label> <input type="text"
						class="form-control" id="local"
						onclick="openPopUp('/FinalProject/kakaomap.jsp','나는카카오맵')"
						placeholder="내용을 입력해주세요" required>
					<!-- 공백란 경고문구 부분 -->
					<span id="localCheck"></span>
				</div>
				
				
				<div class="col-md-12">
					<span class="red">※</span> <label for="validationDefault01"
						class="form-label">방문예정 식당</label> <input type="text"
						class="form-control" id="restautant" placeholder="내용을 입력해주세요"
						required>
					<!-- 공백란 경고문구 부분 -->
					<span id="restCheck"></span>
				</div>
				
				<div class="col-md-4">
					<span class="red">※</span> <label for="validationDefault04"
						class="form-label">모집 희망 성별</label> <select class="form-select"
						id="gender" required>
						<option selected disabled value="">==선택==</option>
						<option value="GC00000001">무관</option>
						<option value="GC00000002">여자</option>
						<option value="GC00000003">남자</option>
					</select>
				</div>
				<div class=" col-md-4">
					<span class="red">※</span> <label for="validationDefault04"
						class="form-label">모집 희망 연령대</label> <select class="form-select"
						id="AgeGroup1" required>
						<option selected disabled value="">==선택==</option>
						<option value="무관">무관</option>
						<option value="10대">10대</option>
						<option value="20대">20대</option>
						<option value="30대">30대</option>
						<option value="40대">40대</option>
						<option value="50대">50대</option>
						<option value="60대">60대</option>
					</select>
				</div>
				<!--  초중후반 셀렉트 박스 추가 -->
				<div class=" col-md-4">
					<label for="validationDefault04" class="form-label">모집 희망
						연령대</label> <select class="form-select" id="AgeGroup2">
						<option selected disabled value="">==선택==</option>
						<option value="초반">초반(ex.20세~23세)</option>
						<option value="중반">중반(ex.24세~26세)</option>
						<option value="후반">후반(ex.27세~29세)</option>
					</select>
				</div>

				<div class=" col-md-6">
					<span class="red">※</span> <label for="validationDefault04"
						class="form-label">음식 종류</label> <select class="form-select"
						id="foodCategory" required>
						<option selected disabled value="">==선택==</option>
						<option value="FCC0000002">한식</option>
						<option value="FCC0000004">일식</option>
						<option value="FCC0000005">중식</option>
						<option value="FCC0000003">양식</option>
						<option value="FCC0000006">아시아</option>
						<option value="FCC0000007">커피 / 디저트</option>
						<option value="FCC0000008">기타</option>
					</select>
				</div>

				<div class="col-md-6">
					<span class="red">※</span> <label for="validationDefault01"
						class="form-label">메인 메뉴명</label> <input type="text"
						class="form-control" id="mainMenu" placeholder="내용을 입력해주세요"
						required>
					<!-- 공백란 경고문구 부분 -->
					<span id="menuCheck"></span>
				</div>
				<div class="col-md-4">
					<span class="red">※</span> <label for="validationDefault01"
						class="form-label">메인 메뉴 가격</label> <input type="text"
						class="form-control" onkeyup="perPriceCal()" id="mainMenuPrice"
						placeholder="내용을 입력해주세요">(원)
					<!-- <span class="red">※</span> <span>메인 메뉴 가격 : </span> <input type="text" onkeyup="perPriceCal()" id="mainMenuPrice" placeholder="내용을 입력해주세요">(원) <br> <span id="menuPriceCheck"></span> -->
				</div>
				<div class="col-md-4">
					<span class="red">※</span> <label for="validationDefault01"
						class="form-label">모집 인원수(본인포함)</label> <input type="text"
						class="form-control" onkeyup="perPriceCal()" id="peopleCount"
						placeholder="내용을 입력해주세요">(명)
					<!-- <span id="peopleCountCheck" style="display: none; font-size: small; color: red; font-weight: bold;">인원수는 2인~15인으로 제한됩니다.</span> -->
				</div>
				<div class="col-md-4">
					<span class="blue">※</span> <label for="validationDefault01"
						class="form-label">인당 예상 가격</label> <input type="text"
						class="form-control" readonly="readonly" id="perPrice"
						placeholder="내용을 입력해주세요">(원)
				</div>
				<br>
				<div class="col-md-12">
					<span class="red">※</span> <span>개설 키워드(최대 3개) : </span>
					<form action="">
						<input type="text" class="form-control item" autofocus>
						<button type="button" class="add_btn">추가</button>
					</form>
					<hr>
					<div class="item_list"></div>
				</div>
			</div>
			<!--main-->
		</form>
	</section>

	  <div class="button_box">
        <button  type="submit" onclick="checkUp()" id="openBtn" class="btn btn-warning">개설하기</button>
     </div> 


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
</body>
<body>
	<jsp:include page="oneButtonPopup.html"></jsp:include>

</body>
</body>
</html>