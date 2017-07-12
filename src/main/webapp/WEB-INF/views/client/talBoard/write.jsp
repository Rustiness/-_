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
					<div class="panel-heading">
						<h3 class="panel-title">
							<a href="javascript:void(0);" class="toggle-sidebar"><span
								class="fa fa-angle-double-left" data-toggle="offcanvas"
								title="Maximize Panel"></span></a>재능 패널
						</h3>
					</div>
					<div class="panel-body">
						<div align="left">
							<h4>재능등록</h4>

						</div>

						<br>
						<h5>
							등록단계: [1단계 보유한 재능]>[2단계 원하는 재능]>[<font color="blue">내용확인</font>]
						</h5>
						<br>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h1 class="panel-title">
									<b><font size="5">3단계: 내용확인</font></b>
								</h1>
							</div>


							<form action="write" method="POST">
							
							    <input type="hidden" value="${talHaveDiv}" id="talHaveDiv" name="talHaveDiv"> 
							    <input type="hidden" value="${talWantDiv}" id="talWantDiv" name="talWantDiv"> 
							    <input type="hidden" value="${TalBoardVO.memNO}" id="memNO" name="memNO"> 

								<div class="form-group">
									<div class="col-md-10">
										재능글 제목<br> <input type="text"
											value="${TalBoardVO.title }" id="title" name="title" class="form-control" readonly>
										
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-10 control-label" for="description">보유한
										재능 내용</label>
									<div class="col-md-10">
										<textarea rows="10" cols="50" name="contentHave" id="contentHave"
											value="받아올 내용" class="form-control" readonly>${TalBoardVO.contentHave }</textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-10 control-label" for="description">원하는
										재능 내용</label>
									<div class="col-md-10">
										<textarea rows="10" cols="50" name="contentWant" id="contentWant" value="받아올 내용" class="form-control" readonly>${TalBoardVO.contentWant }</textarea>
									</div>
								</div>









								<br>
								<div class="form-group">
									<div class="col-md-offset-2 col-md-10">
										<button onclick="history.back()" class="btn btn-info">이전단계</button>
										<input type="submit" value="등록" class="btn btn-info"> <input type="button"
											value="작성취소" id="goListBtn" class="btn btn-info">
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