<%-- 후기게시판 read.jsp
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
		<div style="background-color:#875F9A;" class="panel-heading">
						

							<span class="fa fa-angle-double-left" data-toggle="offcanvas" title="Maximize Panel"></span></a>교환후기 상세정보</h3>
					</div>
		</div>
		<!-- /.box-header -->


		<div class="box-body">
			<div data-text-content="true"
				style="font-weight: bold; font-size: 24px; border-width: 0px; border-style: none; text-shadow: rgba(0, 0, 0, 0.5) 3px 3px 14px;">${TalReviewVO.title}</div>
			
			<table>
				<form role="form" method="post">

					<input type='hidden' id="talReviewNO" name='talReviewNO' value="${talReviewVO.talReviewNO}">
					<input type='hidden' name='page' value="${cri.page}"> 
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
				</form>
				<tr>
				
					
					<th><div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
							<h5>받은 재능: </h5>
							<c:forEach items="${taketalent }" var="tal">
								${tal.name }
							</c:forEach>
						</div></th>
				</tr>
			</table>
			<br>
			<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
							<h5> ${talReviewVO.nickName }님의 교환후기</h5>
						</div>
				
				
			<textarea rows="5" cols="50" readonly>${talReviewVO.content }</textarea>
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
				<input class="form-control" type="text"  id="nickName" name="nickName" value="${clientMemberVO.nickName}" readonly>

				<input type="hidden" value="${clientMemberVO.memNO }" name="memNO"> 
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

<div id="updateForm" style="display: none;"><input type="text" id="replyupdate"><button>수정</button></div>

<script> // 댓글 리스트 목록 보기 
	var talReviewNO= $('#talReviewNO').val();
	 var memNO= "${clientMemberVO.memNO}";
	   
	 function getAllList(){
	    	//alert('talReviewNO: '+talReviewNO)
	    	$.ajax({	    		
	  	      url:'/tr/replies/all/'+talReviewNO,
	  	      success:function(data){
	  	    	  console.log(data.length);
	  	    	 var str='';
	  	    	 $(data).each(function(index){//수정버튼 누르면 변경할 내용 나오는 것
	  	    		str += '<li id="'+this.commExNO+'"><span>NO: '+this.commExNO+"</span><span>"
	  	    		+" 내용: </span><span>"+this.content+"</span><span> 날짜: "+this.writeDate
	  	    		+"</span><button id='replymod' class='replymod'>수정</button>" 
	  	    		+"<button id='replydel' class='replydel'>삭제</button>"+'</li>';
	  	    		
	  	    	    });
	  	    	 
	  	    	 $('#repliesDiv').html(str);
	  	      },//success
	  	     error:function(xhr){
	  	    	 alert('에러:'+ xhr.status)
	  	     }
	   });    
 }
   
$(document).on("click", ".replydel", function(){
	var temp = $(this).attr("id");
    var no = $(this).parent().attr("id");
	alert("댓글을 삭제하시겠습니까??");
	
	 $.ajax({
			type:'delete',
			url:'/tr/replies/'+no,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "DELETE" },
			dataType:'text', 
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("삭제 되었습니다.");
					getAllList();
				
				}
		     },
		     error:function(){
		    	 alert('삭제실패!!')
		     }
	   });//삭제요청
	
});

$(document).on("click", ".replymod", function(){//수정폼
	
	var initialtext = $(this).prev().prev().text();
	//$(this).prev().html('<input type="text" value='+initialtext+'>');
	$('#replyupdate').val(initialtext);
	var uForm = $('#updateForm');//<div id=updateForm>
	$(this).parent().append(uForm);
	uForm.show();
	
	
});//

$("#updateForm button").on("click", function(){//수정처리
	
	$.ajax({
		type: 'put',
		url:'/tr/replies/'+$("#updateForm").parent().attr("id"),
		headers: {
			 "Content-Type": "application/json",
			 "X-HTTP-Method-Override": "PUT"},
		data: JSON.stringify({content: $("#updateForm input").val()}),
		dataType:'text',
		success: function(result){
			console.log("result: "+result);
			if(result =='SUCCESS'){
				alert("수정되었습니다");
				getAllList();
			}
		}
		
	});
});
	
	
	    
	    $("#replyAddBtn").on("click",function(){//댓글 추가하기

			
			 var talReviewNO = $("#talReviewNO").val();
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
					memNO:memNO,
					content:content
				
					
					}),
					
					success:function(result){
						if(result == 'SUCCESS'){
							alert("댓글이 등록 되었습니다.");
							content.val("");//텍스트초기화가 안됨
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