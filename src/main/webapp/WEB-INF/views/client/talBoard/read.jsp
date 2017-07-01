<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%-- .jsp --%>
<%@include file="../include/header.jsp"%>

<!-- talentInfo_detail_maker.jsp -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
	$(document).ready(
			function() {
	$('.conetentHave').on("click", function() {
		


		self.location = ""+"?contentHave="+'${TalentListVO.contentHave }'+"&title="+'${TalentListVO.title }';

	});
	$('.contentWant').on("click", function() {

		self.location = ""+"?contentWant="+'${TalentListVO.contentWant }'+"&title="+'${TalentListVO.title }';

	});

	
	$("#goListBtn").click(function() {
		self.location = "list";
	});

	
			});
	</script>

<!-- Main content -->
<section class="content">

	<center>

		<input type="text" value="카테고리:달러>달러" readonly="readonly"
			style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
		<input type="text" value="${TalentListVO.title }" class="title">
		<table border="0">

			<tr>
				<th colspan="4" align="left"><br>작성자 정보</th>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${TalentListVO.nickName }</td>
				<td>재능교환 진행상태</td>
				<td>3건 진행중<br>10건완료
				</td>
			</tr>
			<tr>
				<td>보유재능</td>
				<td>#영문번역#주식투자</td>
				<td>작성한 재능목록</td>
				<td rowspan="4">문서>자기소개/이력서<br>번역>영문번역<br>상담&노하우>주식투자
				</td>
			</tr>
			<tr>
				<td>찾는재능</td>
				<td>#피아노#일문번역#엑셀</td>
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
				<th colspan="4" align="left"><br>(${TalentListVO.nickName})님의
					보유 재능 정보</th>
			</tr>
			<tr>

				<td colspan="4"><textarea disabled="disabled" cols="120"
						rows="10" style="text-align: left; resize: none;"
						class="contentHave">${TalentListVO.contentHave }</textarea> <br>
					<input type="button" value="보유한 재능 수정" class="conetentHave">
				</td>
			</tr>



			<tr>
				<th colspan="4" align="left"><br>원하는 재능 정보[피아노]</th>
			</tr>
			<tr>

				<td colspan="4"><textarea disabled="disabled" cols="120"
						rows="10" style="text-align: left; resize: none;"
						class="contentWant">${TalentListVO.contentWant }</textarea><br>
					<input type="button" value="원하는 재능 수정" class="contentWant">
				</td>
			</tr>


			<tr>
				<th colspan="4" align="left"><br>교류 현황</th>
			</tr>
			<tr>
				<td colspan="4">재능교환 신청자 수 50명</td>
			</tr>
			<tr>
				<td colspan="4"><input type="button" value="목록" id="goListBtn">
					<input type="button" value="교환글 삭제"> <input type="button"
					value="교환 알림함"> <span style="float: right"> <input
						type="text" size="22" value="작성일자: ${TalentListVO.writeDate }"
						style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
				</span></td>
			</tr>
		</table>
	</center>
</section>

<%@include file="../include/footer.jsp"%>