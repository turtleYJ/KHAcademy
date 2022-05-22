<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:include page="/views/common/header.jsp" />

<style>
		form {
			text-align: center;
		}
       	#E-title {
       		margin-top: 5%;
       	}

        .tbl-enroll {
            border-spacing: 0px;
            font-size: 15px;
            width: 50%;
            padding: 0px;
            border: 1px solid #333;
            margin: 0 auto;
        }
        
        .tbl-enroll th {
        	font-weight: 500;
        }
	
		.tbl-enroll th {
			padding-left: 60px;
		}
		
        .tbl-enroll th,
        .tbl-enroll td {
            text-align: left;
            border-spacing: 0px;
        }
        
        .tbl-enroll td {
        	padding: 10px 0;
        }
        
        .tbl-enroll td input {
			height: 30px;
			border: 1px solid #ddd;
			padding-left: 10px;
			outline: 0;
        }
        
        .tbl-enroll td input:focus {
        	border: 1px solid #ff9227;
        }
        
        .tbl-enroll td input#checkDuplicate {
        	color: #555;
        	padding: 5px 10px;
        	margin-left: 10px;
        }

        #enrollSubmit {
        	font-size: 14px;
        	color: #fff;
        	background: #ff9227;
        	padding: 10px 15px;
        	margin: 20px auto 0;
        	border: 0;
        }

        #top_btn {
            background-color: transparent;
            cursor: pointer;
            border: none;
        }
</style>

<div class="container">
	<div class="contents">       
       <h2 class="page-tit">회원가입</h2> 
       
       <div>
       	<form name="memberEnrollFrm" action="${ pageContext.request.contextPath }/member/enroll" method="post">
            <table class="tbl-enroll">
                <tr>
                    <th style="width: 100px">아이디</th>
                    <td style="width: 150px;">
                    	<input type="text" name="userId" id="newId" placeholder="내용을 입력해주세요" required>
                    </td>
                    <td>
                    	<input type="button" id="checkDuplicate" value="중복검사" >
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>
                    	<input type="password" name="userPwd" id="pass1" required>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td>
                    	<input type="password" id="pass2" required>
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td>
                    	<input type="text" name="userName" id="" placeholder="내용을 입력해주세요" required>
                    </td>
                </tr>	                
                <tr>
                   	<th>휴대폰</th>
                   	<td>
                   		<input type="tel" name="phone" id="phone" maxlength="11" placeholder="(-없이)01012345678" required>
                   	</td>
               	</tr>
               	<tr>
                   	<th>주소</th>
                   	<td><input type="text" name="address" id="address"></td>
               	</tr> 
                <tr>
                    <th>이메일</th>
                    <td><input type="email" name="email" id="email" placeholder="abc@abc.com"></td>
                </tr>
               </tr>
            </table>
			<input type="submit" id="enrollSubmit" value="회원가입">
				
           </form>
       </div>
	</div>
</div>

<script>
	// 아이디 중복 확인
	$(document).ready(() => {
		$("#checkDuplicate").on("click", () => {
			let userId = $("#newId").val().trim();
			
			$.ajax({
				type: "post",
				url: "${ pageContext.request.contextPath }/member/idCheck",
				dataType: "json",
				data: {
					userId
				},
				success: (data) => {
					console.log(data);
					
					if(data.duplicate === true) {
						alert("이미 사용중인 아이디 입니다.");
					} else {
						alert("사용 가능한 아이디 입니다.");						
					}
				},
				error: (error) => {
					console.log(error);
				}
			});
		});		
	});
	
	
	
	
	
	
	
	

</script>
<jsp:include page="/views/common/footer.jsp" />