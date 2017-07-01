<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>




<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">

			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ BOARD</h3>
				</div>
				<!-- /.box-header -->
				<form role="form" action="modifyPage" method="post">

					<input type='hidden' name='csNO' value="${boardVO.csNO}"> <input
						type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

				</form>

				<div class="box-body">
					<div data-text-content="true"
						style="font-weight: bold; font-size: 24px; border-width: 0px; border-style: none; text-shadow: rgba(0, 0, 0, 0.5) 3px 3px 14px;"
						class="">교환할 때 문의요~</div>
					<div data-text-content="true"
						style="font-weight: bold; font-size: 18px; background-color: rgb(224, 224, 224);"
						class>문의 정보</div>
					<table>
						<tr>
							<th><div data-text-content="true"
									style="font-size: 16px; font-weight: bold;" class
									spellcheck="false">카테고리</div></th>
							<td><div data-text-content="true" style="font-size: 16px;"
									class>재능교환</div></td>
							<th><div data-text-content="true"
									style="font-size: 16px; font-weight: bold;" class
									spellcheck="false">공개여부</div></th>
							<td><div data-text-content="true" style="font-size: 16px;"
									class>공개</div></td>
							<th><div data-text-content="true"
									style="font-size: 16px; font-weight: bold;" class
									spellcheck="false">상태</div></th>
							<td><div data-text-content="true" style="font-size: 16px;"
									class>답변완료</div></td>
						</tr>
					</table>


					<div class="form-group">
						<label for="exampleInputEmail1">제목</label> <input type="text"
							name='title' class="form-control" value="${boardVO.title}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">작성자</label> <input type="text"
							name="writer" class="form-control" value="${boardVO.memNO}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">문의내용</label>
						<textarea class="form-control" name="content" rows="5" cols="50"
							readonly="readonly">${boardVO.content}</textarea>
					</div>
				</div>
				<!-- /.box-body -->

				<div class="box-footer">
			    <button type="submit" class="btn btn-warning" id="modifyBtn">수정</button>
			    <button type="submit" class="btn btn-danger" id="removeBtn">삭제</button>
			    <button type="submit" class="btn btn-primary" id="goListBtn">목록 </button>
				</div>

			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->


<div class="row">
  <div class="col-md-12">

<!-- 댓글 등록에 필요한 div -->
	<div class="box box-success">
		 <div class="box-header">
			<h3 class="box-title">ADD NEW REPLY</h3>
		 </div>
		 
		 <div class="box-body">
				<label for="exampleInputEmail1">작성자 명</label> 
				<input class="form-control" type="text" placeholder="작성자" id="newReplyWriter"> 
						
				<label for="exampleInputEmail1">댓글 내용</label> 
				<input class="form-control" type="text" placeholder="댓글 내용" id="newReplyText">
		 </div>
			
				<!-- /.box-body -->
		 <div class="box-footer">
					<button type="button" class="btn btn-primary" id="replyAddBtn">ADD REPLY</button>
		 </div>
	</div>


<!-- 댓글 목록과 페이징 처리에 필요한 div -->
	<ul class="timeline">
		<!-- timeline time label -->
		<li class="time-label" id="repliesDiv"><span class="bg-green">Replies List </span></li>
	</ul>

	<div class='text-center'>
		<ul id="pagination" class="pagination pagination-sm no-margin ">

		</ul>
	</div>

		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
	
<!-- Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>    

</section>



<script>
/*수정, 삭제, 목록가기  */
					$(document).ready(function() {
				
						var formObj = $("form[role='form']");
				
						console.log(formObj);
				
						$(".btn-warning").on("click", function() {
							formObj.attr("action", "/c/mod");
							formObj.attr("method", "get");
							formObj.submit();
						});
				
						$(".btn-danger").on("click", function() {
							formObj.attr("action", "/c/removePage");
							formObj.submit();
						});
				
						$(".btn-primary").on("click", function() {
							formObj.attr("method", "get");
							formObj.attr("action", "/c/list");
							formObj.submit();
						});
				
					});
</script>







<%@include file="../include/footer.jsp"%>



