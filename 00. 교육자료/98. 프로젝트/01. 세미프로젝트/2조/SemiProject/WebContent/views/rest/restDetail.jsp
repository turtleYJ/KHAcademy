<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${ path }/resources/css/detailPage_KHJ.css">

<jsp:include page="/views/common/header.jsp" />

<div class="container" style="display: block; flex: none; height: auto;">
  <div class="contents">
    <h2 class="page-tit">맛집</h2>
    
    <hr>
			
	<h3>${ detailVo.name }</h3>
	
	<hr>

	<!-- -------------------------------맛집 간단 소개------------------------------- -->
	
	<div class="des_wrap">	
		
		<div class="info_img">
			<img src="${ path }${ detailVo.imgPath }${ detailVo.no }.png">
		</div>
		
		<div class="info_box">
			<div class="info_contents">
				<div class="type">
					<span>${ detailVo.type }</span>
				</div>
				<p>${ detailVo.content }<p>
				<dl>
					<dt><strong>메뉴</strong></dt>
					<dd>${ detailVo.menu }</dd>
				</dl>				
				<dl>
					<dt><strong>가격</strong></dt>
					<dd>${ detailVo.price }</dd>
				</dl>				
				<dl>
					<dt><strong>전화번호</strong></dt>
					<dd>${ detailVo.phone }</dd>
				</dl>
				<dl>
					<dt><strong>휴관일</strong></dt>
					<dd>${ detailVo.offday }</dd>
				</dl>
			</div>				
		</div>	
				    
	</div>
	
	
	<hr>
	
	<!-- ====================================== 이미지 슬라이드 방법 2 ====================================== -->	
	
	<div class="imgsldsection">
		<input type="radio" name="slide" id="slide01" checked>
		<input type="radio" name="slide" id="slide02">
		<input type="radio" name="slide" id="slide03">
		
		<div class="slidewrap">
			<ul class="slidelist">
				<li>
					<a>
						<img src="${ path }${ detailVo.imgPath }${ detailVo.no }_1.png">
					</a>
				</li>
				<li>
					<a>
						<img src="${ path }${ detailVo.imgPath }${ detailVo.no }_2.png">
					</a>
				</li>
				<li>
					<a>
						<img src="${ path }${ detailVo.imgPath }${ detailVo.no }_3.png">
					</a>
				</li>
			</ul>
	
			<div class="slide-control">
				<div class="control01">
					<label for="slide03" class="left"></label>
					<label for="slide02" class="right"></label>
				</div>
				<div class="control02">
					<label for="slide01" class="left"></label>
					<label for="slide03" class="right"></label>
				</div>
				<div class="control03">
					<label for="slide02" class="left"></label>
					<label for="slide01" class="right"></label>
				</div>
			</div>
		</div>
	</div>
	
	<!-- ====================================== ============= ====================================== -->
	
	<hr>
	
	<!-- ====================================== 다음 카카오 지도 API ====================================== -->
	
	<div class="map-wrap">
		<p>${ detailVo.addr }</p>
		<div id="map" style="width:100%;height:350px;"></div>
	</div>

	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b61348dc035a0fa7d71297a6f4a74c5"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng("${ detailVo.xlat }", "${ detailVo.ylong }"), // 지도의 중심좌표
		        level: 3, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng("${ detailVo.xlat }", "${ detailVo.ylong }"), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});

		// 마커 위에 표시할 인포윈도우를 생성한다
		var infowindow = new kakao.maps.InfoWindow({
		    content : '<div style= padding:5px;">${ detailVo.name }</div>' // 인포윈도우에 표시할 내용
		});

		// 인포윈도우를 지도에 표시한다
		infowindow.open(map, marker);

	</script>	
    
	<!-- ====================================== 다음 카카오 지도 API ====================================== -->
	
    <div class="backspot">
	    <button class="backbutton" onclick="location.href='${ path }/rest/restList'" >목록으로 돌아가기</button>
    </div>
    
  </div>
</div>

<jsp:include page="/views/common/footer.jsp" />