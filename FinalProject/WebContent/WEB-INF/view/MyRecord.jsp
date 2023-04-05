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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/main.css">



<script type="text/javascript">
	$(document).ready(
			function()
			{
				
				

				$(document).on("click", ".bar", function()
				{
					//$(this).css("color","red");

					if ($(this).parent().hasClass("act"))
					{
						$(this).parent().removeClass("act");
						$(this).removeClass("btn-primary");
						$(this).addClass("btn-secondary");

					} else
					{
						$(this).removeClass("btn-secondary");
						$(this).parent().addClass("act");
						$(this).addClass("btn-primary");
					}
				});

				$(document).on(
						"click",
						".detail",
						function()
						{
							//alert(this.id);

							
							if($(this).hasClass("btn-primary"))
								{
								$(this).removeClass("btn-primary");
								$(this).addClass("btn-secondary");
								const bar = $("#barList").children(".act")
										.children(".btn-primary").attr("id");
								recordList(bar, "none","none");
								
								}
							
							else if ($(this).parent().parent().children().children()
									.hasClass("btn-primary"))
							{
								$(this).parent().parent().children().children()
										.removeClass("btn-primary");

								
								$(this).parent().parent().children().children()
										.addClass("btn-secondary");
								
								
								$(this).removeClass("btn-secondary");
								$(this).addClass("btn-primary");
								
								
								
								const bar = $("#barList").children(".act")
								.children(".btn-primary").attr("id");
								
								recordList(bar, this.id,"none");
							}
						
							else
							{
								//alert();

								$(this).removeClass("btn-secondary");
								$(this).addClass("btn-primary");
								const bar = $("#barList").children(".act")
										.children(".btn-primary").attr("id");
								recordList(bar, this.id,"none");

							}

						});

				$(document).on("click", "#sortList >li > a", function() //정렬하는 부분
				{

					//alert($(this).attr("link"));
					let bar = 'none';
					let detail = 'none';
					
					if($("#barList").children(".act").children(".btn-primary").attr("id") != null)
						{
					bar = $("#barList").children(".act").children(".btn-primary").attr("id");
						}
					
					
					if($("#detailBar").children().children(".btn-primary").attr("id") != null)
					{
					detail = $("#detailBar").children().children(".btn-primary").attr("id");
					}
										
					
					recordList(bar,detail,$(this).attr("id"));
					

				});
				
				$(document).on("click",".recordRoom",function()
				{
					 if($(this).prev().text() == '참가중')
						{
						$(location).attr("href","mmjoinRoom.kkini?openCode="+$(this).next().children("input").val()); //참가중인방은 피드백 못하게
						}
				
			/* 		else if()
						{
						alert("이미 피드백을 완료한 방입니다."). 
						}*/
					 
					else
					{
					$(this).next().children("button").click();
					} 
				});

			});

	function recordList(bar, detail, sortBy)
	{
		const param = "bar=" + bar + "&detail=" + detail+"&sortBy="+sortBy;

		$.ajax(
		{
			type : "GET",
			data : param,
			url : "myRecordList.kkini",
			success : function(args)
			{
				$("#resultDiv").html(args);
				for (var i = 0; i < $(".feedBackStatus").length; i++)
					if($(".feedBackStatus").eq(i).text() == "참가완료")
					{
						$(".recordList").eq(i).css("background-image","url('assets/images/icons/check-mark.png')");
						//$(".recordList").eq(i).css("background-size","cover");
						$(".recordList").eq(i).css("background-repeat","no-repeat");
						$(".recordList").eq(i).css("background-position","center");
						//$(".recordList").eq(i).attr("class","col-12 col-md-6 col-lg-3 h-50 mb-4 mb-lg-3 me-3 border border-dark mmList");
					}
			},
			error : function(e)
			{
				alert(e.responseText);
			}
		});

	}
</script>

</head>
<body onload="recordList('none','none','none')">


	<div>
		<jsp:include page="titleAndSubMenu.jsp"></jsp:include>
	</div>





	<div class="container text-center">


		<div class="row gy-5 justify-content-start">
			<div class="col-12"></div>
			<div class="col-12"></div>
			<h4 class="fs-2 fw-bold theme-text-secondary mb-0">나의 이력</h4>

			<div class="col-12"></div>


		</div>


		<div class="row gy-5 justify-content-start">

			<div class="col-md-auto">
				<h6 class="fs-5 fw-bold theme-text-secondary mb-0">모임 종류</h6>
			</div>


		</div>

		<div class="row gy-5 justify-content-start" id="barList">

			<div class="col-md-auto" id="memadiv">
				<button class="btn btn-secondary bar" id="mema">메뉴메이트</button>
			</div>
			<div class="col-md-auto" id="kimediv">
				<button class="btn btn-secondary bar" id="kime">끼니메이트</button>
			</div>
			<div class="col-md-auto" id="clubdiv">
				<button class="btn btn-secondary bar" id="club">동아리</button>
			</div>
			<div class="col-12"></div>
		</div>


		<div class="row gy-5 gx-1 justify-content-start">

			<div class="col-md-auto">
				<h6 class="fs-5 fw-bold theme-text-secondary mb-0">모임 상태</h6>
			</div>
		</div>

		<div class="row detailBar" id="detailBar">

			<div class="col-md-auto">
				<button class="btn btn-secondary detail" id="complete">참가완료</button>
			</div>
			<div class="col-md-auto">
				<button class="btn btn-secondary detail" id="feedback">피드백
					대기</button>
			</div>
			<div class="col-md-auto">
				<button class="btn btn-secondary detail" id="dropout">불참</button>
			</div>
			<div class="col-12">&nbsp;</div>

			<div class="col-md-auto">
				<button class="btn btn-secondary detail" id="join">참가중</button>
			</div>
			<div class="col-md-auto">
				<button class="btn btn-secondary detail" id="applying">참가신청
					중</button>
			</div>
			<div class="col-md-auto">
				<button class="btn btn-secondary detail" id="opened">개설</button>
			</div>
		</div>






	</div>





	</div>


	<div id="resultDiv"></div>


</body>
</html>