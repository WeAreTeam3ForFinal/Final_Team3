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

<link rel="stylesheet" type="text/css" href="css/main.css">



<script type="text/javascript">


$(document).ready(function(){
	
	$(document).on("click",".bar",function()
	{
		//$(this).css("color","red");
		$(this).removeClass("btn-secondary");
		$(this).parent().addClass("act");
		$(this).addClass("btn-primary");
	});
	
 	$(document).on("click", ".detail", function()
			{
		//alert(this.id);
		$(this).removeClass("btn-secondary");
		$(this).addClass("btn-primary");
		const bar = $("#barList").children(".act").children(".btn-primary").attr("id");
		recordList(bar,this.id);
				
			}); 
	
	
});




function recordList(bar,detail)
{
	const param = "bar="+bar+"&detail="+detail;
	
	
	
	$.ajax(
			{
				type : "GET",
				data : param,
				url : "myRecordList.kkini",
				success : function(args)
				{
					$("#resultDiv").html(args);
				}
				,
				error : function(e)
				{
					alert(e.responseText);
				}
			});
	
}




</script>

</head>
<body onload="recordList('none','none')">


<div>
<jsp:include page="titleAndSubMenu.jsp"></jsp:include>
</div>





<div class="container text-center">


<div class ="row gy-5 justify-content-start">
<div class="col-12"></div><div class="col-12"></div>
이력 페이지

<div class="col-12"></div>


</div>


<div class ="row gy-5 justify-content-start">

<div class="col-md-auto">
모임 종류별로 보기
</div>
<div class="col-12"></div>


</div>

<div class="row gy-5 justify-content-start" id="barList">

<div class="col-md-auto" id="memadiv">
<button class="btn btn-secondary bar" id="mema" >메뉴메이트</button>
</div>
<div class="col-md-auto" id="kimediv">
<button  class="btn btn-secondary bar" id="kime">끼니메이트</button>
</div>
<div class="col-md-auto" id="clubdiv">
<button  class="btn btn-secondary bar" id="club">동아리</button>
</div>
<div class="col-12"></div>
</div>


<div class ="row gy-5 gx-1 justify-content-start">

<div class="col-md-auto">
모임 상태별로 보기
</div>
<div class="col-12"></div>
</div>

<div class="row">

<div class="col-md-auto">
<button  class="btn btn-secondary detail" id="complete">참가완료</button>
</div>
<div class="col-md-auto">
<button  class="btn btn-secondary detail" id="feedback">피드백 대기</button>
</div>
<div class="col-md-auto">
<button  class="btn btn-secondary detail" id="dropout">불참</button>
</div>
<div class="col-12">&nbsp;</div>
</div>


<div class="row">

<div class="col-md-auto">
<button  class="btn btn-secondary detail" id="join">참가중</button>
</div>
<div class="col-md-auto">
<button  class="btn btn-secondary detail" id="applying">참가신청 중</button>
</div>
<div class="col-md-auto">
<button  class="btn btn-secondary detail" id="opened">개설</button>
</div>



</div>





</div>


<div id="resultDiv"></div>


</body>
</html>