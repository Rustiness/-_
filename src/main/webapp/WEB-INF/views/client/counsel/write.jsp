<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Main content -->
<section class="content">
<div class="panel panel-default">
	<div class="panel-body">
						<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
							<h5>고객문의 등록</h5>
						</div>
						
						<form role="form" method="post" name="frm">
						<div class="panel panel-default">
							<div style="background-color:#89729E;" class="panel-heading">
								<h3 style="color:#FFF;" class="panel-title"><b>문의 정보</b></h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-list-alt"></span>
             							<span class="glyphicon-class">카테고리</span>
             						</label>
									<div class="col-md-4">
										<select name="questDF" class="form-control" style="width: 140px; display: inline-block;">
						       				 <c:forEach items="${list}" var="boardVO">
												   <option value="${boardVO.questDF }">${boardVO.name }</option>
											</c:forEach>
						   				 </select>
       								</div>
								</div>
								
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-cloud"></span>
             							<span class="glyphicon-class">공개여부</span>
             						</label>
									<div class="col-md-4">
       									 <select name="state" class="form-control" style="width: 140px; display: inline-block;">
											<option value ='2'>공개</option>
											<option value ='1'>비공개</option>
						    				</select>
       								</div>
								</div>
								
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-user"></span>
             							<span class="glyphicon-class">작성자 닉네임</span>
             						</label>
									<div class="col-md-4">
										<input type="text" value="${clientMemberVO.nickName }" disabled="disabled" class="form-control" style="width: 200px; display: inline-block;">
										<input type="hidden" name='memNO' value="${clientMemberVO.memNO }" >
       								</div>
								</div>
								<br><br>
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-tag"></span>
             							<span class="glyphicon-class">문의글 제목</span>
             						</label>
									<div class="col-md-4">
       									<input type="text" id="title" name='title' class="form-control" placeholder="제목">
       								</div>
								</div>
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-pencil"></span>
             							<span class="glyphicon-class">문의 내용</span>
             						</label>
									<div class="col-md-4">
       									<textarea class="form-control" name="content" rows="5" cols="50" id="content" placeholder="내용 "></textarea>
       								</div>
								</div>
								
							</div>
						</div>
						<div align="center">
							<button type="button" class="btn btn-primary">등록</button>
							<button type="button" class="btn btn-danger" >취소</button>
						</div>
					</form>
				</div>
	</div>


			
		
	
	
			<script>
			$(document).ready(function() {

			$(".btn-warning").on("click",function() {
				self.location = "list";
				});


		});
			
			$(document).ready(function() {
			
				$(".btn-primary").on("click",function() {
					var title = $('#title').val();
					var content = $('#content').val();
					
					if(title.length > 10 || content.length >200){
						alert("제목은 10자 이내 내용은 200자 이내로 작성해 주세요");
					}else{
						if((title == undefined || title =='' ) || (content == undefined || content =='')){
							alert("제목 또는 내용을 입력해주세요");
						}else {
							document.frm.submit();
							alert("등록 되었습니다");
						}
					}
					
				});


			});
			
			
				</script>
	
</section>




<%@include file="../include/footer.jsp" %>