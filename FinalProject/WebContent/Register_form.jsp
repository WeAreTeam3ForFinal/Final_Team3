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
<title>회원가입</title>
</head>
<link rel="stylesheet" type="text/css" href="./assets/css/register.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<!-- 비밀번호 눈 -->
<link rel=”stylesheet”
	href=”https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css” />
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	function SeePw(eye)
	{
		var x = document.getElementById("UserPw");
		if (x.type == "password")
		{
			x.type = "text";
			eye.className = "bi-eye";
		} else
		{
			x.type = "password";
			eye.className = "bi-eye-slash";
		}
	}

	$(function()
	{
		/* 거주지  */
		$("#User_addr").keyup(function()
		{
			//alert($(this).attr('id')); 호출한 곳의 iD 알아오기
			$("#addrErr").css("dispaly", "none");
			$("#addrErr").html("");

			if ($.trim($("#User_addr").val()) != "")
			{
				const id = $(this).attr('id');
				addrCheckAjax(id);

			}

		});

		/* 관심지역 */
		$("#User_IntRegion1").keyup(function()
		{
			//alert($(this).attr('id')); //호출한 곳의 iD 알아오기
			$("#User_IntRegion1Err").css("dispaly", "none");
			$("#User_IntRegion1Err").html("");

			if ($.trim($("#User_IntRegion1").val()) != "")
			{
				const id = $(this).attr('id');
				regionCheckAjax(id);
			}

		});

		/* 관심지역 */
		$("#User_IntRegion2").keyup(function()
		{
			//alert($(this).attr('id')); //호출한 곳의 iD 알아오기
			$("#User_IntRegion2Err").css("dispaly", "none");
			$("#User_IntRegion2Err").html("");

			if ($.trim($("#User_IntRegion2").val()) != "")
			{
				const id = $(this).attr('id');
				regionCheckAjax(id);
			}

		});

		/* 관심지역 */
		$("#User_IntRegion3").keyup(function(e)
		{
			//alert($(this).attr('id')); //호출한 곳의 iD 알아오기
			$("#User_IntRegion3Err").css("dispaly", "none");
			$("#User_IntRegion3Err").html("");

			if ($.trim($("#User_IntRegion3").val()) != "")
			{
				const id = $(this).attr('id');
				regionCheckAjax(id);
			}

		});

		//이메일 직접 입력 부분

		$("#emailDirect").hide();

		$("#email").change(function()
		{
			if ($("#email").val() == "direct")
			{
				$("#emailDirect").show();
			} else
			{
				$("#emailDirect").hide();
			}
		});

	});

	/* 입력된 데이터가 DB데이터와 같은지 확인 */
	function regionCheckAjax(id)
	{
		params = "region_name=" + $('#' + id).val();

		$.ajax(
		{

			type : "POST",
			url : "regionCheck.kkini",
			data : params,
			success : function(args)
			{
				$("#" + id + "Err").css("dispaly", "inline");
				$("#" + id + "Err").html($.trim(args));

			},
			beforeSend : showRequest,
			error : function(e)
			{
				alert(e.responseText);

			}
		});

	}

	/* 입력된 데이터가 DB데이터와 같은지 확인 */
	function addrCheckAjax(id)
	{
		params = "region_name=" + $('#' + id).val();

		$.ajax(
		{

			type : "POST",
			url : "regionCheck.kkini",
			data : params,
			success : function(args)
			{
				$("#addrErr").css("dispaly", "inline");
				$("#addrErr").html($.trim(args));

			},
			beforeSend : showRequest,
			error : function(e)
			{
				alert(e.responseText);

			}
		});

	}

	function showRequest()
	{
		return true;

	}
</script>

