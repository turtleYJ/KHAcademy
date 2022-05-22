<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<jsp:include page="/views/common/header.jsp" />

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<div class="container">
  <div class="contents">
    <h2 class="page-tit">여행지</h2>
    <div class="thumb-list">
      <h3 class="type-tit">관광명소</h3>
      
      <ul>
      	<c:forEach var="spot" items="${ spotList }" begin="0" end="3">
	        <li>
	          <a href="${ pageContext.request.contextPath }/spot/spotDetail?no=${ spot.no }">
	            <div class="img-thumb">
	              <img src="${ pageContext.request.contextPath }${ spot.imgPath }${ spot.no }.png" alt="">
	            </div>
	            <strong>${ spot.title }</strong>
	            <p>${ spot.content }</p>
	          </a>
	        </li>
        </c:forEach>
      </ul>      
      <%-- <c:if test="${ spot.spotList > 10 }">
      	<button type="button" class="btn-more">더보기</button>
      </c:if> --%>
    </div>

    <div class="thumb-list">
      <h3>체험</h3>
      <ul>
      	<c:forEach var="experience" items="${ experienceList }" begin="0" end="3">
	        <li>
	          <a href="${ pageContext.request.contextPath }/spot/spotDetail?no=${ experience.no }">
	            <div class="img-thumb">
	              <img src="${ pageContext.request.contextPath }${ experience.imgPath }${ experience.no }.png" alt="">
	            </div>
	            <strong>${ experience.title }</strong>
	            <p>${ experience.content }</p>
	          </a>
	        </li>
        </c:forEach>
      </ul>
      <c:if test="${ experience.experienceList > 9 }">
      	<button type="button" class="btn-more">더보기</button>
      </c:if>
    </div>

    <div class="thumb-list">
      <h3>쇼핑</h3>
      <ul>
        <c:forEach var="shopping" items="${ shoppingList }" begin="0" end="3">
	        <li>
	          <a href="${ pageContext.request.contextPath }/spot/spotDetail?no=${ shopping.no }">
	            <div class="img-thumb">
	              <img src="${ pageContext.request.contextPath }${ shopping.imgPath }${ shopping.no }.png" alt="">
	            </div>
	            <strong>${ shopping.title }</strong>
	            <p>${ shopping.content }</p>
	          </a>
	        </li>
        </c:forEach>
      </ul>
      <c:if test="${ shopping.list > 9 }">
      	<button type="button" class="btn-more">더보기</button>
      </c:if>
    </div>

  </div>
</div>

<jsp:include page="/views/common/footer.jsp" />
