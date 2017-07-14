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

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<!-- Main content -->
<section class="content">
<form role="form" action="modifyPage" method="post">

					<input type='hidden' name='csNO' value="${boardVO.csNO}"> 
					<input type='hidden' name='page' value="${cri.page}"> 
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

				</form>
<div class="panel-body">
						<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
							<h5>문의사항 내용</h5>
						</div>
						
						<form role="form" method="post" name="frm">
						<div class="panel panel-default">
							<div style="background-color:#89729E;" class="panel-heading">
								<h3 style="color:#FFF;" class="panel-title"><b>문의 정보</b></h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-list-alt"></span>
             							<span class="glyphicon-class">문의 항목</span>
             						</label>
									<div class="col-md-4">
										<input type="text" name='name' class="form-control" value="${boardVO.name}" readonly="readonly">
       								</div>
								</div>
								
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-cloud"></span>
             							<span class="glyphicon-class">공개여부</span>
             						</label>
									<div class="col-md-4">
										<c:if test="${boardVO.state =='2' }">
											<input type="text" name='state' class="form-control" value="공개"  readonly="readonly">
										</c:if>
       								</div>
								</div>
								
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-user"></span>
             							<span class="glyphicon-class">작성자</span>
             						</label>
									<div class="col-md-4">
       									<input type="text" name="memNO" class="form-control" value="${boardVO.memNO}" readonly="readonly">
       								</div>
								</div>
								<br><br>
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-tag"></span>
             							<span class="glyphicon-class">문의 제목</span>
             						</label>
									<div class="col-md-4">
       									<input type="text" name='title' class="form-control" value="${boardVO.title}" readonly="readonly">
       								</div>
								</div>
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-pencil"></span>
             							<span class="glyphicon-class">문의 내용</span>
             						</label>
									<div class="col-md-4">
       									<textarea class="form-control" name="content" rows="5" cols="50" readonly="readonly">${boardVO.content}</textarea>
       								</div>
								</div>
								
							</div>
						</div>
						<div align="center">
							<button type="submit" class="btn btn-warning" id="modifyBtn">수정</button>
			 			    <button type="submit" class="btn btn-danger" id="removeBtn">삭제</button>
			    		    <button type="submit" class="btn btn-primary" id="goListBtn">목록 </button>
						</div>
					</form>
				</div>

<div class="row">
  <div class="col-md-12">

<!-- 댓글 등록에 필요한 div -->
	<div class="box box-success">
		<div class="panel-body">
						<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
							<h5>댓글</h5>
						</div>
						<div class="panel panel-default">
							<div style="background-color:#89729E;" class="panel-heading">
								<h3 style="color:#FFF;" class="panel-title"><b>댓글창</b></h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-list-alt"></span>
             							<span class="glyphicon-class"><button id="replyview" class="btn btn-primary">댓글 보기</button> </span>
             						</label>
									<div class="col-md-4">
       									<div id="repliesDiv"></div>
       								</div>
								</div>
							</div>
						</div>
				</div>
		 
		 <div class="box-body">
<!-- 				<label for="exampleInputEmail2">직원 번호</label> 
				<input class="form-control" type="text" placeholder="작성자" id="newReplyWriter"> 
						
				<label for="exampleInputEmail2">댓글 내용</label> 
				<input class="form-control" type="text" placeholder="댓글 내용" id="newReplyText"> -->
		 </div>
			
				<!-- /.box-body -->
		 <div class="box-footer">
					<!-- <button id="replyAddBtn">댓글 등록</button> --> <br>
		 </div>
	</div>


<!-- 댓글 목록과 페이징 처리에 필요한 div -->


	<div class='text-center'>
		<ul id="pagination" class="pagination pagination-sm no-margin ">

		</ul>
	</div>

		</div><!-- /.col-md-12 -->
		
	</div><!-- /.row -->
	
	
<!-- Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body" data-answerNO>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>   

</section>

<script type="text/javascript">
     
 var csNO="${boardVO.csNO}";

    function getAllList(){
    	$.ajax({
  	      url:'/ad/ca/all/'+csNO,
  	      success:function(data){
  	    	  //alert(data.length);  ---> 11
  	    	  console.log(data.length);
  	    	 var str='';
  	    	 $(data).each(function(){
  	    	      str += '<li>'+this.answerNO+":"+this.content+'</li>';      	
  	    	    }		 
  	    	 );//for
  	    	 $('#repliesDiv').html(str);
  	      }//success
   });    
    }
    
    $("#replyAddBtn").on("click",function(){

		 var replyer = $("#newReplyWriter").val();
		 var replytext = $("#newReplyText").val();
		
		  
		  $.ajax({
				type:'post',
				url:'/ad/ca/',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({
				csNO:csNO,
				empNO:replyer,
				content:replytext
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




<!--handlebars 사용해서 댓글목록처리  -->



<!-- 
<script>
	
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}	
	
var csNO = ${boardVO.csNO};

	
	var replyPage = 1;

	function getPage(pageInfo) {
		alert("asdasda");
		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));

			$("#modifyModal").modal('hide');

		});
	}

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};

	$("#repliesDiv").on("click", function() {

		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/ad/ca/" + csNO + "/1");

	});
	

	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPage("/ad/ca/"+csNO+"/"+replyPage);
		
	});
	
	// 등록작업 하는 곳 replyAddBtn을 누르는 순간 처리됨.
	$("#replyAddBtn").on("click",function(){
		 
		var csNO = ${boardVO.csNO};
		alert(csNO);
		
		 var replyerObj = $("#newReplyWriter");
		 var replytextObj = $("#newReplyText");
		 var empNO = replyerObj.val();
		 var content = replytextObj.val();
		
		  
		  $.ajax({
				type:'post',
				url:'/ad/ca/',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({csNO:csNO, empNO:empNO, content:content}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("댓글이 등록 되었습니다.");
						replyPage = 1;
						getPage("/ad/ca/"+csNO+"/"+replyPage );
						replyerObj.val("");
						replytextObj.val("");
					}
			}});
	});
	$(".timeline").on("click", ".replyLi", function(event){
		
		var reply = $(this);
		
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-answerNO"));
		
	});
	
	

	$("#replyModBtn").on("click",function(){
		  
		  var answerNO = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'put',
				url:'/ad/ca/'+answerNO,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({replytext:replytext}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/ad/ca/"+csNO+"/"+replyPage );
					}
			}});
	});

	$("#replyDelBtn").on("click",function(){
		  
		  var answerNO = $(".modal-title").html();
		 // var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'delete',
				url:'/ad/ca/'+answerNO,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/ad/ca/"+csNO+"/"+replyPage );
					}
			}});
	});
	
</script>
 -->
<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/c/mod");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function(){
		formObj.attr("action", "/c/removePage");
		formObj.submit();
	});
	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/c/list");
		formObj.submit();
	});
	
});
</script>

<%@include file="../include/footer.jsp"%>



