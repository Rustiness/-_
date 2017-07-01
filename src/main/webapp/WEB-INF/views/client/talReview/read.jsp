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
		<div class="box-header">
			<h3 class="box-title">교환후기 상세정보</h3>
		</div>
		<!-- /.box-header -->

		
			<div class="box-body">
				<div data-text-content="true"
					style="font-weight: bold; font-size: 24px; border-width: 0px; border-style: none; text-shadow: rgba(0, 0, 0, 0.5) 3px 3px 14px;">${TalExchangeVO.title}</div>
				<div data-text-content="true"
					style="font-weight: bold; font-size: 18px; background-color: rgb(224, 224, 224);"
					class>교환 정보</div>
				<table>
				   <form role="form"  method="post">

					<input type='hidden' name='talExcNO' value="${TalExchangeVO.talExcNO}"> 
					<input type='hidden' name='page' value="${cri.page}"> 
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
				</form>
					<tr>
						<th>받은 재능:</th>
						<td>피아노</td>
						<th>교환자 닉네임:</th>
						<td></td>
					</tr>
				</table>
				<br> ${TalExchangeVO.nickname}님의 교환후기<br>
				<br>
				<textarea rows="5" cols="50" readonly>${TalExchangeVO.content }</textarea>
				<br>
			</div>
			<!-- /.box-body -->
			<br>
			<div class="box-footer">
				<button type="submit" class="btn btn-warning" id="modifyBtn">수정</button>
				<button type="submit" class="btn btn-danger" id="removeBtn">삭제</button>
				<button type="submit" class="btn btn-primary" id="goListBtn">목록으로</button>
			</div>

			<!-- The time line -->


			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>
	</div>

					<script>
				
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "mod");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$(".btn-danger").on("click", function(){
		formObj.attr("action", "remove");
		formObj.submit();
	});
	
	$(".btn-primary").on("click", function(){
		self.location = "list";
	});
	
});

</script>
</section>

<%@include file="../include/footer.jsp" %>