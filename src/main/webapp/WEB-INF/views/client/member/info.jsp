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
		location.href="/m/upchkPassform";
 	});
 	
 	$(document).on('click', '#delete', function() {
		location.href=" /m/delchkPassform";
 	});
 	
</script>
<!-- Main content -->
<section class="content">

   회원정보보기<br><br>
       <table  cellpadding="1">
      <tr>
        <td colspan="2" height="100">계정정보</td>
        <c:choose>
        	<c:when test="${SUCCESS.personDF eq 'D_PE01'}"><c:out value="<tr><td>회원분류</td><td><input type=text value=일반회원 disabled=disabled></td></tr>" escapeXml="false"></c:out></c:when>
			<c:otherwise><c:out value="<tr><td>회원분류</td><td><input type=text value=관리자 disabled=disabled></td></tr>" escapeXml="true"></c:out></c:otherwise>        
        </c:choose>
        
        <tr><td>아이디(이메일주소)</td><td><input type="text" value="${SUCCESS.email }" disabled="disabled"></td></tr>
        
        <tr><td colspan="2" height="100">개인정보</td></tr>
            <tr><td>이름</td><td><input type="text" value="${SUCCESS.name }" disabled="disabled"></td></tr>
         <tr><td>닉네임</td><td><input type="text" value="${SUCCESS.nickname }" disabled="disabled"></td></tr>              
           <tr><td>생년월일</td><td><input type="Date" value="${SUCCESS.birth }" disabled="disabled"></td></tr>
           <c:choose>
           		<c:when test="${SUCCESS.sex eq '1'}"><tr><td>성별</td><td><input type="text" value="남자" disabled="disabled"></td></tr></c:when>
           		<c:otherwise><tr><td>성별</td><td><input type="text" value="여자" disabled="disabled"></td></tr></c:otherwise>
           </c:choose>
           		
           <tr><td>핸드폰번호</td><td><input type="tel" value="${SUCCESS.tel }" disabled="disabled"></td></tr>
           <tr><td>가입일</td><td><input type="Date" value="${SUCCESS.joinDate }" disabled="disabled"></td></tr>
           
          
          <tr><td colspan="2" height="100" align="center" >
          <input type="button" value="수정" id="update"> <input type="button" value="삭제" id="delete"> </td></tr>
             
     </table>   
   
</section>

<%@include file="../include/footer.jsp" %>