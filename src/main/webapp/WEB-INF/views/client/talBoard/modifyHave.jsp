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
	$(document).ready(
		function() {
			$("#goReadBtn").click(function() {
				self.location = 'read' + '?talDocNO=' + '${TalBoardVO.talDocNO}' + '&loginMem=' + '${loginMem}' + '&page=${cri.page}&perPageNum=${cri.perPageNum}'
					+ '&searchType=${cri.searchType}&keyword=${cri.keyword}';
			});

		});
</script>
<!-- Main content -->
<section class="content">
	재능수정 <br> 재능글 제목 <br>
	<form action="/tb/modHave" role="form" method="post">
		<input type="hidden" name="contentWant" id="contentWant"
			value="${TalBoardVO.contentWant}"> <input type='hidden'
			name='page' value="${cri.page}"> <input type='hidden'
			name='perPageNum' value="${cri.perPageNum}"> <input
			type='hidden' name='searchType' value="${cri.searchType}"> <input
			type='hidden' name='keyword' value="${cri.keyword}"> <input
			type="hidden" value="${TalBoardVO.talDocNO }" id="talDocNO"
			name="talDocNO"> <input type="hidden" value="${loginMem }"
			id="loginMem" name="loginMem"> <input type="text"
			value="${TalBoardVO.title }" id="title" name="title"> <input
			type="button" value="보유한 재능 이전글 가져오기"> <br> 보유한 재능 정보 <br>

		<table id="table">

			<tr id="tr1">
				<td>보유한 재능</td>
				<td><c:forEach items="${readDivHave }" var="talDivItem">

						<tr>
							<td>#${talDivItem.name}</td>
						</tr>

					</c:forEach></td>
				<td><input type="text" name="category"></td>
				<td id="button"></td>
			</tr>

		</table>




		보유한 재능 내용 <br>
		<textarea rows="10" cols="50" id="contentHave" name="contentHave"
			value="내용을 수정해 주세요">${TalBoardVO.contentHave }</textarea>
		<br> <input type="submit" value="보유한 재능 수정"> <input
			type="button" value="수정취소" id="goReadBtn">
	</form>








</section>

<%@include file="../include/footer.jsp"%>