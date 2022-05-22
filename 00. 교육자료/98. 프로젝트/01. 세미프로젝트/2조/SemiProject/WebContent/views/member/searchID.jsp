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
          width: 35%;
          border: hidden;
        
      }
      .SID-div table th {
      	font-weight: 500;
      }
      
      .SID-div table th,
      .SID-div table td {
      	text-align: left;
      }
      .SID-div table td {
      	padding: 10px 0;
      }
      
      input[type="text"],
      input[type="password"] {
      	height: 30px;
      	border: 1px solid #ddd;
      	outline: 0;
      	padding-left: 10px;
      }
      
      input[type="text"]:focus,
      input[type="password"]:focus {
      	border: 1px solid #ff9227;
      }
      
      #SID-outer{
      	margin-top: 5%;
      	margin-bottom: 10%;
      }
      
      #btn1 {
          margin-right: -4px;
          border-bottom-left-radius: 5px;
          border-top-left-radius: 5px;
          background-color: skyblue;
          color: white;
      }
      #btn2 {
          margin-left: -3px;
          border-bottom-right-radius: 5px;
          border-top-right-radius: 5px;
          background-color: transparent;
          color: skyblue;
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

     

      #submit {
          color: #fff;
          font-size: 14px;
          background: #ff9227;
          border: 0;
          padding: 10px 20px;
      }
    </style>
    
    
<div class="container">
	<div class="contents">
		<h2 class="page-tit">아이디 찾기</h2>
		<div class="SID-div" id="SID-outer">
		    <!-- <div class="SID-div" style="font-size: 20px;">
		        <span style="font-size: 40px;">아이디 찾기</span>
		    </div> -->
	
	        <form action="${ pageContext.request.contextPath }/member/search" method="post">
			    <div class="SID-div">
		            <table >
		                <tr>
		                	<th>휴대 전화번호</th>
		                    <td>
		                        <input type="text" name="phone" id="phone" placeholder="휴대전화번호 입력('-'제외)" required>
		                    </td>		                    
		                </tr>
		                <tr>
		                	<th>이름</th>
		                    <td>
		                        <input type="text" name="userName" id="userName" placeholder="이름 입력" required>
		                    </td>		                    
		                </tr>
		            </table>		            
		        </div>
		        <div class="SID-div">
		            <input id="submit" type="submit" value="아이디 찾기">
		        </div>
		    </form>
	    </div>
	</div>
</div>

<jsp:include page="/views/common/footer.jsp" />