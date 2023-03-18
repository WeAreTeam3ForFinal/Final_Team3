<%@ page contentType="text/html; charset=UTF-8"%>
<script>
	//회원가입 페이지 로드시 ajax를 통해 대한민국의 광역시도 list 가져오기
	
		//alert(); 호출확인
	$(function()
	{
		
		
	    $("#loadIntModal").click(function()
		{
	    	$("#city_province_list_Int").empty();
	    	
	    	$
			.ajax(
			{
				type : "GET",
				url : "http://api.vworld.kr/req/data?service=data&request=GetFeature&data=LT_C_ADSIDO_INFO&key=5EFC480E-69E8-37A1-852A-43F279EA8BC7&domain=110.15.239.172&geometry=false&size=100&geomFilter=BOX(124,33,132,43)",
				dataType : "jsonp",
				success : function(data)
				{
					let city_province_option = "<option selected='selected'>선택</option>";

					//alert(data); //Object
					//alert(data.response); //[object Object]
					//alert(data.response.status); //OK 실제로 status라는 값은 OK
					//alert(data.response.result.featureCollection); //[object Object] 결과값이 들어있는 result 이름의 Object 안에 있는 featureCollection이라는 이름의 객체로 
					//type":"FeatureCollection","bbox","features" 세가지 변수(?)를 가지고있다.

					//alert(data.response.result.featureCollection.features); //전국 광역시 결과값을 내포하고 있는 결과값 변수
					/*
					[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],
					[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],
					[object Object],[object Object],[object Object]
					 */

					//결과값을 가지는 객체배열을 dataList라는 변수에 주입
					const dataList = data.response.result.featureCollection.features;

					//alert(dataList.length); //17 광역시도의 개수도 17

					//alert(dataList[0].properties.ctp_kor_nm);// 서울 특별시  / features의 0번째 배열값의 properties중 광역시도이름인 ctp_kor_nm의 값 = 서울특별시

					//모든 광역시도를 option으로 담는다
					//for문 변수는 const를 지정하지 않는다. const는 한번 할당한 값을 다시 할당하지 못한다.
					for (let i = 0; i < dataList.length; i++)
					{
						//alert(dataList[i].properties.ctp_kor_nm);

						//제주특별자치도, 세종특별자치시 는 카카오맵에서도 동일하게 나온다.
						//충청남도,북도  경상남도 북도 전라남도 북도 는 충남 충북 처럼  1과 3번째 글자가 조합되고 나머지는 없어진다. 즉 남도,북도가 들어가면 가져와서 1,3글자만 연결해서 넣으면 될듯
						//강원도, 경기도도 도가 없어진다.
						//1.남도, 북도를 가지고있다면 1번째 3번째 글자만 떼내어 연결시킨다.
						//ㄴㄴㄴㄴㄴ 글자로 할필요가 없다.

						//ctprvn_cd(행정구역코드)  11 = 서울특별시                              ※ 특별시 삭제
						//                         26~31 = 부산,대구,인천,광주,대전,울산광역시  ※ 광역시 삭제
						//                         36 = 세종특별자치시                          ※ 그대로
						//                         41~42 = 경기도, 강원도                       ※'도' 빼기
						//                         43~48 = 충청북도~ 경상남도                   ※ 1번째 3번째 단어 결합시켜넣기
						//                         50 = 제주특별자치도                          ※그대로

						//광역시의 행정구역 코드
						let ctprvn_cd = parseInt(dataList[i].properties.ctprvn_cd);
						let ctp_kor_nm = dataList[i].properties.ctp_kor_nm;

						/* if (ctprvn_cd == 11)
						{
							ctp_kor_nm = ctp_kor_nm.replace("특별시", "");

						} else if (26 <= ctprvn_cd && ctprvn_cd <= 31)
						{
							ctp_kor_nm = ctp_kor_nm.replace("광역시", "");
						} else if (41 <= ctprvn_cd && ctprvn_cd <= 42)
						{
							ctp_kor_nm = ctp_kor_nm.replace("도", "");
						} else if (43 <= ctprvn_cd && ctprvn_cd <= 48)
						{
							ctp_kor_nm = ctp_kor_nm.substr(0, 1)
									+ ctp_kor_nm.substr(2, 1);
						}
 */
						city_province_option += "<option value="+ctp_kor_nm+">";
						city_province_option += dataList[i].properties.ctp_kor_nm;
						city_province_option += "</option>";
					}

					$("#city_province_list_Int").append(city_province_option);

				},
				error : function(e)
				{
					alert(e.responseText);

				}

			});
			
		});
		
		
		$("#city_province_list_Int").change(
				function()
				{
					searchInt();
				});
		
		function searchInt()
		{
			$("#User_IntRegionRec").empty();
			//alert();

			//&attrFilter=full_nm:like: | sig_kor_nm:like:			
			
			params = "attrFilter=full_nm:like:"
					+ $("#city_province_list_Int option:checked").text();  //https://api.jquery.com/checked-selector/참고
			
			
			$.ajax(
					{

						type : "GET",
						url : "https://api.vworld.kr/req/data?service=data&request=GetFeature&data=LT_C_ADSIGG_INFO&key=5EFC480E-69E8-37A1-852A-43F279EA8BC7"
								+ "&domain=110.15.239.172&geometry=false&size=100&columns=sig_kor_nm",
						data : params,
						dataType : "jsonp",
						success : function(data)
						{
							let city_county_rec=""; //받아온 시군구 리스트
							//city ​​county
							const city_county_list = data.response.result.featureCollection.features;
																			
							//alert(city_county_list.length);
							//alert(city_county_list[0].properties.sig_kor_nm);
							
							for(let i=0;i<city_county_list.length;i++)
							{
								city_county_rec += "<button type='button' class='btn rounded' style='margin:auto;display:block;' onclick='insertIntRegion(this)'>"
								+ (($("#city_province_list_Int option:checked").text() == city_county_list[i].properties.sig_kor_nm) ? city_county_list[i].properties.sig_kor_nm+"</button>" : $("#city_province_list_Int option:checked").val()+" "+city_county_list[i].properties.sig_kor_nm+"</button>");
								city_county_rec += "<hr>";
								
								
								
								
							}
							
							
							
							$("#User_IntRegionRec").html(city_county_rec);
							

						},
						error : function(e)
						{
							alert(e.responseText);

						}
					});
			
		}
		
		
		
		
		 $("#User_IntRegionDetail").keyup(
						function()
						{
							 
							if($.trim($("#User_IntRegionDetail").val())=="")
								{
								searchInt();
								}
							
							else
								{
								$("#User_IntRegionRec").empty();
								//alert();

								//&attrFilter=full_nm:like: | sig_kor_nm:like:			
								
								params = "attrFilter=full_nm:like:"
										+ $("#city_province_list_Int option:checked").text()  //https://api.jquery.com/checked-selector/참고
										+ "|" 
										+ "sig_kor_nm:like:"+$("#User_IntRegionDetail").val();
								
								
								$.ajax(
										{

											type : "GET",
											url : "https://api.vworld.kr/req/data?service=data&request=GetFeature&data=LT_C_ADSIGG_INFO&key=5EFC480E-69E8-37A1-852A-43F279EA8BC7"
													+ "&domain=110.15.239.172&geometry=false&size=100&columns=sig_kor_nm",
											data : params,
											dataType : "jsonp",
											success : function(data)
											{
												let city_county_rec=""; //받아온 시군구 리스트
												//city ​​county
												const city_county_list = data.response.result.featureCollection.features;
																								
												//alert(city_county_list.length);
												//alert(city_county_list[0].properties.sig_kor_nm);
												
												for(let i=0;i<city_county_list.length;i++)
												{
													city_county_rec += "<button type='button' class='btn rounded' style='margin:auto;display:block;' onclick='insertIntRegion(this)'>"
													+ (($("#city_province_list_Int option:checked").text() == city_county_list[i].properties.sig_kor_nm) ? city_county_list[i].properties.sig_kor_nm+"</button>" : $("#city_province_list_Int option:checked").val()+" "+city_county_list[i].properties.sig_kor_nm+"</button>");
													city_county_rec += "<hr>";
												}
												
												
												
												$("#User_IntRegionRec").html(city_county_rec);

											},
											error : function(e)
											{
												alert(e.responseText);

											}
										});
								
								}
							
							
							
						
							

						});

	});
	
	
	function insertIntRegion(region)
	{
		//alert($(region).text());
		
		$("#User_IntRegion").val($(region).text());
		$("#IntregionModal").modal("hide");
		
		
	}

	
