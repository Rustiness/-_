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
	alert("비밀번호 찾기 페이지입니다.\n회원가입시 입력하셨던 아이디(email),이름,전화번호를 입력해주세요.");

	$(document).on('click', '#back', function() {
		location.href="/l/logout";
	});
	
	$(document).on('click', '#findpass', function() {
		var tel1 =  $('#tel1').val();
		var tel2 =  $('#tel2').val();
		var tel3 =  $('#tel3').val();
		
		var tel = tel1+"-"+tel2+"-"+tel3
		$.ajax({
			url : "/l/findpass/check",
			type : "post",
			data : {
				email : $('#email').val(),
				name : $('#name').val(),
				tel : tel
			},			
			dataType : "text",
			success : function(result) {
				var seul = result.split(':')[0];
				var seul2 = result.split(':')[1];
				
				if(seul.match("fail")){  //잘못된 값 입력시
					document.frm.email.value='';	
					document.frm.name.value='';		
					document.frm.tel1.value='';		
					document.frm.tel2.value='';		
					document.frm.tel3.value='';		
					$('#d1').html("<font color=red>아이디가 존재하지 않거나,<br>입력하신 값이 올바르지 않습니다.</font>");
				}else{						//올바른 값 입력시
					document.frm.email.value='';	
					document.frm.name.value='';		
					document.frm.tel1.value='';		
					document.frm.tel2.value='';		
					document.frm.tel3.value='';		
					$('#d1').html("<font color=blue>비밀번호는 :[ "+seul2+" ]입니다</font>");
				}
			}
			
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
					<div class="panel-body">
						<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
							<h5>비밀번호 찾기</h5>
						</div>
						<br>
						<div class="panel panel-default">
							<div style="background-color:#89729E;" class="panel-heading">
								<h3 style="color:#FFF;" class="panel-title"><b>정보입력</b></h3>
							</div>
						<form name="frm">
							<div class="panel-body">
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-globe"></span>
             							<span class="glyphicon-class">아이디</span>
             						</label>
									<div class="col-md-4">
										<input type="text" id="email" class="form-control" style="width: 200px; display: inline-block;">
       								</div>
								</div>
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-user"></span>
             							<span class="glyphicon-class">이름</span>
             						</label>
									<div class="col-md-4">
										<input type="text" id="name" class="form-control" style="width: 200px; display: inline-block;">
       								</div>
								</div>
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-phone-alt"></span>
             							<span class="glyphicon-class">전화번호</span>
             						</label>
									<div class="col-md-4">
										<input type="text" id="tel1" class="form-control" style="width: 60px; display: inline-block;"> 
										-<input type="text" id="tel2" class="form-control" style="width: 65px; display: inline-block;">
										-<input type="text" id="tel3" class="form-control" style="width: 65px; display: inline-block;">
									</div>
								</div>
							</div>
								<div id="d1" ></div>
							</form>
						</div>
						<div align="center">	
							<button id="findpass" type="button" class="btn btn-primary">확인</button>
        					<button id="back" type="button" class="btn btn-warning ">뒤로</button>
						</div>
					</div>
				</div>








		
		











</section>

<%@include file="../include/footer.jsp" %>