<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String sortBy = request.getParameter("sortBy");
%>


  <section class="recommended" id="deals">
        <div class="container">
        		<div class="row">
	                <div class="col-12 col-lg-6">
	                    <h4 class="fs-2 fw-bold theme-text-secondary mb-0">메뉴메이트 목록</h4>
	                    <!-- 회원일 때만 해당 문구 출력 -->
	                    <p class="mb-0 theme-text-accent-one"></p>
	                </div>
	                <div class="col-12 col-lg-6 align-self-center justify-content-end d-flex">
	                    <div class="d-flex">
	                        <div class="dropdown-center">
	                            <button class="btn btn-secondary dropdown-toggle recomended-btn" type="button"
	                                data-bs-toggle="dropdown" aria-expanded="false" id="selectedSort">
	                                <b>정렬기준</b>
	                            </button>
	                            <ul class="dropdown-menu" id="sortList">
	                                <li><a class="dropdown-item" id="recordDate"><b>개설일순</b></a></li>
	                                <li><a class="dropdown-item" id="recordClose"><b>마감임박순</b></a></li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	          
	            
	             <div class="row mt-2">
	             <!-- 리스트 표시 조건 체크박스 추가 -->
	             <!-- style에 더블클릭 시 파란색 블럭 방지 기능 추가 -->
	      
	             <c:choose>
	             	<c:when test="${recordList != null }">
			             <c:forEach var="recordList" items="${recordList }">
			                
			                
			                <div class="col-12 col-md-6 col-lg-3 h-50 mb-4 mb-lg-3 me-3 border recordList ${recordList.STATUS eq '피드백 대기' ? 'background-color: border-success' : 'border-warning'}" style="width: 280px;">
			                	<button style="background-color: orange; border: 0">${recordList.BAR}</button>
			                	<c:choose>
			                	<c:when test="${recordList.GRADE=='참가'}">
			                	<button style="background-color: green; border: 0;color: white;">${recordList.GRADE }</button>
			                	</c:when>
			                	<c:otherwise>
			                	<button style="background-color: blue; border: 0;color: white;">${recordList.GRADE }</button>
			                	</c:otherwise>
			                	</c:choose>
			                	
			                	
			                	<button class="feedBackStatus"style="border: 0;color: white; ${recordList.STATUS eq '피드백 대기' ? 'background-color: green;' : (recordList.STATUS eq '불참' ? 'background-color: red;' : 'background-color: black;')}">${recordList.STATUS }</button>
			                	
			                	
			                	<!-- div 스타일 속성 추가. div영역 넘어가는 해시태그 ... 처리 -->
								<div style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;" class="recordRoom">
								<!-- 일시, 지역, 식당명, 음식종류, 메인메뉴, 모집 연령대, 인원수 -->
									<p id="club-list-title" class="text-center fw-bold h4 mt-4">${recordList.REST_NAME }</p>
									<div class="border"></div>
									<i class="bi bi-geo-alt-fill ms-3 me-3"></i><span id="mema-list-region">${recordList.REST_LOCATION }</span><br>
									<i class="bi bi-heart-fill ms-3 me-3"></i><span id="mema-list-foodCtg">${recordList.FOOD_CASE }</span><br>
									<i class="bi bi-calendar-check-fill ms-3 me-3"></i><span id="mema-list-visitDate">${recordList.VISIT_DATE }</span><br>
									<i class="fa-solid fa-utensils ms-3 me-3"></i><span id="mema-list-region">${recordList.MAIN_MENU }</span><br>
									<div class="border"></div>
								
								</div>
								
								
								
									 <form action="mmRecordRoom.kkini" method="get">
									<input type="text" style="display:none;" name="openCode" value="${recordList.openCode }"> <!-- value에는 각각의 개설코드 들어가야함  -->
									<button type="submit" style="display:none;"></button>
								</form>                 	
			                </div>
			             </c:forEach>
			             
	             	</c:when>
	             	
	             	<c:otherwise>
			           
	             	</c:otherwise>
	             </c:choose>
	                </div> 
             </div>
       </section>

       
       
       
