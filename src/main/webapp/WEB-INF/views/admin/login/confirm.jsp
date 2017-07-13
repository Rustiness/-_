<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%-- .jsp --%>

<link rel="stylesheet" href="//prezi-a.akamaihd.net/login-versioned/292-f4e2ba409da434ef697fe50a67f5f60b241a0b37/CACHE/css/bd9dbea875b8.css" type="text/css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(document).on('click', '#login', function() {
			$.ajax({
				url : "http://localhost/ad/check", //일반회원과 구분하기 위해 sql문에 계정정보가 2(직원)일때만 로그인 가능하게 하기
				type : "post",
				data : {
					email : $('#email').val(),
					pass : $('#pass').val()
				},
				dataType : "html",
				success : function(result) {
					if (result.match("fail")) { //잘못된 값 입력시
						document.frm.email.value = ''; //emial초기화
						document.frm.pass.value = ''; //pass초기화
						$('#d1').html("<div class='alert alert-danger' style='text-align : center'><font color=red>아이디가 존재하지 않거나,<br> 비밀번호가 일치하지 않습니다.</font></div>");
					} else { //올바른 값 입력시
						location.href = "/ad/m/list";
					}
				}
			});
		});
	});
</script>
<!-- Main content -->
<section class="content">

	<div class="container">
		<div class="row">
			<!-- Form: No AD -->
			<!--<div class="col-xs-12 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3 btm-24">-->
			<div class="col-xs-12 card-wrapper">
				<!-- Form: With AD -->
				<div style="margin-left: 280px; margin-top: 150px;" 
					class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-0 col-lg-6 col-lg-offset-1 form-container">
					<div class="title-wrapper btm-30">
						<h3 class="title btm-0">로그인</h3>
					</div>
					<form class="form-group " name="frm" accept-charset="utf-8">
						<input
							id="email" type="email" name="email" placeholder="이메일" class="p-form-control btm-24">
							<input id="pass" type="password" name="pass" placeholder="비밀번호" class="p-form-control btm-24" maxlength="128">
						<button type="button" id="login" class="btn-sm btn-responsive green btm-12 btn-login">로그인</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="d1"></div>
	
</section>

