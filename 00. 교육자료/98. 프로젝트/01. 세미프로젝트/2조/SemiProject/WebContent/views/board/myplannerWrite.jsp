<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/views/common/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 반복문 넣기위에 선언  -->

<style>
#inputDay{
	display:inline-block , center;
	text-align :center;
}
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
            width: 50%;
            height: 500px;
        }

        #second {
       		
            display: inline-block;
            width: 50%;
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
            float: center;
            margin-right: 100px;
        }
        strong {
        	font-weight: 500;
        }
        table {
        	border: 0;
       	}



</style>
<div class="container">
	<div class="contents">
		<br>
        <h2 class="page-tit">마이 플래너</h2>
		<br>
		<hr>
		<br>
		<strong>1박 2일 일정을 등록해주세요.</strong>
		<div id = "inputDay">
		    <form action = "myplanner.jsp" method="post"> <!--myplanner으로 입력받은 데이터넘김  -->
		        <br>
			<!-- 여행 제목을 입력해주세요.. -->
			<label><input type="text" name="travel_title" placeholder="여행제목을 입력해주세요."></label> <br><br>
			
			<!-- 출발일 -->
			<label for="dateIn">여행 시작 날짜 : </label> 
        	<input type="date" name="dateIn" id="dateIn" onchange="call()"> <br><br>
        	<!-- 등록일 -->
			<label for="dateIn">여행 끝 날짜 : </label> 
        	<input type="date" name="dateIn2" id="dateIn2" onchange="call()" > <br><br>  	<!-- value="${ now }"일단 아님 -->
        	
        	<br>
  
  
        	<!-- 출발일과 등록일의 차이 구현? -->
        	<script>
        	 function call(){
        
        	var sdd = document.getElementById("dateIn").value; //출발일 :2021-12-20
    		var edd = document.getElementById("dateIn2").value;//등록일 :2021-12-22 (총3일차)
   			var ar1 = sdd.split('-'); //-문자를 빼는것 : 20211220
    		var ar2 = edd.split('-'); //-문자를 뺴는것 : 20211222
    		var da1 = new Date(ar1[0], ar1[1], ar1[2]);
    		var da2 = new Date(ar2[0], ar2[1], ar2[2]);
   			 var dif = da2 - da1;
    		var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
   			
 			if(sdd && edd){
   			document.getElementById('days').value = parseInt(dif/cDay)+1 //20일, 21일 22일 총3일차니까 +1해주었다.
   			//call 함수 호출후에 두 날짜의 차이를 days에 넣어줌.
			 }
        	}
        	 </script>
        	 
        	 
        	<br> 
        	총 <input type="text" id="days" size="2" style="text-align:center">일 의 여행계획입니다.<br><br><br>
				<br>
				<hr>
				
				 <h2 class="sch-date">1일차</h2> <!-- 1일차 -->
				 <h4>(4개 입력해주세요)</h4>
                
                <script>

			var addRow;
						//Row 추가
			function insRow() {
  			addRow = document.getElementById("addTable");
  			var oRow = addRow.insertRow();
  			oRow.onmouseover=function(){addRow.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
  			var oCell = oRow.insertCell();

  			//삽입될 Form Tag
  		
 			 var frmTag = "<input type=text name=addText style=width:350px; height:20px;> ";
 			 frmTag += "<input type=button value='삭제' onClick='removeRow()'>";
			  oCell.innerHTML = frmTag;
			}
			//Row 삭제
		function removeRow() {
  		addRow.deleteRow(addRow.clickedRowIndex);
		}

		

</script>
         
	<table>
  	<tr>
   	 <td>
      <table>
        <tr> <!-- 추가버튼 -->
        <td height="25" align="center"> 
         <input name="addButton" type="button" onClick="insRow()" value="추가">
        </td>
        </tr>
        
        <tr>
         <td height="25">
           <table id="addTable" >
            <tr>
              <td>
              <input type="text" name="addText" placeholder='계획을 입력하세요.'>     
             </td>       
            </tr>
          </table>
          </td>
        </tr>
        
       </table>
      </td>
   </tr>
 </table>
 
 
 <br><br><br><br><br><br><br><br>
 
 	<h2 class="sch-date">2일차</h2> <!-- 1일차 -->
 	 <h4>(4개 입력해주세요)</h4>
 
    <script>

			var addRow2;
						//Row 추가
			function insRow2() {
  			addRow2 = document.getElementById("addTable2");
  			var oRow2 = addRow2.insertRow();
  			oRow2.onmouseover=function(){addRow2.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
  			var oCell2 = oRow2.insertCell();

  			//삽입될 Form Tag
  		
 			 var frmTag2 = "<input type=text name=addText2 style=width:350px; height:20px;> ";
 			 frmTag2 += "<input type=button value='삭제' onClick='removeRow2()'>";
			  oCell2.innerHTML = frmTag2;
			}
			//Row 삭제
		function removeRow2() {
  		addRow2.deleteRow2(addRow2.clickedRowIndex);
		}

		

</script>
         
	<table>
  	<tr>
   	 <td>
      <table>
        <tr> <!-- 추가버튼 -->
        <td height="25" align="center"> 
         <input name="addButton" type="button" onClick="insRow2()" value="추가">
        </td>
        </tr>
        
        <tr>
         <td height="25">
           <table id="addTable2" >
            <tr>
              <td>
              <input type="text" name="addText2" placeholder='계획을 입력하세요.'>     
             </td>       
            </tr>
          </table>
          </td>
        </tr>
        
       </table>
      </td>
   </tr>
 </table>
 
 <table>
    <tr>
      <td height="10">
      </td>
    </tr>
    <tr>
      <td align="center">
  
      <input type="submit" name="button" value="입력 확인">
      </td>
    </tr>
 </table>
</form>
		
		</div>
	
            
          

</div>
</div>


<jsp:include page="/views/common/footer.jsp" />