<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="ThemesLay">
    <title>RoundTours - Tours and Travel Landing Page</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="80x80" href="assets/images/favicon.png">
    <!-- Main CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <link href="./assets/css/main.css" rel="stylesheet">
    <!-- js file -->
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <!-- 데이트 피커 -->
    <link rel="stylesheet" type="text/css" href="datetimepicker/jquery.datetimepicker.css">
	<script src="datetimepicker/jquery.js"></script>
	<script src="datetimepicker/build/jquery.datetimepicker.full.min.js"></script>
    <script>
        // Scroll Top 
        $(document).ready(function () {
            var ScrollTop = $(".scrollToTop");
            $(window).on('scroll', function () {
                if ($(this).scrollTop() < 500) {
                    ScrollTop.removeClass("active");
                } else {
                    ScrollTop.addClass("active");
                }
            });
            
            $('.scrollToTop').on('click', function () {
                $('html, body').animate({
                    scrollTop: 0
                }, 500);
                return false;
            });
            
            $("#searchMema").click(function() 
            {
            	var address = "index3.html?keyword="+$("#keyword").val();
           		$("#searchForm").attr("action", address);
            	alert($("#searchForm").attr("action"));
            	$("#searchForm").submit();
         	});
            
            $.datetimepicker.setLocale('ko');
            
            $("#datetime-start").datetimepicker(
            		{
            			format:'Y.m.d H:i',
            			lang: 'ko',
            			 allowTimes:[
            				 '24:30','01:00', '01:30', '02:00', '02:30', '03:00', '03:30', '04:00', '04:30', '05:00', '05:30', '06:00', '06:30', '07:00', '07:30', '08:00', '08:30', '09:00', '09:30', '10:00', '10:30', '11:00',
            				 '11:30', '12:00', '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', '18:00', '18:30', '19:00',
            				 '19:30', '20:00', '20:30', '21:00', '21:30', '22:00', '22:30', '23:00', '24:00'  
            				 ]
            		});
            
            $("#datetime-end").datetimepicker(
            		{
            			format:'Y.m.d H:i',
            			lang: 'ko',
            			 allowTimes:[
            				 '24:30','01:00', '01:30', '02:00', '02:30', '03:00', '03:30', '04:00', '04:30', '05:00', '05:30', '06:00', '06:30', '07:00', '07:30', '08:00', '08:30', '09:00', '09:30', '10:00', '10:30', '11:00',
            				 '11:30', '12:00', '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', '18:00', '18:30', '19:00',
            				 '19:30', '20:00', '20:30', '21:00', '21:30', '22:00', '22:30', '23:00', '24:00'  
            				 ]
            		});
            
            
            // 동아리 리스트 출력 Ajax 구문
            /*
            $("#club-tab").click(function()
			{
				// alert($("#club-tab").attr("id"));
				var id = $("#club-tab").attr("id");
				// alert(id);
				var param = "id=" + id;
				
				$.ajax(
				{
					type : "POST"
					, url : "ClubListAjax.kkini"
					, data : param
					, success : function(args)
					{
						$("#resultDiv").html(args);
					}
					, beforesend : showRequest
					, error : function(e)
					{
						alert(e.responseText);
					}
				});
			});
            
            function showRequest()
			{
				alert("현재 선택된 탭은 동아리탭 입니다.");
			}
            */
            
            $("#club-tab").click(function()
			{
				$("#tab-form").attr("action","clubList.kkini");
				$("#tab-form").submit();
			});
            
        });
    </script>
</head>

