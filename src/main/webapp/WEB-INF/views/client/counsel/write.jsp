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

<!-- Main content -->
<section class="content">
	<center>
		<div class="box box-primary">

			<!-- /.box-header -->
			<form role="form" method="post" name="frm">
				<div data-text-content="true"
					style="font-weight: bold; font-size: 18px" class>고객문의 등록</div>
				<div data-text-content="true"
					style="font-weight: bold; font-size: 18px; background-color: rgb(224, 224, 224);"
					class spellcheck="false">문의 정보</div>
					
			
				<table>
					<tr>
						<th>카테고리</th>
						  <td>
						    <select name="questDF">
						        <c:forEach items="${list}" var="boardVO">
								
								   <option value="${boardVO.questDF }">${boardVO.name }</option>
								
								</c:forEach>
						    </select>
						  </td>
					</tr>
					<tr>
						<th>공개여부</th>
						   <td>

						     <select name="state">
						        
								
								<option value ='2'>공개</option>
								<option value ='1'>비공개</option>
								
								
						    </select>
						   </td>
						<br>
					</tr>
					<br>

				</table>
				
				
			<div class="form-group">
						<label for="writer">작성자 닉네임</label> 
						<%-- <select name="memNO">
						        <c:forEach items="${list2}" var="boardVO">
								
								<option value="${boardVO.memNO }">${boardVO.nickName }</option>
								
								</c:forEach>
						   </select> --%>
						   
				<input type="text" value="${clientMemberVO.nickName }" disabled="disabled">
				<input type="hidden" name='memNO' value="${clientMemberVO.memNO }" >

				<div class="box-body">
					<div class="form-group">
						<label for="title">문의글 제목</label> 
						<input type="text" id="title"
							name='title' class="form-control" placeholder="제목">
					</div>
					<div class="form-group">
						<label for="content">문의 내용</label>
						<br>
						<textarea class="form-control" name="content" rows="5" cols="50"
							id="content" placeholder="내용 "></textarea>
					</div>
					</div>
				</div>


				<div class="box-footer">
					<button type="button" class="btn btn-primary">등록</button>
					<button type="button" class="btn btn-warning">취소</button>
				</div>
			</form>


		</div>

	</center>
	
	
			<script>
			$(document).ready(function() {

			$(".btn-warning").on("click",function() {
				self.location = "list";
				});


		});
			
			$(document).ready(function() {
			
				$(".btn-primary").on("click",function() {
					var title = $('#title').val();
					var content = $('#content').val();
					
					if(title.length > 10 || content.length >200){
						alert("제목은 10자 이내 내용은 200자 이내로 작성해 주세요");
					}else{
						if((title == undefined || title =='' ) || (content == undefined || content =='')){
							alert("제목 또는 내용을 입력해주세요");
						}else {
							document.frm.submit();
							alert("등록 되었습니다");
						}
					}
					
				});


			});
			
			
				</script>
	
</section>




<%@include file="../include/footer.jsp" %>