<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/views/common/header.jsp" />

<style>
	/* .member-section {
	    display: flex;
	    flex-direction: column;
	    margin-top: 20px;
	    margin-bottom: 50px;
	    text-align:center;
	}
	.memberInfo {
	    font-weight: 500;
	    font-size: 35px;
	    line-height: 30px;
	    color: lightsalmon;
	
	} */
	#memberFrm {
	    width: 50%;
	    text-align: center;
	    border: 1px solid #888;
	    margin: 50px auto 0;
	    padding: 50px 0 20px;
	}
	#memberFrm .tbl-mypage {
	    margin: 0 auto;
	    border: 0;
	}
	.tbl-mypage th {
		vertical-align: top;
	    font-weight: 500;
	    padding: 0 0 20px 30px;
	}
	.tbl-mypage th,
	.tbl-mypage td {
	    text-align: left;
	}
	.tbl-mypage td {
	    padding-left: 40px;
	}
	.tbl-mypage td input {
	    width: 80%;
	    height: 30px;
	    border: 1px solid #a5a5a5;
	    outline: 0;
	    padding-left: 10px;
	}
	.tbl-mypage td input:focus {
	    border: 1px solid #ff7f27;
	    border-radius: 0;
	}
	.tbl-mypage td input:disabled {
		color: #999;
		background: #eee;
	}
	.button-section {
	    text-align: center;
	    margin: 20px 0;
	}
	
	.update-button {
	    text-align: center;
	}
	.btn-mypage {
	    width: 120px;
	    color: #fff;
	    font-size: 14px;
	    border: none;
	    background: #ff9227;
	    padding: 10px 0;
	}
	.btn-mypage.gray {
		background: #999;
	}
	.notice {
		display: block;
		font-size: 12px;
		color: #888;
		margin: 5px 0;
	} 
</style>

<div class="container">
	<div class="contents">
		<h2 class="page-tit">회원 정보</h2>
	    <!-- 정보 수정 누르면 이동 -->
	    <form id="memberFrm" action="${ pageContext.request.contextPath }/member/update" method="post">
		    <!-- 서버로 보내야하나 공개 하지않을 경우  -->
		    <%--
		    <input type="hidden" name="userNo" value="${loginMember.no }">
		     --%>
		    <table class="tbl-mypage">
	           <tr>
	                <th>아이디</th>
	                <td>
	                    <input type="text" name="userId" id="newId" 
	                    	value="${ loginMember.id }" disabled required onfocus="this.blur();">
	                    <span class="notice">* 아이디는 변경이 불가능합니다.</span>
	                </td>
	            </tr>
	           	<tr>
	                <th>이름</th>
	                <td>
	                    <input type="text" name="userName" id="userName" 
	                    	value="${ loginMember.name }"required>	
	                </td>
	            </tr>
	            <tr>
	            	<th>전화번호</th>
	            	<td>
	            		<input type="tel" name="phone" id="phone" 
	            		value="${ loginMember.phone }" maxlength="11">
	            	</td>
	            </tr>
	            <tr>
	            	<th>이메일</th>
	            	<td>
	            		<input type="email" name="email" id="email"
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
		    </table>
		    
		   	<div class="button-section">
			    <button type="button" id="updatePwd" class="btn-mypage gray">비밀번호변경</button>
			    <input type="button" id="btnDelete" class="btn-mypage gray" value="탈퇴">
		    	<input type="submit" id="updateMem" class="btn-mypage" value="정보수정 완료">
		    </div>
		</form>
	</div>
</div>

<script>
	$(document).ready(() => {
		$("#updatePwd").on("click", () => {
			const url = "${ pageContext.request.contextPath }/member/updatePwd";
			const status = "left=700px,top=400px,width=600px,height=400px";
			
			// 새로운 창 
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