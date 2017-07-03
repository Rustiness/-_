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
		});

$(document).on('click', '#upcheck', function() {
	$.ajax({
		url : "http://localhost/m/upchkPass",
		type : "post",
		data : {
			memNO : '${SUCCESS.memNO }',
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
			memNO : '${SUCCESS.memNO }',
			delpass : $('#delpass').val()
			
		},			
		dataType : "html",
		success : function(result) {
					if(result.match("success")){  //올바른 값 입력시
						if (confirm("정말 삭제하시겠습니까??") == true){    //확인
							alert("그동안  LTE(Life Talent Exchange)를 이용해 주셔서 대단히 갑사합니다.\n 다시 만나는 날을 희망합니다. :D");
							location.href="/logout";	
						}
					}else{						//잘못된 값 입력시
						document.delfrm.delpass.value='';		//pass초기화
						$('#deld1').html("<font color=red>비밀번호가 일치하지 않습니다.</font>");
					}
			}
		});
	});
</script>
<!-- Main content -->
<section class="content">
<div id="up">
			<b>회원 정보를 확인하기 위해서는 비밀번호를 입력해 주세요.</b><br>
		<form name="upfrm">
			비밀번호 : <input type="password" id="uppass"> <input type="button" value="확인" id="upcheck">
			<div id="upd1"></div>
		</form>
		</div>
		
		<div id="del">
			<b>회원 탈퇴를 하시려면 비밀번호를 입력해 주세요.</b><br>
				<form name="delfrm">
			비밀번호 : <input type="password" id="delpass"> <input type="button" value="확인" id="delcheck">
			<div id="deld1"></div>
		</form>
		
		</div>
</section>

<%@include file="../include/footer.jsp" %>