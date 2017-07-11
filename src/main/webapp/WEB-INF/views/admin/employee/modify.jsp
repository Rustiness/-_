<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	$(document).on('click', '#update', function() {
		if(confirm("수정하시겠습니까?")){
			var grade = $('#grade option:selected').val();
			var position = $('#position option:selected').val();
			var state = $('#state option:selected').val();
			$.ajax({			
				url : "/ad/e/mod/db",			
				type : "post",
				data : {
						empNO : '${employeeVO.empNO}',
						gradeDF : grade,
						posDF : position,
						state : state
				},
				success : function(result){
					if(result== "empUPSUCCESS"){
						alert("수정이 완료되었습니다");
						location.href='/ad/e/list';
					}
				}
			});
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
관리등급명 <select id="grade">
			<c:forEach items="${gradeDF }" var="grade"> 
				<c:choose>
					<c:when test="${employeeVO.gradeDF eq grade.gradeDF }">
						<option selected="selected" value="${grade.gradeDF }">${grade.name }</option>
					</c:when>
					<c:otherwise>
						<option value="${grade.gradeDF }">${grade.name }</option>					
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select><br>


직책명<select id="position">
			<c:forEach items="${positionDF }" var="position"> 
				<c:choose>
					<c:when test="${employeeVO.posDF eq position.posDF }">
						<option selected="selected" value="${position.posDF }">${position.name }</option>
					</c:when>
					<c:otherwise>
						<option value="${position.posDF }">${position.name }</option>					
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select><br>

입사일<input type="text" value="${employeeVO.latestDate}" disabled="disabled"><br>
퇴사일<c:choose>
		<c:when test="${employeeVO.retireDate eq null}"><input type="text" value="재직중" disabled="disabled"></c:when>
		<c:otherwise>${employeeVO.retireDate}</c:otherwise>
	</c:choose><br>
직원상태<select id="state">
	 	<c:choose>
    		<c:when test="${employeeVO.state eq '1'}">
    	 		<option value="1" selected="selected">비활성</option>
				<option value="2">정상</option>
				<option value="3">휴직</option>
				<option value="4">퇴사</option>
    	 	</c:when>
    	 	<c:when test="${employeeVO.state eq '2'}">
    	 		<option value="1">비활성</option>
				<option value="2" selected="selected">정상</option>
				<option value="3">휴직</option>
				<option value="4">퇴사</option>
    	 	</c:when>
    	 	<c:when test="${employeeVO.state eq '3'}">
    	 		<option value="1">비활성</option>
				<option value="2">정상</option>
				<option value="3" selected="selected">휴직</option>
				<option value="4">퇴사</option>
    	 	</c:when>
        	<c:otherwise>
        		<option value="1">비활성</option>
				<option value="2">정상</option>
				<option value="3">휴직</option>
				<option value="4" selected="selected">퇴사</option>
        	</c:otherwise>
	 	</c:choose>
	</select>
<br><br>           
메신저목록<br>
<c:forEach items="${empmessengerVO }" var="list">
	<input type="text" value="${list.name}" disabled="disabled"> <input type="text" value="${list.id}" disabled="disabled"><br>
</c:forEach><br><br>

<input type="button" value="변경하기" id="update"> <input type="button" value="취소" id="reset">



</section>

<%@include file="../include/footer.jsp" %>