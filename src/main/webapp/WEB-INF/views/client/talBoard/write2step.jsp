<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");

		console.log(formObj);



		$("#goListBtn").click(function() {




			self.location = "/tb/list";



		});



		$("#backBtn").on("click", function() {
		
		          self.location = "/tb/write1s"+"?title="+$(".title").val()+"&contentHave="+$(".contentHave").val()+"&contentWant="+$(".contentWant").val();
		          $(".title").val("");
		          $(".contentHave").val("");
			
			
			
		});


	});
</script>
<!-- Main content -->
<section class="content">
	재능등록
	<br> 등록단계: [1단계 보유한 재능]>[
	<font color="blue">2단계 원하는 재능</font>]>[내용확인]
	<br>
	<br>
	<input type="button" value="원하는 재능 이전글 가져오기">
	<br> 1단계: 보유한 재능 정보
	<br>
	<form action="/tb/write" role="form" method="get">



		<input type="text" value="${TalBoardVO.title }" class="title"
			name="title"> <input type="text"
			value="${TalBoardVO.contentHave }" class="contentHave"
			name="contentHave">
		<table>
			<tr>
				<td>원하는 재능 <input type="text"></td>
				<td><input type="text"><br></td>
				<td><input type="button" value="-"><br></td>
			</tr>
		</table>

		<table>
			<tr>
				<td>원하는 재능</td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="button" value="+"><br></td>
			</tr>
		</table>
		원하는 재능 내용<br>
		<textarea rows="10" cols="50" class="contentWant" name="contentWant">${TalBoardVO.contentWant}</textarea>
		<br> <input type="button" value="이전단계" id="backBtn">
		 <input type="submit" value="다음단계" id="nextBtn"> 
		 <input type="button" value="작성취소" id="goListBtn">
	</form>
</section>

<%@include file="../include/footer.jsp" %>