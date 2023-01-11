<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>

<%
	String user_id = request.getParameter("UserId");
String user_email = request.getParameter("email");
String emailDirect = request.getParameter("emailDirect");
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
										<h3 class="fw-normal mb-5">성향 입력</h3>

										<!-- 식사속도 -->
										<div class="col-md-7 mb-4">

											<h6 class="mb-2 pb-1">식사속도</h6>

											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="femaleGender" value="option1"
													checked /> <label class="form-check-label"
													for="femaleGender">매우 빠른편</label>
											</div>

											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="maleGender" value="option2" />
												<label class="form-check-label" for="maleGender">빠른편</label>
											</div>
											
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="maleGender" value="option2" />
												<label class="form-check-label" for="maleGender">보통</label>
											</div>
											
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="maleGender" value="option2" />
												<label class="form-check-label" for="maleGender">느린편</label>
											</div>
											
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="maleGender" value="option2" />
												<label class="form-check-label" for="maleGender">매우 느린편</label>
											</div>

										</div>
										
										
										<!-- 식사중 대화량 -->
										<div class="col-md-7 mb-4">

											<h6 class="mb-2 pb-1">식사속도</h6>

											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="femaleGender" value="option1"
													checked /> <label class="form-check-label"
													for="femaleGender">매우 빠른편</label>
											</div>

											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="maleGender" value="option2" />
												<label class="form-check-label" for="maleGender">빠른편</label>
											</div>
											
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="maleGender" value="option2" />
												<label class="form-check-label" for="maleGender">보통</label>
											</div>
											
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="maleGender" value="option2" />
												<label class="form-check-label" for="maleGender">느린편</label>
											</div>
											
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="maleGender" value="option2" />
												<label class="form-check-label" for="maleGender">매우 느린편</label>
											</div>

										</div>





										<div class="mb-4 pb-2">
											<div class="form-outline form-white">
												<input type="text" id="form3Examplea2"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form3Examplea2">Street + Nr</label>
											</div>
										</div>

										<div class="mb-4 pb-2">
											<div class="form-outline form-white">
												<input type="text" id="form3Examplea3"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form3Examplea3">Additional
													Information</label>
											</div>
										</div>

										<div class="row">
											<div class="col-md-5 mb-4 pb-2">

												<div class="form-outline form-white">
													<input type="text" id="form3Examplea4"
														class="form-control form-control-lg" /> <label
														class="form-label" for="form3Examplea4">Zip Code</label>
												</div>

											</div>
											<div class="col-md-7 mb-4 pb-2">

												<div class="form-outline form-white">
													<input type="text" id="form3Examplea5"
														class="form-control form-control-lg" /> <label
														class="form-label" for="form3Examplea5">Place</label>
												</div>

											</div>
										</div>

										<div class="mb-4 pb-2">
											<div class="form-outline form-white">
												<input type="text" id="form3Examplea6"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form3Examplea6">Country</label>
											</div>
										</div>

										<div class="row">
											<div class="col-md-5 mb-4 pb-2">

												<div class="form-outline form-white">
													<input type="text" id="form3Examplea7"
														class="form-control form-control-lg" /> <label
														class="form-label" for="form3Examplea7">Code +</label>
												</div>

											</div>
											<div class="col-md-7 mb-4 pb-2">

												<div class="form-outline form-white">
													<input type="text" id="form3Examplea8"
														class="form-control form-control-lg" /> <label
														class="form-label" for="form3Examplea8">Phone
														Number</label>
												</div>

											</div>
										</div>

										<div class="mb-4">
											<div class="form-outline form-white">
												<input type="text" id="form3Examplea9"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form3Examplea9">Your Email</label>
											</div>
										</div>


										<!-- radio 버튼  -->
										<div class="col-md-6 mb-4">

											<h6 class="mb-2 pb-1">Gender:</h6>

											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="femaleGender" value="option1"
													checked /> <label class="form-check-label"
													for="femaleGender">Female</label>
											</div>

											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="maleGender" value="option2" />
												<label class="form-check-label" for="maleGender">Male</label>
											</div>

										</div>

										<div class="form-check d-flex justify-content-start mb-4 pb-3">
											<input class="form-check-input me-3" type="checkbox" value=""
												id="form2Example3c" /> <label
												class="form-check-label text-white" for="form2Example3">
												I do accept the <a href="#!" class="text-white"><u>Terms
														and Conditions</u></a> of your site.
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
</body>
</html>