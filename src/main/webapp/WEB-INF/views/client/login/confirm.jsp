<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- confirm.jsp --%>
<%@include file="../include/header.jsp" %>
<link rel="stylesheet" href="/resources/tempBootflatAdmin/dist/css/site.min.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600&amp;subset=latin,latin-ext" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
      body {			
        background-color: #4E2C4C;
        color: #C1C3C6
      }
</style>
<script type="text/javascript">
$( document ).ready(function() {
	$(document).on('click','#findpass',function(){
		location.href="/l/findPass";
	});
	
	$(document).on('click','#join',function(){
		location.href="/j/terms";
	});
	
	$(document).on('click', '#login', function() {
		$.ajax({
			url : "/l/check",
			type : "post",
			data : {
				email : $('#email').val(),
				pass : $('#pass').val()
			},			
			success : function(result) {
						if(result.match("fail")){  //잘못된 값 입력시
							document.frm.email.value='';
							document.frm.pass.value='';
							$('#d1').html("<font color=red>아이디가 존재하지 않거나,<br> 비밀번호가 일치하지 않습니다.</font>");
						}else{						//올바른 값 입력시
							location.href="/lte";
						}
			}
			
		});
 	}); 
});
</script>
<!-- Main content -->
<section class="content">
    <div class="container">
      <form class="form-signin" name="frm">
        <h3 class="form-signin-heading">로그인</h3>
        <div class="form-group">
          <div class="input-group">
            <div class="input-group-addon">
              <i class="glyphicon glyphicon-user"></i>
            </div>
            <input type="text" class="form-control" id="email" name="email" placeholder="UserEamil" autocomplete="off">
          </div>
        </div>
        <div class="form-group">
          <div class="input-group">
            <div class="input-group-addon">
              <i class=" glyphicon glyphicon-lock "></i>
            </div>
            <input type="password" class="form-control" id="pass"  name="pass" placeholder="Password" autocomplete="off">
          </div>
        </div>
        <button class="btn btn-lg btn btn-block" id="login" type="button">로그인</button><br>
        <button class="btn btn-xs btn btn-block" id="join" type="button">회원가입</button>
        <button class="btn btn-xs btn btn-block" id="findpass" type="button">비밀번호 찾기</button>
      </form><br><br><br>

    </div>
    <div class="clearfix"></div>
	<div id="d1" align="center"></div>
</section>

<%@include file="../include/footer.jsp" %>