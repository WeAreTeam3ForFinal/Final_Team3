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
<title>회원정보수정</title>
</head>
<link rel="stylesheet" type="text/css" href="./assets/css/register.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />

<!-- 비밀번호 눈 -->
<link rel=”stylesheet”
	href=”https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css” />
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
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

		$("#UserId").keyup(function()
		{
			$("#CheckId").addClass("not-approve");
			$("#CheckId").removeClass("approve");
		});

		$("#UserNickName").keyup(function()
		{

			$("#CheckNickName").addClass("not-approve");
			$("#CheckNickName").removeClass("approve");

		});

		/*
		// 입력된 데이터가 DB데이터와 같은지 확인 
		function regionCheckAjax(id)
		{
			params = "region_name=" + $('#' + id).val();

			$.ajax(
			{

				type : "POST",
				url : "",
				data : params,
				success : function(args)
				{
					$("#" + id + "Err").css("dispaly", "inline");
					$("#" + id + "Err").html($.trim(args));
					
					if($.trim(args)=="유효하지 않은 지역입니다.")
						{
					$("#AddInt").attr("disabled", true);
						}
					else
						{
					$("#AddInt").attr("disabled", false);
						}
				},
				beforeSend : showRequest,
				error : function(e)
				{
					alert(e.responseText);

				}
			});

		}

		// 입력된 데이터가 DB데이터와 같은지 확인 
		function addrCheckAjax(id)
		{
			params = "region_name=" + $('#' + id).val();

			$.ajax(
			{

				type : "POST",
				url : "",
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
		 */

		var index = $("#tmpIndex").val();

		$("#AddInt").click(
				
				
				function()
				{
					if (index == 3)
					{
						alert("최대 개수는 3개입니다.")
						return false;
					}

					var addRegDiv = document.getElementById("addInput");
					addRegDiv.setAttribute("class", "newDiv col-12");

					var newInput = document.createElement("input");
					newInput.setAttribute("id", "newInput" + index);
					newInput.setAttribute("name", "user_intregions");
					newInput.setAttribute("type", "text");
					newInput.setAttribute("readonly", "readonly");
					newInput.setAttribute("class",
							"form-control form-control-m rounded d-inline");
					newInput.setAttribute("style", "width:150px;")
					newInput.setAttribute("value", $("#User_IntRegion").val());

					var removeInput = document.createElement("label");
					removeInput.setAttribute("for", "newInput" + index);
					removeInput.setAttribute("class", "removeInput");
					removeInput.setAttribute("name", "newInput" + index);
					removeInput.textContent = "X\u00a0\u00a0\u00a0";

					addRegDiv.append(newInput);
					addRegDiv.append(removeInput);
					index += 1

				});
		/* 리셋버튼 추가 */
		$(document).on("click", ".removeInput", function()
		{
			const id = $(this).attr("name");
			$("#" + id).remove();
			$(this).remove();
			index -= 1;

		});
		
		$("#cancel").click(function()
		{
			location.replace("myPage.kkini");
		});
		
	});

	

	/*
	입력값 유효성 검사
	 */
	function check()
	{

		$("#idCheck").css("display", "none");
		$("#pwCheck").css("display", "none");
		$("#phoneCheck").css("display", "none");
		$("#nicknameCheck").css("display", "none");
		$("#birthgenderCheck").css("display", "none");

		/* 비밀번호 */

		if ($.trim($("#UserPw").val()) == ""
				|| !/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/
						.test($("#UserPw").val()))
		{
			$("#pwCheck").css("display", "inline");
			$("#pwCheck").html("비밀번호를 확인해주세요");
			$("#UserPw").focus();
			return false;
		}

		/*닉네임  */

		/* 닉네임 중복검사 실행 */

		if ($("#nicknameCheck").html() == "사용중인 닉네임입니다.")
		{
			alert("사용중인 닉네임은 사용할 수 없습니다.");
			$("#nicknameCheck").css("display", "inline");
			return false;
		}

		if (!/^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,16}$/.test($("#UserNickName").val())
				|| $.trim($("#UserNickName").val()) == "")
		{
			$("#nicknameCheck").css("display", "inline");
			$("#nicknameCheck").html("닉네임 확인해주세요");
			$("#UserNickName").focus();
			return false;
		}

		/* 전화번호 */
		if (!/^[0-9]{11}$/.test($("#Phone_number").val())
				|| $.trim($("#Phone_number").val()) == "")
		{
			//alert("숫자가 아닙니다.");
			$("#phoneCheck").css("display", "inline");
			$("#phoneCheck").html(" 번호를 확인해주세요");
			$("#Phone_number").focus();
			return false;
		}

		/* 거주지역 */

		if ($.trim($("#User_addr").val()) == "")
		{
			$("#addrErr").css("display", "inline");
			$("#addrErr").html("거주지역을 입력해주세요");
			$("#User_addr").focus();
			return false;
		}
		/* 관심지역 등록안하면 못넘어가게 */

		if ($("#addInput").children().hasClass("removeInput") == false)
		{
			alert("관심지역은 1개이상 등록해야합니다.");
			$("#User_IntRegion").focus();
			return false;
		}

	}

	function nickNameOverlapCheck()
	{
		
		$.post("nickNameOverlapCk.kkini",
		{
			nickname : $("#UserNickName").val()
		}, function(args)
		{
			if (args == 1 && $("#tmpNickName").val() != $("#UserNickName").val())
			{
				alert("이미 사용중인 닉네임입니다.");
				$("#nicknameCheck").html("사용중인 닉네임입니다.");
				$("#nicknameCheck").css("display", "inline");
				$("#CheckNickName").addClass("not-approve");
				$("#CheckNickName").removeClass("approve");
				$("#UserNickName").focus();
			} else
			{
				alert("사용가능한 닉네임입니다.");
				$("#nicknameCheck").html("");
				$("#nicknameCheck").css("display", "none");
				$("#CheckNickName").removeClass("not-approve");
				$("#CheckNickName").addClass("approve");
				$("#Birth").focus();
			}
		});

	}

