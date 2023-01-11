<%@page import="com.kkini.dto.ClubDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

  <section class="recommended" id="deals">
        <div class="container">
        
	            <div class="row">
	                <div class="col-12 col-lg-6">
	                    <h4 class="fs-2 fw-bold theme-text-secondary mb-0">동아리 목록</h4>
	                    <!-- 회원일 때만 해당 문구 출력 -->
	                    <p class="mb-0 theme-text-accent-one">피카츄님에게 딱 맞는 동아리를 추천해드릴게요!</p>
	                </div>
	                <div class="col-12 col-lg-6 align-self-center justify-content-end d-flex">
	                    <div class="d-flex">
	                        <div class="dropdown-center">
	                            <button class="btn btn-secondary dropdown-toggle recomended-btn" type="button"
	                                data-bs-toggle="dropdown" aria-expanded="false">
	                                Hotels
	                            </button>
	                            <ul class="dropdown-menu">
	                                <li><a class="dropdown-item" href="#">등록순</a></li>
	                                <li><a class="dropdown-item" href="#">마감임박순</a></li>
	                                <li><a class="dropdown-item" href="#">Holidays</a></li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            
	            
	            <!-- 기존 카드 내용 제거 및 부트스트랩 속성 이용해서 동아리 목록 생성 -->
	             <div class="row mt-5">
	             <!-- jstl 반복문으로 동아리 리스트 출력 -->
	             <!-- dto 객체는 ClubController.java에서 가져옴 -->
	             <c:forEach var="dto" items="${clubList }">
	                <div class="col-12 col-md-6 col-lg-3 h-50 mb-4 mb-lg-0 border border-warning">
						<div>
							<p id="club-list-title" class="text-center fw-bold h4 mt-4">${dto.clubName }</p>
							<div class="border"></div>
							<i class="bi bi-geo-alt-fill ms-3 me-3"></i><span id="club-list-region">${dto.clubRegion }</span><br>
							<i class="bi bi-heart-fill ms-3 me-3"></i><span id="club-list-foodCtg">${dto.clubFoodCtg }</span><br>
							<i class="bi bi-people-fill ms-3 me-3"></i><span id="club-list-memberCount">${dto.clubMemberCount }</span><br>
							<div class="border"></div>
							<i class="bi bi-tag-fill ms-3 me-3"></i><span id="club-list-tags" class="text-muted">#${dto.clubOpenKeyword }</span>
						</div>                	
	                </div>
	             </c:forEach>
	                
               	</div> 
             </div>
             
       </section>
       
       
       