<body>
    <!-- page content area 테스트-->
    <div class="box01">
       <div class="dropdown">
        <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton1"
         data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #ffe4b5;">
          내 동아리
        </button>
        <ul class="dropdown-menu dropdown3" aria-labelledby="dropdownMenuButton1">
          <li><a class="dropdown-item" href="#" style="font-size: small;">고만 먹자(고기만 먹자..)</a></li>
          <li><a class="dropdown-item" href="#" style="font-size: small;">안 고독한 사람들</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item" href="#" style="font-size: small;">한국의 고독한 미식가</a></li>
        </ul>
      </div>
   </div>
   <div class="box02">
      <div class="dropdown">
        <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton2"
         data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #ffe4b5;">
          나의 개설
        </button>
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
        <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton3"
         data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #ffe4b5;">
          식당 방문 대기 목록
        </button>
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
        <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton4"
         data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #ffe4b5;">
          지원 수락 대기중
        </button>
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
                        <a class="navbar-brand" href="index3.html"><img src="assets/images/logoo.png" alt="Brand Logo"
                                title="Brand Logo" class="img-fluid"></a>
                        <button class="navbar-toggler px-1 btn rounded-0" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <!-- 사이트 최상단 메뉴영역 부분 -->
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <!-- style 속성 추가 -->
                        <!-- 상단 회원로고 우측으로 보내기 위한 margin-left 1100으로 조정 -->
                            <ul class="navbar-nav page-menu mb-3 mb-lg-0" style="margin-left: 1100px;">
                                <!-- user account  -->
                                <li class="nav-item mx-4">
                                    <a href="#" class="nav-link d-inline-block position-relative">
                                        <i class="bi bi-bell"></i>
                                        <span
                                            class="position-absolute translate-middle p-1 bg-success border border-light rounded-circle">
                                            <span class="visually-hidden">New alerts</span>
                                        </span>
                                    </a>
                                </li>
                                <!-- user account  -->
                                <li class="nav-item dropdown my-auto">
                                    <a href="#" class="nav-link dropdown-toggle p-0 user" id="navbarDropdown3"
                                        data-bs-toggle="dropdown" aria-expanded="false">
                                        <!-- 오렌지색 색깔 변경 -->
                                        <span class="d-inline-block p-2 theme-bg-primary rounded-circle lh-1"  style="background-color: #FFA500;"><i
                                                class="bi bi-person"></i></span></a>
                                    <ul class="dropdown-menu dropdown-menu-end sub-menu"
                                        aria-labelledby="navbarDropdown3">
                                        <li><a class="dropdown-item" href="#">로그인</a></li>
                                        <li><a class="dropdown-item" href="#">회원가입</a>
                                        
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                          <button type="button" class="btn btn-warning btn-sm" onclick="location.href='MyPage.html'" style="float: right;">나의이력</button>
                    </nav>
                </div>
                  <!-- <button type="button" class="btn btn-warning btn-sm" onclick="location.href='MyPage.html'" style="float: right;">나의이력</button> -->
            </header>
            <!-- search engine section-->
            <div class="search-engine">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-lg-12 mb-5 text-center position-relative">
                            <h1 class="display-3 fw-bold mb-4 theme-text-shadow" style="color:#FFA500;">
                                끼리끼니~?
                            </h1>
                            <p class="fw-bold mb-0" style="color:#FFA500;">맛있는 끼니 끼리끼리 먹자!</p>
                        </div>
                    </div>
                    <!-- search engine tabs -->
                    <div class="row mt-0 mt-lg-5"></div>
  
