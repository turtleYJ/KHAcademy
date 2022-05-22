<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/views/common/header.jsp" />

<style>
        .SID-div {
            margin: 15px;
            padding: 10px;
            text-align: center;
        }

        .SID-div table {
            margin:0 auto;
            width: 15%
        }
        
        #SID-outer{
        	margin-top: 5%;
        	margin-bottom: 10%;
        }
        
        #btn1 {
            margin-right: -4px;
            border-bottom-left-radius: 5px;
            border-top-left-radius: 5px;           
            background-color: transparent;
            color: skyblue;
        }
        #btn2 {
            margin-left: -3px;
            border-bottom-right-radius: 5px;
            border-top-right-radius: 5px;
            background-color: skyblue;
            color: white;
        }

        .tb_btn {
            background-color: transparent;
            color: skyblue;
            border-radius: 10px;
            border: 1px solid skyblue;
        }
        
        #btn_group button{
            border: 1px solid skyblue;
            display: inline-block;
            height: 50px;
            width: 150px;
            font-size: 2.5ex;
            cursor: pointer;
        }

        #top_btn {
            background-color: transparent;
            cursor: pointer;
            border: none;
        }

        #btn_group {
            height: 50px;
        }

        #submit {
            height: 50px;
            width: 285px;
            border-radius: 10px;
            background-color: skyblue;
            color: white;
            border: 1px solid skyblue;
            font-size: 2.5ex;
        }

        img {
            width: 30px;
            height: 20px;
            margin-right: 20px;
        }
        
    </style>
    
    
<section>

	<div class="SID-div" id="SID-outer">
	    <div class="SID-div" style="font-size: 20px;">
	        <button id="top_btn" onclick="location.href='javascript:history.back();'"><img src="${ pageContext.request.contextPath }/resources/images/direction.png" alt=""></button> 아이디 / 비밀번호 찾기
	    </div>

	
	    <div class="SID-div" id="btn_group">
	        <button id="btn1" onclick="location.href='${ pageContext.request.contextPath }/member/search'">아이디 찾기</button>
	        <button id="btn2" onclick="location.href='${ pageContext.request.contextPath }/member/searchPWD'">비밀번호 찾기</button>
	    </div>
	
        <form action="${ pageContext.request.contextPath }/member/searchPWD" method="post">
		    <div class="SID-div">
		            <table >
		            	<tr>
		            		<td>
		                        <input type="text" name="userId" id="userId" placeholder="아이디 입력" required>
		                    </td>	
		            	</tr>
		                <tr>
		                    <td>
		                        <input type="text" name="phone" id="phone" placeholder="휴대전화번호 입력('-'제외)" required>
		                    </td>		                    
		                </tr>
		                <tr>
		                    <td>
		                        <input type="text" name="userName" id="userName" placeholder="이름 입력" required>
		                    </td>		                    
		                </tr>
		            </table>		            
	        </div>
	        <div class="SID-div">
	            <input id="submit" type="submit" value="비밀번호 찾기">
	        </div>
	    </form>
    </div>
            
</section>
<jsp:include page="/views/common/footer.jsp" />