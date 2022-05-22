<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//인코딩 설정
	request.setCharacterEncoding("utf-8");

	//form 파라미터 값 읽어오기
	String travel_title = request.getParameter("travel_title");
	
	String dateIn = request.getParameter("dateIn");
	String dateIn2 = request.getParameter("dateIn2");
	String[] addText = request.getParameterValues("addText");
	String[] addText2 = request.getParameterValues("addText2");
	
%>

<jsp:include page="/views/common/header.jsp" />

<style>
        .label {
            margin: 20px;
        }
        .sch-date {
            margin: 20px;
            padding-left: 20px;
        }

        .outer {
            position: relative;
            /* top: 100px;
            left: 100px;
            border: 1px solid; */
        }

        #first {
            display: inline-block;
            width: 40%;
            height: 500px;
        }

        #second {
            display: inline-block;
            width: 40%;
            height: 500px;
        }

        .outer {
            margin-top: 50px;
        }
        
        .inner {
            margin-left: 70px;
        }

        .schedule {
            size: 20px;
        }
        
        .schedule {
            margin: 20px;
        }

        #planner-btn {
            background-color: skyblue;
            border: 1px solid skyblue;
            color: white;
            font-size: 15px;
            border-radius: 10px;
            width: 200px;
            height: 50px;
            cursor: pointer;
            float: right;
            margin-right: 100px;
        }
        
</style>

<div class="container">
<div class="contents">
		<br>
        <h2 class="page-tit">마이 플래너</h1>
        <br>
        <hr>
        <h2 align="center">나 혼자 제주도 간다(1박 2일)</h2>
         여행 타이틀 : <%= travel_title %> <br><br>
        <label class="label">출발일</label> : <%=dateIn %><br><br>
        <label class="label">도착일</label> : <%=dateIn2 %><br><br>
        <hr>
        
        <div class="outer">
            <div class="inner" id="first">
                <h2 class="sch-date">1일차</h2>
               
                <ul style="font-size: 30px;">
                    <li class="schedule">
                        <%= addText[0] %>
                    </li>
                    <li class="schedule">
                         <%= addText[1] %>
                    </li>
                    <li class="schedule">
                         <%= addText[2] %>
                    </li> 
                    <li class="schedule">
                         <%= addText[3] %>
                    </li>
                   
                  
                    
                </ul>
                
            </div>
            <div class="inner" id="second">
                <h2 class="sch-date">2일차</h2>
               
                <ul style="font-size: 30px;">
                    <li class="schedule">
                         <%= addText2[0] %>
                    </li>
                    <li class="schedule">
                         <%= addText2[1] %>
                    </li>
                    <li class="schedule">
                         <%= addText2[2] %>
                    </li>
                    <li class="schedule">
                         <%= addText2[3] %>
                    </li>
					
                </ul>
        		<button type="button" id="planner-btn" onClick="location.href='myplannerWrite.jsp'">플래너 수정 및 추가</button>
            </div>
        </div>
        

    </div>
</div>

<jsp:include page="/views/common/footer.jsp" />