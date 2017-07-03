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
		$.ajax({
			url : "http://localhost/l/findpass/check",
			type : "post",
			data : {
				email : $('#email').val(),
				name : $('#name').val(),
				tel : $('#tel').val()
			},			
			dataType : "html",
			success : function(result) {
						if(result.match("fail")){  //잘못된 값 입력시
							document.frm.email.value='';	
							document.frm.name.value='';		
							document.frm.tel.value='';		
							$('#d1').html("<font color=red>아이디가 존재하지 않거나,<br>입력하신 값이 올바르지 않습니다.</font>");
						}else{						//올바른 값 입력시
							document.frm.email.value='';	
							document.frm.name.value='';		
							document.frm.tel.value='';	
							$('#d1').html("<font color=blue>비밀번호는 :[ ${findpass} ]입니다</font>");
						}
			}
			
		});
 	});

</script>
<!-- Main content -->
<section class="content">

		<form name="frm">
		<table>
				<tr>
					<td>아이디(email)</td><td><input type="text" id="email"></td>
				</tr>
				<tr>
					<td>이름</td><td><input type="text" id="name"></td>
				</tr>
				<tr>
					<td>전화번호</td><td><input type="text" id="tel"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="확인" id="findpass">
						<input type="reset" value="취소">
						<input type="button" value="뒤로" id="back">
					</td>
				</tr>
			</table>
			<div id="d1"></div>
		</form>

</section>

<%@include file="../include/footer.jsp" %>