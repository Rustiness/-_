<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- .jsp --%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
	$(document).on('click', '#login', function() {
		$.ajax({
			url : "http://localhost/ad/check",		//일반회원과 구분하기 위해 sql문에 계정정보가 2(직원)일때만 로그인 가능하게 하기
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
							location.href="/ad";
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
					<td>관리자 Email</td><td><input type="text" name="email" id="email"></td>
					<td rowspan="2"><input type="button" value="로그인" id="login"></td>
				</tr>
				<tr>
					<td>관리자 비밀번호</td><td><input type="password" name="pass" id="pass"></td>
				</tr>
				
		</table>
		</form>
				<div id="d1" align="center"></div>
</section>

<%@include file="../include/footer.jsp" %>