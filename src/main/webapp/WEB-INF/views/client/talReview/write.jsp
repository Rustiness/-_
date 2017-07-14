<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Main content -->
<section class="content">

<center>
<div class="box box-primary">
				
				<!-- /.box-header -->

<form role="form" method="post" name="frm">
 

 
	<div data-text-content="true" style="font-weight:bold;font-size:18px" class>교환후기 등록</div>
	<div data-text-content="true" style="font-weight: bold; font-size: 18px; background-color: rgb(224, 224, 224);" class spellcheck="false">  교환 정보</div>
     <table>
     <tr>
     <th>받은재능: </th>
     <td>
    
    
		<c:forEach items="${talDivHave}" var="talDivItem">
			<c:if test="${talExchangeVO.talConnNO eq talDivItem.talConnNO}">
			</c:if>
		</c:forEach> 
	 </td>
  					
	
	
     
     </td>
     
     </tr>
     <tr>
     <th>작성자닉네임: </th>
     <td>${clientMemberVO.nickName }</td>
    <input type=hidden name="memNO" value ='${clientMemberVO.memNO }' >
     </tr>
     
     
     </table>
     <div data-text-content="true" style="font-weight: bold; font-size: 18px; background-color: rgb(224, 224, 224);" class spellcheck="false">  후기입력</div>
     <div data-text-content="true" style="font-size:16px;" >후기 제목</div>
     <input type="text" id="title"  name="title" placeholder="제목을 입력해주세요">
     <div data-text-content="true" style="font-size:16px;" >후기 내용</div>
     <textarea rows="10" cols="50" style="color: rgb(94, 94, 94);" spellcheck="false" id="content" name="content" placeholder="내용을 입력해주세요."></textarea>
	<!-- /.box-body -->

	<div class="box-footer">
		<button type="button" class="btn btn-primary" id="enter" >등록</button>
		<button type="button" class="btn btn-warning" >취소</button>
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