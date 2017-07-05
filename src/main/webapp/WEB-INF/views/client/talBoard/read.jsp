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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- talentInfo_detail_maker.jsp -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">



	$(document).ready(
		function() {
			var loginMem = '${loginMem}';
			var memNO = '${TalBoardVO.memNO}';

			if (loginMem == memNO) {
				$("#updateBtnHave").html("<input type='button' value='보유한 재능 수정' class='conetentHave'>");
				$("#updateBtnWant").html("<input type='button' value='원하는 재능 수정' class='contentWant'>");

			} else {
				$("#updateBtnHave").html("");
				$("#updateBtnWant").html("");


			}



			$('.conetentHave').on("click", function() {



				self.location = "modHave${pageMaker.makeSearch(pageMaker.cri.page) }"+ "&contentHave=" + '${TalBoardVO.contentHave }' + "&title=" + '${TalBoardVO.title }' + '&loginMem=' + loginMem + '&talDocNO=' + '${TalBoardVO.talDocNO}';
			});
			$('.contentWant').on("click", function() {

				self.location = "modWant${pageMaker.makeSearch(pageMaker.cri.page) }"+"&contentWant=" + '${TalBoardVO.contentWant }' + "&title=" + '${TalBoardVO.title }' + '&loginMem=' + loginMem + '&talDocNO=' + '${TalBoardVO.talDocNO}';

			});


			$("#goListBtn").click(function() {
				self.location = "list?page=${cri.page}&perPageNum=${cri.perPageNum}"
				+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
			});


		});
</script>

<!-- Main content -->
<section class="content">

	<center>


		<input type="text" value="카테고리:달러>달러" readonly="readonly"
			style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
			<input type='hidden' name='page' value="${cri.page}"> <input
		type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">
		<input type="text" value="${TalBoardVO.title }" class="title" readonly>
		<table border="0">

			<tr>
				<th colspan="4" align="left"><br>작성자 정보</th>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${TalBoardVO.nickName }</td>
				<td>재능교환 진행상태</td>
				<td>3건 진행중<br>10건완료
				</td>
			</tr>
			<tr>
				<td>보유재능</td>
				<td><table><tr><c:forEach items="${readDivHave }" var="talDivItem">
						
							<td>#${talDivItem.name}</td>
						
					</c:forEach></tr></table></td>
				<td>작성한 재능목록</td>
				<td rowspan="4">문서>자기소개/이력서<br>번역>영문번역<br>상담&노하우>주식투자
				</td>
			</tr>
			<tr>
				<td>찾는재능</td>
				<td><table><tr><c:forEach items="${readDivWant }" var="talDivItem">
						
							<td>#${talDivItem.name}</td>
						
					</c:forEach></tr></table></td>
			</tr>
			<tr>
				<td>보유 별점</td>
				<td>230점</td>
			</tr>
			<tr>
				<td>교환 만족도</td>
				<td>80%</td>
			</tr>
			<tr>
				<th colspan="4" align="left"><br>(${TalBoardVO.nickName})님의
					보유 재능 정보</th>
			</tr>
			<tr>

				<td colspan="4"><textarea disabled="disabled" cols="120"
						rows="10" style="text-align: left; resize: none;"
						class="contentHave">${TalBoardVO.contentHave }</textarea> <br>
					<div id="updateBtnHave"></div></td>
			</tr>



			<tr>
				<th colspan="4" align="left"><br>원하는 재능 정보</th>
			</tr>
			<tr>

				<td colspan="4"><textarea disabled="disabled" cols="120"
						rows="10" style="text-align: left; resize: none;"
						class="contentWant">${TalBoardVO.contentWant }</textarea><br>
					<div id="updateBtnWant"></div></td>
			</tr>


			<tr>
				<th colspan="4" align="left"><br>교류 현황</th>
			</tr>
			<tr>
				<td colspan="4">재능교환 신청자 수 ${TalBoardVO.excCalls }명</td>
			</tr>
			<tr>
				<td colspan="4"><input type="button" value="목록" id="goListBtn">
					<input type="button" value="교환글 삭제"> <input type="button"
					value="교환 알림함"> <span style="float: right"> 
						작성일자: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${TalBoardVO.writeDate }"/>
				</span></td>
			</tr>
		</table>
	</center>
</section>


<%@include file="../include/footer.jsp"%>