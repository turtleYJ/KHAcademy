<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<title>비밀번호변경</title>
<style>
    .updatepwd-section {
        display: flex;
        flex-direction: column;
        margin-top: 40px;
        margin-bottom: 40px;
        text-align: center;
    }

    .updatePwd {
        font-weight: 500px;
        font-size: 26px;
        line-height: 20px;
    }

    table {
        margin: 0 auto;
        border-spacing: 20px;
        font-size: 14px;
    }

    th, td {
        text-align: left;
    }
    table input {
    	width: 80%;
	    height: 24px;
	    border: 1px solid #a5a5a5;
	    outline: 0;
	    padding-left: 10px;
    }
    table input:focus {
    	border: 1px solid #ff7f27;
	    border-radius: 0;
    }

    .pwdbtn-section {
        text-align: center;
        margin-bottom: 50px;
    }
    .button-section {
    	text-align: center;
    }
    .btn-mypage {
	    width: 120px;
	    color: #fff;
	    font-size: 14px;
	    border: none;
	    background: #ff9227;
	    cursor: pointer;
	    padding: 10px 0;
	}
</style>
</head>

<body>
    <div class="updatepwd-section">
        <span class="updatePwd">비밀번호 변경</span>
    </div>
    
	<div id="updatePassword-container">
		<form action="${ pageContext.request.contextPath }/member/updatePwd" method="post">
	        <table>
	            <tr>
	                <th>현재 비밀번호</th>
	                <td>
	                    <input type="password" id="nowPwd" required>
	                </td>
	            </tr>
	            <tr>
	                <th>새 비밀번호</th>
	                <td>
	                    <input type="password" name="userPwd" id="pass1" required>
	                </td>
	            </tr>
	            <tr>
	                <th>새 비밀번호 확인</th>
	                <td>
	                    <input type="password" id="pass2" required>
	                </td>
	            </tr>
	        </table>
	        
	        <div class="button-section">
	        	<input type="submit" id="updatePwdBtn" class="btn-mypage" value="변경" onclick="return validate();">
	            &nbsp;
                <input type="button" id="closeBtn" class="btn-mypage" value="닫기" onclick="self.close();">
	        </div>
			<input	type="hidden" name="userId">	
		</form>
	</div>
	
	<script>
		// 비밀번호 일치 확인 
		function validate() {
			let pass3 = $("#pass3").val();
			let pass4 = $("#pass4").val();
			
			if(pass3.trim() != pass4.trim()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#pass3").val("");
				$("#pass4").val("");
				$("#pass3").focus();
				
				return false;
			}
		}
	</script>
</body>
</html>
