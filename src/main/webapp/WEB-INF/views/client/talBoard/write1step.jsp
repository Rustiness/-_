<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).on("click", ".talincrement1", function() {
		//var uptalent = '<tr id="tr"><td>보유한 재능</td><td><select id="category2"><option>디자인</option><option>프로그래밍</option><option>문서</option><option>번역</option><option>컨텐츠제작</option><option>마케팅</option><option>상담&노하우</option></select></td><td><input type="text" id="tal2"></td><td><input type="button" value="+" id="talincrement"><br></td></tr>'; 
		var downtalent = '<input type="button" value="-" class="taldecrement1">';

		$("#table").append("<tr id='tr2'><td>보유한 재능</td><td><select id='category2'><option>디자인</option><option>프로그래밍</option><option>문서</option><option>번역</option><option>컨텐츠제작</option><option>마케팅</option><option>상담&노하우</option></select></td><td><input type='text' id='tal2'></td><td id='button1'><input type='button' value='+' class='talincrement2'></td></tr>");
		$("#button").html(downtalent);

	});

	$(document).on("click", ".talincrement2", function() {
		//var uptalent = '<tr id="tr"><td>보유한 재능</td><td><select id="category2"><option>디자인</option><option>프로그래밍</option><option>문서</option><option>번역</option><option>컨텐츠제작</option><option>마케팅</option><option>상담&노하우</option></select></td><td><input type="text" id="tal2"></td><td><input type="button" value="+" id="talincrement"><br></td></tr>'; 
		var downtalent = '<input type="button" value="-" class="taldecrement2">';

		$("#table").append("<tr id='tr'><td>보유한 재능</td><td><select id='category2'><option>디자인</option><option>프로그래밍</option><option>문서</option><option>번역</option><option>컨텐츠제작</option><option>마케팅</option><option>상담&노하우</option></select></td><td><input type='text' id='tal2'></td><td id='button2'><input type='button' value='+' class='talincrement'></td></tr>");
		$("#button1").html(downtalent);
		

	});
	
	
	

	$(document).on("click", ".taldecrement1", function() {
	  
		$("#tr1").remove();
		$("table tr:first td:last").attr("id","button");
		$("table tr:first td:last input").attr("class","taldecrement1");
		$("table tr:first td:last input").attr("value","-");
		
		$("table tr:last td:last").attr("id","button1");
		$("table tr:last td:last input").attr("class","talincrement2");
		
	});
	
	$(document).on("click", ".taldecrement2", function() {
		$("#tr2").remove();
		$("table tr:last td:last").attr("id","button1");
		$("table tr:last td:last input").attr("class","talincrement2");
		
		
	});

	$(document).ready(function() {
		var formObj = $("form[role='form']");

		console.log(formObj);

		$("#goListBtn").click(function() {
		
			self.location = "/tb/list";	
					
				
		});
		
	});
 		$(document).on("click", "#div2", function() {
			var talDivDF = $("#div2 option:selected").val();
			 $.ajax({
					type:'GET',
					url:'/talcate',
					data: {talDivDF:talDivDF},
					success:function(result){
					
						    alert(result);
							$("#div").html(result);
						     
						}
				});
			 });
			
			
	
	 
	

	
	
	
</script>
<!-- Main content -->
<section class="content">
	재능등록
	<br> 등록단계: [
	<font color="blue">1단계 보유한 재능</font>]>[2단계 원하는 재능]>[내용확인]
	<br> 재능글 제목
	<br>
	<form action="/tb/write2s" role="form" method="post">
        <input type="hidden" name="contentWant" id="contentWant" value="${TalBoardVO.contentWant}">
		<input type="hidden" name='page' value="${cri.page}"> <input
			type='hidden' name='perPageNum' value="${cri.perPageNum}"> <input
			type="hidden" name='searchType' value="${cri.searchType}"> <input
			type="hidden" name='keyword' value="${cri.keyword}"> <input
			type="text" value="${TalBoardVO.title }" id="title" name="title">
		<input type="button" value="보유한 재능 이전글 가져오기"> <br> 1단계:
		보유한 재능 정보 <br>

		<table id="table">

			<tr id="tr1">
				<td>보유한 재능</td>
				<td><select id="div2">
						<c:forEach items="${categoryList }" var="TalCategoryVO">
							<option value="${TalCategoryVO.talCateDF }"
								<c:out value="${cri.searchType eq '${TalCategoryVO.talCateDF }'?'selected':''}"/>>
								${TalCategoryVO.name }</option>
						</c:forEach>
				</select></td>
				<td><select id="category2">
						<%-- <c:forEach items="${divList }" var="TalDivVO">
							<option value="${TalDivVO.taldivdf }"
								<c:out value="${cri.searchType eq '${TalDivVO.taldivdf }'?'selected':''}"/>>
								${TalDivVO.name }</option>
						</c:forEach> --%>
				</select></td>
				<td id="button"><input type="button" value="+"
					class="talincrement1"><br></td>
			</tr>

		</table>




		보유한 재능 내용 <br>
		<textarea rows="10" cols="50" id="contentHave" name="contentHave"
			value="내용을 입력해 주세요">${TalBoardVO.contentHave }</textarea>
		<br> <input type="submit" value="다음단계"> <input
			type="button" value="작성취소" id="goListBtn">
	</form>
	
	<div id="div"></div>
	</section>
<%@include file="../include/footer.jsp" %>