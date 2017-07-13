<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Main content -->
<section class="content">
<div class="box box-primary">
	<div class="box-header"></div>
	<!-- /.box-header -->

	<form role="form" method="post" action="mod">
		
	    <input type='hidden' name='talReviewNO' value="${talReviewVO.talReviewNO}">
		<input type='hidden' name='page' value="${cri.page}"> 
		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
		<input type='hidden' name='searchType' value="${cri.searchType}">
		<input type='hidden' name='keyword' value="${cri.keyword}">
	
		<div data-text-content="true"
			style="font-weight: bold; font-size: 18px" class>교환후기 등록</div>
		<div data-text-content="true"
			style="font-weight: bold; font-size: 18px; background-color: rgb(224, 224, 224);"
			class spellcheck="false">교환 정보</div>
		<table>
			<tr>
				<th>받은재능</th>
				<td><input type="text" value="피아노" readonly></td>
			</tr>
			<tr>
				<th>교환자닉네임</th>
				<td><input type="text" value="x7360" readonly></td>
			</tr>
	

		</table>
		<div data-text-content="true"
			style="font-weight: bold; font-size: 18px; background-color: rgb(224, 224, 224);"
			class spellcheck="false">후기입력</div>
		<div data-text-content="true" style="font-size: 16px;">후기 제목</div>
		<input type="text" id="title" name="title" value="${talReviewVO.title}">
		<div data-text-content="true" style="font-size: 16px;" rows="5"
			cols="50">후기 내용</div>
		<textarea rows="5" cols="50" id="content" name="content"> ${talReviewVO.content }</textarea>
		<!-- /.box-body -->

		<div class="box-footer">
			<button type="submit" class="btn btn-primary" >수정완료</button>
			<button type="button" class="btn btn-warning">취소</button>
		</div>
	</form>
	<script>
			$(document).ready(function() {

			var formObj = $("form[role='form']");
			console.log(formObj);
			$(".btn-warning").on("click",function() {
				self.location = "list?page=${cri.page}&perPageNum=${cri.perPageNum}"
				+"&searchType=${cri.searchType}&keyword=${cri.keyword}";		
						
				});

				$(".btn-primary").on("click",function() {
				formObj.submit();
			});

		});
				</script>



</div>

</section>

<%@include file="../include/footer.jsp" %>