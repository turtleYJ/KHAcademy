<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<jsp:include page="/views/common/header.jsp" />

    <div class="container" style="display: block; flex: none; height: auto;">
        <div class="contents">
            <h2 class="page-tit">여행후기</h2>
            <div class="reviewTitle">
                <div id="reviewType">${ review.rv_type }</div>
                <div id="reviewTitle">${ review.rv_title }</div>
                <div id="reviewHits">조회수 ${ review.rv_hits }</div>
                <div class="reviewWriteInf">
                    <div id="userName">${ review.mem_nm }</div>
                    <div id="reviewUploadDate">${ review.rv_date }</div>
                </div>
            </div>
            <div class="reviewContents">
                ${ review.rv_content }
            </div>

            <div id="comment-container">
	            <div class="comment-editor">
		            <form action="${ pageContext.request.contextPath }/review/comment" method="POST" id="frm-comment">
		            	<input type=hidden name="rv_no" value="${ review.rv_no }">
		            	<textarea name="cm_content" id="commentContent" rows="3" cols="55" placeholder="댓글을 입력해주세요."></textarea>
		            	<button type="submit" id="btn-insert">등록</button>
		            </form>
	            </div>
	            <table id="tbl-comment" style="border: none; margin-bottom: 30px;">
			    	<c:forEach var="comment" items="${ review.rv_comments }">
				    	<tr class="level1">
				    		<td>
				    			<sub class="comment-writer" style="font-weight: bold;"><c:out value="${ comment.mem_nm }"/></sub>
				    			<sub class="comment-date" style="font-size: 13px; float: right; margin-right: 10px;"><fmt:formatDate type="date" value="${ comment.cm_date }"/></sub>
				    			<br>
				    			<sub class="comment-contents" style="font-size: 13px;"><c:out value="${ comment.cm_content }"/></sub>
				    		</td>
				    		<td>
				    			<c:if test="${ ! empty loginMember && loginMember.no == comment.mem_no }">
			    					<button id="#btn-commentdelete">삭제</button>
		    					</c:if>
				    		</td>
				    	</tr>
			    	</c:forEach>
	            </table>
	            <div>
            </div>
                <a type="button" id="btn-list" href="${ pageContext.request.contextPath }/review/reviewList">목록</a>
            </div>
        </div>
    </div>


<jsp:include page="/views/common/footer.jsp" />
