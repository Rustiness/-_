<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Main content -->
<section class="content">
	<div class="container-fluid">
		<div class="row row-offcanvas row-offcanvas-left">
			<%@include file="../include/lefter.jsp" %>
			<div class="col-xs-12 col-sm-9 content">
				<div class="panel panel-default">
					<div style="background-color:#875F9A;" class="panel-heading">
						<h3 style="color:#FFF;" class="panel-title"><a href="javascript:void(0);"
						                                               class="toggle-sidebar">
							<span class="fa fa-angle-double-left" data-toggle="offcanvas" title="Maximize Panel"></span></a>재능
							패널
						</h3>
					</div>
					<div class="row" style="margin-left: 15px">
						<!-- left column -->
						<div class="col-md-12">
							<!-- general form elements -->

							<div style="min-height: 450px" class="panel-body">
								<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
									<h5>고객문의</h5>
								</div>
								<left>
									<select name="searchType" class="form-control"
									        style="width: 140px; display: inline-block;">
										<option value="n" <c:out value="${cri.searchType == null?'selected':''}"/>>
											---선택---
										</option>
										<option value="t"
												<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
											제목
										</option>
										<option value="c"
												<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
											내용
										</option>
										<option value="m"
												<c:out value="${cri.searchType eq 'm'?'selected':''}"/>>
											작성자
										</option>

									</select>
									<input type="text" name='keyword' id="keywordInput"
									       value='${cri.keyword }' placeholder="검색어" class="form-control"
									       style="width: 200px; display: inline-block;">
									<button id='searchBtn' class="btn btn-default"><i class="fa fa-search"></i></button>
									<button id='newBtn' class="btn btn-default"><span
											class="glyphicon glyphicon-pencil"></span>
									</button>
									<br>
									<div class="box-body">

										<br><br>

										<table style="font-size:inherit;"
										       class="table table-condensed table-bordered table-hover"
										       cellpadding="10">
											<thead style="color:#FFF; background-color:#89729E; width: 100%;">
											<tr>
												<th style="width: 10px">NO.</th>
												<th>문의항목</th>
												<th>제목</th>
												<th>닉네임</th>
												<th>작성일</th>
											</thead>
											<!-- 	<th>상태</th> -->


											</tr>

											<c:forEach items="${list}" var="boardVO">
												<c:if test="${boardVO.state =='2' }">
													<tr>
														<td>${boardVO.csNO}</td>
														<td>${boardVO.name }</td>
														<td><a
																href='/c/read${pageMaker.makeSearch(pageMaker.cri.page) }&csNO=${boardVO.csNO}'>
																${boardVO.title} </a></td>

														<td>${boardVO.nickName}</td>
														<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
														                    value="${boardVO.writeDate}"/></td>


													</tr>
												</c:if>
											</c:forEach>

										</table>
									</div>
								</left>
								<!-- /.box-body -->

								<div class="box-footer">

									<div class="text-center">
										<ul class="pagination">

											<c:if test="${pageMaker.prev}">
												<li><a
														href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a>
												</li>
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
														href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a>
												</li>
											</c:if>

										</ul>
									</div>


								</div>

								<!-- /.box-footer-->
							</div>
						</div>
					</div>
				</div>
				<!--/.col (left) -->

			</div>
		</div>
		<!-- /.row -->
</section>
<!-- /.content -->


<script>
	var result = '${msg}';

	/* 	if (result == 'SUCCESS') {
	 alert("글이 등록되었습니다.");
	 }
	 if (result == 'delete') {
	 alert("글이 삭제되었습니다.");
	 } */


</script>

<script>
	$(document).ready(
		function () {

			$('#searchBtn').on(
				"click",
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

<%@include file="../include/footer.jsp" %>