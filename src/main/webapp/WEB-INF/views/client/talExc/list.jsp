<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<script>
	var loginmemNO = '${clientMemberVO.memNO }';

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
		});
</script>
<!-- Main content -->
<section class="content">
	<div class="container-fluid">
		<!--documents-->
		<div class="row row-offcanvas row-offcanvas-left">
			<%@include file="../include/lefter.jsp" %>
			<div class="col-xs-12 col-sm-9 content">
				<div class="panel panel-default">
					<div style="background-color:#875F9A;" class="panel-heading">
						<h3 style="color:#FFF;" class="panel-title"><a href="javascript:void(0);" class="toggle-sidebar">
							<span class="fa fa-angle-double-left" data-toggle="offcanvas" title="Maximize Panel"></span></a>재능 패널</h3>
					</div>
					<%-- 패널 시작 --%>
					<div style="min-height: 450px" class="panel-body">
						<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
							<h5>연결된 재능교환 목록</h5>
						</div>
						<div class='form-inline'>
							<select class="form-control" name="searchType">
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
								<option value="w" <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
									작성자
								</option>
							</select>
							<input class=" form-control" type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
							<button style="background-color:#5B3256; border-color:#89729E;" class="btn btn-info" id='searchBtn'>찾기 </button>
						</div>
						<br>
						<table style="font-size:inherit;" class="table table-condensed table-bordered table-hover" cellpadding="10">
							<thead style="color:#FFF; background-color:#89729E; width: 100%;">
							<tr>
								<th style="width: 8vw;">NO.</th>
								<th style="width: 6vw;">연결일시</th>
								<th style="width: 6vw;">교환대상</th>
								<th style="width: 10vw;">보유재능</th>
								<th style="width: 6vw;">연락처</th>
								<th style="width: 6vw;">교환정보</th>
								<th style="width: 8vw;">만족도/후기</th>
							</tr>
							</thead>
							<tbody class="text-info ">
							<c:forEach items="${listSearch }" var="talExchangeVO">
								<tr>
									<td>${talExchangeVO.talConnNO}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${talExchangeVO.connDate}"/></td>
									<td>${talExchangeVO.nickName}</td>
									<td>
										<c:forEach items="${talDivHave }" var="talDivItem">
											<c:if test="${talExchangeVO.talConnNO eq talDivItem.talConnNO}">
												<span style="background-color: #2d9bff; line-height: 30px;" class="label label-info">#${talDivItem.name}</span>
											</c:if>
										</c:forEach>
									</td>
									<td>
											<span style="background-color: #aac0ff; line-height: 30px;" class="label label-info">이메일 : ${talExchangeVO.email}</span>
										<span style="background-color: #aac0ff; line-height: 30px;" class="label label-info">연락처 : ${talExchangeVO.tel}</span>
									</td>
									<td>
										<a href='/te/read${pageMaker.makeSearch(pageMaker.cri.page) }&talConnNO=${talExchangeVO.talConnNO}'>타임라인</a></td>
									</td>
									<td>
										<a href='/tr/write${pageMaker.makeSearch(pageMaker.cri.page) }&talConnNO=${talExchangeVO.talConnNO}'>후기등록</a></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>

						<div class="text-center">
							<ul class="pagination">

								<c:if test="${pageMaker.prev}">
									<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a>
									</li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
									<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>

							</ul>
						</div>
					</div>
					<%-- 패널 종료 --%>
				</div>
			</div>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>