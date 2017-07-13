<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" 	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on('click', '.tr',function(){
		var trid = $(this).attr('id'); 			// 각 행의 id값
		var no = document.getElementById("no"+trid).childNodes.item(0).nodeValue;// 선택한 행에 따른 memNO값
		location.href="/ad/m/read?memNO="+no; 
	});	
});
</script>
<!-- Main content -->
<section class="content">
<div class="row">
		<!-- left column -->

	<div style="margin-left: 300px">
		<div class="col-md-9">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">회원 목록</h3>
				</div>
<div class='box-body'>
                  <select name="searchType" class="form-control" style="width: 140px; display: inline-block;">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							회원번호</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							유저 아이디</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							계정상태</option>
                  </select> 
                  <input type="text" class="form-control" name='keyword' id="keywordInput" value='${cri.keyword }' style="width: 200px; display: inline-block;">
                  <button type="button" class="btn btn-default" id='searchBtn' ><i class="fa fa-search"></i></button>
               </div>
				</div>


			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">회원 목록페이지</h3>
				</div>
				<div class="box-body">
					<table class="table table-hover">
						<tr>
							<th style="width: 100px">회원번호</th>
							<th>유저 아이디</th>
							<th>유저 등급</th>
							<th>계정상태</th>
						</tr>

<!-- 페이징 이동할때 
<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&email=${memberVO.email}'>	${boardVO.title} </a> -->
						<c:forEach items="${list}" var="memberVO" varStatus="status">
							<tr id="${status.count}" class="tr" >	
								<td id="no${status.count}">${memberVO.memNO}</td>
								<td>${memberVO.email}</td>
								<td id="person${status.count}">
									<c:choose>
        								<c:when test="${memberVO.personDF eq 'D_PE01'}"><input type="hidden" value="'D_PE01'">일반회원</c:when>
										<c:otherwise><input type="hidden" value="'D_PE02'">관리자회원</c:otherwise>        
        							</c:choose>
        						</td>
        							<c:choose>
        								<c:when test="${memberVO.state eq '1'}"><td>비활성</td></c:when>
        								<c:when test="${memberVO.state eq '2'}"><td>정상</td></c:when>
        								<c:when test="${memberVO.state eq '3'}"><td>장기미접속</td></c:when>
        								<c:when test="${memberVO.state eq '4'}"><td>탈퇴</td></c:when>
										<c:otherwise><td>이용정지</td></c:otherwise>        
        							</c:choose>
							</tr>

						</c:forEach>

					</table>
				</div>
				<!-- /.box-body -->
			</div>

				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

</div>
	<!-- /.row -->
</section>
<script>
	$(document).ready(
			function() {

				$('#searchBtn').on("click",function(event) {
						var state= $('#keywordInput').val();
						var inputkeyword = encodeURIComponent($('#keywordInput').val());
						if($("select option:selected").val()=='w'){
							if(state=='비활성'){
								inputkeyword = '1';
							}else if(state=='정상'){
								inputkeyword = '2';
							}else if(state=='장기미접속'){
								inputkeyword = '3';
							}else if(state=='탈퇴'){
								inputkeyword = '4';
							}else if(state=='이용정지'){
								inputkeyword = '5';
							}
						}
							alert(inputkeyword);
							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" +inputkeyword;
						
							inputkeyword='';

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});

			});
</script>
<%@include file="../include/footer.jsp" %>
