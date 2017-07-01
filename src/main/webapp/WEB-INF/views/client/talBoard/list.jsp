<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%-- .jsp --%>
<%@include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
  
   
   $(document).on("click", ".checkMem", function() {
	   var memNO = $(this).find('.memNO').val();
	   var talDocNO = $(this).find('.talDocNO').val();
	   		
	   		var loginMem = 'MEM_A00001';
	   		/* if(loginMem == memNO){  */
		self.location="read"+ "?talDocNO="+ talDocNO;
	   /*   <!--  }else{
	      	    	  self.location = "read"
	      	    	+ "?talDocNO="
	      			+ talDocNO;
	      } --> */

   }); 
$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + encodeURIComponent($('#keywordInput').val());

						});

				$('#uploadBtn').on("click", function() {

					self.location = "write1s"
					                  +"${pageMaker.makeSearch(pageMaker.cri.page) }";

				});
				
				/* $('.checkMem').on("click", function(event) {
					 var loginMem = "MEM_A00001";
					alert(loginMem);
					alert($("#memNO").val());
					if(loginMem == $("#memNO").val()){
					self.location="talentInfo_detail_maker"
						+ "?talDocNO="
					    + $(".talDocNO").val();
				      }else{
				    	  self.location = "talentInfo_detail_guest"
				    	+ "?talDocNO="
						+ $(".talDocNO").val();
					}
				}); */
				

			});


</script>
<!-- talentInfo_board.jsp -->

<!-- Main content -->
<section class="content">

	<center>
		<select name="searchType">
			<option value="all"
				<c:out value="${cri.searchType eq 'all'?'selected':''}"/>>
				통합검색</option>
			<option value="t"
				<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>
			<option value="c"
				<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>내용</option>
			<option value="w"
				<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
				작성자</option>

		</select> <input type="text" name='keyword' id="keywordInput"
			value='${cri.keyword }'>&nbsp;&nbsp;&nbsp; <input
			type="button" value="검색" id="searchBtn"> <select
			name="detailsearchType">
			<option value="all"
				<c:out value="${cri.searchType eq 'all'?'selected':''}"/>>
				전체</option>
			<c:forEach items="${categoryList }" var="TalCategoryVO">
				<option value="${TalCategoryVO.talcatedf }"
					<c:out value="${cri.searchType eq '${TalCategoryVO.talcatedf }'?'selected':''}"/>>
					${TalCategoryVO.name }</option>
			</c:forEach>
		</select> <select>
			<option>보유한재능</option>
			<option>원하는재능</option>
		</select> <input type="button" value="상세재능필터" id="detailsearchBtn">
	</center>
	<br>
	<table align="center" border="1" height=200 width="300">
		<c:forEach items="${list}" var="TalentListVO">

			<tr>
				<td align="center" colspan="4">사진</td>
				<td>보유재능 : ${TalentListVO.contentWant }<br>
					<hr> 찾는재능 : ${TalentListVO.contentHave}
				</td>
			</tr>

			<tr>
				<td colspan="6" height="20"><div class="checkMem">${TalentListVO.title }<input
							type="text" value="${TalentListVO.memNO }" class="memNO"><input
							type="hidden" value="${TalentListVO.talDocNO }" class="talDocNO">
					</div></td>
			</tr>
			<tr>
				<td colspan="6" height="20">${TalentListVO.nickName }</td>
			</tr>
			<tr>
				<td align="left" colspan="3" height="20">★★★★★</td>
				<td align="right" colspan="3" height="20">
					${TalentListVO.writeDate }</td>

			</tr>

		</c:forEach>


	</table>
	<input type="button" value="보유재능등록" id="uploadBtn">

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
</section>

<%@include file="../include/footer.jsp"%>