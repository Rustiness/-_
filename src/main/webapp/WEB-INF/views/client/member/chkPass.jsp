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
<script type="text/javascript">
var del = '${delete }';
$(document).ready(function(){ //DOM이 준비되고
   if(del==''){			//세션값이 없을경우
	 	$('#del').hide(); // ID가 unlogin인 요소를 hide();        
  	 }else{ // 그 외에는
  	 	$('#up').hide();
  	 }


$(document).on('click', '#upcheck', function() {
	$.ajax({
		url : "http://localhost/m/upchkPass",
		type : "post",
		data : {
			memNO : '${clientMemberVO.memNO }',
			uppass : $('#uppass').val()
		},			
		dataType : "html",
		success : function(result) {
					if(result.match("success")){  //올바른 값 입력시
						location.href="/m/mod";	
					}else{						//잘못된 값 입력시
						document.upfrm.uppass.value='';		//pass초기화
						$('#upd1').html("<font color=red>비밀번호가 일치하지 않습니다.</font>");
					}
		}
		
	});
});
$(document).on('click', '#delcheck', function() {
$.ajax({
		url : "http://localhost/m/delchkPass",
		type : "post",
		data : {
			memNO : '${clientMemberVO.memNO }',
			delpass : $('#delpass').val()
			
		},			
		dataType : "html",
		success : function(result) {
					if(result.match("success")){  //올바른 값 입력시
						if (confirm("정말 삭제하시겠습니까??") == true){    //확인
							alert("그동안  LTE(Life Talent Exchange)를 이용해 주셔서 대단히 갑사합니다.\n 다시 만나는 날을 희망합니다. :D");
							location.href="/l/logout";	
						}
					}else{						//잘못된 값 입력시
						document.delfrm.delpass.value='';		//pass초기화
						$('#deld1').html("<font color=red>비밀번호가 일치하지 않습니다.</font>");
					}
			}
		});
	});
});
</script>
<!-- Main content -->
<section class="content">
<div class="panel panel-default">
					<div>
						<input type="hidden" name="page" value="1"> <input type="hidden" name="perPageNum" value="10">
						<input type="hidden" name="searchType" value="">
						<input type="hidden" name="keyword" value="">
					</div>
				<div id="up">
					<div class="panel-body">
						
						<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
							<h5>회원 정보수정</h5>
						</div>
						<br>
						
						<div class="panel panel-default">
							<div style="background-color:#89729E;" class="panel-heading">
								<h3 style="color:#FFF;" class="panel-title"><b>회원 정보를 확인하기 위해서는 비밀번호를 입력해 주세요.</b></h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<label class="col-md-2 form-label" style="margin-top: 5px">
										<span style="margin-left: 50px;">
											<span class="glyphicon glyphicon-lock"></span>
	            				 			<span class="glyphicon-class">비밀번호</span>
										</span>
            				 		</label>
            				 		<form name="upfrm">
									<div class="col-md-4">
										<input type="password" id="uppass" class="form-control" style="width: 200px; display: inline-block;"> 
										<button type="button" id="upcheck" class="btn btn-info">확인</button><br>
										<div id="upd1"></div>
									</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<div id="del">
					<div class="panel-body">
						
						<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
							<h5>회원 정보수정</h5>
						</div>
						<br>
						
						<div class="panel panel-default">
							<div style="background-color:#89729E;" class="panel-heading">
								<h3 style="color:#FFF;" class="panel-title"><b>회원 탈퇴를 하시려면 비밀번호를 입력해 주세요.</b></h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<label class="col-md-2 form-label" style="margin-top: 5px">
										<span style="margin-left: 50px;">
											<span class="glyphicon glyphicon-lock"></span>
	            				 			<span class="glyphicon-class">비밀번호</span>
										</span>
            				 		</label>
            				 		<form name="delfrm">
									<div class="col-md-4">
										<input type="password" id="delpass" class="form-control" style="width: 200px; display: inline-block;"> 
										<button type="button" id="delcheck" class="btn btn-info">확인</button><br>
										<div id="deld1"></div>
									</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
</div>
</section>

<%@include file="../include/footer.jsp" %>