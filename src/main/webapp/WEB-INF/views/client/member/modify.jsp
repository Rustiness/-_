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
$(document).ready(function () {
		var lastmsg = $('#msglast').val(); // 기존에 있던 메신저의 마지막행값
		
$(document).on('click', '#update', function() {
	$.ajax({
		url : "/m/mod/result",
		type : "post",
		data : {
			memNO : $('#memNO').val(),
			pass : $('#pass').val(),
			name : $('#name').val(),
			nickName : $('#nickName').val(),
			tel : $('#tel').val()
		},			
		dataType : "html",
		success : function(result) {
					if(result.match("1")){  //수정성공시
						for(var i=1; i<=lastmsg; i++){	//기존에 있는 메신저의 양만큼 수정을 실행 
							$.ajax({
								url : "/m/mod/messenger/up",			
								type : "post",
								data : {
										no : i+'',
										memNO : $('#memNO').val(),
										mesDF : $('#upmesDF'+i+' option:selected').val(),
										id : $('#upmesID'+i).val()
											}
							});
						}
						alert("수정이 완료되었습니다\n다시 로그인해 주세요.");
						location.href="/l/confirm"	
					
					}else{
						alert("실패입니다");
					}
		}
		
	});
	});
		
		var no=''; //메신저 추가시 비교용
			for(var i=1; i<4; i++){
				if(!$('#no'+i).length){
					no=i+"";
					break;
				}
			}
			if(lastmsg>=3){
				$('#addmsgMAX').hide();
			}else{
				$('#addmsgMAX').show();
			}
		//메신저 행 추가
		$(document).on('click', '[name="addButton"]', function() {
				$.ajax({
					url : "/m/mod/messenger/add",
					type : "post",
					data : {
							no : no,
							memNO : $('#memNO').val(),
							mesDF : $('#select_box option:selected').val(),
							id : $('#msg').val()
					},
					success : function(result) {
						if(result =="clientmsgAddSUCCESS"){
							alert('메신저가 추가되었습니다.');
							location.href='/m/mod';
						}
					}
				});
		});
		//기존에 있던 메신저 제거
		$(document).on('click', '#removemsg', function() {
			if(lastmsg==1){
				alert("최소 1개의 메신저를 보유해야 합니다.");
			}else{
				$.ajax({
					url : "/m/mod/messenger/del",
					type : "post",
					data : {
						no :$(this).prev().val(),
						memNO : $('#memNO').val()
					},
					success : function(result) {						
						if(result === "clientmsgDelSUCCESS"){
							alert('메신저가 삭제되었습니다.');
							location.href='/m/mod';
						
						}
					}
				});
			}
		});
})
</script>
<!-- Main content -->
<section class="content">
회원정보수정ss<br><br>
계정정보
회원분류
<input type="hidden" value="${clientMemberVO.memNO }" id="memNO">
        <c:choose>
        	<c:when test="${clientMemberVO.personDF eq 'D_PE01'}"><input type=text value=일반회원 disabled=disabled></c:when>
			<c:otherwise><input type=text value=관리자 disabled=disabled></c:otherwise>        
        </c:choose><br>
아이디(이메일주소)<input type="text" value="${clientMemberVO.email }" disabled="disabled"><br>
비밀번호<input type="password" value="${clientMemberVO.pass }" id="pass"><br>
비밀번호확인<input type="password" value="${clientMemberVO.pass }"><br><br>
개인정보<br>
이름<input type="text" value="${clientMemberVO.name }" id="name"><br>
닉네임<input type="text" value="${clientMemberVO.nickName }" id="nickName">            <br>
생년월일<input type="Date" value="${clientMemberVO.birth }" disabled="disabled" id="birth"><br>
성별   
           <c:choose>
           		<c:when test="${clientMemberVO.sex eq '1'}"><input type="text" value="남자" disabled="disabled" id=sex></c:when>
           		<c:otherwise><input type="text" value="여자" disabled="disabled" id="sex"></c:otherwise>
           </c:choose><br>
핸드폰번호<input type="text" value="${clientMemberVO.tel }" id="tel"><br>
가입일<input type="Date" value="${clientMemberVO.joinDate }" disabled="disabled" id="joinDate">	<br><br>
메신저목록<br>
	
<c:forEach items="${clientMessengerVO }" var="my" varStatus="status">  <!-- 회원이 등록한 메신저 수정-->
  <div>
	<select id="upmesDF${status.count }">
		<c:forEach items="${messengerVOlist}" var="list">	
				<c:choose>
					<c:when test="${my.name eq list.name}">
						<option selected="selected" value="${list.mesDF }">${list.name }</option>
					</c:when>
					<c:otherwise>
						<option value="${list.mesDF }">${list.name }</option>
					</c:otherwise>
				</c:choose>
		</c:forEach>
	</select>
	<input type="text" value="${my.id}" id="upmesID${status.count }"> 
	<input type="hidden" value="${my.no }" id="no${my.no }">
	<input type=button value='삭제' id='removemsg'><br>
	
	<c:if test="${status.last}">
		<input type="hidden" value="${status.count}" id="msglast">
	</c:if>
  </div>
</c:forEach>

<br><br>
<div id="addmsgMAX">
메신저 추가하기
	<form id="megform"><!-- 메신저 추가로 입력하기-->
		<select id="select_box">
				 <c:forEach items="${messengerVOlist}" var="messenger"> 
						<option value="${messenger.mesDF }">${messenger.name }</option>
				</c:forEach>
		</select>
			 
			 	<input type="text" id="msg" value=""> <input name="addButton" type="button" value="추가"><br>
			 
	</form>
</div>
          <input type="button" value="수정" id="update"> <input type="button" value="취소"><br>
</section>

<%@include file="../include/footer.jsp" %>	