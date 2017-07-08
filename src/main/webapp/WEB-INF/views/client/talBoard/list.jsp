<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%-- .jsp --%>
<%@include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	var loginMem = '${SUCCESS[0].memNO }';

	$(document).on("click", ".checkMem", function() {
		var memNO = $(this).find('.memNO').val();
		var talDocNO = $(this).find('.talDocNO').val();
		alert(talDocNO);


		self.location = "read${pageMaker.makeSearch(pageMaker.cri.page) }"+"&talDocNO=" + talDocNO + "&loginMem=" + loginMem;


	});
	$(document).ready(
		function() {

			$('#searchBtn').on(
				"click",
				function(event) {

					self.location = "list"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword=" + encodeURIComponent($('#keywordInput').val());

				});

			$('#uploadBtn').on("click", function() {

				self.location = "write1s"
					+ "${pageMaker.makeSearch(pageMaker.cri.page) }";

			});

			/* $('.checkMem').on("click", function(event) {
				 var loginMem = "MEM_A00001";
				alert(loginMem);
				alert($("#memNO").val());
				if(loginMem == $("#memNO").val()){
				self.location="talentInfo_detail_maker"
					+ "?talDocNO="
				    + $(".talDocNO").val();
			      }else{
			    	  self.location = "talentInfo_detail_guest"
			    	+ "?talDocNO="
					+ $(".talDocNO").val();
				}
			}); */


		});
</script>
<!-- talentInfo_board.jsp -->

<!-- Main content -->
<section class="content">

	<div class="container-fluid">


		<div class="row row-offcanvas row-offcanvas-left">
			<%@include file="../include/lefter.jsp"%>
			<div class="form-group">
				<div id="searchType" class="form-inline col-md-10">
					<div class="form-inline">
						<select name="searchType" class="form-control">

							<option value="all"
								<c:out value="${cri.searchType eq 'all'?'selected':''}"/>>
								통합검색</option>
							<option value="t"
								<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>
							<option value="c"
								<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>내용</option>
							<option value="w"
								<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
								작성자</option>

						</select>



						<div class="col-md-2">
							<div class="input-group form-search">
								<input type="text" name='keyword' id="keywordInput"
									value='${cri.keyword }' class="form-control search-query">
								<span class="input-group-btn"><input type="button"
									value="검색" id="searchBtn" class="btn btn-primary"></span>
							</div>
						</div>
						<select name="detailsearchType">
							<option value="all"
								<c:out value="${cri.searchType eq 'all'?'selected':''}"/>>
								전체</option>
							<c:forEach items="${categoryList }" var="TalCategoryVO">
								<option value="${TalCategoryVO.talCateDF }"
									<c:out value="${cri.searchType eq '${TalCategoryVO.talCateDF }'?'selected':''}"/>>
									${TalCategoryVO.name }</option>
							</c:forEach>
						</select> <select>
							<option>보유한재능</option>
							<option>원하는재능</option>
						</select> <input type="button" value="상세재능필터" id="detailsearchBtn"
							class="btn">
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-9 content">

				<div class="panel panel-default">



					<br>

					<div class="panel panel-default">
						<div class="panel-body">
							<div class="content-row">
								<div class="row">
									<c:forEach items="${list}" var="TalBoardVO">

										<div class="col-sm-6 col-md-3">



											<div class="checkMem">
												<input type="hidden" value="${TalBoardVO.memNO }"
													class="memNO"> <input type="hidden"
													value="${TalBoardVO.talDocNO }" class="talDocNO">


												<div class="caption text-center">
													<div height="120" width="100">사진</div>
													<p>${TalBoardVO.nickName }</p>

													<h5>${TalBoardVO.title }</h5>

													<p>보유재능 :</p>
													<c:forEach items="${talDivHave }" var="talDivHavItem">
														<c:if
															test="${TalBoardVO.talDocNO eq talDivHavItem.talDocNO}">
															<span>#${talDivHavItem.name}</span>
														</c:if>
													</c:forEach>
													<br> <br>
													<p>찾는재능 :</p>
													<c:forEach items="${talDivWant }" var="talDivItem">
														<c:if test="${TalBoardVO.talDocNO eq talDivItem.talDocNO}">
															<span>#${talDivItem.name}</span>
														</c:if>
													</c:forEach>



													<p>${TalBoardVO.writeDate }</p>



												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>

					<input type="button" value="보유재능등록" id="uploadBtn"
						class="btn btn-primary">
				</div>

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
			</div>
		</div>
	</div>

</section>

<%@include file="../include/footer.jsp"%>