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
<title>MenuMate Apply</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="80x80" href="assets/images/favicon.png">
<!-- Main CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<link href="./assets/css/main.css" rel="stylesheet">
<!-- js file -->
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 데이트 피커 -->
<link rel="stylesheet" type="text/css" href="datetimepicker/jquery.datetimepicker.css">
<script src="datetimepicker/jquery.js"></script>
<script src="datetimepicker/build/jquery.datetimepicker.full.min.js"></script>
<!-- Open CSS -->
<link rel="stylesheet" type="text/css" href="assets/css/open.css">

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

/*좌측 드롭다운 부분 js */
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
/*좌측 드롭다운 부분 js 끝*/


<!--데이트피커 js 추가부분-->
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
<body>
   <!-- 좌측 드롭다운 4 개 추가-->
   <div class="box01">
      <div class="dropdown">
         <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #ffe4b5;">내 동아리</button>
         <ul class="dropdown-menu dropdown3" aria-labelledby="dropdownMenuButton1">
            <li><a class="dropdown-item" href="#" style="font-size: small;">고만 먹자(고기만 먹자..)</a></li>
            <li><a class="dropdown-item" hreFf="#" style="font-size: small;">안 고독한 사람들</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#" style="font-size: small;">한국의 고독한 미식가</a></li>
         </ul>
      </div>
   </div>
   <div class="box02">
      <div class="dropdown">
         <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #ffe4b5;">나의 개설</button>
         <ul class="dropdown-menu dropdown5" aria-labelledby="dropdownMenuButton2" style="max-width: 190px; max-height: 155px;">
            <li><a class="dropdown-item" href="#" style="font-size: small;">[메메][창고43] 12/13 마감 2시간 전</a></li>
            <li><a class="dropdown-item" href="#" style="font-size: small;">[끼메][오목집] 1/5 마감 7시간 전</a></li>
            <li><a class="dropdown-item" href="#" style="font-size: small;">[끼메][오목집] 1/5 마감 7시간 전</a></li>
            <li><a class="dropdown-item" href="#" style="font-size: small;">[끼메][오목집] 1/5 마감 7시간 전</a></li>
            <li><a class="dropdown-item" href="#" style="font-size: small;">[끼메][오목집] 1/5 마감 7시간 전</a></li>
            <li><a class="dropdown-item" href="#" style="font-size: small;">[끼메][오목집] 1/5 마감 7시간 전</a></li>
         </ul>
      </div>
   </div>
   <div class="box03">
      <div class="dropdown">
         <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton3" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #ffe4b5;">식당 방문 대기 목록</button>
         <ul class="dropdown-menu dropdown5" aria-labelledby="dropdownMenuButton3" style="max-width: 190px; max-height: 155px;">
            <li><a class="dropdown-item" href="#" style="font-size: small;">[확정] [22/12/24 16:00] 음음</a></li>
            <li><a class="dropdown-item" href="#" style="font-size: small;">[확정] [22/12/25 18:00] 아웃백</a></li>
            <li><a class="dropdown-item" href="#" style="font-size: small;">[확정] [22/12/25 18:00] 아웃백</a></li>
            <li><a class="dropdown-item" href="#" style="font-size: small;">[확정] [22/12/25 18:00] 아웃백</a></li>
            <li><a class="dropdown-item" href="#" style="font-size: small;">[확정] [22/12/25 18:00] 아웃백</a></li>
            <li><a class="dropdown-item" href="#" style="font-size: small;">[확정] [22/12/25 18:00] 아웃백</a></li>
         </ul>
      </div>
   </div>
   <div class="box04">
      <div class="dropdown">
         <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton4" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #ffe4b5;">지원 수락 대기중</button>
         <ul class="dropdown-menu dropdown5" aria-labelledby="dropdownMenuButton4" style="max-width: 190px; max-height: 155px;">
            <li><a class="dropdown-item" href="#" style="font-size: small;">[X] [22/12/27 18:00] 해운대암소갈비</a></li>
            <li><a class="dropdown-item" href="#" style="font-size: small;">[△] [22/12/31 18:00]링링</a></li>
            <li><a class="dropdown-item" href="#" style="font-size: small;">[△] [22/12/31 18:00]링링</a></li>
            <li><a class="dropdown-item" href="#" style="font-size: small;">[△] [22/12/31 18:00]링링</a></li>
            <li><a class="dropdown-item" href="#" style="font-size: small;">[△] [22/12/31 18:00]링링</a></li>
            <li><a class="dropdown-item" href="#" style="font-size: small;">[△] [22/12/31 18:00]링링</a></li>
         </ul>
      </div>
   </div>


   <div class="pagewrap">
      <div class="head-wrapper">
         <!-- header section -->
         <header class="header theme-bg-white">

            <!-- 상단 좌측 로고 클래스 추가 생성 -->
            <div class="container headerMargin">

               <nav class="navbar navbar-expand-lg py-0 px-0">
                  <a class="navbar-brand" href="MainPage.jsp"><img src="assets/images/logo1.png" alt="Brand Logo" title="Brand Logo" class="img-fluid"></a>
                  <button class="navbar-toggler px-1 btn rounded-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                     <span class="navbar-toggler-icon"></span>
                  </button>
                  <!-- 사이트 최상단 메뉴영역 부분 -->
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                     <!-- style 속성 추가 -->
                     <!-- 상단 회원로고 우측으로 보내기 위한 margin-left 1100으로 조정 -->
                     <ul class="navbar-nav page-menu mb-3 mb-lg-0" style="margin-left: 1100px;">
                        <!-- user account  -->
                        <li class="nasv-item mx-4"><a href="#" class="nav-link d-inline-block position-relative"> <i class="bi bi-bell"></i> <span class="position-absolute translate-middle p-1 bg-success border border-light rounded-circle"> <span class="visually-hidden">New alerts</span>
                           </span>
                        </a></li>
                        <!-- user account  -->
                        <li class="nav-item dropdown my-auto"><a href="#" class="nav-link dropdown-toggle p-0 user" id="navbarDropdown3" data-bs-toggle="dropdown" aria-expanded="false"> <!-- 오렌지색 색깔 변경 --> <span class="d-inline-block p-2 theme-bg-primary rounded-circle lh-1" style="background-color: #FFA500;"><i class="bi bi-person"></i></span></a>
                           <ul class="dropdown-menu dropdown-menu-end sub-menu" aria-labelledby="navbarDropdown3">
                              <li><a class="dropdown-item" href="#">로그인</a></li>
                              <li><a class="dropdown-item" href="#">회원가입</a></li>
                           </ul></li>
                     </ul>
                  </div>
                  <button type="button" class="btn btn-warning btn-sm" onclick="location.href='MyPage.html'" style="float: right;">나의이력</button>
               </nav>
            </div>

         </header>
      </div>
   </div>

      <div class="title_box">
         <!--부트스트랩 테두리 색상 추가  -->
         <p class="title border border-secondary border border-3 bg-transparent text-dark">메뉴 메이트 지원</p>
      </div>

      <!--부트스트랩 테두리 색상 추가  -->
      <form action="memaopen.action" method="post">
      <section id="section" class=" border border-secondary border border-3 bg-transparent text-dark">

    
         <div class="sub_title">

            <div class="sub01">
                <span>개설자 연령대 : </span> <span>&nbsp;20대</span>
            </div>

            <div class="sub02">
                <span>개설자 출석점수 : </span> <span>&nbsp;출석왕★</span>
            </div>

            <div class="sub03">
                <span>개설자 매너점수 : </span>
               <div class="bar"></div>
               <span>보통</span>
            </div>

         </div>
         <!--sub_title-->
         <br>

         <div class="main row g-2">
               <div class="col-md-6">
                   
                   <label for="validationDefault01" class="form-label">방문예정 일자</label>
                    <input type="text" value="2023.01.31" readonly class="form-control form-control-date" required><!--  id="datetime" --> 
                  <!-- 공백란 경고문구 부분 -->
                 <!--  <span id="datetimeCheck"></span>  -->
               </div>
               <div class="col-md-6">
                  
                    <label for="validationDefault01" class="form-label">방문예정 지역</label>
                    <input type="text" class="form-control" id="local" value="서울시 마포구" readonly required>
                  <!-- 공백란 경고문구 부분 -->
                  <span id="localCheck"></span>
               </div>
               <div class="col-md-12">
                 
                   <label for="validationDefault01" class="form-label">방문예정 식당</label>
                    <input type="text" value="링링" class="form-control" id="restautant" readonly required>
                  <!-- 공백란 경고문구 부분 -->
                  <span id="restCheck"></span> 
               </div>
                   <div class="col-md-4">
                   
                      <label for="validationDefault04" class="form-label">모집 희망 성별</label>
                      <select class="form-select" id="gender"  required>
                        <option selected disabled value="" >무관</option>
                        
                      </select>
                    </div>
                <div class=" col-md-4">
               
                      <label for="validationDefault04" class="form-label">모집 희망 연령대</label>
                      <select class="form-select" id="AgeGroup1" required>
                        <option selected disabled value="">20대</option>
                         
                        
                      </select>
                      </div>
                     <!--  초중후반 셀렉트 박스 추가 -->
                     <div class=" col-md-4">
                     <label for="validationDefault04" class="form-label">모집 희망 연령대</label>
                     <select class="form-select" id="AgeGroup2">
                     <option selected disabled value="">중반</option>
                     
                  </select>
                    </div>

            <div class=" col-md-6">
             
                   <label for="validationDefault04" class="form-label">음식 종류</label>
                      <select class="form-select" id="foodCategory" required>
                        <option selected disabled value="">일식</option>
                       
                      </select>
               </div>
               
               <div class="col-md-6">
               
                    <label for="validationDefault01" class="form-label">메인 메뉴명</label>
                    <input type="text" class="form-control" id="mainMenu" value="스시" readonly required>
                  <!-- 공백란 경고문구 부분 -->
                  <span id="menuCheck"></span>
               </div>
               <div class="col-md-4">
              
                    <label for="validationDefault01" class="form-label">메인 메뉴 가격</label>
                    <input type="text" class="form-control" onkeyup="perPriceCal()" id="mainMenuPrice" value="100000" readonly>(원)
                  <!-- <span class="red">※</span> <span>메인 메뉴 가격 : </span> <input type="text" onkeyup="perPriceCal()" id="mainMenuPrice" placeholder="내용을 입력해주세요">(원) <br> <span id="menuPriceCheck"></span> -->
               </div>
               <div class="col-md-4">
                  
                   <label for="validationDefault01" class="form-label">모집 인원수(본인포함)</label>
                    <input type="text" class="form-control" onkeyup="perPriceCal()" id="peopleCount" value="2" readonly>(명)
                  <!-- <span id="peopleCountCheck" style="display: none; font-size: small; color: red; font-weight: bold;">인원수는 2인~15인으로 제한됩니다.</span> --> 
               </div>
               <div class="col-md-4">
            
                   <label for="validationDefault01" class="form-label">인당 예상 가격</label>
                    <input type="text" class="form-control" readonly="readonly"  id="perPrice" value="50000">(원)
               </div>
               <br>
               <div class="col-md-12">
                 <span>개설 키워드(최대 3개) : </span>
                  <form action="">
                      <input type="text" class="form-control item" readonly value="#스시 #일식">
                     <!-- <button type="button" class="add_btn">추가</button> -->
                  </form>
                  <hr>
                  <div class="item_list"></div>
               </div>
               <!--container-->
               <!--main_right-->
               <br>
            </div>
      </div><!--main-->
      </section>

      <!--  <div class="button_box">
        <button  id="openBtn" class="btn btn-warning">개설하기</button>
     </div> -->


      <div class="button_box">
         <button id="mm_open" type="submit" class="btn btn-warning" opCtn="지원이 완료되었습니다." opBtn="메인페이지로 돌아갑니다." opBtnHref="MainPage.jsp" data-bs-toggle="modal" data-bs-target="#oneBtnPopup" onclick="oneBtnPopOpen('#mm_open')">지원하기</button>
         <button id="cancel" type="button" class="btn btn-dark" opCtn="취소되었습니다." opBtn="메인페이지로 돌아갑니다." opBtnHref="MainPage.jsp" data-bs-toggle="modal" data-bs-target="#oneBtnPopup" onclick="oneBtnPopOpen('#cancel') ">취소</button>
      </div>
   </form>
   <!--
    opCtn 에는 팝업에 들어갈 내용을 적고 opBtn에는 팝업의 버튼에 들어갈 내용을 적는다.
    opBtnHref 에는 버튼 클릭 시 이동하고자 하는 페이지의 주소를 적는다.
    data-bs-toggle, data-bs-target 은 부트스트랩의 attribute 이고
    data-bs-target 는 열릴 팝업의 아이디를 적으면 된다. 
    onclick의 oneBtnPopOpen함수의 매개변수에는 현재 버튼의 id를 입력해주면 된다.
-->
<body>
   <jsp:include page="oneButtonPopup.html"></jsp:include>
</body>
</body>
</html>