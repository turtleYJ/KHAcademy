<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/views/common/header.jsp" />

<style>
	section #view-container {
		text-align:center;
	}
	
	section #view-container input {
		margin:3px;
	}
	
	section #view-container table {
		margin:0 auto;
	}
	
	section #view-container table th {
		padding:0 10px; 
		text-align:right;
	}
	
	section #view-container table td {
		padding:0 10px; 
		text-align:left;
	}
</style>
<section id="content">
	<h2 align="center">회원 정보 수정</h2>
	<div id="view-container">
		<form id="memberFrm" action="${ pageContext.request.contextPath }/member/update" method="post">
			<%-- 
			<input type="hidden" name="userNo" value="${ loginMember.no }">
			--%>
			
			<table>
				<tr>
	                <th>아이디</th>
					<td>
						<input type="text" name="userId" id="newId" 
							value="${ loginMember.id }" readonly required >
					</td> 	
	            </tr>
	            <tr>
	                <th>이름</th>
					<td>
						<input type="text" name="userName" id="userName" 
							value="${ loginMember.name }" required>				
					</td> 	
	            </tr>
      	        <tr>
	                <th>휴대폰</th>
	                <td>
	                    <input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" 
	                    	value="${ loginMember.phone }" maxlength="11">
	                </td>
	            </tr>
	            <tr>
	                <th>이메일</th>
					<td>
						<input type="email" placeholder="abc@abc.com" name="email" id="email"
							value="${ loginMember.email }">												
					</td> 	
	            </tr>
	            <tr>
	                <th>주소</th>
					<td>
						<input type="text" name="address" id="address"
							value="${ loginMember.address }">
					</td> 	
	            </tr>
	            <tr>
	               	<th>취미</th>
					<td>
						<label><input type="checkbox" name="hobby" id="hobby0" 
									value="운동" ${ fn:contains(loginMember.hobby, '운동') ? 'checked' : '' }>운동</label>
						<label><input type="checkbox" name="hobby" id="hobby1" 
									value="등산" ${ fn:contains(loginMember.hobby, '등산') ? 'checked' : '' }>등산</label>
						<label><input type="checkbox" name="hobby" id="hobby2" 
									value="독서" ${ fn:contains(loginMember.hobby, '독서') ? 'checked' : '' }>독서</label>
						<label><input type="checkbox" name="hobby" id="hobby3" 
									value="게임" ${ fn:contains(loginMember.hobby, '게임') ? 'checked' : '' }>게임</label>
						<label><input type="checkbox" name="hobby" id="hobby4" 
									value="여행" ${ fn:contains(loginMember.hobby, '여행') ? 'checked' : '' }>여행</label>
					</td> 		
	            </tr>
	        </table>
	        <button type="button" id="updatePwd">비밀번호변경</button>
	        <input type="submit" value="정보수정">
	        <input type="button" id="btnDelete" value="탈퇴">
	 	</form>
 	</div>
</section>
<script>
	$(document).ready(() => {
		$("#updatePwd").on("click", () => {
			const url = "${ pageContext.request.contextPath }/member/updatePwd";
			const status = "left=500px,top=200px,width=400px,height=200px";
			
			open(url, "", status);
		});
		
		$("#btnDelete").on("click", () => {
			if(confirm("정말로 탈퇴하시겠습니까?")) {
				location.replace("${ pageContext.request.contextPath }/member/delete");
			}
		});
	});

</script>

<jsp:include page="/views/common/footer.jsp" />