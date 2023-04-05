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
<link rel="stylesheet" type="text/css" href="assets/css/open2.css">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="80x80" href="assets/images/favicon.png">
<!-- Main CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<link href="./assets/css/main.css" rel="stylesheet">
<!--구글폰트  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">

<title></title>

<style type="text/css">
/* 카맵 css */
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
/* 카맵 css끝  */


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
	//sessionStorage.setItem('userCode', 'UC00000001'); 	// 세션에 로그인된 userCode 임의로 입력(더미 데이터)
	$("#userCode").val(sessionStorage.getItem('userCode'));	// 세션에 저장된 userCode 가져오기
	  
	  var tag = {};
      var counter = 0;

      // 입력한 값을 태그로 생성한다.
      function addTag (value) {
          tag[counter] = value;	// 태그를 Object 안에 추가
          counter++; 			// counter 증가, 삭제를 위한 del-btn 의 고유 id 가 된다.
      }

   // 서버에 넘길 때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
      function marginTag () {
          return Object.values(tag).filter(function (word) {
              return word !== "";
          }).join(',');
      }
  
      // 서버에 제공
      $("#tag-form").on("submit", function (e) {
          var value = marginTag(); // return array
          $("#rdTag").val(value); 

          $(this).submit();
      });

      $("#tag").on("keypress", function (e) {
          var self = $(this);
          
          // 엔터나 스페이스바 눌렀을때 실행
          if (e.key === "Enter" || e.keyCode == 32) {
        	  
        	  // 배열이 이미 3일 때는 해당 조건문을 탄다
        	  if (Object.values(tag).length > 2)  {
        		  alert("태그값은 3개까지 입력가능합니다.");
        		  return;
        	  }

        	  var tagValue = self.val(); // 값 가져오기

              // 해시태그 값 없으면 실행X
              if (tagValue !== "") {

                  // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                  var result = Object.values(tag).filter(function (word) {
                      return word === tagValue;
                  })
              
                  // 해시태그가 중복되었는지 확인
                  if (result.length == 0) { 
                      $("#tag-list").append("<li class='tag-item'>"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
                      addTag(tagValue);
                      
                      // 개설키워드 서버에 제공하기
                      $("#keyWord").val(marginTag);
                      
                      
                      self.val("");
                  } else {
                      alert("태그값이 중복됩니다.");
                  }
              }
              e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
          }
      });

      // 삭제 버튼 
      // 인덱스 검사 후 삭제
      /*
      $(document).on("click", ".del-btn", function (e) {
          var index = $(this).attr("idx");
          tag[index] = "";
          $(this).parent().remove();
      });
      */
      
      $(document).on("click", ".del-btn", function (e) {
          var index = $(this).attr("idx");
          delete tag[index];	// 기존 방식은 입력한 개설키워드의 x 표시를 눌렀을 때 value값을 초기화시켜주는 방식이라 값은 보이지 않지만
          						// key(index)는 남아있는 상태였음! 그래서 delete 키워드를 이용하여 key와 value 모두를 삭제했다.
          $(this).parent().remove();
      });
      
});
	
	/*==========기존 개설 키워드 자스 
	let itemList = [];
    let addBtn = document.querySelector('.add_btn');

    addBtn.addEventListener('click',addList);

    function addList() {
        let item = document.querySelector('.item');

        
        if(item.value !=null)
        
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
    } */
    
// 개설키워드 js 끝


$(function() {
    $.datetimepicker.setLocale('ko');
	
	
	// 최소 방문 예정일 제한(현재 날짜 및 시간으로부터 2시간 이후)
    var minDateTime = new Date();
	var time = minDateTime.getHours(); //+ 2 복구
	minDateTime.setHours(time); 
	//var minDate = now.getTime()+2;
	
	// 최대 방문 예정일 제한(현재날짜로부터 7일 안으로)
    var maxDate = new Date();
	var day = maxDate.getDate()+7;
	maxDate.setDate(day);
	
    $("#datetime").datetimepicker(
    		{
    			format:'Y-m-d H:i',
    			lang: 'ko',
    			 allowTimes:[
    				 '24:30','01:00', '01:30', '02:00', '02:30', '03:00', '03:30', '04:00', '04:30', '05:00', '05:30', '06:00', '06:30', '07:00', '07:30', '08:00', '08:30', '09:00', '09:30', '10:00', '10:30', '11:00',
    				 '11:30', '12:00', '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', '18:00', '18:30', '19:00',
    				 '19:30', '20:00', '20:30', '21:00', '21:30', '22:00', '22:30', '23:00', '24:00'  
    				 ],
    		    /*상단에서 설정해놓은 방문일시 각각  minDateTime, minDate 속성에 추가 */
    	        minDateTime : minDateTime,   
    			maxDate : maxDate
     		}); 
           
    /* $(document).on("click", ".selectInfo",function() {
        $(this).next().children('button').click();
      }); */
});
<!-- 데이트피커 js 끝-->

