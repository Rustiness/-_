<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%-- .jsp --%>
<%@include file="../include/header.jsp"%>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- Main content -->
<section class="content">

	<div class="box box-primary">
		<div class="box-header">
			<h3 class="box-title">교환후기 상세정보</h3>
		</div>
		<!-- /.box-header -->


		<div class="box-body">
			<div data-text-content="true"
				style="font-weight: bold; font-size: 24px; border-width: 0px; border-style: none; text-shadow: rgba(0, 0, 0, 0.5) 3px 3px 14px;">${TalReviewVO.title}</div>
			<div data-text-content="true"
				style="font-weight: bold; font-size: 18px; background-color: rgb(224, 224, 224);"
				class>교환 정보</div>
			<table>
				<form role="form" method="post">

					<input type='hidden' name='talReviewNO' value="${TalReviewVO.talReviewNO}">
					<input type='hidden' name='page' value="${cri.page}"> 
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
				</form>
				<tr>
					<th>받은 재능:</th>
					<td>피아노</td>
					<th>교환자 닉네임:</th>
					<td></td>
				</tr>
			</table>
				<br> ${TalReviewVO.nickname}님의 교환후기<br>
				<br>
			<textarea rows="5" cols="50" readonly>${TalReviewVO.content }</textarea>
			<br>
		</div>
		<!-- /.box-body -->
		<br>
		<div class="box-footer">
			<button type="submit" class="btn btn-warning" id="modifyBtn">수정</button>
			<button type="submit" class="btn btn-danger" id="removeBtn">삭제</button>
			<button type="submit" class="btn btn-primary" id="goListBtn">목록으로</button>
		</div>

		<!-- 댓글 등록에 필요한 div -->
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title">댓글 쓰기</h3>
			</div>

			<div class="box-body">
				<label for="exampleInputEmail1">작성자 명</label> 
				<input class="form-control" type="text" placeholder="작성자" id="writer" name="writer"> 
				<label for="exampleInputEmail1">댓글내용</label> 
				<input class="form-control" type="text" placeholder="댓글 내용" id="content" name="content">
			</div>

			<!-- /.box-body -->
			<div class="box-footer">
				<button  id="replyAddBtn">댓글입력</button> <button id="replyview">댓글보기</button>
			</div>
		</div>

		<!-- 댓글 목록과 페이징 처리에 필요한 div -->
		<!-- The time line -->
		<!-- timeline time label -->
		<li class="time-label" id="repliesDiv"><span class="bg-green">Replies List </span></li>
		</ul>


		<div class='text-center'>
			<ul id="pagination" class="pagination pagination-sm no-margin ">

			</ul>
		</div>
	</div>


</section>
<!-- /.content -->


<script>
	 var talReviewNO= "${TalReviewVO.talReviewNO}";

	    function getAllList(){
	    	$.ajax({	    		
	  	      url:'/tr/replies/all/'+talReviewNO,
	  	      success:function(data){
	  	    	  console.log(data.length);
	  	    	 var str='';
	  	    	 
	  	    	 $(data).each(function(){
	  	    		str += '<li>'+this.commExNO+":"+this.content+"<button id='replymod'>수정</button>"+"<button id='replydel'>삭제</button>"+'</li>';
	  	    		
	  	    	    });
	  	    	 
	  	    	 $('#repliesDiv').html(str);
	  	      },//success
	  	     error:function(xhr){
	  	    	 alert('에러:'+ xhr.status)
	  	     }
	   });    
 }
    
	    $("#replymod").on("click",function(){
	    	
	    	alert("확인");
	    	var reply = $(this).parent();
	    	var commExNO = reply.attr("data-commExNO");
	    	var content = reply.text();
	    	
	    	
	    	
	    	
	    });
	    
	    
	    
	    
	    $("#replyAddBtn").on("click",function(){

			 var replyer = $("#writer").val();
			 var content = $("#content").val();
			
			  
			  $.ajax({
					type:'post',
					url:'/tr/replies/',
					headers: { 
					      "Content-Type": "application/json",
					      "X-HTTP-Method-Override": "POST" },
					dataType:'text',
					data: JSON.stringify({
					talReviewNO:talReviewNO,
					content:content
					}),
					
					success:function(result){
						if(result == 'SUCCESS'){
							alert("댓글이 등록 되었습니다.");
							
							getAllList();

						}
				}});
		});
	    
	    $("#replyview").on("click",function(){
	 
				getAllList();

	    });
	    

	 
</script>


<script>
	/*수정, 삭제, 목록가기  */
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$("#modifyBtn").on("click", function() {
			formObj.attr("action", "mod");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".btn-danger").on("click", function() {
			formObj.attr("action", "remove");
			formObj.submit();
		});

		$(".btn-primary").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "list");
			formObj.submit();
		});

	});
</script>


<%@include file="../include/footer.jsp"%>