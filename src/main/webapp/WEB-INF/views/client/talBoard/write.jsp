<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%-- .jsp --%>
<%@include file="../include/header.jsp"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {


		$("#goListBtn").click(function() {
			 
			self.location = "/tb/list";



		});
		
		

		


		
	});
</script>
<!-- Main content -->
<section class="content">
	<div class="container-fluid">
		<div class="row row-offcanvas row-offcanvas-left">
			<%@include file="../include/lefter.jsp"%>

			<div class="col-xs-12 col-sm-9 content">

				<div class="panel panel-default">
					<div class="panel-heading" style="background-color:#875F9A;">
						<h3 class="panel-title" style="color:#FFF;">
							<a href="javascript:void(0);" class="toggle-sidebar"><span
								class="fa fa-angle-double-left" data-toggle="offcanvas"
								title="Maximize Panel"></span></a>재능 패널
						</h3>
					</div>
					<div class="panel-body">
						<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
							<h4>재능등록</h4>

						</div>

						<br>
						<h5>
							등록단계: [1단계 보유한 재능]>[2단계 원하는 재능]>[<font color="blue">내용확인</font>]
						</h5>
						<br>
						<div class="panel panel-default">
							<div class="panel-heading" style="background-color:#875F9A;">
								<h1 class="panel-title" style="color:#FFF;">
									<b><font size="5">3단계: 내용확인</font></b>
								</h1>
							</div>


							<form action="write" method="POST">
                              
                                <input type="hidden" value="${TalBoardVO.contentHave}" id="contentHave" name="contentHave">
                                <input type="hidden" value="${TalBoardVO.contentWant}" id="contentWant" name="contentWant">
								<input type="hidden" value="${talHaveDiv}" id="talHaveDiv"
									name="talHaveDiv"> <input type="hidden"
									value="${talWantDiv}" id="talWantDiv" name="talWantDiv">
								<input type="hidden" value="${TalBoardVO.memNO}" id="memNO"
									name="memNO">
									

								<div class="form-group">
									<label class="col-md-10 control-label" for="description">
										재능글 제목</label><br> <input type="text"
											value="${TalBoardVO.title }" id="title" name="title"
											class="form-control" readonly>

									</div>
								</div>
								<div class="form-group">
									<label class="col-md-10 control-label" for="description">보유한
										재능 내용</label><br><br>
									<div class="panel-body">
								<div style="min-height: 80px;" novalidate="" class="form-horizontal jumbotron-contents">
									${TalBoardVO.contentHave}
								</div>
							</div>
								</div>
								<div class="form-group">
									<label class="col-md-10 control-label" for="description">원하는
										재능 내용</label><br><br>
          
									<div class="panel-body">
								<div style="min-height: 80px;" novalidate="" class="form-horizontal jumbotron-contents">
									${TalBoardVO.contentWant}
								</div>
							</div>









								<br>
								<div class="form-group">
									<div class="col-md-offset-2 col-md-10">
										<button onclick="history.back()" class="btn btn-info">이전단계</button>
										<input type="submit" value="등록" class="btn btn-info">
										<input type="button" value="작성취소" id="goListBtn"
											class="btn btn-info">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp"%>