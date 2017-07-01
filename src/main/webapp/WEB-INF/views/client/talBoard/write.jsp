<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%-- .jsp --%>
<%@include file="../include/header.jsp"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {


		$("#goListBtn").click(function() {

			self.location = "/tb/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
				+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";



		});
	});
</script>
<!-- Main content -->
<section class="content">
	재능등록<br> 등록단계: [1단계 보유한 재능]>[2단계 원하는 재능]>[<font color="blue">내용확인</font>]<br>
	내용확인<br> 재능글 제목<br>
	<form action="write" method="POST">
		<input type="hidden" value="${TalentListVO.title }" id="title"
			name="title"> <input type="button" value="원하는 재능 이전글 가져오기"><br>
		보유한 재능 정보<br> 보유한 재능<br>
		<textarea rows="10" cols="50" name="contentHave" value="받아올 내용">${TalentListVO.contentHave }</textarea>
		<br> 원하는 재능 정보<br> 원하는 재능 <br>
		<textarea rows="10" cols="50" name="contentWant" value="받아올 내용">${TalentListVO.contentWant }</textarea>
		<br>
		<br>
		<button onclick="history.back()">이전단계</button>
		<input type="submit" value="등록"> <input type="button"
			value="작성취소" id="goListBtn">

	</form>

</section>

<%@include file="../include/footer.jsp"%>