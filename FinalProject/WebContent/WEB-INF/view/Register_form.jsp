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
		
		/* 거주지  */
		$("#User_addr").keyup(function()
		{
			//alert($(this).attr('id')); 호출한 곳의 iD 알아오기
			$("#addrErr").css("dispaly", "none");
			$("#addrErr").html("");

			if ($.trim($("#User_addr").val()) != "")
			{
				const id = $(this).attr('id');
				addrAjax(id);
				addrCheckAjax(id);

			}

		});

		/* 관심지역 */
		$("#User_IntRegion").keyup(function()
		{
			//alert($(this).attr('id')); //호출한 곳의 iD 알아오기
			$("#User_IntRegionErr").css("dispaly", "none");
			$("#User_IntRegionErr").html("");

			if ($.trim($("#User_IntRegion").val()) != "")
			{
				const id = $(this).attr('id');
				regionAjax(id);
				regionCheckAjax(id);
			}

		});

		/* 지역 에이잭스 처리 */
		function addrAjax(id)
		{
			//alert($("#"+id).val()); //호출한 곳의 id를 받아 입력값 받아오기
			params = "region_name=" + $('#' + id).val();
			$.ajax(
			{

				type : "POST",
				url : "addrList.kkini",
				data : params,
				success : function(args)
				{
					$("#" + id + "Rec").html(args);

				},
				beforeSend : showRequest,
				error : function(e)
				{
					alert(e.responseText);

				}
			});

		}

		/* 지역 에이잭스 처리 */
		function regionAjax(id)
		{
			//alert($("#"+id).val()); //호출한 곳의 id를 받아 입력값 받아오기
			params = "region_name=" + $('#' + id).val();
			$.ajax(
			{

				type : "POST",
				url : "regionList.kkini",
				data : params,
				success : function(args)
				{

					$("#User_addrRec").html(args);

				},
				beforeSend : showRequest,
				error : function(e)
				{
					alert(e.responseText);

				}
			});

		}

		/* 	
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

			}); */

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

		var index = 0

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
					newInput.setAttribute("name", "User_IntRegion");
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

	/*
	입력값 유효성 검사
	 */
	function check()
	{

		$("#idCheck").css("display", "none");
		$("#pwCheck").css("display", "none");
		$("#phoneCheck").css("display", "none");
		$("#nicknameCheck").css("display", "none");
		$("#birthgenderCheck").css("display","none");

		
		
		/* 아이디  */

		/* 중복검사 실행 등록필요 */
		
		if(!$("#CheckId").hasClass("approve") && $.trim($("#UserId").val())!="")
			{
			alert("아이디 중복검사를 실행해주세요");
			$("#idCheck").css("display", "inline");
			return false;
			}
		
		if(!$("#CheckNickName").hasClass("approve") && $.trim($("#UserNickName").val())!="")
			{
			alert("닉네임 중복검사를 실행해주세요");
			$("#nicknameCheck").css("display", "inline");
			return false;
			}
		
		
		/* 직접 입력했을때 */
		if ($.trim($("#emailDirect").val()) != "")
		{

			const id = $("#UserId").val() + "@" + $("#emailDirect").val();

			if ($.trim($("#UserId").val()) == ""
					|| !/^([a-z0-9\-]+\.)+[a-z]{2,6}$/.test($("#emailDirect")
							.val())
					|| !/^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/.test(id))
			{
				$("#idCheck").css("display", "inline");
				$("#idCheck").html("아이디 확인해주세요");
				$("#UserId").focus();
				return false;
			}

		}

		/* select 사용했을때 */

		else if ($.trim($("#emailDirect").val()) == "")
		{
			const id = $("#UserId").val() + "@" + $("#email").val();

			if ($.trim($("#UserId").val()) == ""
					|| !/^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/.test(id))
			{
				$("#idCheck").css("display", "inline");
				$("#idCheck").html("아이디 확인해주세요");
				$("#UserId").focus();
				return false;
			}

		}
		
		
		//아이디 중복검사 실패시
		
				
		if($("#idCheck").html()=="사용중인 아이디입니다.")
		{
		alert("사용중인 아이디로는 회원가입이 불가능합니다.");
		$("#idCheck").css("display", "inline");
		return false;
		}
		
		

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
		
		if($("#nicknameCheck").html()=="사용중인 닉네임입니다.")
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


		
		/* 생년원일 */
		const birthgender = $("#Birth").val() + "-" + $("#Gender").val();
		
		const age = calAge(birthgender);
		
		
		
		if (!/^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4]{1}$/.test(birthgender))
		{
			$("#birthgenderCheck").css("display","inline");
			$("#birthgenderCheck").html("생년월일 확인");
			$("#Birth").focus();
			return false;

		}
		
		/* 미성년자 가입 불가 */
		
		
		if(age<20)
		{
			alert("미성년자는 가입 불가능합니다.");
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
		
		if($("#addrErr").html()=="유효하지 않은 지역입니다." || $.trim($("#User_addr").val())=="" )
			{
			$("#addrErr").css("display","inline");
			$("#User_addr").focus();
			return false;
			}
		/* 관심지역 등록안하면 못넘어가게 */
		
		if($("#addInput").children().hasClass("removeInput")==false)
		{
		alert("관심지역은 1개이상 등록해야합니다.");
		$("#User_IntRegion").focus();
		return false;
		}
		
		
		

	}
	
	
	function idOverlapCheck()
	{
		$("#idCheck").css("display","none");
		
		
		
		let id="";
		
		if($("#email").val()=="direct")
			{
			id = $("#UserId").val()+"@"+$("#emailDirect").val();
			
			//alert(id);
			
			}
		else
			{
			id= $("#UserId").val()+"@"+$("#email").val();
			}
		
		
		$.post("idOverlapCk.kkini",{id:id}, function(args)
		{
			if(args==1)
				{
			alert("이미 사용중인 아이디입니다.");
			$("#idCheck").html("사용중인 아이디입니다.");
			$("#idCheck").css("display","inline");
			$("#CheckId").addClass("not-approve");
			$("#CheckId").removeClass("approve");
			$("#UserId").focus();
				}		
			else
				{
				alert("사용가능한 아이디입니다.");
				$("#idCheck").html("");
				$("#idCheck").css("display","none");
				$("#CheckId").removeClass("not-approve");
				$("#CheckId").addClass("approve");
				$("#UserPw").focus();
				}
		});
		
	}
	
	
	function calAge(jumin)
	{
		
		jumin = jumin.replace("-","");
		
		let today = new Date();	// 현재 날짜 및 시간

		let juminFront = jumin.substr(0,6); // 주민번호앞자리
		let juminBackFirstVal = jumin.substr(6,1); //주민번호뒷자리 첫 문자열(2000년도 이전생인지 확인)

		let age = 0;
		let birthDate = null;
		let juminYear = null;
		let juminMonth = jumin.substr(2,2);//10
		let juminDate = jumin.substr(4,2);//03
		
		let monthCheck = 0;

		if(juminBackFirstVal == 1 || juminBackFirstVal == 2){
			// 2000년생 이전일 경우
			juminYear = "19" + jumin.substr(0,2);//93~~

			//Month는 0부터 시작하기 때문에 -1 처리해야
			birthDate = new Date(juminYear*1, juminMonth-1, juminDate*1);
			
			// 현재 연도에서 - 태어난 연도
			age = today.getFullYear() - birthDate.getFullYear();

			// 현재 월에서 - 태어난 월
			monthCheck = today.getMonth() - birthDate.getMonth();

			// 생일 월이 현재 월을 지나지 않았을 경우 만 나이기 때문에 -1
			if(monthCheck < 0 || (monthCheck === 0 && today.getDate() < birthDate.getDate())){
				age--;
			}
		}else{
			// 2000년생 이후
			juminYear = "20" + jumin.substr(0,2);//01~~
			
			birthDate = new Date(juminYear*1, juminMonth-1, juminDate*1);
			
			age = today.getFullYear() - birthDate.getFullYear();

			monthCheck = today.getMonth() - birthDate.getMonth();

			if(monthCheck < 0 || (monthCheck === 0 && today.getDate() < birthDate.getDate())){
				age--;
			}
		}
		
		
		return age;
	}
	
	
	function nickNameOverlapCheck()
	{
		
		
		
		$.post("nickNameOverlapCk.kkini",{nickname:$("#UserNickName").val()}, function(args)
				{
					if(args==1)
						{
					alert("이미 사용중인 닉네임입니다.");
					$("#nicknameCheck").html("사용중인 닉네임입니다.");
					$("#nicknameCheck").css("display","inline");
					$("#CheckNickName").addClass("not-approve");
					$("#CheckNickName").removeClass("approve");
					$("#UserNickName").focus();
						}
					else
						{
						alert("사용가능한 닉네임입니다.");
						$("#nicknameCheck").html("");
						$("#nicknameCheck").css("display","none");
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
										<form action="regist_Alignment.kkini" method="post"
											onsubmit="return check()">
											<h3 class="fw-normal mb-4" style="color: #FFA500;">
												회원 정보 <small style="font-size: small; color: gray;">
													<i class="bi bi-check-lg"></i>는 필수사항입니다.
												</small>
											</h3>
											<div class="row g-1">
												<div class="col-4 mb-2 pb-2">

													<label class="form-label" for="UserId">아이디</label> <span
														id="idCheck" style="color: red; display: none;"></span>

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
													<label class="form-label" for="CheckId"
														style="visibility: hidden;">.</label><br>
													<button type="button" id="CheckId"
														class="btn btn-outline-success" onclick="idOverlapCheck()">중복검사</button>
												</div>

											</div>

											<div>
												<div class="col-5 mb-2 pb-2">
													<label class="form-label" for="UserPw">비밀번호<span
														id="pwCheck" style="color: red; display: none;"></span>
													</label>
													<div class="input-group form-outline">
														<input type="password" id="UserPw" name="UserPw"
															class="form-control form-control-m rounded"
															placeholder="문자,숫자,특수문자 8~16자리">
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
														<input type="text" id="UserNickName" name="UserNickName"
															class="form-control form-control-m rounded"
															placeholder="2~16자리">
														<button type="button" id="CheckNickName"
															class="btn btn-outline-success" onclick="nickNameOverlapCheck()">중복검사</button>


													</div>
												</div>
											</div>

											<div class="row g-2">
												<div class="col-md-3 mb-1 pb-1">
													<label class="form-label" for="Birth">생년월일<span
														id="birthgenderCheck" style="color: red; display: none; font-size: small;"></span></label>
													<div class="form-outline">
														<input type="text" id="Birth" name="Birth" maxlength="6" placeholder="ex)940601"
															class="form-control form-control-m" />
													</div>

												</div>
												<div class="col-md-1" style="width: 10px;">
													<label class="form-label" for="form3Examplea0"
														style="visibility: hidden;">.</label> <span
														style="font-size: x-large;">-</span>
												</div>
												&nbsp;
												<div class="mb-1 pb-1" style="width: 45px;">
													<div class="form-outline">
														<label class="form-label" for="Gender"
															>성별</label> <input type="text"
															id="Gender" name="Gender" maxlength="1"
															class="form-control form-control-m" />
													</div>
												</div>

											</div>
											<div class="row">
												<div class="col-5 mb-4 pb-2">

													<div class="form-outline form-input-inline">
														<label class="form-label" for="Phone_number">휴대폰
															번호<span id="phoneCheck"
															style="color: red; display: none;"></span>
														</label> <input type="text" id="Phone_number" name="Phone_number"
															maxlength="11" class="form-control form-control-m "
															placeholder="숫자만 입력" />
													</div>

												</div>

											</div>

											<!-- 거주지  -->
											<div class="row">
												<div class="col-6 mb-2 pb-2">
													<label class="form-label" for="User_addr">거주지역<small
														class="text-muted">단위 : 구</small>&nbsp;<span
														id="addrCheck" style="color: red; display: none;"></span></label>
													<div class="input-group form-outline">
														<input type="text" id="User_addr" list="addr"
															name="User_addr"
															class="form-control form-control-m rounded"
															placeholder="ex) 서울시 용산구">
														<div id="User_addrRec" class="col-6 form-outline"></div>

													<div class="col-7">
														<span id="addrErr" style="color: red;"></span>
													</div>


													</div>
													
												</div>
											</div>

											<!-- 관심지역 -->
											<div class="row">
												<div class="col-5 mb-2 pb-2">
													<label class="form-label" for="User_IntRegion">관심지역<small
														class="text-muted">단위 : 구</small>&nbsp;<span
														id="regionCheck" style="color: red; display: none;"></span></label>
													<div class="input-group form-outline">
														<input type="text" id="User_IntRegion"
															name="add_IntRegion" list="region"
															class="form-control form-control-m rounded"
															placeholder="ex)서울시 서대문구">
														
														<button type="button" id="AddInt"
															class="btn btn-outline-success">추가</button>
													    
													    
													    

													</div>
													<div >
														<span id="User_IntRegionErr" style="color: red;"></span>
														<div class="col-6"></div>
													</div>

												</div>
											</div>
											<div>
												<div id="addInput"></div>
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