// 카카오맵 API 팝업창 띄우기
 function openPopUp(url, name){

  var options = 'width=500, height=600, top=30, left=30, resizable=no, scrollbars=no, location=no';
  window.open(url, name, options);

}


// 모집희망인원제한 & 메인메뉴 가격에 따른 인당예상 가격 자동입력 ==> keyUp 이벤트 처리
function perPriceCal()
{
	
	var peopleCount = document.getElementById("peopleCount").value;
	
	// 메인메뉴가격 입력시 모집희망 인원 미입력 상태라면
	if (!peopleCount)   
	{
		return false; 	// 조건문 빠져나가겠다
	} 
	
    if (peopleCount<2 || peopleCount>15)
	{
		alert("모집인원수는 2인 이상 15인 이하로 제한됩니다. ");
		return;
	}
	var mainMenuPrice = document.getElementById("mainMenuPrice").value;	
	var perPrice = Math.floor(parseInt(mainMenuPrice) / parseInt(peopleCount));
	
	// 메인메뉴 가격이나 모집희망 인원수에 값이 없을 경우
	if (isNaN(perPrice))
	{
		perPrice = 0;   // NaN -> 0 처리하겠다
	}
	
	
	// 인당예상가격 숫자 3자리마다 콤마 찍겠다
	let result = perPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	// 인당예상가격란에 가격 삽입
	document.getElementById("perPrice").value = result;
}


// 입력값 유효성 검사
function checkUp()
{
    var local = $('#local').val();   
	var restautant = $('#restautant').val();   
	var datetime = $('#datetime').val();   
	var mainMenu = $('#mainMenu').val();   
	var mainMenuPrice = $('#mainMenuPrice').val(); 
	var count = $('#count').val(); 
	
	
	if (datetime==null || datetime =="" || local==null || local =="" || restautant==null || restautant =="" 
		|| mainMenu==null || mainMenu =="" || mainMenuPrice==null || mainMenuPrice =="" || count==null || count =="" )
	{
	    var check = document.getElementById("Check");
        check.style.display = "block";
        return false;
			
	}	
		 
} 

/* 버튼 1개인 팝업창 열기(범용) */
// 여기저기 그대로 가져다 쓰기 가능
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
<!--HEAD 종료 -->