<div class="row mt-0 mt-lg-5">
                        <div class="col-12 col-lg-10 offset-lg-1 mb-5 text-center position-relative">
                            <!-- product main tab list -->
                            <form action="" method="get" id="tab-form">
                            <ul class="nav nav-tabs d-flex justify-content-center border-0 cust-tab" id="myTab"
                                role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="flight-tab" data-bs-toggle="tab"
                                        data-bs-target="#recommend-tab-pane" type="button" role="tab"
                                        aria-controls="recommend-tab-pane" aria-selected="false">추천</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="flight-tab" data-bs-toggle="tab"
                                        data-bs-target="#flight-tab-pane" type="button" role="tab"
                                        aria-controls="flight-tab-pane" aria-selected="true">메뉴메이트</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="hotel-tab" data-bs-toggle="tab"
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
                              <div class="tab-pane fade" id="recommend-tab-pane" role="tabpanel"
									                                    aria-labelledby="recommend-tab" tabindex="0">
                            
                             </div>
                            
                            <!-- 추천 끝 -->
                            
                            
                            <!-- 메뉴메이트 시작-->
                            <div class="tab-pane fade show active" id="flight-tab-pane" role="tabpanel"
									                                    aria-labelledby="flight-tab" tabindex="0">
									                                    
                                            <!-- one way search -->
                                            <div class="row" >
                                                    <form action="Test01.jsp" method="get" > <!-- action 추가 필요  -->
                                                <div class="col-12">
                                                   <div class="search-pan row mx-0 theme-border-radius">
                                                <div class="col-12 col-lg-4 col-xl-4 ps-0 mb-2 mb-xl-4 mt-xl-2 pe-0 pe-lg-2">
                                                    <div class="form-group">
                                                            
                                                            <label for="KeyWord" class="form-label">검색어
                                                            <i class="bi bi-caret-down-fill small"></i>
                                                        </label>
                                                        <!-- 입력창 & 검색어 추천 -->
                                                        <input class="form-control ps-lg-4 mt-xl-3" list="RestaurantRec"
                                                            id="KeyWord" name="KeyWord" style="font-size: 15pt; color: black; font-weight: bold;">
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
                                                        <span class="fw-bold"><i
                                                                class="bi bi-search me-2"></i>Search</span>
                                                    </button>
                                                </div>
                                                <div class="col-xl-4"></div>
                                                <div class="col-xl-1"></div>
                                                <div style="border:1px solid #dddddd; margin-bottom: 15px;"></div>

													<!-- 연령대 select box -->
                                                <div class="col-12 col-lg-4 col-xl-3 ps-1 mb-2 mb-xl-0 pe-0 pe-lg-2">
                                                <div class="form-group">
                                                <label for="Age-boundary" class="form-label" style="text-align: center;">연령대
                                                            <i class="bi bi-caret-down-fill small"></i>
                                                        </label>
                                                <select id="Age-boundary" name="Age-boundary">
                                                 <option>20대</option>
                                                 <option>30대</option>
                                                 <option>40대</option>
                                                 <option></option>
                                                 <option></option>                                                
                                                </select>
                                                <label>초<input name="Age-detail" type="radio" value=""></label>
                                               <label>중<input name="Age-detail" type="radio" value=""></label>
                                               <label>후<input name="Age-detail" type="radio" value=""></label>
                                                </div>
                                                </div>
                                                
                                                <!-- 연령대 select box end -->
                                                
                                                 <!--  성별 select box -->
                                                <div class="col-sm-2 ps-0 mb-2 mb-xl-0 pe-0 pe-lg-2">
                                                <div class="form-group ">
                                                <label for="gender-boundary" class="form-label">성별
                                                            <i class="bi bi-caret-down-fill small"></i>
                                                        </label>
                                                <select id="gender-boundary" name="gender-boundary">
                                                 <option>무관</option>
                                                 <option>남/여</option> <!-- 검색자의 성별 -->
                                                </select>
                                                
                                                </div>
                                                
                                                </div>
                                                
                                                <!-- 성별 select box end -->
                                               
                                                 <!--  음식종류 select box -->
                                                <div class="col-sm-2 ps-0 mb-2 mb-xl-0 pe-0 pe-lg-2">
                                                <div class="form-group">
                                                <label for="food-category" class="form-label">음식 카테고리
                                                            <i class="bi bi-caret-down-fill small"></i>
                                                        </label>
                                                <select id="food-category" name="food-category">
                                                 <option>한식</option>
                                                 <option>양식</option> 
                                                 <option>일식</option>
                                                </select>
                                                
                                                </div>
                                                
                                                </div>
                                                
                                                <!-- 음식종류 select box end -->
                                                
                                               <!-- 날짜 범위 선택 -->
                                                 <div
                                                    class="col-4  ps-0 mb-2 mb-xl-0 pe-0 pe-lg-0 pe-xl-2">
                                                    <div class="form-group border-0">
                                                        <label class="form-label" style="text-align: center;">방문 가능 시간대</label>
                                                        <input type="text"  class="form-control-date" id="datetime-start" style="width: 150px; border : none;">
	                                                    -<input type="text" class="form-control-date"  id="datetime-end" style="width: 150px; border : none;">
                                                        
                                                    </div>
                                                </div>
                                                <!-- 날짜 범위 선택 끝  -->
                                            </div>
                                                    </div>
                                                </form> 
                                                </div>
                                            </div>
                            
                            <!-- 메뉴메이트 끝 -->
                            
                            
                            
                            <!-- 끼니메이트 -->
                            <div class="tab-pane fade" id="hotel-tab-pane" role="tabpanel"
									                                    aria-labelledby="hotel-tab" tabindex="0">
                                            <!-- one way search -->
                                            <div class="row">
                                                        <form action="Test01.jsp" method="get" > <!-- action 추가 필요  -->
                                                <div class="col-12">
                                                   <div class="search-pan row mx-0 theme-border-radius">
                                                <div class="col-12 col-lg-4 col-xl-4 ps-0 mb-2 mb-xl-4 mt-xl-2 pe-0 pe-lg-2">
                                                    <div class="form-group">
                                                            
                                                            <label for="KeyWord" class="form-label">검색어
                                                            <i class="bi bi-caret-down-fill small"></i>
                                                        </label>
                                                        <!-- 입력창 & 검색어 추천 -->
                                                        <input class="form-control ps-lg-4 mt-xl-3" list="RestaurantRec"
                                                            id="KeyWord" name="KeyWord" style="font-size: 15pt; color: black; font-weight: bold;">
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
                                                        <span class="fw-bold"><i
                                                                class="bi bi-search me-2"></i>Search</span>
                                                    </button>
                                                </div>
                                                <div class="col-xl-4"></div>
                                                <div class="col-xl-1"></div>
                                                <div style="border:1px solid #dddddd; margin-bottom: 15px;"></div>

													<!-- 연령대 select box -->
                                                <div class="col-12 col-lg-4 col-xl-3 ps-1 mb-2 mb-xl-0 pe-0 pe-lg-2">
                                                <div class="form-group">
                                                <label for="Age-boundary" class="form-label" style="text-align: center;">연령대
                                                            <i class="bi bi-caret-down-fill small"></i>
                                                        </label>
                                                <select id="Age-boundary" name="Age-boundary">
                                                 <option>20대</option>
                                                 <option>30대</option>
                                                 <option>40대</option>
                                                 <option></option>
                                                 <option></option>                                                
                                                </select>
                                                <label>초<input name="Age-detail" type="radio" value=""></label>
                                               <label>중<input name="Age-detail" type="radio" value=""></label>
                                               <label>후<input name="Age-detail" type="radio" value=""></label>
                                                </div>
                                                </div>
                                                
                                                <!-- 연령대 select box end -->
                                                
                                                 <!--  성별 select box -->
                                                <div class="col-sm-2 ps-0 mb-2 mb-xl-0 pe-0 pe-lg-2">
                                                <div class="form-group ">
                                                <label for="gender-boundary" class="form-label">성별
                                                            <i class="bi bi-caret-down-fill small"></i>
                                                        </label>
                                                <select id="gender-boundary" name="gender-boundary">
                                                 <option>무관</option>
                                                 <option>남/여</option> <!-- 검색자의 성별 -->
                                                </select>
                                                
                                                </div>
                                                
                                                </div>
                                                
                                                <!-- 성별 select box end -->
                                               
                                                 <!--  음식종류 select box -->
                                                <div class="col-sm-2 ps-0 mb-2 mb-xl-0 pe-0 pe-lg-2">
                                                <div class="form-group">
                                                <label for="food-category" class="form-label">음식 카테고리
                                                            <i class="bi bi-caret-down-fill small"></i>
                                                        </label>
                                                <select id="food-category" name="food-category">
                                                 <option>한식</option>
                                                 <option>양식</option> 
                                                 <option>일식</option>
                                                </select>
                                                
                                                </div>
                                                
                                                </div>
                                                
                                                <!-- 음식종류 select box end -->
                                                
                                               <!-- 날짜 범위 선택 -->
                                                 <div
                                                    class="col-4  ps-0 mb-2 mb-xl-0 pe-0 pe-lg-0 pe-xl-2">
                                                    <div class="form-group border-0">
                                                        <label class="form-label" style="text-align: center;">방문 가능 시간대</label>
                                                        <input type="text"  class="form-control-date" id="datetime-start" style="width: 100px; border: none;">
	                                                    -<input type="text" class="form-control-date"  id="datetime-end" style="width: 100px; border: none;">
                                                        
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
                                            <div class="row justify-content-center" >
                                                <div class="col-8" >
                                                   <div class="search-pan row mx-0 theme-border-radius">
                                                <div class="col-12 col-lg-4 col-xl-3 ps-0 mb-2 mb-xl-0 pe-0 pe-lg-2">
                                                    <div class="form-group">
                                                        <label for="exampleDataList7" class="form-label">검색어
                                                            <i class="bi bi-caret-down-fill small"></i>
                                                        </label>
                                                        <input class="form-control" list="datalistOptions15"
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
                                                <div class="form-group" >
                                                <label for="food-category" class="form-label">카테고리
                                                            <i class="bi bi-caret-down-fill small"></i>
                                                        </label>
                                                <select id="food-category" name="food-category">
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
                                                        <span class="fw-bold"><i
                                                                class="bi bi-search me-2"></i>Search</span>
                                                    </button>
                                                </div>
                                            </div>
                                                    </div>
                                                </div>
                                            </div>  <!-- 동아리 끝 -->
                                            
                                            
                                            
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
     
     <div id="resultDiv">
     
     </div>
    
    <!-- footer section-->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-6 col-lg-3 mb-5 mb-lg-0">
                    <h5 class="mb-5 fs-6">Contact Us</h5>
                    <div class="flex-grow-1">
                        Customer Care<br>
                        <span class="fs-5 theme-text-primary">+(1) 123 456 7890</span>
                    </div>
                    <div class="flex-grow-1 mt-3">
                        Need live support?<br>
                        <a href="#" class="fs-5 theme-text-primary">hi@example.com</a>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-2 mb-5 mb-lg-0">
                    <div class="d-flex">
                        <h5 class="mb-5 fs-6">Company</h5>
                    </div>
                    <div class="d-flex">
                        <ul class="fl-menu">
                            <li class="nav-item"><a href="javascript:void(0)">About Us</a></li>
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
                            <li class="nav-item"><a href="javascript:void(0)">Legal Notice</a></li>
                            <li class="nav-item"><a href="javascript:void(0)">Privacy Policy</a></li>
                            <li class="nav-item"><a href="javascript:void(0)">Terms and Conditions</a></li>
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
                            <li class="nav-item"><a href="javascript:void(0)">Activity Finder</a></li>
                            <li class="nav-item"><a href="javascript:void(0)">Tour List</a></li>
                            <li class="nav-item"><a href="javascript:void(0)">Flight Search</a></li>
                            <li class="nav-item"><a href="javascript:void(0)">Cruise Ticket</a></li>
                            <li class="nav-item"><a href="javascript:void(0)">Holidays</a></li>
                            <li class="nav-item"><a href="javascript:void(0)">Travel Agents</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-2 mb-5 mb-lg-0">
                    <h5 class="mb-5 fs-6">Download App</h5>
                    <a href="javascript:void(0)"
                        class="d-inline-flex align-items-center border px-3 py-2 theme-border-radius min-w-150">
                        <div class="flex-shrink-0">
                            <img src="assets/images/icons/play-icon.png" class="img-fluid" alt="Google-Play"
                                title="Google-Play">
                        </div>
                        <div class="flex-grow-1 ms-2">
                            <p class="mb-0 small theme-text-accent-two">Get it on</p>
                            <p class="mb-0 small theme-text-accent-one fw-bold">Google Play</p>
                        </div>
                    </a>
                    <a href="javascript:void(0)"
                        class="d-inline-flex align-items-center border px-3 py-2 theme-border-radius mt-2 min-w-150">
                        <div class="flex-shrink-0">
                            <img src="assets/images/icons/apple.png" class="img-fluid" alt="apple" title="apple">
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
                    <p class="pt-2 mb-0 small theme-text-accent-one">&copy; 2022 AFA Tourism All rights reserved.
                    </p>
                </div>
                <div class="col-12 col-lg-6 mt-5">
                    <ul class="footer-link d-flex flex-row flex-wrap justify-content-lg-center align-items-center">
                        <li><a href="javascript:void(0)">Privacy</a></li>
                        <li><a href="javascript:void(0)">Terms</a></li>
                        <li><a href="javascript:void(0)">Site Map</a></li>
                    </ul>
                </div>
                <div class="col-12 col-lg-3 mt-5">
                    <div class="d-flex social justify-content-lg-end">
                        <a href="javascript:void(0)" class="fs-4 pe-3"><i class="bi bi-facebook"></i></a>
                        <a href="javascript:void(0)" class="fs-4 pe-3"><i class="bi bi-twitter"></i></a>
                        <a href="javascript:void(0)" class="fs-4 pe-3"><i class="bi bi-linkedin"></i></a>
                        <a href="javascript:void(0)" class="fs-4 pe-3"><i class="bi bi-instagram"></i></a>
                        <a href="javascript:void(0)" class="fs-4"><i class="bi bi-whatsapp"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Scroll To Top Start-->
        <a href="javascript:void(0)" class="scrollToTop"><i class="bi bi-chevron-double-up"></i></a>
    </footer>

   
</body>
</html>