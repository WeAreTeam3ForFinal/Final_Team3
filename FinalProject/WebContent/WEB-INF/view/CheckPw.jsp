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
<title></title>
<link rel="styleSheet" type="text/css" href="<%=cp %>/css/style.css">
<script src="assets/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<form action="updateprivateinfoform.kkini" method="get">
	비밀번호 확인 <br>
	<input type="password" name="user_pw"/> <br>
	<button type="submit" class="btn btn-primary">확인</button>
	<input type="text" name="nickName" value="${nickName }" style="display: none;"/>
	<input type="text" name="user_id" value="${user_id }" style="display: none;"/>
	<input type="text" name="user_addr" value="${user_addr }" style="display: none;"/>
	<input type="text" name="user_phonenumber" value="${user_phonenumber }" style="display: none;"/>
	<input type="text" name="intregions" value="${intregions }" style="display: none;"/>
	</form>
	
</body>
</html>