<!-- BODY 시작 -->
<body>
	<!-- 끼리끼니 로고 div 시작 -->
	<div class="logo">
		<img alt="로고" src="./assets/images/logo.jpeg" style="width: 300px;">
	</div>

	<!-- form 시작  -->
	<form action="memaopen.kkini" method="post">
		<!--개설폼 div  -->
		<div class="openBox">
		  <div class="scoreBtn">
				<span class="checkScore" style="background-color: orange;">내 점수 확인하기!</span>
						<div class="ScoreText" style=" background-color: #444444;opacity:0.9;">
						출석 점수 : ${getScore.attendScore}<br>
						신뢰 점수 : ${getScore.mannerScore}<br>
						매너 점수 : ${getScore.biasScore}<br>
						<p class="alertText">※개설자님의 출석,신뢰,매너 점수는 지원자에게 전체공개됩니다</p>
						</div>
		 </div>
			<div class="content">
					<p class="infoText">
						내가 먹고싶은 메뉴로 <span class="mm">메뉴메이트</span>를 바로 개설해보세요!
					</p>
					<hr>
				<br>
				<div>
					<span class="red">※</span> 방문예정 일시<br> <input type="text" class="form-control-lg form-control-date" style="width: 500px;" id="datetime" name="mmVisitDate" placeholder="클릭하여 선택해주세요." readonly="readonly" required>
				</div><br>
				
				<p>
					방문하고자 하는 <span class="mm">식당명</span>을 검색 후 선택해주세요!
				</p>
				<!-- 카카오맵 팝업창 말고 개설페이지에 띄우는 방향으로 결정-->
				<div class="map_wrap">
			    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			
			    <div id="menu_wrap" class="bg_white">
			        <div class="option">
			            <div>
			                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
			                    <button onclick="searchPlaces()" >검색하기</button> 
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			    </div>
			</div>
			<br>
			
			<!-- ★주의★ 카카오맵 자바스크립트와 appKey 위치 head 영역으로 올리면 기능 안돌아가니 현재 위치 유지 바람. 이유는 저도 아직 모르겠음 --> 
			<!--        ㄴ 이거 아마 자바스크립트가 입력한 순서대로 코드가 진행되는거라 웹에서 보여지는 순서랑 같아야 돌아갈거야! -->
			<!--카카오맵 API APP KEY  -->
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=73ce8ac5774ecbf47e6474dc618e62f2&libraries=services"></script>
			<!--카카오맵 자바스크립트  -->
			<script type="text/javascript">
			// 마커를 담을 배열입니다
			var markers = [];

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 

			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places();  

			// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	        
			// 키워드로 장소를 검색합니다
			searchPlaces();

			// 키워드 검색을 요청하는 함수입니다
			function searchPlaces() {

			    var keyword = document.getElementById('keyword').value;

			    if (!keyword.replace(/^\s+|\s+$/g, '')) {
			        alert('키워드를 입력해주세요!');
			        return false;
			    }

			    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			    ps.keywordSearch( keyword, placesSearchCB); 
			}

			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {

			        // 정상적으로 검색이 완료됐으면
			        // 검색 목록과 마커를 표출합니다
			        displayPlaces(data);

			        // 페이지 번호를 표출합니다
			        displayPagination(pagination);

			    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

			        alert('검색 결과가 존재하지 않습니다.');
			        return;

			    } else if (status === kakao.maps.services.Status.ERROR) {

			        alert('검색 결과 중 오류가 발생했습니다.');
			        return;
			    }
			}
			// 검색 결과 목록과 마커를 표출하는 함수입니다
			function displayPlaces(places) {

			    var listEl = document.getElementById('placesList'), 
			    menuEl = document.getElementById('menu_wrap'),
			    fragment = document.createDocumentFragment(), 
			    bounds = new kakao.maps.LatLngBounds(), 
			    listStr = '';
			    
			    // 검색 결과 목록에 추가된 항목들을 제거합니다
			    removeAllChildNods(listEl);

			    // 지도에 표시되고 있는 마커를 제거합니다
			    removeMarker();
			    
			    for ( var i=0; i<places.length; i++ ) {

			        // 마커를 생성하고 지도에 표시합니다
			        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
			            marker = addMarker(placePosition, i), 
			            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        bounds.extend(placePosition);

			        // 마커와 검색결과 항목를 click 했을때
			        // 해당 장소에 인포윈도우에 장소명을 표시합니다
			        // <끼리끼니 수정 부분> === 방문예정 지역 추출을 위한 함수 세번째 매개변수 address 추가===
			        (function(marker, title, address) {
			            kakao.maps.event.addListener(marker, 'click', function() {
			                displayInfowindow(marker, title, address);
			            });

			            itemEl.onclick =  function () {
			                displayInfowindow(marker, title, address);
			            };

			        })(marker, places[i].place_name, places[i].address_name); //<끼리끼니 수정 부분> 방문예정 지역 추출을 위한 세번째 속성 places[i].address_name 추가

			        fragment.appendChild(itemEl);
			    }

			    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			    listEl.appendChild(fragment);
			    menuEl.scrollTop = 0;

			    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			    map.setBounds(bounds);
			}

			// 검색결과 항목을 Element로 반환하는 함수입니다
			function getListItem(index, places) {

			    var el = document.createElement('li'),
			    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
			                '<div class="info">' +
			                '   <h5>' + places.place_name + '</h5>';

			    if (places.road_address_name) {
			        itemStr += '    <span>' + places.road_address_name + '</span>' +
			                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
			    } else {
			        itemStr += '    <span>' +  places.address_name  + '</span>'; 
			    }
			                 
			      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
			                '</div>';           

			    el.innerHTML = itemStr;
			    el.className = 'item';

			    return el;
			}

			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(position, idx, title) {
			    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
			        imgOptions =  {
			            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			        },
			        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
			            marker = new kakao.maps.Marker({
			            position: position, // 마커의 위치
			            image: markerImage 
			        });

			    marker.setMap(map); // 지도 위에 마커를 표출합니다
			    clickAction();
			    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
			    
			    return marker;
			}

			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
			    for ( var i = 0; i < markers.length; i++ ) {
			        markers[i].setMap(null);
			    }   
			    markers = [];
			}

			// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
			function displayPagination(pagination) {
			    var paginationEl = document.getElementById('pagination'),
			        fragment = document.createDocumentFragment(),
			        i; 

			    // 기존에 추가된 페이지번호를 삭제합니다
			    while (paginationEl.hasChildNodes()) {
			        paginationEl.removeChild (paginationEl.lastChild);
			    }

			    for (i=1; i<=pagination.last; i++) {
			        var el = document.createElement('a');
			        el.href = "#";
			        el.innerHTML = i;

			        if (i===pagination.current) {
			            el.className = 'on';
			        } else {
			            el.onclick = (function(i) {
			                return function() {
			                    pagination.gotoPage(i);
			                }
			            })(i);
			        }

			        fragment.appendChild(el);
			    }
			    paginationEl.appendChild(fragment);
			}


			// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
			// 인포윈도우에 장소명을 표시합니다
			// <끼리끼니 수정 부분> 방문 예정 지역 추출을 위한 address 매개변수 추가
			 function displayInfowindow(marker, title, address) {
			    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

			    // infowindow 표시부분, 여기서는 식당명만 표시해줌
			    infowindow.setContent(content);
			    infowindow.open(map, marker);
			    
			    // 선택된 방문예정 식당, 방문예정 지역 변수에 담아주기 
			    contentTitle = title;
			    contentAddress = address;
			    
			    // 정보가 담긴 변수 해당 입력칸에 삽입
			    document.getElementById("restaurant").value = contentTitle;
			    document.getElementById("local").value = contentAddress;
			    //clickAction();
			} 

			 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
			function removeAllChildNods(el) {   
			    while (el.hasChildNodes()) {
			        el.removeChild (el.lastChild);
			    }
			}
			 
			 function clickAction()
			{
			   kakao.maps.event.addListener(map, "click", function(mouseEvent)
			   {
				  // 클릭한 위도, 경도 정보를 가져옵니다 
				  var latLng = mouseEvent.latLng;
			   
			      // 기존 마커의 위치를 클릭한 지점으로 이동 check~!!!
			      marker.setPosition(latLng);
			      
			      var message = "클릭한 지점의 위도는 " + latLng.getLat();
			      message += " 이고, 경도는 " + latLng.getLng() + " 입니다.";
			      
			      var resultDiv = document.getElementById("result");
			      resultDiv.innerHTML = message;
			      
			   });
			} 
			 
			</script>
			<!-- 카카오맵 자바스크립트 끝 -->
				
				<div>
					<span class="red">※</span> 방문예정 지역<br> <input type="text" class="form-control-lg" style="width: 500px;" id="local"  name="mmRestLocation" readonly="readonly" required>
				</div>
				<div>
					<span class="red">※</span> 방문예정 식당<br> <input type="text" class="form-control-lg" style="width: 500px;" id="restaurant"  name="mmRestName" readonly="readonly" required>
				</div>
				<br>
				<div>
					<span class="red">※</span> 음식종류<br> <select class="form-select-lg" style="width: 500px;" id="foodCategory" name="mmFoodCtgCode" required>
						<option selected disabled value="">==선택==</option>
						<c:forEach var="foodCtgList" items="${foodCtgList }">
							<option value="${foodCtgList.FOOD_CTG_CODE}">${foodCtgList.FOOD_CASE}</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<span class="red">※</span> 메인메뉴명<br> 
					<input type="text" class="form-control-lg" style="width: 500px;" id="mainMenu" name="mmMenu" placeholder="내용을 입력해주세요" required>
				</div>
				<div>
					<span class="red">※</span> 메인메뉴가격<br> <input type="text" class="form-control-lg" style="width: 500px;" onkeyup="perPriceCal()" id="mainMenuPrice" name="mmMenuPrice" placeholder="내용을 입력해주세요">(원)
				</div>
				<div>
					<span class="red">※</span> 모집 인원수<br> <input type="text" class="form-control-lg" style="width: 500px;" onkeyup="perPriceCal()" id="peopleCount" name="mmNop" placeholder="내용을 입력해주세요">(명)
				</div>
				<div>
					<span class="blue">※</span> 인당 예상 가격<br> <input type="text" class="form-control-lg" style="width: 500px;" readonly="readonly" id="perPrice" placeholder="(원)">
				</div>
				<br>
				<div>
					<span class="red">※</span> 모집 희망 성별<br> <select class="form-select-lg" style="width: 500px;" id="gender" name="mmGenderCode" required>
						<option selected disabled value="">==선택==</option>
						 <c:choose>
					         <c:when test = "${genderResult==1}"> <!--남자 회원이 개설할 시  -->
					            <c:forEach var="MalegenderList" items="${MalegenderList }">
									<option value="${MalegenderList.GENDER_CODE}">${MalegenderList.GENDER_CTG}</option>
							    </c:forEach>
					         </c:when>
							
							 <c:when test = "${genderResult==2}">  <!-- 여자 회원이 개설할 시   -->
							 	<c:forEach var="FemalegenderList" items="${FemalegenderList }">
									<option value="${FemalegenderList.GENDER_CODE}">${FemalegenderList.GENDER_CTG}</option>
								</c:forEach>
							</c:when>	
							
							<c:when test = "${genderResult==3}"> <!--남자 회원이 개설할 시  -->
					            <c:forEach var="MalegenderList" items="${MalegenderList }">
									<option value="${MalegenderList.GENDER_CODE}">${MalegenderList.GENDER_CTG}</option>
							    </c:forEach>
					         </c:when>
					         
					         <c:when test = "${genderResult==4}"> <!--여자 회원이 개설할 시  -->
					            <c:forEach var="FemalegenderList" items="${FemalegenderList }">
									<option value="${FemalegenderList.GENDER_CODE}">${FemalegenderList.GENDER_CTG}</option>
							    </c:forEach>
					         </c:when>
					    </c:choose>
					</select>
				</div>
				<div>
					<span class="red">※</span> 모집 희망 연령대<br> <select class="form-select-lg" style="width: 500px;" id="AgeGroup" name="mmAgeGroupCode" required>
						<option selected disabled value="">==선택==</option>
						<c:forEach var="ageGroupList" items="${ageGroupList }">
							<option value="${ageGroupList.AGE_GROUP_CODE}">${ageGroupList.AGE_GROUP_CASE}</option>
						</c:forEach>
					</select>
				</div>
				<!--개설키워드  -->
				<div class="form-group">
					<span class="red">※</span> 개설 키워드(최대 3개) :<input type="text" id="tag" class="form-control-lg item" style="width: 500px;" placeholder="엔터로 개설키워드를 등록해주세요."  />
				</div>
				<div class="form-group">
					<input type="hidden" value="" name="tag" id="rdTag" />
				</div>

				<ul id="tag-list"></ul>
				<!-- <div>
					<span class="red">※</span> <span>개설 키워드(최대 3개) : </span><br> <input type="text" style="width: 500px;" class="form-control-lg item" autofocus>
					<button type="button" class="add_btn">추가</button>
					<hr>
					<div class="item_list"></div>
				</div> -->
				<input style="display: none;" type="text" name="mmUserCode" id="userCode" value="${sessionScope.userCode}">
				<input style="display: none;" type="text" name="mmOpenKeyWord" id="keyWord">
				<span id="Check" class="red" style="text-align: center; display: none;">※항목은 필수입력값입니다.</span>
			</div>
			<!--end content  -->
		</div>
		<!--end openBox  -->
		<br>
		<!--개설 버튼 div  -->
		<div class="button_box">
			<button type="submit" class="btn btn-warning" style="width: 400px; font-weight: bold; font-size: x-large;">개설하기!</button>
		</div>
	
	</form>
	<!--form 끝  -->
</body>
</html>