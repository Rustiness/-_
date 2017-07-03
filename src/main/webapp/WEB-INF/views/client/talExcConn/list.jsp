<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Main content -->
<section class="content">
	<center>
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title">교환신청 수신 목록</h3>
			</div>
			<div class='box-body'>
				<select name="searchType">
					<option value="n" <c:out value="${cri.searchType == null?'selected':''}"/>>==SELECT==</option>
					<option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>
					<option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>상대재능</option>
					<option value="w"<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>작성자</option>
				</select>
				<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
				<button id='searchBtn'>검색</button>
			</div>
			<div class="box-body">
				<table class="table table-bordered" cellpadding="10">
					<tr>
						<th>NO.</th>
						<th>상대 보유재능</th>
						<th>메시지명</th>
						<th>작성자</th>
						<th>수신일시</th>
						<th>상태</th>
					</tr>
					<c:forEach items="${list }" var="talExcConnList">
						<tr>
							<td>${talExcConnList.talConnNO}</td>
							<td>
								<c:forEach items="${divList }" var="talDivItem">
									<c:out value="${talExcConnList.talConnNO eq talDivItem.talConnNO ? talDivItem.name:''}"/>
								</c:forEach>
							</td>
							<td>
								<a href='/tec/read${pageMaker.makeSearch(pageMaker.cri.page) }&talExcNO=${talExcConnList.talConnNO}'>${talExcConnList.title} </a>
							</td>
							<td>${talExcConnList.nickname }</td>
							<td>${talExcConnList.reqDate }</td>
							<td>${talExcConnList.state }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- /.box-body -->
		</div>
		<div class="text-center">
			<ul class="pagination" id="pagination">
				<c:if test="${pageMaker.prev}">
					<li>
						<a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
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
				$('#searchBtn').on("click", function (event) {
					self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
				});
			});
	</script>
</section>
<%@include file="../include/footer.jsp" %>