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
	$(document).on('click', '#update', function() {
		if(confirm("수정하시겠습니까?")){
			if($('#memberGrade option:selected').val() == "D_PE02"){	//직원으로 바뀌면 기본정보로 등록하기
				$.ajax({
					url : "/ad/m//updateToEMP",			
					type : "post",
					data : {
							memNO : $('#memNO').val()
					}
				});
			}
			$.ajax({				//회원 기본정보를 변경
				url : "/ad/m/update",			
				type : "post",
				data : {
						memNO : $('#memNO').val(),
						personDF : $('#memberGrade option:selected').val(),
						state : $('#memberState option:selected').val()
				},
				success : function(result){
					if(result== "memberUPSUCCESS"){
						alert("수정이 완료되었습니다");
						location.href='/ad/m/list';		//다시 회원리스트로
					}
				}
			});
		}
	});
});
</script>
<!-- Main content -->
<section class="content">
<input type="hidden" id="memNO" value="${memberVO.memNO }">
계정정보<br>
회원분류
	<select id="memberGrade">
		<c:forEach items="${personDFVO }" var="grade">
			<c:choose>
				<c:when test="${grade.personDF eq memberVO.personDF}">
					<option value="${grade.personDF }" selected="selected"><c:choose>
																		    	<c:when test="${grade.personDF eq 'D_PE01'}">일반회원</c:when>
																		  		<c:otherwise>관리자</c:otherwise>
																		   </c:choose></option>
				</c:when>
				<c:otherwise>
					<option value="${grade.personDF }"><c:choose>
														   <c:when test="${grade.personDF eq 'D_PE01'}">일반회원</c:when>
														   <c:otherwise>관리자</c:otherwise>
														</c:choose></option>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</select><br>

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
계정상태
<select id="memberState">
	<c:choose>
		<c:when test="${memberVO.state eq '1'}">
			<option value="1" selected="selected">비활성</option>
			<option value="2">정상</option>
			<option value="3">장기미접속</option>
			<option value="4">탈퇴</option>
			<option value="5">이용정지</option>
		</c:when>
		<c:when test="${memberVO.state eq '2'}">
			<option value="1">비활성</option>
			<option value="2" selected="selected">정상</option>
			<option value="3">장기미접속</option>
			<option value="4">탈퇴</option>
			<option value="5">이용정지</option>
		</c:when>
		<c:when test="${memberVO.state eq '3'}">
			<option value="1">비활성</option>
			<option value="2">정상</option>
			<option value="3" selected="selected">장기미접속</option>
			<option value="4">탈퇴</option>
			<option value="5">이용정지</option>
		</c:when>
		<c:when test="${memberVO.state eq '4'}">
			<option value="1">비활성</option>
			<option value="2">정상</option>
			<option value="3">장기미접속</option>
			<option value="4" selected="selected">탈퇴</option>
			<option value="5">이용정지</option>
		</c:when>
		<c:otherwise>
			<option value="1">비활성</option>
			<option value="2">정상</option>
			<option value="3">장기미접속</option>
			<option value="4">탈퇴</option>
			<option value="5" selected="selected">이용정지</option>
		</c:otherwise>
	</c:choose>
</select><br>


<br><br>           
메신저목록<br>
<c:forEach items="${messengerVO }" var="list">
	<input type="text" value="${list.name}" disabled="disabled"> <input type="text" value="${list.id}" disabled="disabled"><br>
</c:forEach><br><br>

<input type="button" value="변경하기" id="update"> <input type="button" value="취소">

</section>

<%@include file="../include/footer.jsp" %>