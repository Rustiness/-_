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
$(document).on('click', '#update', function() {
	$.ajax({
		url : "http://localhost/m/mod/result",
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
						
						alert("수정이 완료되었습니다\n다시 로그인해 주세요.");
						location.href="/l/confirm"
					}
		}
		
	});
	});
</script>
<!-- Main content -->
<section class="content">
 회원정보수정<br><br>
       <table>
      <tr>
        <td colspan="2" height="100">계정정보</td>
        <c:choose>
        	<c:when test="${SUCCESS[0].personDF eq 'D_PE01'}"><c:out value="<tr><td>회원분류</td><td><input type=text value=일반회원 disabled=disabled></td></tr>" escapeXml="false"></c:out></c:when>
			<c:otherwise><c:out value="<tr><td>회원분류</td><td><input type=text value=관리자 disabled=disabled></td></tr>" escapeXml="true"></c:out></c:otherwise>        
        </c:choose>
        
        <tr><td><input type="hidden" value="${SUCCESS[0].memNO }" id="memNO"></td></tr>
        <tr><td>아이디(이메일주소)</td><td><input type="text" value="${SUCCESS[0].email }" disabled="disabled"></td></tr>
        <tr><td>비밀번호</td><td><input type="password" value="${SUCCESS[0].pass }" id="pass"></td></tr>
        <tr><td>비밀번호확인</td><td><input type="password" value="${SUCCESS[0].pass }"></td></tr>
        
        <tr><td colspan="2" height="100">개인정보</td></tr>
            <tr><td>이름</td><td><input type="text" value="${SUCCESS[0].name }" id="name"></td></tr>
         <tr><td>닉네임</td><td><input type="text" value="${SUCCESS[0].nickName }" id="nickName"></td></tr>              
           <tr><td>생년월일</td><td><input type="Date" value="${SUCCESS[0].birth }" disabled="disabled" id="birth"></td></tr>
           <c:choose>
           		<c:when test="${SUCCESS[0].sex eq '1'}"><tr><td>성별</td><td><input type="text" value="남자" disabled="disabled" id=sex></td></tr></c:when>
           		<c:otherwise><tr><td>성별</td><td><input type="text" value="여자" disabled="disabled" id="sex"></td></tr></c:otherwise>
           </c:choose>
           		
           <tr><td>핸드폰번호</td><td><input type="text" value="${SUCCESS[0].tel }" id="tel"></td></tr>
           <tr><td>가입일</td><td><input type="Date" value="${SUCCESS[0].joinDate }" disabled="disabled" id="joinDate"></td></tr>
           
          
          <tr><td colspan="2" height="100" align="center" >
          <input type="submit" value="수정" id="update"> <input type="button" value="취소"> </td></tr>
             
     </table>
</section>

<%@include file="../include/footer.jsp" %>