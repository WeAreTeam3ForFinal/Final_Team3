<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<datalist id="addr">
<c:forEach var="region" items="${regionList }">
<option value="${region.region_name}"></option>
</c:forEach>
</datalist>