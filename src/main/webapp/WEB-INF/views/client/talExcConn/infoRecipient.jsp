<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<script type="text/javascript">
	$(document).ready(function () {
		$(document).on("click", "#btnList", function () {
			self.location = "list?page=${cri.page}&perPageNum=${cri.perPageNum}" + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
		});

		$(document).on("click", ".btn", function () {
			var state = 2;
			if ($(this).attr("id") == "btnAccept"){
				console.log("수락 진행");
				state = 3;
			}else if ($(this).attr("id") == "btnRefuse"){
				console.log("거절 진행");
				state = 4;
			} else {
				return;
			}

			$.ajax({
				type: 'post',
				url: '/tec/infoRecipient',
				data: {
					talConnNO: '${talExcConnVO.talConnNO}',
					state: state,
				},
				dataType: 'text',
				success: function (result) {
					console.log("result: " + result);
					if(result.match("successAccept")) {
						alert("교환신청을 수락하였습니다.");
					} else if (result.match("failAccept")) {
						alert("교환신청 수락이 실패되었습니다.");
					} else if (result.match("successRefuse")) {
						alert("교환신청을 거절하였습니다.");
					} else if (result.match("failRefuse")) {
						alert("교환신청 거절이 실패되었습니다.");
					} else if (result.match("failError")) {
						alert("신청에 문제가 발생하였습니다.");
					}
					self.location = "list?page=${cri.page}&perPageNum=${cri.perPageNum}" + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				}
			});
		});

		$(document).on("click", "#btnRefuse", function () {
			$.ajax({
				type: 'post',
				url: '/tec/infoRecipient',
				data: {
					talConnNO: '${talExcConnVO.talConnNO}',
					state: '4',
				},
				dataType: 'text',
				success: function (result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("신청을 거절하였습니다.");
						self.location = "list?page=${cri.page}&perPageNum=${cri.perPageNum}" + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
					}
				}
			});
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
					<div class="panel-body">
						<%-- CONTENT 시작--%>
						<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
							<h5>신청 상세정보</h5>
						</div>
						<div style="font-weight: bold; font-size: 30px; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.3) 3px 3px 14px;">${talExcConnVO.title}</div>
						<br>
						<div class="panel panel-default">
							<div style="background-color:#89729E;" class="panel-heading">
								<h3 style="color:#FFF;" class="panel-title"><b>신청자 정보</b></h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<label class="col-md-2 form-label">닉네임</label>
									<div class="col-md-4">${talExcConnVO.nickname}</div>
									<label class="col-md-2 form-label">교환 만족도</label>
									<div class="col-md-4">80%</div>
								</div>
								<div class="row">
									<label class="col-md-2 form-label">원하는 재능</label>
									<div class="col-md-4">
										<c:forEach items="${listSenderWantDiv }" var="wantDivItem">
											<span style="background-color: #2d9bff" class="label label-info">#${wantDivItem.name}</span>
										</c:forEach>
									</div>
									<label class="col-md-2 form-label">보유한 재능</label>
									<div class="col-md-4">
										<c:forEach items="${listSenderHaveDiv }" var="haveDivItem">
											<span style="background-color: #c525ff" class="label label-info">#${haveDivItem.name}</span>
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
								<div class="row form-inline">
									<div id="talDocNO" value="재능글NO" title="재능글번호" style="display:none;"/>
								</div>
							</div>


							<div class="panel panel-default">
								<div style="background-color:#89729E" class="panel-heading">
									<div style="color:#FFF;" class="panel-title">
										<span><b>신청 정보</b></span>
									</div>

									<div class="panel-options">
										<a class="bg" data-target="#sample-modal-dialog-1" data-toggle="modal"
										   href="#sample-modal">
											<i class="entypo-cog"></i></a>
										<a data-rel="collapse" href="#"><i class="entypo-down-open"></i></a>
										<a data-rel="close" href="#!/tasks" ui-sref="Tasks"><i
												class="entypo-cancel"></i></a>
									</div>
								</div>

								<div class="panel-body">
									<div class="text-right">
								<span style="background-color:#89729E;"
								      class="badge badge-primary">Send : <fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								                                                         value="${talExcConnVO.reqDate}"/></span>
									</div>
									<div style="min-height: 80px;" novalidate="" class="form-horizontal jumbotron-contents">
										${talExcConnVO.content}
									</div>
								</div>
								<%-- CONTENT 끝--%>
							</div><!-- panel body -->
							<div class="form-group">
								<div class="col-md-12">
									<input style="background-color:#5B3256; border-color:#89729E;" class="btn btn-info"
									       type="button" id="btnList" value="목록"/>
									<a style="background-color:#5B3256; border-color:#89729E;" href="#"
									   class="btn btn-info"
									   data-toggle="modal" data-target="#acceptModal">수락</a>
									<a style="background-color:#5B3256; border-color:#89729E;" href="#"
									   class="btn btn-info"
									   data-toggle="modal" data-target="#refuseModal">거절</a>
								</div>
							</div>
						</div>
					</div><!-- content -->
					<%-- 신청 수락 Modal 시작--%>
					<div class="modal fade" id="acceptModal" tabindex="-1" role="dialog" aria-labelledby="smallModal"
					     aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
									</button>
									<h4 class="modal-title" id="acceptModalLabel">재능교환 알림창</h4>
								</div>
								<div class="modal-body">
									<h6>재능 교환을 진행하시겠습니까?</h6>
									<h7>수락시 상대와 자신의 연락처가 공유됩니다.</h7>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									<input style="background-color:#5B3256; border-color:#89729E;" class="btn btn-info"
									       type="button" id="btnAccept" value="수락"/>
								</div>
							</div>
						</div>
					</div>
					<%-- 신청 수락 Modal 끝--%>
					<%-- 신청 거절 Modal 시작--%>
					<div class="modal fade" id="refuseModal" tabindex="-1" role="dialog" aria-labelledby="smallModal"
					     aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
									</button>
									<h4 class="modal-title" id="refuseModalLabel">재능교환 알림창</h4>
								</div>
								<div class="modal-body">
									<h6>재능 교환을 거절하시겠습니까?</h6>
									<h7>거절시 해당 신청내역이 목록에서 삭제됩니다.</h7>
									<!--<h7>교환 거절시 상대는 연결된 게시글을 통해 교환신청을 할 수 없게 됩니다.</h7>-->
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									<input style="background-color:#5B3256; border-color:#89729E;" class="btn btn-info"
									       type="button" id="btnRefuse" value="거절"/>
								</div>
							</div>
						</div>
					</div>
					<%-- 신청 거절 Modal 끝--%>
				</div>
			</div>
		</div>
	</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>