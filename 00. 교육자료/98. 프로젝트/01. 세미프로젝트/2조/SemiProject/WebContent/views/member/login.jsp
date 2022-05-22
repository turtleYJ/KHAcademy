<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />


<style>
#loginSubmit {
	width: 100%;
    background-color: #ff9227;
    border: 0;
    color: white;
    width: 100px;
    padding: 10px 15px;
    margin: 10px 0;
}
#loginFrm {
	width: 30%;
	text-align: center;
	border: 1px solid #888;
	margin: 50px auto 0;
	padding: 20px 0;
}
#loginFrm table {
    margin: 0 auto;
    border: 0;
}
#loginFrm table th {
	font-weight: 500;
	padding: 10px 0;
}
#loginFrm table th,
#loginFrm table td {
	text-align: left;
	padding-left: 20px;
}
#loginFrm input[type="text"],
#loginFrm input[type="password"] {
	height: 30px;
	border: 1px solid #a5a5a5;
	outline: 0;
	padding-left: 10px;
}
#loginFrm input[type="text"]:focus,
#loginFrm input[type="password"]:focus {
	border: 1px solid #ff7f27;
	border-radius: 0;
}
#l-menu {
    margin-top: 20px;
    text-align: center;
}
.l-btn {
    background: transparent;
    border: 0;
    cursor: pointer;
}

#con1 {
	margin-top: 30%;
	font-size: 3em;
}

</style>
<div class="container">
 <section id="contents" class="contents">
	<c:if test="${ empty loginMember }">
 	<h2 class="page-tit">로그인</h2>
 	<form id="loginFrm" action="${ pageContext.request.contextPath }/member/login" method="post">
 	
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요." ></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력해주세요."></td>
			</tr>
		</table>
		
		<input type="submit" id="loginSubmit" value="로그인">	
 	</form>
 	
 	<div id="l-menu">
         <input class="l-btn" type="button" value="회원가입" onclick="location.href='${ path }/member/enroll'"> | 
         <input class="l-btn" type="button" value="아이디 찾기" onclick="location.href='${ path }/member/search'">
     </div> 	
	</c:if>
	<c:if test="${ !empty loginMember }">
	<p id="con1">로그아웃 시에만 이용 가능한 페이지입니다.</p>
	</c:if>
 </section>
</div>
 
<jsp:include page="/views/common/footer.jsp" />