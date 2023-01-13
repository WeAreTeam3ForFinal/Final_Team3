<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>

<% /* 에이잭스로 할게아니었음 */
String user_id = request.getParameter("UserId");
String user_email = request.getParameter("email");
String emailDirect = request.getParameter("emailDirect");


if(user_email == null)
{
	user_id += "@"+emailDirect;
}
else
{
	user_id += "@"+user_email;
}


String user_nickname = request.getParameter("UserNickName");
String user_pw = request.getParameter("UserPw");
String user_birth = request.getParameter("Birth");
String user_gender = request.getParameter("Gender");
String user_addr = request.getParameter("User_addr");
String user_phonenumber = request.getParameter("Phone_number");
String[] user_intregion = request.getParameterValues("User_IntRegion");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입-식사 성향입력</title>
</head>
<link rel="stylesheet" type="text/css" href="./assets/css/register.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<body>


<<<<<<< Updated upstream
	<section class="h-100 h-custom">
		<div class="container py-5 h-100">
			<div class="row d-flex justify-content-center h-100">
				<img alt="로고" src="./assets/images/logo.jpeg"
					style="width: 300px; align-items: flex-end;">
				<div class="col-12">
					<div class="card card-registration card-registration-2"
						style="border-radius: 15px;">

						<div class="card-body p-0">
							<div class="row g-0" style="justify-content: center;">
								<div class="col-lg-10 bg-indigo text-white">
									<div class="px-5 pt-5 pb-1">
									<form action="user_register.kkini" method="post">
										<h3 class="fw-normal mb-5">성향 입력</h3>

										<!-- 식사속도 -->
										<div class="col-md-7 mb-4">

											<h6 class="mb-2 pb-1">밥을 얼마나 빨리드시나요?</h6>
											<c:forEach var="speedList" items="${speedList }">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="user_eatSpeed" id="${speedList.CODE}" value="${speedList.CODE}"
													/> <label class="form-check-label"
													for="${speedList.CODE}">${speedList.U_SPEED}</label>
											</div>
											</c:forEach>
										</div>
										
										
										<!-- 식사중 대화량 -->
										<div class="col-md-7 mb-4">

											<h6 class="mb-2 pb-1">식사중 대화는 얼마나 하세요?</h6>
											<c:forEach var="talkList" items="${talkList }">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="user_talk" id="${talkList.CODE}" value="${talkList.CODE}"
													checked /> <label class="form-check-label"
													for="${talkList.CODE}">${talkList.AMOUNT}</label>
											</div>

										   </c:forEach>
										</div>


										<!-- 성격유형 -->
										<div class="col-md-7 mb-4">
										<h6 class="mb-2 pb-1">성격유형</h6>
										<c:forEach var="chaList" items="${chaList }">
										<div class="form-check form-check-inline">
												<input class="form-check-input" type="checkbox"
													name="user_character" id="${chaList.CHA_TYPE_CODE}" value="${chaList.CHA_TYPE_CODE}" />
												<label class="form-check-label" for="${chaList.CHA_TYPE_CODE}">${chaList.CHA}</label>
											</div>
										
										</c:forEach>
										</div>
										
										<!-- 관심사 -->
										<!-- 전체선택 필요한가? -->
										<div class="col-md-7 mb-4">
										<h6 class="mb-2 pb-1">관심사</h6>
										<c:forEach var="intList" items="${intList }">
										<div class="form-check form-check-inline">
												<input class="form-check-input" type="checkbox"
													name="user_interest" id="${intList.CODE}" value="${intList.CODE}" />
												<label class="form-check-label" for="${intList.CODE}">${intList.INTER}</label>
											</div>
										
										</c:forEach>
										</div>
										
										
										<!-- 자기소개 -->


										<div class="col-8 mb-4 pb-2 ">
											<div class="form-outline form-white">
													<label class="form-label" for="User_introduce">자기 소개</label>
												<textarea rows="5" cols="20" id="User_introduce" name="user_introduce"  class="form-control form-control-lg" style="font-size: medium;"></textarea> 
											</div>
										</div>



												
										<div class="row justify-content-center">
											<div class="col-2 ">
										<button type="submit" class="btn btn-light btn-lg "
											data-mdb-ripple-color="dark">회원가입</button>
											</div>
										</div>
										
										
										<input type="hidden"  name="user_id" value="<%=user_id %>">
										<input type="hidden"  name="user_nickname" value="<%=user_nickname %>">
										<input type="hidden"  name="user_pw" value="<%= user_pw %>">
										<input type="hidden"  name="user_birth" value="<%=user_birth %>">
										<input type="hidden"  name="user_gender" value="<%=user_gender %>">
										<input type="hidden"  name="user_addr" value="<%=user_addr %>">
										<input type="hidden"  name="user_phonenumber" value="<%=user_phonenumber %>">
									
										<%
										for(int i=0; i<user_intregion.length;i++)
										{
										%>
									
										<input type="hidden"  name="user_intregion" value="<%=user_intregion[i] %>">
										<%
										}
										%>
										
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
=======
<section class="h-100 h-custom">
  <div class="container py-5 h-100">
    <div class="row d-flex align-items-center h-100">
      <div class="col-12">
        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
        
          <div class="card-body p-0">
            <div class="row g-0" style="justify-content: center;">
              <div class="col-lg-10 bg-indigo text-white">
                <div class="p-5">
                  <h3 class="fw-normal mb-5"><%= %></h3>

                  <div class="mb-4 pb-2">
                    <div class="form-outline form-white">
                      <input type="text" id="form3Examplea2" class="form-control form-control-lg" />
                      <label class="form-label" for="form3Examplea2">Street + Nr</label>
                    </div>
                  </div>

                  <div class="mb-4 pb-2">
                    <div class="form-outline form-white">
                      <input type="text" id="form3Examplea3" class="form-control form-control-lg" />
                      <label class="form-label" for="form3Examplea3">Additional Information</label>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-5 mb-4 pb-2">

                      <div class="form-outline form-white">
                        <input type="text" id="form3Examplea4" class="form-control form-control-lg" />
                        <label class="form-label" for="form3Examplea4">Zip Code</label>
                      </div>

                    </div>
                    <div class="col-md-7 mb-4 pb-2">

                      <div class="form-outline form-white">
                        <input type="text" id="form3Examplea5" class="form-control form-control-lg" />
                        <label class="form-label" for="form3Examplea5">Place</label>
                      </div>

                    </div>
                  </div>

                  <div class="mb-4 pb-2">
                    <div class="form-outline form-white">
                      <input type="text" id="form3Examplea6" class="form-control form-control-lg" />
                      <label class="form-label" for="form3Examplea6">Country</label>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-5 mb-4 pb-2">

                      <div class="form-outline form-white">
                        <input type="text" id="form3Examplea7" class="form-control form-control-lg" />
                        <label class="form-label" for="form3Examplea7">Code +</label>
                      </div>

                    </div>
                    <div class="col-md-7 mb-4 pb-2">

                      <div class="form-outline form-white">
                        <input type="text" id="form3Examplea8" class="form-control form-control-lg" />
                        <label class="form-label" for="form3Examplea8">Phone Number</label>
                      </div>

                    </div>
                  </div>

                  <div class="mb-4">
                    <div class="form-outline form-white">
                      <input type="text" id="form3Examplea9" class="form-control form-control-lg" />
                      <label class="form-label" for="form3Examplea9">Your Email</label>
                    </div>
                  </div>
                  
      
      <!-- radio 버튼  -->            
                    <div class="col-md-6 mb-4">

                  <h6 class="mb-2 pb-1">Gender: </h6>

            <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="femaleGender"
                      value="option1" checked />
                    <label class="form-check-label" for="femaleGender">Female</label>
                  </div>

                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="maleGender"
                      value="option2" />
                    <label class="form-check-label" for="maleGender">Male</label>
                  </div>

                </div>

                  <div class="form-check d-flex justify-content-start mb-4 pb-3">
                    <input class="form-check-input me-3" type="checkbox" value="" id="form2Example3c" />
                    <label class="form-check-label text-white" for="form2Example3">
                      I do accept the <a href="#!" class="text-white"><u>Terms and Conditions</u></a> of your
                      site.
                    </label>
                  </div>

                  <button type="button" class="btn btn-light btn-lg"
                    data-mdb-ripple-color="dark">Register</button>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
>>>>>>> Stashed changes
</body>
</html>