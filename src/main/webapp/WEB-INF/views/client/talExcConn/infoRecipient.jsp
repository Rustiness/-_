<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>

<!-- Main content -->
<section class="content">
	<div class="container-fluid">
		<!--documents-->
		<div class="row row-offcanvas row-offcanvas-left">
			<%@include file="../include/lefter.jsp" %>
			<div class="col-xs-12 col-sm-9 content">
				<div class="panel panel-default">
					<div style="background-color:#875F9A;" class="panel-heading">
						<h3 style="color:#FFF;" class="panel-title"><a href="javascript:void(0);" class="toggle-sidebar"><span class="fa fa-angle-double-left" data-toggle="offcanvas" title="Maximize Panel"></span></a>재능 패널</h3>
					</div>
					<div class="panel-body">
						<%-- CONTENT 시작--%>
							<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
								<h5>신청 상세정보</h5>
							</div>
							<div style="font-weight: bold; font-size: 30px; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.3) 3px 3px 14px;">
								피아노교습과 일식요리법을 교환해요~!${TalExchangeVO.title}</div><br>
						<div class="panel panel-default">
							<div style="background-color:#89729E;" class="panel-heading">
								<h3 style="color:#FFF;" class="panel-title"><b>신청자 정보</b></h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<label class="col-md-2 form-label">닉네임</label>
									<div class="col-md-4">talent87</div>
									<label class="col-md-2 form-label">교환 만족도</label>
									<div class="col-md-4">80%</div>
								</div>
								<div class="row">
									<label class="col-md-2 form-label">원하는 재능</label>
									<div class="col-md-4">#영문번역 #주식투자</div>
									<label class="col-md-2 form-label">보유한 재능</label>
									<div class="col-md-4">#영문번역 #주식투자</div>
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
						</div>


						<div class="panel panel-default">
							<div style="background-color:#89729E" class="panel-heading">
								<div style="color:#FFF;" class="panel-title">
									<span><b>신청 정보</b></span>

								</div>

								<div class="panel-options">
									<a class="bg" data-target="#sample-modal-dialog-1" data-toggle="modal"
									   href="#sample-modal"><i class="entypo-cog"></i></a>
									<a data-rel="collapse" href="#"><i class="entypo-down-open"></i></a>
									<a data-rel="close" href="#!/tasks" ui-sref="Tasks"><i
											class="entypo-cancel"></i></a>
								</div>
							</div>

							<div class="panel-body">
								<div class="text-right">
									<span style="background-color:#89729E;" class="badge badge-primary">Send : 2017-07-13 13:30:04</span>
								</div>
								<div novalidate="" class="form-horizontal jumbotron-contents">

												<p>신청글을 작성한 사람의 내용이 들어갑니다.</p>
												<p>신청글을 작성한 사람의 내용이 들어갑니다.</p>
									신청내용글이 들어가요오오오오오<br>
									신청내용글이 들어가요오오오오오신청내용글이 들어가요오오오오오신청내용글이 들어가요오오오오오
									</div>
								</div>
								<%-- CONTENT 끝--%>
							</div><!-- panel body -->
							<div class="form-group">
								<div class="col-md-12">
									<input style="background-color:#5B3256; border-color:#89729E;" class="btn btn-info" type="button" id="list" value="목록"/>
									<input style="background-color:#5B3256; border-color:#89729E;" class="btn btn-info" type="button" id="ok" value="수락"/>
									<input style="background-color:#5B3256; border-color:#89729E;" class="btn btn-info" type="button" value="거절"/>
								</div>
							</div>
						</div>
					</div><!-- content -->
				</div>
			</div>
		</div>
	</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>