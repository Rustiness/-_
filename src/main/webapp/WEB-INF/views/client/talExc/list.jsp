<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>

<!-- Main content -->
<section class="content">
	<center>
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title">연결된 재능교환 목록</h3>
			</div>
			<div class='box-body'>

				<select name="searchType">
					<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
						---선택---
					</option>
					<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
						제목
					</option>
					<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
						받은재능
					</option>
					<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
						작성자
					</option>
				</select> <input type="text" name='keyword' id="keywordInput"
				                 value='${cri.keyword }'>
				<button id='searchBtn'>찾기</button>

			</div>
			<div class="box-body">

				<table class="table table-bordered" cellpadding="10">
					<tr bgcolor="#cceeff">
						<th style="width: 10px">NO.</th>
						<th>교환대상</th>
						<th>상대 보유재능</th>
						<th>연락처</th>
						<th>연결일시</th>
						<th>만족도/후기</th>

					</tr>

					<c:forEach items="${list }" var="TECVO">

						<tr>
							<td>${TECVO. talExcNO}</td>
							<td>제이쿼리</td>
							<td>
								<a href='/tr/read${pageMaker.makeSearch(pageMaker.cri.page) }&talExcNO=${TECVO.talExcNO}'>
										${TalExchangeVO.title} </a></td>
							<td>${TECVO.nickname }</td>
							<td>${TECVO.writeDate }</td>


						</tr>

					</c:forEach>

				</table>
			</div>
			<!-- /.box-body -->


		</div>
		<div class="text-center">
			<ul class="pagination" id="pagination">

				<c:if test="${pageMaker.prev}">
					<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
				           end="${pageMaker.endPage }" var="idx">
					<li
							<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
				</c:if>

			</ul>
		</div>

		<!-- /.box-footer-->

	</center>

	<script>
		$(document).ready(
			function () {

				$('#searchBtn').on("click",
					function (event) {

						self.location = "list"
							+ '${pageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val()
							+ "&keyword=" + encodeURIComponent($('#keywordInput').val());

					});

				$('#newBtn').on("click", function (evt) {

					self.location = "write";

				});

			});
	</script>
</section>

<%@include file="../include/footer.jsp" %>