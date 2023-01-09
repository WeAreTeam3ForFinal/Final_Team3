<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String id = request.getParameter("id");
%>
  <section class="recommended" id="deals">
        <div class="container">
        
            <div class="row">
                <div class="col-12 col-lg-6">
                    <h4 class="fs-2 fw-bold theme-text-secondary mb-0">Recommended</h4>
                    <p class="mb-0 theme-text-accent-one">International & Domestic fames ac ante ipsum</p>
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
            
            <div class="row mt-5">
            	<!-- 기존 카드내용 삭제 및 부트스트랩 속성 추가 -->
                <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0 h-50 border border-warning rounded">
                	<div>
	                    <p id="club-title" class="h4 text-center mt-3 fw-bold">한국판 고독한 미식가</p>
	                    <p id="club-region"><i class="bi bi-geo-alt-fill ms-2 me-2"></i>부산</p>
	                    <p id="club-food-ctg"><i class="bi bi-heart-fill ms-2 me-2"></i>일식</p>
	                    <p id="club-member-count"><i class="bi bi-people-fill ms-2 me-2" ></i>28명</p>
	                    <i class="bi bi-tags-fill ms-2 me-2"></i><span class="text-muted">#고미팸 #일식러버 #오겡끼데스까</span>
                	</div>
                </div>
                
                <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0 h-50 border border-warning rounded">
                	<div>
	                    <p id="club-title" class="h4 text-center mt-3 fw-bold">한국판 고독한 미식가</p>
	                    <p id="club-region"><i class="bi bi-geo-alt-fill ms-2 me-2"></i>부산</p>
	                    <p id="club-food-ctg"><i class="bi bi-heart-fill ms-2 me-2"></i>일식</p>
	                    <p id="club-member-count"><i class="bi bi-people-fill ms-2 me-2" ></i>28명</p>
	                    <i class="bi bi-tags-fill ms-2 me-2"></i><span class="text-muted">#고미팸 #일식러버 #오겡끼데스까</span>
                	</div>
                </div>
                
                <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0 h-50 border border-warning rounded">
                	<div>
	                    <p id="club-title" class="h4 text-center mt-3 fw-bold">한국판 고독한 미식가</p>
	                    <p id="club-region"><i class="bi bi-geo-alt-fill ms-2 me-2"></i>부산</p>
	                    <p id="club-food-ctg"><i class="bi bi-heart-fill ms-2 me-2"></i>일식</p>
	                    <p id="club-member-count"><i class="bi bi-people-fill ms-2 me-2" ></i>28명</p>
	                    <i class="bi bi-tags-fill ms-2 me-2"></i><span class="text-muted">#고미팸 #일식러버 #오겡끼데스까</span>
                	</div>
                </div>
                
                <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0 h-50 border border-warning rounded">
                	<div>
	                    <p id="club-title" class="h4 text-center mt-3 fw-bold">한국판 고독한 미식가</p>
	                    <p id="club-region"><i class="bi bi-geo-alt-fill ms-2 me-2"></i>부산</p>
	                    <p id="club-food-ctg"><i class="bi bi-heart-fill ms-2 me-2"></i>일식</p>
	                    <p id="club-member-count"><i class="bi bi-people-fill ms-2 me-2" ></i>28명</p>
	                    <i class="bi bi-tags-fill ms-2 me-2"></i><span class="text-muted">#고미팸 #일식러버 #오겡끼데스까</span>
                	</div>
                </div>
             </div>
          </div>
       </section>
