<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<jsp:include page="/views/common/header.jsp" />


<div class="container">
  <div class="contents">
    <h2 class="page-tit">여행후기</h2>
	
    <div class="thumb-list">
      <h3>여행지</h3>
      <ul>
        <c:forEach var="spot" items="${ spotList }" begin="0" end="3">
	        <li>
	          <a href="${ pageContext.request.contextPath }/review/reviewDetail?rv_no=${ spot.no }">
	            <div class="img-thumb">
	              <img src="${ pageContext.request.contextPath }${ spot.imgPath }${ spot.no }.png" alt="">
	            </div>
	            <strong>${ spot.title }</strong>
	            <p>${ spot.content }</p>
	          </a>
	        </li>
        </c:forEach>
      </ul>
    </div>

    <div class="thumb-list">
      <h3>숙박</h3>
      <ul>
        <c:forEach var="stay" items="${ stayList }" begin="0" end="3">
	        <li>
	          <a href="${ pageContext.request.contextPath }/review/reviewDetail?rv_no=${ stay.no }">
	            <div class="img-thumb">
	              <img src="${ pageContext.request.contextPath }${ stay.imgPath }${ stay.no }.png" alt="">
	            </div>
	            <strong>${ stay.title }</strong>
	            <p>${ stay.content }</p>
	          </a>
	        </li>
        </c:forEach>
      </ul>
    </div>

    <div class="thumb-list">
      <h3>맛집</h3>
      <ul>
        <c:forEach var="reset" items="${ restList }" begin="0" end="3">
	        <li>
	          <a href="${ pageContext.request.contextPath }/review/reviewDetail?rv_no=${ reset.no }">
	            <div class="img-thumb">
	              <img src="${ pageContext.request.contextPath }${ reset.imgPath }${ reset.no }.png" alt="">
	            </div>
	            <strong>${ reset.title }</strong>
	            <p>${ reset.content }</p>
	          </a>
	        </li>
        </c:forEach>
      </ul>
    </div>
    
	<div class="btn-wrap">
		<a href="${ pageContext.request.contextPath }/review/write">여행후기 작성</a>
	</div>

  </div>
</div>


<jsp:include page="/views/common/footer.jsp" />
