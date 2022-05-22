<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/views/common/header.jsp" />


<div class="container">
	<div class="contents">
		<h2 class="page-tit">여행후기</h2>

		<div class="reviewWrite">
			<form action="${ pageContext.request.contextPath }/review/write" method="post">
				<div class="form-type">
					<input type="text" class="form-control" id="title"
						placeholder="제목을 입력해 주세요." name="title" required="required">
				</div>
				<div class="form-type">
					<select id="select-type" name="type">
						<option value="여행지">여행지</option>
						<option value="맛집">맛집</option>
						<option value="숙소">숙소</option>
					</select>
					<!-- api로 텍스트 내 옵션.. -->
				</div>
				<!-- 로그인 된 사용자 이름 불러오기? -->
				<!-- <div id="form-writer">${ review.mem_nm }</div> -->
				<div class="form-type">
					<textarea class="form-control" rows="15" id="form-content"
						name="content" placeholder="내용 작성"></textarea>
				</div>
				<div>
					<button type="submit" id="btn-rv_submit">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>

<jsp:include page="/views/common/footer.jsp" />
