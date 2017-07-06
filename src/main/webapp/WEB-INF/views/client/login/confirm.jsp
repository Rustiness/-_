<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- confirm.jsp --%>
<%@include file="../include/header.jsp" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
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
			url : "http://localhost/l/check",
			type : "post",
			data : {
				email : $('#email').val(),
				pass : $('#pass').val()
			},			
			dataType : "html",
			success : function(result) {
						if(result.match("fail")){  //잘못된 값 입력시
							document.frm.email.value='';	//emial초기화
							document.frm.pass.value='';		//pass초기화
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
<form name="frm">		
			<table>
				<tr>
					<td>아이디(Email)</td><td><input type="text" name="email" id="email"></td>
					<td rowspan="2"><input type="button" value="로그인" id="login"></td>
				</tr>
				<tr>
					<td>비밀번호</td><td><input type="password" name="pass" id="pass"></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input type="button" id="join" value="회원가입"> <input type="button" id="findpass" value="비밀번호 찾기"> 
				</tr>
		</table>
		</form>
				<div id="d1" align="center"></div>
</section>

<%@include file="../include/footer.jsp" %>