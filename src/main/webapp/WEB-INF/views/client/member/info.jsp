<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
계정정보<br>
회원분류
        <c:choose>
        	<c:when test="${clientMemberVO.personDF eq 'D_PE01'}"><input type=text value=일반회원 disabled=disabled></c:when>
			<c:otherwise><input type=text value=관리자 disabled=disabled></c:otherwise>       
        </c:choose><br>
아이디(이메일주소)<input type="text" value="${clientMemberVO.email }" disabled="disabled"><br><br>
개인정보<br>
이름<input type="text" value="${clientMemberVO.name }" disabled="disabled"><br>
닉네임<input type="text" value="${clientMemberVO.nickName }" disabled="disabled">  <br>         
생년월일<input type="Date" value="${clientMemberVO.birth }" disabled="disabled"><br>
성별               <c:choose>
           		<c:when test="${clientMemberVO.sex eq '1'}"><input type="text" value="남자" disabled="disabled"></c:when>
           		<c:otherwise><input type="text" value="여자" disabled="disabled"></c:otherwise>
           </c:choose><br>
핸드폰번호<input type="tel" value="${clientMemberVO.tel }" disabled="disabled"><br>
가입일<input type="Date" value="${clientMemberVO.joinDate }" disabled="disabled"><br>
   <br><br>           
메신저목록<br>
<c:forEach items="${clientMessengerVO }" var="list">
	<input type="text" value="${list.name}" disabled="disabled"> <input type="text" value="${list.id}" disabled="disabled"><br>
</c:forEach><br><br>
	<input type="button" value="수정" id="update"> <input type="button" value="삭제" id="delete">
</section>

<%@include file="../include/footer.jsp" %>