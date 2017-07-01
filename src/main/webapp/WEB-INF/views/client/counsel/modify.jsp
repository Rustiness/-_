<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@include file="../include/header.jsp" %>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">MODIFY BOARD</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="mod" method="post">
					<div data-text-content="true"
						style="font-weight: bold; font-size: 18px" class>고객문의 수정</div>
					<div data-text-content="true"
						style="font-weight: bold; font-size: 18px; background-color: rgb(224, 224, 224);"
						class spellcheck="false">문의 정보</div>
					<table>
						<tr>
							<th>카테고리</th>
							<td><input type="text" value="재능교환" readonly></td>
						</tr>
						<tr>
							<th>공개여부</th>
							<td><input type="text" value="공개" readonly></td>
						</tr>


					</table>

					
	<input type='hidden' name='page' value="${cri.page}"> 
	<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

					<div class="box-body">

						<div class="form-group">
							<label for="exampleInputEmail1">csNO</label> <input type="text"
								name='csNO' class="form-control" value="${boardVO.csNO}"
								readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">제목</label> <input type="text"
								name='title' class="form-control" value="${boardVO.title}">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">작성자</label> <input type="text"
								name="writer" class="form-control" value="${boardVO.memNO}">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">문의내용</label>
							<textarea class="form-control" name="content" rows="5" cols="50">${boardVO.content}</textarea>
						</div>
					</div>
					<!-- /.box-body -->
				</form>
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">저장</button>
					<button type="submit" class="btn btn-warning">취소</button>
				</div>
				
				
				<script>
$(document).ready(
	function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning")
				.on("click",function() {
					self.location = "/c/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});

		$(".btn-primary").on("click",
				function() {
					formObj.submit();
				});
	});
</script>




			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp" %>
