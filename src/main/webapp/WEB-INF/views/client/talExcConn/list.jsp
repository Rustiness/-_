<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(
		function () {
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
					<div class="panel-body">
						<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
							<h5>교환신청 수신함</h5>
						</div>
						<div class='form-inline'>
							<select class="form-control" name="searchType">
								<option value="n" <c:out value="${cri.searchType == null?'selected':''}"/>>---선택---
								</option>
								<option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목
								</option>
								<option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>보유재능
								</option>
								<option value="w"<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>닉네임
								</option>
							</select>
							<input class=" form-control" type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
							<button style="background-color:#5B3256; border-color:#89729E;" class="btn btn-info" id='searchBtn'>검색 </button>
						</div>
						<br>
						<table style="font-size:inherit;" class="table table-condensed table-bordered table-hover" cellpadding="10">
							<thead style="color:#FFF; background-color:#89729E;">
							<tr>
								<th class="col-md-1">NO.</th>
								<th class="col-md-2">보유재능</th>
								<th class="col-md-3">메시지명</th>
								<th class="col-md-1">닉네임</th>
								<th class="col-md-1">수신일시</th>
								<th class="col-md-1">확인</th>
								<th class="col-md-1">연결</th>
							</tr>
							</thead>
							<tbody class="text-info">
							<c:forEach items="${list }" var="talExcConnList">
								<tr class="text-center">
									<td>${talExcConnList.talConnNO}</td>
									<td>
										<c:forEach items="${divList }" var="talDivItem">
											<c:if test="${talExcConnList.talConnNO eq talDivItem.talConnNO}">
												<span style="background-color: #2d9bff" class="label label-info">#${talDivItem.name}</span>
											</c:if>
										</c:forEach>
									</td>
									<td>
										<a href='/tec/infoRecipient${pageMaker.makeSearch(pageMaker.cri.page) }&talConnNO=${talExcConnList.talConnNO}&isYNview=${talExcConnList.isYNview}'>${talExcConnList.title} </a>
									</td>
									<td>${talExcConnList.nickname }</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${talExcConnList.reqDate }"/></td>
									<td>
										<c:choose>
											<c:when test="${talExcConnList.isYNview eq 'N'}">읽지않음</c:when>
											<c:when test="${talExcConnList.isYNview eq 'Y'}">읽음</c:when>
											<c:otherwise>ERROR</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${talExcConnList.state eq '1'}">비활성</c:when>
											<c:when test="${talExcConnList.state eq '2'}">대기</c:when>
											<c:when test="${talExcConnList.state eq '3'}">성공</c:when>
											<c:when test="${talExcConnList.state eq '4'}">실패</c:when>
											<c:otherwise>ERROR</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
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
					</div>
					<%-- 패널 종료 --%>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="../include/footer.jsp" %>