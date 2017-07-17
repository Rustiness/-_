<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link type="text/css" rel="stylesheet" href="/resources/tempBootflatAdmin/dist/css/site.min.css">
<script type="text/javascript" src="/resources/tempBootflatAdmin/dist/js/site.min.js"></script>

<%-------------------------------- 섬머노트 작업 시작 -------------------------%>
<%-- include summernote css/js--%>
<link href="/resources/summernote-0.8.4-dist/dist/summernote.css" rel="stylesheet">
<script src="/resources/summernote-0.8.4-dist/dist/summernote.js"></script>
<script src="/resources/summernote-0.8.4-dist/dist/summernote.js"></script>
<script src="/resources/summernote-0.8.4-dist/dist/lang/summernote-ko-KR.js"></script>
<%-------------------------------- 섬머노트 작업 끝 -------------------------%>

<script type="text/javascript">
	$(document).ready(function () {

		<%-- 섬머노트 적용 시작 --%>
		$('#description').summernote({
			lang: 'ko-KR', // default: 'en-US'
			minHeight: 250,             // set minimum height of editor
			height: 250,                 // set editor height
			maxHeight: null,             // set maximum height of editor
			focus: true                  // set focus to editable area after initializing summernote
		});
		<%-- 섬머노트 적용 끝 --%>

		//$("iframe").on().css("width", "100%").css("height", "350px");
		$("writeTimeL").on(setTimeout("('iframe').css('width', '100%').css('height', '350px')", 1000));
		$(document).on("click", "#btnList", function () {
			self.location = "list?page=${cri.page}&perPageNum=${cri.perPageNum}" + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
		});

		$(document).on("click", ".btn", function () {

			if ($(this).attr("id") == "btnList") {
				self.location = "/te/list?page=${cri.page}&perPageNum=${cri.perPageNum}" + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
			}

			if ($(this).attr("id") == "btnSubmit") {

				$.ajax({
					type: 'post',
					url: '/te/read',
					data: {
						talConnNO: '${connMemVO.talConnNO}',
						memNO: '${connMemVO.memNO}',
						content: oEditors.getById["description"].getIR()
					},
					dataType: 'text',
					success: function (result) {
						console.log("result: " + result);
						if (result.match("successSubmit")) {
							alert("타임라인 등록에 성공하였습니다.");
							location.reload(true);
							//location.href = "/te/read?${pageMaker.makeSearch(pageMaker.cri.page) }&talConnNO=${talExchangeVO.talConnNO}";
						} else if (result.match("failSubmit")) {
							alert("타임라인 등록에 실패하였습니다.");
						}
						$(".btnSubmitClose").click();
					}
				});
			}
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
							<h5>재능교환 타임라인</h5>
						</div>

						<%-- 등록 진행 Modal 시작--%>
						<div class="modal fade" id="submitModal" tabindex="-1" role="dialog"
						     aria-labelledby="smallModal" aria-hidden="true">
							<div class="modal-dialog modal-sm">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
											&times;
										</button>
										<h4 class="modal-title" id="submitModalLabel">교환 타임라인 알림창</h4>
									</div>
									<div class="modal-body">
										<h6>타임 라인을 등록하시겠습니까?</h6>
										<h7>등록시 타임라인에 작성글이 게시됩니다.</h7>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default btnSubmitClose"
										        data-dismiss="modal">취소
										</button>
										<input style="background-color:#5B3256; border-color:#89729E;"
										       class="btn btn-info" type="button" id="btnSubmit" value="등록"/>
									</div>
								</div>
							</div>
						</div>
						<%-- 등록 진행 Modal 끝--%>
						<%-- 목록 진행 Modal 시작--%>
						<div class="modal fade" id="listModal" tabindex="-1" role="dialog" aria-labelledby="smallModal"
						     aria-hidden="true">
							<div class="modal-dialog modal-sm">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
											&times;
										</button>
										<h4 class="modal-title" id="listModalLabel">교환 타임라인 알림창</h4>
									</div>
									<div class="modal-body">
										<h6>교환 목록으로 이동하시겠습니까?</h6>
										<h7>입력하신 내용은 저장되지 않습니다.</h7>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default btnListClose" data-dismiss="modal">
											취소
										</button>
										<input style="background-color:#5B3256; border-color:#89729E;"
										       class="btn btn-info" type="button" id="btnList" value="이동"/>
									</div>
								</div>
							</div>
						</div>
						<%-- 목록 진행 Modal 끝--%>

						<div class="panel-group" id="accordion">
							<div class="panel panel-default">

								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion" href="#connInfo"
										   class="collapsed">
											교환 정보
										</a>
									</h4>
								</div>
								<div id="connInfo" class="panel-collapse collapse in">
									<div class="panel-body">
										상대 연락처 : 010-4423-2213
										상대 메신저 :
										나의 보유 재능 :
										상대의 보유 재능 :
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion" href="#writeTimeL" class="">
											타임라인 작성
										</a>
									</h4>
								</div>
								<div id="writeTimeL" class="panel-collapse collapse">
									<div class="panel-body">
										<div class="col-md-12" style="height: 80%">
										<textarea style="width: 100%;" required="" class=""
										          placeholder="Description" rows="10" cols="30" id="description"
										          name="description"></textarea>
										</div>
										<div class="col-md-12">
											<a style="background-color:#5B3256; border-color:#89729E;" href="#"
											   class="btn btn-info" data-toggle="modal"
											   data-target="#submitModal">등록</a>
										</div>
									</div>
								</div>
							</div>
						</div>

						<br>
						<a style="background-color:#5B3256; border-color:#89729E;" href="#" class="btn btn-info"
						   data-toggle="modal" data-target="#listModal">목록</a>
						<hr>

						<div class="content-row">
							<h2 class="content-row-title">TimeLine</h2>
							<div class="row">
								<div class="col-md-12">
									<div class="timeline">
										<dl>
											<c:forEach items="${listTalExcTimelineVO }" var="talExcTimeItem">
												<c:choose>
												<c:when test="${connMemVO.memNO eq talExcTimeItem.memNO}"><dd class="pos-right clearfix"></c:when>
												<c:otherwise><dd class="pos-left clearfix"></c:otherwise>
												</c:choose>
													<div class="circ"></div>
													<div class="time">${talExcTimeItem.writeDate}</div>
													<div class="events">
														<div class="events-body">
															<h4 class="events-heading">${talExcTimeItem.nickName}</h4>
															<div>${talExcTimeItem.content}</div>
														</div>
													</div>
												</dd>
											</c:forEach>
										</dl>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div><!-- content -->
			</div>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>