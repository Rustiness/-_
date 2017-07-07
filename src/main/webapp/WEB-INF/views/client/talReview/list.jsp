<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- .jsp --%>
<%@include file="../include/header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Main content -->
<section class="content">

	<center>
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title">교환후기</h3>
			</div>
			<div class='box-body'>

				<select name="searchType">
					<option value="n"
						<c:out value="${cri.searchType == null?'selected':''}"/>>
						---선택---</option>
					<option value="t"
						<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
						제목</option>
					<option value="c"
						<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
						받은재능</option>
					<option value="w"
						<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
						작성자</option>
				</select> <input type="text" name='keyword' id="keywordInput"
					value='${cri.keyword }'>
				<button id='searchBtn'>찾기</button>
				<button id='newBtn'>글쓰기</button>

			</div>
			<div class="box-body">

				<table class="table table-bordered" cellpadding="10">
					<tr bgcolor="#cceeff">
						<th style="width: 10px">NO.</th>
						<th>받은재능</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>

					</tr>

					<c:forEach items="${list }" var="TalExchangeVO">

						<tr>
							<td>${TalExchangeVO. talExcNO}</td>
							
							
									<td>${TalExchangeVO.name}</td>
								
								
									
							
							
							<td><a
								href='/tr/read${pageMaker.makeSearch(pageMaker.cri.page) }&talExcNO=${TalExchangeVO.talExcNO}'>
									${TalExchangeVO.title} </a></td>
							<td>${TalExchangeVO.nickname }</td>
							<td>${TalExchangeVO.writeDate }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- /.box-body -->

		</div>
		<div class="text-center">
			<ul class="pagination" id="pagination">

				<c:if test="${pageMaker.prev}">
					<li><a
						href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
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
						href="list${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
				</c:if>

			</ul>
		</div>

		<!-- /.box-footer-->

	</center>

	<script>
		$(document).ready(
			function() {
	
				$('#searchBtn').on("click",
					function(event) {
	
						self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
	
					});
	
				$('#newBtn').on("click", function(evt) {
	
					self.location = "write";
	
				});
	
			});
	</script>
</section>

<%@include file="../include/footer.jsp"%>