<%@ page contentType="text/html; charset=UTF-8"%>

<div class="modal fade " id="loginModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<br> <br>
	<br> <br>
	<br> <br>
	<br> <br>
	<br> <br>
	<div class="modal-dialog">
	<form action="login.kkini" method="post">
		<div class="modal-content">
			<div class="modal-header justify-content-center"
				style="background-color: #FFA500;">
				<h5 class="modal-title" id="modalTitle" style="color: white;"
					align="center">로그인</h5>
			</div>
			<div class="modal-body justify-content-center">
				<br>
				<div class="container">

					<div class="row gy-2 justify-content-md-center ">
						<div class="col col-xs-1"></div>
						<div class="col-8 ">
							<div class="input-group align-items-center form-outline ">
								<!-- ID &nbsp;:&nbsp; &nbsp; -->
								<input type="text" class="form-control form-control-m rounded"
									id="user_id" name="user_id" placeholder="아이디:">
							</div>
						</div>

						<div class="col col-xs-1"></div>
					</div>
					<br>

					<div class="row gy-2 justify-content-md-center ">
						<div class="col col-xs-1"></div>

						<div class="col-8">
							<div class="input-group align-items-center form-outline">
								<!-- PW : &nbsp; -->
								<input class="form-control form-control-m rounded"
									type="password" id="user_pw" name="user_pw"
									placeholder="비밀번호 :">
							</div>
							<br> <br>

						</div>
						<div class="col col-xs-1"></div>
					</div>
				</div>

			</div>
			<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-secondary" onclick="location.href='userRegiste.kkini'">회원가입</button>
				<button type="submit" class="btn btn-primary" onclick="return check()">로그인</button>
			</div>
		</div>
		</form>
	</div>
</div>
<script>
	function check()
	{

		if ($.trim($("#user_id").val()) == "")
		{
			alert("아이디를 입력해주세요");
			return false;
		}
		if ($.trim($("#user_pw").val()) == "")
		{
			alert("비밀번호를 입력해주세요");
			return false;
		}

	}
</script>