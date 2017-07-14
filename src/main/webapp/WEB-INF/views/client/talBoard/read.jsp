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
<!-- talentInfo_detail_maker.jsp -->
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function () {
		var loginMem = '${loginMem}';
		var memNO = '${TalBoardVO.memNO}';

		if (loginMem == memNO) {
			$("#updateBtnHave").html("<input type='button' value='보유한 재능 수정' class='btn btn-primary conetentHave'>");
			$("#updateBtnWant").html("<input type='button' value='원하는 재능 수정' class='btn btn-primary contentWant'>");
			$("#btnDelete").html("<input type='button' value='교환글 삭제' class='btn btn-danger remove'>");
		} else {
			$("#updateBtnHave").html("");
			$("#updateBtnWant").html("");
			$("#btnApply").html("<input type='button' value='교환 신청' class='btn btn-info exchageApply'>");
		}

		/* 보유한 재능 수정 */
		$('.conetentHave').on("click", function () {
			self.location = "modHave?page=${cri.page}&perPageNum=${cri.perPageNum}"
				+ "&searchType=${cri.searchType}&keyword=${cri.keyword}" + "&contentHave=" + '${TalBoardVO.contentHave }' + "&title=" + '${TalBoardVO.title }' + '&loginMem=' + loginMem + '&talDocNO=' + '${TalBoardVO.talDocNO}';
		});

		/* 원하는 재능 수정 */
		$('.contentWant').on("click", function () {
			self.location = "modWant?page=${cri.page}&perPageNum=${cri.perPageNum}"
				+ "&searchType=${cri.searchType}&keyword=${cri.keyword}" + "&contentWant=" + '${TalBoardVO.contentWant }' + "&title=" + '${TalBoardVO.title }' + '&loginMem=' + loginMem + '&talDocNO=' + '${TalBoardVO.talDocNO}';

		});

		/* 재능교환 신청 */
		$('.exchageApply').on("click", function () {
			self.location = "/tec/app?page=${cri.page}&perPageNum=${cri.perPageNum}"
				+ "&searchType=${cri.searchType}&keyword=${cri.keyword}"
				+ '&memNO=' + loginMem + '&talDocNO=' + '${TalBoardVO.talDocNO}';
		});

		/* 목록 표시 */
		$("#btnList").click(function () {
			self.location = "list?page=${cri.page}&perPageNum=${cri.perPageNum}"
				+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
		});
		$('.remove').click(function(){
			
			self.location ="remove?" + "talDocNO=" + $('.talDocNO').val();
			
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
								<span class="fa fa-angle-double-left" data-toggle="offcanvas"
								      title="Maximize Panel"></span>
							</a>재능 패널</h3>
					</div>
					<div>
						<input type='hidden' name='page' value="${cri.page}"> <input
							type='hidden' name='perPageNum' value="${cri.perPageNum}">
						<input type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">
						<input type='hidden' name='talDocNO' value="${TalBoardVO.talDocNO}" id='talDocNO' class="talDocNO">
					</div>
					<div class="panel-body">
						<%-- CONTENT 시작--%>
						<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
							<h5>재능 상세정보</h5>
						</div>
						<div style="font-weight: bold; font-size: 30px; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.3) 3px 3px 14px;">${TalBoardVO.title}</div>
						<br>
						<div class="panel panel-default">
							<div style="background-color:#89729E;" class="panel-heading">
								<h3 style="color:#FFF;" class="panel-title"><b>작성자 정보</b></h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<label class="col-md-2 form-label">닉네임</label>
									<div class="col-md-4">${TalBoardVO.nickName}</div>
									<label class="col-md-2 form-label">교환 만족도</label>
									<div class="col-md-4">80%</div>
								</div>
								<div class="row">
									<label class="col-md-2 form-label">보유한 재능</label>
									<div class="col-md-4">
										<c:forEach items="${readDivHave }" var="talDivItem">
											<span style="background-color: #c525ff" class="label label-info">#${talDivItem.talDivName}</span>
										</c:forEach>
									</div>
									<label class="col-md-2 form-label">원하는 재능</label>
									<div class="col-md-4">
										<c:forEach items="${readDivWant }" var="talDivItem">
											<span style="background-color: #2d9bff" class="label label-info">#${talDivItem.talDivName}</span>
										</c:forEach>
									</div>

								</div>
								<div class="row">
									<label class="col-md-2 form-label">재능교환 진행상태</label>
									<div class="col-md-4">3건 진행중 / 10건 완료</div>
									<label class="col-md-2 form-label">작성한 재능 항목</label>
									<div class="col-md-4">문서 > 자기소개/이력서</div>
									<div class="col-md-4">번역 > 영문번역</div>
									<div class="col-md-8"></div>
									<div class="col-md-4">상담&노하우 > 주식투자</div>
								</div>
							</div>
						</div>
						<%-- CONTENT -panel-default 시작 --%>
						<div class="panel panel-default">
							<div style="background-color:#89729E" class="panel-heading">
								<div style="color:#FFF;" class="panel-title">
									<span><b>『${TalBoardVO.nickName}』님의 보유한 재능 정보</b></span>
								</div>
							</div>

							<div class="panel-body">
								<div class="text-right">
									<span style="background-color:#89729E;"
									      class="badge badge-primary">Write : <fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									                                                          value="${TalBoardVO.writeDate}"/></span>
								</div>
								<div style="min-height: 80px;" novalidate="" class="form-horizontal jumbotron-contents">
									${TalBoardVO.contentHave }
								</div>
							</div>
						</div>
						<div class="form-group text-center" id="updateBtnHave"></div>
						<div class="panel panel-default">
							<div style="background-color:#89729E" class="panel-heading">
								<div style="color:#FFF;" class="panel-title">
									<span><b>『${TalBoardVO.nickName}』님이 원하는 재능 정보</b></span>
								</div>
							</div>

							<div class="panel-body">
								<div style="min-height: 80px;" novalidate="" class="form-horizontal jumbotron-contents">
									${TalBoardVO.contentWant }
								</div>
							</div>
						</div>
						<div class="form-group text-center" id="updateBtnWant"></div>

						<div class="panel panel-default">
							<div style="background-color:#89729E" class="panel-heading">
								<div style="color:#FFF;" class="panel-title">
									<span><b>재능 교류 현황</b></span>
								</div>
							</div>
							<div class="panel-body">
								<div novalidate="" class="form-horizontal jumbotron-contents">
									재능교환 신청자 수 : ${TalBoardVO.excCalls }명
								</div>
							</div>

						</div>
						<%-- CONTENT -panel-default 끝 --%>
						<div class="form-group">
							<div class="col-md-12">
								<input style="background-color:#5B3256; border-color:#89729E;" class="btn btn-info"
								       type="button" id="btnList" value="목록"/>
								<span id="btnDelete"></span>
								<span id="btnApply"></span>
							</div>
						</div>
					</div>


				</div><!-- panel body -->
			</div>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>