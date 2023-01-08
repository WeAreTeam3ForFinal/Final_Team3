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
                <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0">
                    <div class="card-wrap">
                        <div class="con-img-wrap m-auto">
                            <img src="assets/images/recommended/offers01.png" class="img-fluid mx-auto d-block"
                                alt="product picture">
                            <div class="offer-tag bg-warning">Best Deal</div>
                            <span class="wishlist-tag"><i class="bi bi-heart"></i></span>
                        </div>
                        <div class="con-wrap mt-4">
                            <h2 class="fs-6 mt-4 fw-bold text-truncate">The Montcalm At Brewery London City</h2>
                            <p class="mb-2 theme-text-accent-two small">Westminster Borough, London</p>
                            <div class="d-flex bottom mb-2">
                                <div class="rating-cover">
                                    <span class="p-1 small rounded-1 bg-warning theme-text-white">4.8</span>
                                    <span class="me-2 small theme-text-accent-one">Exceptional</span>
                                    <span class="small">3,014 reviews</span>
                                </div>
                            </div>
                            <p class="mb-0 theme-text-accent-one">Starting from US$72</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0">
                    <div class="card-wrap">
                        <div class="con-img-wrap m-auto">
                            <img src="assets/images/recommended/offers02.png" class="img-fluid mx-auto d-block"
                                alt="product picture">
                            <div class="offer-tag  bg-info">Best Deal</div>
                            <span class="wishlist-tag"><i class="bi bi-heart"></i></span>
                        </div>
                        <div class="con-wrap mt-4">
                            <h2 class="fs-6 mt-4 fw-bold text-truncate">Flying Over Bali</h2>
                            <p class="mb-2 theme-text-accent-two small">Beautiful Lands, Indonasia</p>
                            <div class="d-flex bottom mb-2">
                                <div class="rating-cover">
                                    <span class="p-1 small rounded-1 bg-danger theme-text-white">4.7</span>
                                    <span class="me-2 small theme-text-accent-one">Exceptional</span>
                                    <span class="small">4,114 reviews</span>
                                </div>
                            </div>
                            <p class="mb-0 theme-text-accent-one">Starting from US$89</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0">
                    <div class="card-wrap">
                        <div class="con-img-wrap m-auto">
                            <img src="assets/images/recommended/offers03.png" class="img-fluid mx-auto d-block"
                                alt="product picture">
                            <div class="offer-tag bg-success">Best Deal</div>
                            <span class="wishlist-tag"><i class="bi bi-heart"></i></span>
                        </div>
                        <div class="con-wrap mt-4">
                            <h2 class="fs-6 mt-4 fw-bold text-truncate">American Landscapes</h2>
                            <p class="mb-2 theme-text-accent-two small">Pestminster Worough, USA</p>
                            <div class="d-flex bottom mb-2">
                                <div class="rating-cover">
                                    <span class="p-1 small rounded-1 bg-success theme-text-white">4.9</span>
                                    <span class="me-2 small theme-text-accent-one">Exceptional</span>
                                    <span class="small">3,894 reviews</span>
                                </div>
                            </div>
                            <p class="mb-0 theme-text-accent-one">Starting from US$88</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0">
                    <div class="card-wrap">
                        <div class="con-img-wrap m-auto">
                            <img src="assets/images/recommended/offers04.png" class="img-fluid mx-auto d-block"
                                alt="product picture">
                            <div class="offer-tag">Best Deal</div>
                            <span class="wishlist-tag"><i class="bi bi-heart"></i></span>
                        </div>
                        <div class="con-wrap mt-4">
                            <h2 class="fs-6 mt-4 fw-bold text-truncate">The Beauty of Scotland</h2>
                            <p class="mb-2 theme-text-accent-two small">Mestminster Gorough, UK</p>
                            <div class="d-flex bottom mb-2">
                                <div class="rating-cover">
                                    <span class="p-1 small rounded-1 bg-info theme-text-white">4.5</span>
                                    <span class="me-2 small theme-text-accent-one">Exceptional</span>
                                    <span class="small">2,914 reviews</span>
                                </div>
                            </div>
                            <p class="mb-0 theme-text-accent-one">Starting from US$69</p>
                        </div>
                    </div>
               </div>
               </div>
               </div>
       </section>
