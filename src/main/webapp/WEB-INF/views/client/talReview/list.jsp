<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Main content -->
<section class="content">
	<div class="container-fluid">
		<!--documents-->
		<div class="row row-offcanvas row-offcanvas-left">
			<%@include file="../include/lefter.jsp" %>
			<div class="col-xs-12 col-sm-9 content">
				<div class="panel panel-default">
					<div style="background-color:#875F9A;" class="panel-heading">
						<h3 style="color:#FFF;" class="panel-title">
							<a href="javascript:void(0);" class="toggle-sidebar">
								<span class="fa fa-angle-double-left" data-toggle="offcanvas" title="Maximize Panel"></span>
							</a>재능 패널</h3>
					</div>
					<%-- 패널 시작 --%>
					<div style="min-height: 450px" class="panel-body">
						<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
							<h5>교환후기</h5>
						</div>
						<div class='form-inline'>

							<select name="searchType" class="form-control" style="width: 140px; display: inline-block;">
								<option value="n" <c:out value="${cri.searchType == null?'selected':''}"/>>
									---선택---
								</option>
								<option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}"/>>
									제목
								</option>
								<option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
									받은재능
								</option>
								<option value="w" <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
									작성자
								</option>
							</select>
							<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }'
							       placeholder="검색어" class="form-control" style="width: 200px; display: inline-block;">
							<button id='searchBtn' class="btn btn-default"><i class="fa fa-search"></i></button>
						</div>
						<br>
						<div class="box-body">
							<table style="font-size:inherit;" class="table table-condensed table-bordered table-hover" cellpadding="10">
								<thead style="color:#FFF; background-color:#89729E; width: 100%;">
								<th style="width: 10px">NO.</th>
								<th>받은재능</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								</thead>
								<c:forEach items="${list }" var="talReviewVO">
									<tr>
										<td>${talReviewVO.talReviewNO}</td>
										<td>${talReviewVO.name}</td>
										<td><a href='/tr/read${pageMaker.makeSearch(pageMaker.cri.page) }&talReviewNO=${talReviewVO.talReviewNO}'>
												${talReviewVO.title} </a></td>
										<td>${talReviewVO.nickName }</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${talReviewVO.writeDate }"/></td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<!-- /.box-body -->
					</div>
				</div>
			</div>
			<div class="text-center">
				<ul class="pagination" id="pagination">

					<c:if test="${pageMaker.prev}">
						<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
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
		</div>
	</div>
	<!-- /.box-footer-->

	<script>
		$(document).ready(function () {
			$('#searchBtn').on("click", function (event) {

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