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
$(document).ready(function () {
	var memNO = '${memberVO.memNO }';
	var empNO = '${employeeVO.empNO}';
	var grade = '${loginMemNO.gradeDF}';	//로그인한 사람의 관리등급
	$(document).on('click', '#update', function() {
		if(grade == 'D_GR02'){	
			location.href="/ad/e/mod?memNO="+memNO;
		}else{
			alert("총괄관리자만 수정권한이 있습니다.");
		}
	});
});
</script>
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
    	<c:when test="${memberVO.sex eq '1'}"><input type="text" value="남자" disabled="disabled"></c:when>
        <c:otherwise><input type="text" value="여자" disabled="disabled"></c:otherwise>
    </c:choose><br>
핸드폰번호<input type="tel" value="${memberVO.tel }" disabled="disabled"><br><br>

    	
직원추가정보<br>
직원번호 <input type="text" value="${employeeVO.empNO}" disabled="disabled"><br>
관리등급명 <input type="text" value="${employeeVO.gname}" disabled="disabled"><br>
직책명<input type="text" value="${employeeVO.pname}" disabled="disabled"><br>
입사일<input type="text" value="${employeeVO.latestDate}" disabled="disabled"><br>
퇴사일<c:choose>
		<c:when test="${employeeVO.retireDate eq null}"><input type="text" value="재직중" disabled="disabled"></c:when>
		<c:otherwise><input type="date" value="${employeeVO.retireDate}" disabled="disabled"></c:otherwise>
	</c:choose><br>
직원상태<c:choose>
    	 <c:when test="${employeeVO.state eq '1'}"><input type="text" value="비활성" disabled="disabled"></c:when>
    	 <c:when test="${employeeVO.state eq '2'}"><input type="text" value="정상" disabled="disabled"></c:when>
    	 <c:when test="${employeeVO.state eq '3'}"><input type="text" value="휴직" disabled="disabled"></c:when>
         <c:otherwise><input type="text" value="퇴사" disabled="disabled"></c:otherwise>
	 </c:choose>


<br><br>           
메신저목록<br>
<c:forEach items="${empmessengerVO }" var="list">
	<input type="text" value="${list.name}" disabled="disabled"> <input type="text" value="${list.id}" disabled="disabled"><br>
</c:forEach><br><br>

<input type="button" value="수정" id="update"> <input type="button" value="삭제" id="delete">


</section>

<%@include file="../include/footer.jsp" %>