</script>
<div class="modal fade " id="IntregionModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<br> <br> <br> <br> <br> <br> <br> <br>
	<br> <br>
	<div class="modal-dialog">

		<div class="modal-content">
			<div class="modal-header justify-content-center"
				style="background-color: #FFA500;">
				<h5 class="modal-title" id="modalTitle" style="color: white;"
					align="center">관심지역입력</h5>
			</div>
			<div class="modal-body justify-content-center">
				<br>
				<div class="container">

					<div class="row gy-2 justify-content-md-center ">
						<div class="col-5 ">
							<div class="align-items-center form-outline ">
								<!-- 광역시도 API에서 얻어온 값을 option으로 출력-->
								<select class="form-select rounded" id="city_province_list_Int">

								</select>


							</div>
						</div>

						<div class="col-5">
							<input type="text" id="User_IntRegionDetail" name="User_IntRegionDetail"
								class="form-control form-control-m rounded"
								placeholder="ex) 시,군,구 입력">
						</div>

						<div class="col col-xs-1"></div>
					</div>
					<br>
					<div class="border-bottom"></div>

					<div class="row gy-2 justify-content-md-center ">
						<div class="col-12">
							<div class="input-group align-items-center form-outline">



								<div id="User_IntRegionRec" class="col-12 form-outline">

									

								</div>

							</div>
							

						</div>
						<div class="col col-xs-1"></div>
					</div>
				</div>

			</div>
			<div class="modal-footer justify-content-center">
			</div>
		</div>
	</div>
</div>
