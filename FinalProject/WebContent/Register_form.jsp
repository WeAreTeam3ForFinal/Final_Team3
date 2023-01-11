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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
<!-- 비밀번호 눈 -->
<link rel=”stylesheet” href=”https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css” />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">



function SeePw(eye) {
	  var x = document.getElementById("UserPw");
	  if (x.type == "password") {
	    x.type = "text";
	    eye.className = "bi-eye";
	  } else {
	    x.type = "password";
	    eye.className = "bi-eye-slash";
	  }
	}
	
	
	$(function()
	{
		
		$("#User_addr").keyup(function()
		{
			
			
		});
	});
	
	
	
	/* 지역 에이잭스 처리 */
	function regionAjax()
	{
		
		
	}
	


</script>

<body>


<section class="h-100 h-custom">
  <div class="container py-5 h-100" style="width: 800px;">
    <div class="row d-flex justify-content-center h-100">
    <img alt="로고" src="./assets/images/logo.jpeg" style="width: 200px; align-items: flex-end;">
      <div class="col-12">
        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
        
          <div class="card-body p-0">
            <div class="row g-1">
              <div class="col-lg-12" >
                <div class="px-5 pt-5 pb-1"  >
               
               <!-- 폼 시작 -->
                <form action="Register_Alignment_form.jsp" method="post">
                  <h3 class="fw-normal mb-4" style="color: #FFA500;">회원 정보 <small style="font-size: small; color: gray;"> <i class="bi bi-check-lg"></i>는 필수사항입니다.</small>  </h3>
                  <div class="row g-1">
                    <div class="col-4 mb-2 pb-2">

                        <label class="form-label" for="UserId">아이디</label><i class="bi bi-check-lg mt-2" style="color: red; font-size: 18px;"></i>
                      <div class="input-group form-outline">
                        <input type="text" id="UserId"  name="UserId" class="form-control form-control-m" placeholder="2~16자"/>
                        <span class="mt-2 mx-1">@</span>
                       
                      </div>
                    </div>
                    <div class="col-3 mb-2 pb-2">
                    <label class="form-label" for="email" style="visibility: hidden;">.</label>
                     <select class="form-select" id="email">
                        <option>gmail.com</option>
                        </select>
                        
                    </div>
                    </div>
					
					<div>
						<div class="col-4 mb-2 pb-2">
						<label class="form-label" for="UserPw">비밀번호<i class="bi bi-check-lg mt-2" style="color: green; font-size: 18px;"></i><small class="text-muted">&nbsp;[8~16자리]</small></label>
						<div class="input-group form-outline">
						<input type="password" id="UserPw" name="UserPw" class="form-control form-control-m rounded" placeholder="●●●●●●●">
						<button type="button" class="btn btn-outline-success"><i class="bi bi-eye-slash" onclick="SeePw(this)"></i></button>
						
						
						</div>
						</div>
					</div>
					
					<div>
						<div class="col-6 mb-2 pb-2">
						<label class="form-label" for="UserNickName">닉네임</label><i class="bi bi-check-lg mt-2" style="color: green; font-size: 18px;"></i>
						<div class="input-group form-outline">
						<input type="text" id="UserNickName" name="UserNickName" class="form-control form-control-m rounded" placeholder="2~16자리">
                        <button type="button" id="CheckNickName" class="btn btn-outline-success">중복검사</button>
						
						
						</div>
						</div>
					</div>				
				
				 <div class="row g-2">
                    <div class="col-md-3 mb-1 pb-1">
                        <label class="form-label" for="Birth">생년월일/성별<i class="bi bi-check-lg mt-2" style="color: green; font-size: 18px;"></i></label>
                      <div class="form-outline">
                        <input type="text" id="Birth" name="Birth" class="form-control form-control-m" />
                      </div>
					
                    </div>
                    <div class="col-md-1" style="width: 10px;">
                    <label class="form-label" for="form3Examplea0" style="visibility: hidden;" >.</label>
                    <span style="font-size: x-large;">-</span>
                    </div>
                    &nbsp;
                    <div class="mb-1 pb-1" style="width: 40px;">
                      <div class="form-outline">
                        <label class="form-label" for="Gender" style="visibility: hidden;" >아</label>
                        <input type="text" id="Gender" name="Gender" class="form-control form-control-m" />
                      </div>

                    </div>
                  </div>	
                  <div class="row">
                    <div class="col-4 mb-4 pb-2">

                      <div class="form-outline form-input-inline">
                        <label class="form-label" for="Phone_number">휴대폰 번호<i class="bi bi-check-lg mt-2" style="color: green; font-size: 18px;"></i></label>
                        <input type="text" id="Phone_number" name="Phone_number" class="form-control form-control-m " placeholder="숫자만 입력"/>
                      </div>

                    </div>
                   
                  </div>
                  
                  
                  <!-- 거주지  -->
                  <div class="row">
						<div class="col-6 mb-2 pb-2">
						<label class="form-label" for="User_addr">거주지역</label><i class="bi bi-check-lg mt-2" style="color: green; font-size: 18px;"></i>
						<div class="input-group form-outline">
						<input type="text" id="User_addr" class="form-control form-control-m rounded" placeholder="ex) 서울시 용산구">
                        <button type="button" id="Add_addr" class="btn btn-outline-success">등록</button>
						
						
						</div>
						</div>
					</div>	
                  
                  <!-- 관심지역 -->
                  <div class="row">
						<div class="col-6 mb-2 pb-2">
						<label class="form-label" for="User_IntRegion">관심지역</label><i class="bi bi-check-lg mt-2" style="color: green; font-size: 18px;"></i>
						<div class="input-group form-outline">
						<input type="text" id="User_IntRegion" class="form-control form-control-m rounded" placeholder="ex)서울시 서대문구">
                        <button type="button" id="Add_IntRegion" class="btn btn-outline-success">추가</button>
							
						
						</div>
						</div>
					</div>	
                  
                  
                 <br>
                  <div class="row justify-content-center">
                  <div class="col-2">
                  <button class="btn btn-primary" type="submit" onsubmit="Check()">다음</button>
                  </div>
                  </div>
                  
				</form> <!-- 폼 끝 -->
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