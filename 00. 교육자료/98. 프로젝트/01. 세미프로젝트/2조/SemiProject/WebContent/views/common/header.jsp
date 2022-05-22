<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주혼여행</title>
<link rel="stylesheet" href="${ path }/resources/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="shortcut icon" href="resources/favicon.ico">
<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
	<header>
		<div class="header-inner">
			<div class="member-container">
				<a href="${ path }/home" class="logo">
					<img src="${ pageContext.request.contextPath }/resources/images/logo.png" alt="메인으로 이동">
				</a>
				<c:if test="${ empty loginMember }">
					<div class="before-login">
						<button class="btn" onclick="location.href='${ path }/member/login'">로그인</button>
						<button class="btn" onclick="location.href='${ path }/member/enroll'">회원가입</button>
					</div>
				</c:if>
				<c:if test="${ !empty loginMember }">
					<div class="after-login">
						<table>
							<tr>
								<td colspan="2">
									${ loginMember.name }
								</td>
								<td>
									<button onclick="location.href='${ path }/member/myPage'">내 정보</button>
								</td>
								<td>
									<button onclick="location.replace('${ path }/logout')">로그아웃</button>
								</td>
							</tr>
						</table>
					</div>
				</c:if>
			</div>
		</div>	
	
		
	    <div class="menu-bar">
	        <ul>
	            <li><a href="${ pageContext.request.contextPath }/spot/spotList">여행지</a></li>
	            <li><a href="${ pageContext.request.contextPath }/stay/stayList">숙박</a></li>
	            <li><a href="${ pageContext.request.contextPath }/rest/restList">맛집</a></li>
	            <c:if test="${ !empty loginMember }">
	            	<li><a href="./views/board/myplannerWrite.jsp">마이 플래너</a></li>
	            </c:if>
	            <li><a href="${ pageContext.request.contextPath }/review/reviewList">여행 후기</a></li>
	        </ul>
	    </div>
	</header>