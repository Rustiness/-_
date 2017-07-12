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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var loginMem = '${clientMemberVO.memNO }';

	$(document).on("click", ".checkMem", function () {
		var memNO = $(this).find('.memNO').val();
		var talDocNO = $(this).find('.talDocNO').val();
		self.location = "read${pageMaker.makeSearch(pageMaker.cri.page) }" + "&talDocNO=" + talDocNO + "&loginMem=" + loginMem;
	});

	$(document).ready(function () {

		//마우스 커서 표시 ON
		$(".checkMem").mouseenter(function () {
			$(this).css('cursor', 'pointer');
		});

		//마우스 커서 표시 OFF
		$(".checkMem").mouseleave(function () {
			$(this).css('cursor', 'default');
		});

		$('#searchBtn').on( "click", function (event) {
				self.location = "list"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
			});

		$('.uploadBtn').on("click", function () {
				if (loginMem == '') {
					alert('로그인시 이용가능 합니다.');
				} else {
					self.location = "write1s" + "${pageMaker.makeSearch(pageMaker.cri.page) }" + "&memNO=" + loginMem;
				}
			}
		);

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
							<h5>재능 목록</h5>
						</div>
						<div class="content-row">
							<div class="form-inline pull-left">
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
								<button style="background-color:#5B3256; border-color:#89729E;" class="btn btn-info" id='searchBtn'>검색
								</button>
							</div>
							<%-- 필터 시작 --%>
							<div class="form-inline pull-right">
								<select class="form-control" name="detailsearchType">
									<option value="all" <c:out value="${cri.searchType eq 'all'?'selected':''}"/>>
										전체
									</option>
									<c:forEach items="${categoryList }" var="TalCategoryVO">
										<option value="${TalCategoryVO.talCateDF }"
												<c:out value="${cri.searchType eq '${TalCategoryVO.talCateDF }'?'selected':''}"/>>
												${TalCategoryVO.name }</option>
									</c:forEach>
								</select>
								<select class="form-control">
									<option>보유한 재능</option>
									<option>원하는 재능</option>
								</select>
								<input type="button" id="detailsearchBtn" class="btn btn-info" value="상세재능필터"/>
							</div>
							<%-- 필터 끝 --%>
						</div>
						<br><br><br>
						<div class="text-center">
							<input type="button" value="보유한 재능 등록" class="btn btn-primary uploadBtn">
						</div>
						<div class="content-row">
							<div class="row">
								<c:forEach items="${list}" var="TalBoardVO">
								<div class="col-xs-18 col-sm-6 col-md-4">
									<div class="thumbnail checkMem">
										<input type="hidden" value="${TalBoardVO.memNO }" class="memNO"> <input type="hidden" value="${TalBoardVO.talDocNO }" class="talDocNO">
										<span class="label label-info info pull-right">
											<span data-toggle="tooltip" title="viewed">257 <b class="glyphicon glyphicon-eye-open"></b></span>
											<span data-toggle="tooltip" title="viewed">3 <b class="glyphicon glyphicon-star"></b></span>
										</span>
										<h4>
											${TalBoardVO.title }
										</h4>
										<img style="padding:0;" src="http://placehold.it/500x250/EEE" alt="...">
										<div class="caption">
											<span class="label label-info info pull-right ">Writer 『${TalBoardVO.nickName }』</span>
										</div>
										<div class="caption">
												<span style="background-color: #8744ff; " class="label label-info info col-xs-12">▼ 보유한 재능 ▼
												</span>
											<c:forEach items="${talDivHave }" var="talDivHavItem">
												<c:if test="${TalBoardVO.talDocNO eq talDivHavItem.talDocNO}">
																	<span style="background-color: #2d9bff; line-height: 30px;" class="label label-info">#${talDivHavItem.name}</span>
												</c:if>
											</c:forEach>
										</div>
										<div class="caption">
												<span style="background-color: #c525ff; " class="label label-info info col-xs-12">▼ 원하는 재능 ▼
												</span>
											<c:forEach items="${talDivWant }" var="talDivItem">
												<c:if test="${TalBoardVO.talDocNO eq talDivItem.talDocNO}">
																	<span style="background-color: #2d9bff; line-height: 30px;" class="label label-info info">#${talDivItem.name}</span>
												</c:if>
											</c:forEach>
										</div>
											<%--<div class="clearfix"></div>--%>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="text-center">
					<input type="button" value="보유한 재능 등록" class="btn btn-primary uploadBtn">
				</div>
			</div>

			<div class="box-footer">
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
							<li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>