<body>


	<section class="h-100 h-custom">
		<div class="container py-5 h-100" style="width: 800px;">
			<div class="row d-flex justify-content-center h-100">
				<img alt="로고" src="./assets/images/logo.jpeg"
					style="width: 300px; align-items: flex-end;">
				<div class="col-12">
					<div class="card card-registration card-registration-2"
						style="border-radius: 15px;">

						<div class="card-body p-0">
							<div class="row g-1">
								<div class="col-lg-12">
									<div class="px-5 pt-5 pb-1">

										<!-- 폼 시작 -->
										<form action="Register_Alignment_form.jsp" method="post">
											<h3 class="fw-normal mb-4" style="color: #FFA500;">
												회원 정보 <small style="font-size: small; color: gray;">
													<i class="bi bi-check-lg"></i>는 필수사항입니다.
												</small>
											</h3>
											<div class="row g-1">
												<div class="col-4 mb-2 pb-2">

													<label class="form-label" for="UserId">아이디</label><i
														class="bi bi-check-lg mt-2"
														style="color: black; font-size: 18px;"></i>
													<div class="input-group form-outline">
														<input type="text" id="UserId" name="UserId"
															class="form-control form-control-m" /> <span
															class="mt-2 mx-1">@</span>

													</div>
												</div>
												<div class="col-3 mb-2 pb-2">
													<label class="form-label" for="email"
														style="visibility: hidden;">.</label> <select
														class="form-select" id="email" name="email">
														<option value="gmail.com">gmail.com</option>
														<option value="naver.com">naver.com</option>
														<option value="direct">직접입력</option>
													</select> <input type="text" class="form-control" id="emailDirect"
														name="emailDirect" />
												</div>

												<div class="col-2 mb-2 pb-2 align-items-baseline">
													<label class="form-label" for="CheckNickName"
														style="visibility: hidden;">.</label><br>
													<button type="button" id="CheckNickName"
														class="btn btn-outline-success">중복검사</button>
												</div>
											</div>

											<div>
												<div class="col-4 mb-2 pb-2">
													<label class="form-label" for="UserPw">비밀번호<i
														class="bi bi-check-lg mt-2"
														style="color: black; font-size: 18px;"></i><small
														class="text-muted">&nbsp;[8~16자리]</small></label>
													<div class="input-group form-outline">
														<input type="password" id="UserPw" name="UserPw"
															class="form-control form-control-m rounded"
															placeholder="●●●●●●●">
														<button type="button" class="btn btn-outline-success">
															<i class="bi bi-eye-slash" onclick="SeePw(this)"></i>
														</button>


													</div>
												</div>
											</div>

											<div>
												<div class="col-6 mb-2 pb-2">
													<label class="form-label" for="UserNickName">닉네임</label><i
														class="bi bi-check-lg mt-2"
														style="color: black; font-size: 18px;"></i>
													<div class="input-group form-outline">
														<input type="text" id="UserNickName" name="UserNickName"
															class="form-control form-control-m rounded"
															placeholder="2~16자리">
														<button type="button" id="CheckNickName"
															class="btn btn-outline-success">중복검사</button>


													</div>
												</div>
											</div>

											<div class="row g-2">
												<div class="col-md-3 mb-1 pb-1">
													<label class="form-label" for="Birth">생년월일/성별<i
														class="bi bi-check-lg mt-2"
														style="color: black; font-size: 18px;"></i></label>
													<div class="form-outline">
														<input type="text" id="Birth" name="Birth"
															class="form-control form-control-m" />
													</div>

												</div>
												<div class="col-md-1" style="width: 10px;">
													<label class="form-label" for="form3Examplea0"
														style="visibility: hidden;">.</label> <span
														style="font-size: x-large;">-</span>
												</div>
												&nbsp;
												<div class="mb-1 pb-1" style="width: 40px;">
													<div class="form-outline">
														<label class="form-label" for="Gender"
															style="visibility: hidden;">아</label> <input type="text"
															id="Gender" name="Gender"
															class="form-control form-control-m" />
													</div>
												</div>

											</div>
											<div class="row">
												<div class="col-4 mb-4 pb-2">

													<div class="form-outline form-input-inline">
														<label class="form-label" for="Phone_number">휴대폰
															번호<i class="bi bi-check-lg mt-2"
															style="color: black; font-size: 18px;"></i>
														</label> <input type="text" id="Phone_number" name="Phone_number"
															class="form-control form-control-m " placeholder="숫자만 입력" />
													</div>

												</div>

											</div>

											<!-- 거주지  -->
											<div class="row">
												<div class="col-6 mb-2 pb-2">
													<label class="form-label" for="User_addr">거주지역</label><small
														class="text-muted">단위 : 구</small><i
														class="bi bi-check-lg mt-2"
														style="color: black; font-size: 18px;"></i>
													<div class="input-group form-outline">
														<input type="text" id="User_addr" list="addr"
															name="User_addr"
															class="form-control form-control-m rounded"
															placeholder="ex) 서울시 용산구">
														<div id="User_addrRec" class="col-6 form-outline">
														</div>




													</div>
													<div class="col-7">
														<span id="addrErr" style="color: red;"></span>
													</div>
												</div>
											</div>

											<!-- 관심지역 -->
											<div class="row">
												<div class="col-6 mb-2 pb-2">
													<label class="form-label" for="User_IntRegion1">관심지역①<small
														class="text-muted">단위 : 구</small></label><i
														class="bi bi-check-lg mt-2"
														style="color: black; font-size: 18px;"></i>
													<div class="input-group form-outline">
														<input type="text" id="User_IntRegion1"
															name="User_IntRegion" list="User_IntRegion1"
															class="form-control form-control-m rounded"
															placeholder="ex)서울시 서대문구">

														<div id="User_IntRegion1Rec" class="col-2"></div>

													</div>
													<div class="col-7">
														<span id="User_IntRegion1Err" style="color: red;"></span>
														<div class="col-6"></div>
													</div>
												</div>
												<div></div>
												<div class="col-6 mb-2 pb-2">
													<label class="form-label" for="User_IntRegion2">관심지역②<small
														class="text-muted">단위 : 구</small></label><i
														class="bi bi-check-lg mt-2"
														style="color: black; font-size: 18px;"></i>
													<div class="input-group form-outline">
														<input type="text" id="User_IntRegion2"
															name="User_IntRegion" list="User_IntRegion2"
															class="form-control form-control-m rounded"
															placeholder="ex)서울시 서대문구">

														<div id="User_IntRegion2Rec" class="col-2"></div>

													</div>
													<div class="col-7">
														<span id="User_IntRegion2Err" style="color: red;"></span>
														<div class="col-6"></div>
													</div>
												</div>


												<div></div>
												<div class="col-6 mb-2 pb-2">
													<label class="form-label" for="User_IntRegion3">관심지역③<small
														class="text-muted">단위 : 구</small></label><i
														class="bi bi-check-lg mt-2"
														style="color: black; font-size: 18px;"></i>
													<div class="input-group form-outline">
														<input type="text" id="User_IntRegion3"
															name="User_IntRegion" list="User_IntRegion3"
															class="form-control form-control-m rounded"
															placeholder="ex)서울시 서대문구">

														<div id="User_IntRegion3Rec" class="col-2"></div>

													</div>
													<div class="col-7">
														<span id="User_IntRegion3Err" style="color: red;"></span>
														<div class="col-6"></div>
													</div>
												</div>

											</div>



											<br>
											<div class="row justify-content-center">
												<div class="col-2">
													<button class="btn btn-primary" type="submit">다음</button>
												</div>
											</div>

										</form>
										<!-- 폼 끝 -->
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