</script>

<body>

	<section class="h-100 h-custom">
		<div class="container py-5 h-100" style="width: 800px;">
			<div class="row d-flex justify-content-center h-100">
				<div class="col-12">
					<div class="card card-registration card-registration-2"
						style="border-radius: 15px;">

						<div class="card-body p-0">
							<div class="row g-1">
								<div class="col-lg-12">
									<div class="px-5 pt-5 pb-1">

										<!-- 폼 시작 -->
										<form action="updateprivateinfo.kkini" method="post"
											onsubmit="return check()">
											<h3 class="fw-normal mb-4" style="color: #FFA500;">
											</h3>
											<div class="row g-1">
												<div class="col-4 mb-2 pb-2">
													<label class="form-label" for="UserId">아이디</label> <span
														id="idCheck" style="color: red; display: none;"></span>
														<div class="input-group form-outline">
															<input type="text" value="${user_id }" class="form-control form-control-m rounded" disabled="disabled" />
														</div>
												</div>
											</div>

											<div>
												<div class="col-5 mb-2 pb-2">
													<label class="form-label" for="UserPw">비밀번호<span
														id="pwCheck" style="color: red; display: none;"></span>
													</label>
													<div class="input-group form-outline">
														<input type="password" id="UserPw" name="user_pw"
															class="form-control form-control-m rounded"
															placeholder="문자,숫자,특수문자 8~16자리" value="${user_pw }">
														<button type="button" class="btn btn-outline-success">
															<i class="bi bi-eye-slash" onclick="SeePw(this)"></i>
														</button>
														
													</div>
												</div>
											</div>

											<div>
												<div class="col-6 mb-2 pb-2">
													<label class="form-label" for="UserNickName">닉네임</label> <span
														id="nicknameCheck" style="color: red; display: none;"></span>
													<div class="input-group form-outline">
														<input type="text" id="UserNickName" name="nickName"
															class="form-control form-control-m rounded"
															placeholder="2~16자리" value="${nickName }">
														<button type="button" id="CheckNickName"
															class="btn btn-outline-success"
															onclick="nickNameOverlapCheck()">중복검사</button>
														<input type="text" id="tmpNickName" hidden="hidden" value="${nickName }"/>


													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-5 mb-4 pb-2">

													<div class="form-outline form-input-inline">
														<label class="form-label" for="Phone_number">휴대폰
															번호<span id="phoneCheck"
															style="color: red; display: none;"></span>
														</label> <input type="text" id="Phone_number" name="user_phonenumber"
															maxlength="11" class="form-control form-control-m "
															placeholder="숫자만 입력" value="${user_phonenumber }"/>
													</div>

												</div>

											</div>

											<!-- 거주지  -->
											<div class="row">
												<div class="col-12 mb-1 pb-1">거주지역</div>
												<div class="col-5 mb-2 pb-2">
													<div class="input-group form-outline">
														<input type="text" id="User_addr" name="user_addr"
															class="form-control form-control-m rounded"
															placeholder="ex) 서울시 용산구" readonly="readonly" value="${user_addr }">
														<button type="button" class="btn btn-outline-success" id="loadAddrModal"
															data-bs-toggle="modal" data-bs-target="#regionModal">찾기</button>
													</div>
												</div>
												<br>


												<div class="col-7">
													<span id="addrErr" style="color: red;"></span>
												</div>
												<div>
													<jsp:include page="regionSearchModal.jsp"></jsp:include>
												</div>





											</div>
											<br>

											<!-- 관심지역 -->
											<div class="row">
												<div class="col-6 mb-2 pb-2">
													<label class="form-label" for="intregions">관심지역<small
														class="text-muted">단위 : 구</small>
													</label>
													<div class="input-group form-outline">
														<input type="text" id="User_IntRegion"
															name="user_intregions"
															readonly="readonly"
															class="form-control form-control-m rounded"
															placeholder="ex)서울시 서대문구">
														<button type="button" class="btn btn-outline-success" id="loadIntModal"
															data-bs-toggle="modal" data-bs-target="#IntregionModal">찾기</button>
														<button type="button" id="AddInt"
															class="btn btn-outline-success">추가</button>
													</div>
													<div>
														<span id="User_IntRegionErr" style="color: red;"></span>
														<div class="col-6"></div>
													</div>

												</div>
											</div>
											<div>
													<jsp:include page="IntregionSearchModal.jsp"></jsp:include>
												</div>
											<div>
												<div id="addInput">
												<c:set var="i" value="1"></c:set>
												<c:forEach var="intregion" items="${intregions }">
													<input id="newInput${i }" name="user_intregions" type="text" readonly="readonly" class="form-control form-control-m rounded d-inline"
													 style="width:150px;" value="${intregion }">
													 <label for="newInput${i }" class="removeInput" name="newInput${i }">X&nbsp;&nbsp;&nbsp;</label>
													 <c:set var="i" value="${i+1 }"></c:set>
												</c:forEach>
												<input type="text" value="${i-1 }" id="tmpIndex" style="display: none;"/>
												</div>
											</div>
											<br>
											<div class="row justify-content-center">
												<div class="col-3">
													<button class="btn btn-primary" type="submit" id="update">수정</button> 
													<button class="btn btn-danger" type="button" id="cancel">취소</button>
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






