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

<!-- Main content -->
<section class="content">
<center>
<div class="box box-primary">
				
				<!-- /.box-header -->

<form role="form" method="post">
 <input type="hidden" name="nickname" value="김주원"> 
 <input type="hidden" name="talConnNO" value="TEC_A00025"> 
 
	<div data-text-content="true" style="font-weight:bold;font-size:18px" class>교환후기 등록</div>
	<div data-text-content="true" style="font-weight: bold; font-size: 18px; background-color: rgb(224, 224, 224);" class spellcheck="false">  교환 정보</div>
     <table>
     <tr><th>받은재능</th><td><select><option>피아노</option><option>요리</option><option>프로그래밍</option></select></td></tr>
     <tr><th>교환자닉네임</th><td><select><option>x7360</option><option>gildon</option><option>lime</option></select></td></tr>
     
     
     </table>
     <div data-text-content="true" style="font-weight: bold; font-size: 18px; background-color: rgb(224, 224, 224);" class spellcheck="false">  후기입력</div>
     <div data-text-content="true" style="font-size:16px;" >후기 제목</div>
     <input type="text" id="title"  name="title" placeholder="제목을 입력해주세요">
     <div data-text-content="true" style="font-size:16px;" >후기 내용</div>
     <textarea rows="10" cols="50" style="color: rgb(94, 94, 94);" spellcheck="false" name="content" placeholder="내용을 입력해주세요."></textarea>
	<!-- /.box-body -->

	<div class="box-footer">
		<button type="submit" class="btn btn-primary">등록</button>
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
				</script>
</section>

<%@include file="../include/footer.jsp" %>