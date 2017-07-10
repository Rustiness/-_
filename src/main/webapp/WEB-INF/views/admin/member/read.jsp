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

<!-- Main content -->
<section class="content">
계정정보<br>
회원분류 
<c:choose>
     <c:when test="${memberVO.personDF eq 'D_PE01'}"><input type=text value=일반회원 disabled=disabled></c:when>
	 <c:otherwise><input type=text value=관리자 disabled=disabled></c:otherwise>        
</c:choose><br>
아이디(이메일주소)<input type="text" value="${memberVO.email }" disabled="disabled">
        <br><br>
       개인정보<br>
이름<input type="text" value="${memberVO.name }" disabled="disabled"><br>
닉네임<input type="text" value="${memberVO.nickName }" disabled="disabled"><br>    
생년월일<input type="Date" value="${memberVO.birth }" disabled="disabled"><br>
성별
	<c:choose>
    	<c:when test="${memberVO.sex eq '1'}">성별<input type="text" value="남자" disabled="disabled"></c:when>
        <c:otherwise><input type="text" value="여자" disabled="disabled"></c:otherwise>
    </c:choose><br>
핸드폰번호<input type="tel" value="${memberVO.tel }" disabled="disabled"><br>
가입일<input type="Date" value="${memberVO.joinDate }" disabled="disabled"><br>
최근 접속일<input type=date value="${memberVO.latestDate }" disabled="disabled"><br>
계정상태	 <c:choose>
    			<c:when test="${memberVO.state eq '1'}"><input type="text" value="비활성" disabled="disabled"></c:when>
    			<c:when test="${memberVO.state eq '2'}"><input type="text" value="정상" disabled="disabled"></c:when>
    			<c:when test="${memberVO.state eq '3'}"><input type="text" value="장기미접속" disabled="disabled"></c:when>
    			<c:when test="${memberVO.state eq '4'}"><input type="text" value="탈퇴" disabled="disabled"></c:when>
        		<c:otherwise><input type="text" value="이용정지" disabled="disabled"></c:otherwise>
    	</c:choose><br>

<br><br>           
메신저목록<br>
<c:forEach items="${messengerVO }" var="list">
	<input type="text" value="${list.name}" disabled="disabled"> <input type="text" value="${list.id}" disabled="disabled"><br>
</c:forEach>

<input type="button" value="수정" id="update"> <input type="button" value="삭제" id="delete">


</section>

<%@include file="../include/footer.jsp" %>