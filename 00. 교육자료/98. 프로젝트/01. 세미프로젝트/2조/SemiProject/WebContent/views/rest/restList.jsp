<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<jsp:include page="/views/common/header.jsp" />


<div class="container">
  <div class="contents">
    <h2 class="page-tit">맛집</h2>
    <div class="thumb-list">
   		<h3 class="type-tit">음식점</h3>
		<ul>
			<c:forEach var="rest" items="${ restList }" begin="0" end="3">
		        <li>
		          <a href="${ pageContext.request.contextPath }/rest/restDetail?no=${ rest.no }">
		            <div class="img-thumb">
		              <img src="${ pageContext.request.contextPath }${ rest.imgPath }${ rest.no }.png" alt="">
		            </div>
		            <strong>${ rest.name }</strong>
		            <p>${ rest.content }</p>
		          </a>
		        </li>
	        </c:forEach>
		</ul>
    </div>
    
    <div class="thumb-list">
   		<h3 class="type-tit">카페</h3>
		<ul>
			<c:forEach var="cafe" items="${ cafeList }" begin="0" end="3">
		        <li>
		          <a href="${ pageContext.request.contextPath }/rest/restDetail?no=${ cafe.no }">
		            <div class="img-thumb">
		              <img src="${ pageContext.request.contextPath }${ cafe.imgPath }${ cafe.no }.png" alt="">
		            </div>
		            <strong>${ cafe.name }</strong>
		            <p>${ cafe.content }</p>
		          </a>
		        </li>
	        </c:forEach>
		</ul>
    </div>
    
    <div class="thumb-list">
   		<h3 class="type-tit">술집</h3>
		<ul>
			<c:forEach var="bar" items="${ barList }" begin="0" end="3">
		        <li>
		          <a href="${ pageContext.request.contextPath }/rest/restDetail?no=${ bar.no }">
		            <div class="img-thumb">
		              <img src="${ pageContext.request.contextPath }${ bar.imgPath }${ bar.no }.png" alt="">
		            </div>
		            <strong>${ bar.name }</strong>
		            <p>${ bar.content }</p>
		          </a>
		        </li>
	        </c:forEach>
		</ul>
    </div>
  </div>
</div>

<jsp:include page="/views/common/footer.jsp" />
