<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			
			<div class='box'>
				<div class="box-header with-border">
				<center>
					<h1 class="box-title">고객문의 게시판</h1>
					
				</center>
				</div>
				<center>
				<div class="box-body">
				
				<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							Title</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							Content</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							Writer</option>
						
					</select> 
					<input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }' placeholder="검색어">
					<button id='searchBtn'>Search</button>
					<button id='newBtn'>New Board</button>
					<br>
				
				
				<center>
					<table class="table table-bordered" cellpadding="10">
						<tr>
							<th style="width: 10px">NO.</th>
							<th>문의항목</th>
							<th>제목</th>
							<th>작성자번호</th>
							<th>작성일</th>
							
							<th>상태</th>
						</tr>

						<c:forEach items="${list}" var="boardVO">

						
							
						<tr>
							<td>${boardVO.csNO}</td>
							<td>${boardVO.questDF }</td>
							<td><a
									href='/c/read${pageMaker.makeSearch(pageMaker.cri.page) }&csNO=${boardVO.csNO}'>
										${boardVO.title} </a></td>
							<td>${boardVO.memNO}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${boardVO.writeDate}" /></td>
							
							<td> <center> ${boardVO.state }</center></td>
						</tr>

						</c:forEach>

					</table>
				</div>
				</center>
				<!-- /.box-body -->

			<center>
				<div class="box-footer">

			<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>


				</div>
				</center>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->



<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("글이 등록되었습니다.");
	}
	if (result == 'delete') {
		alert("글이 삭제되었습니다.");
	}


</script>

<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + encodeURIComponent ($('#keywordInput').val());

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "write";

				});

			});
</script>

<%@include file="../include/footer.jsp" %>