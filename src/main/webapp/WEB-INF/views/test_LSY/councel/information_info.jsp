<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객문의 상세정보</title>
</head>
<body>

<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">고객문의 상세정보</h3>
				</div>
				<!-- /.box-header -->


				<div class="box-body">
				<div data-text-content="true" style="font-weight: bold; font-size: 24px; border-width: 0px; border-style: none; text-shadow: rgba(0, 0, 0, 0.5) 3px 3px 14px;" class="">교환할 때 문의요~</div>	
				<div data-text-content="true" style="font-weight: bold; font-size: 18px; background-color: rgb(224, 224, 224);" class>   문의 정보</div>
				<table>
				<tr><th><div data-text-content="true" style="font-size: 16px; font-weight: bold;" class spellcheck="false">카테고리</div></th>
				<td><div data-text-content="true" style="font-size:16px;" class>재능교환</div></td>
				<th><div data-text-content="true" style="font-size: 16px; font-weight: bold;" class spellcheck="false">공개여부</div></th>
				<td><div data-text-content="true" style="font-size:16px;" class>공개</div></td>
				<th><div data-text-content="true" style="font-size: 16px; font-weight: bold;" class spellcheck="false">상태</div></th>
				<td><div data-text-content="true" style="font-size:16px;" class>답변완료</div></td>
				</tr>
				</table>
				<div data-text-content="true" style="font-weight: bold; font-size: 18px; background-color: rgb(224, 224, 224);" class spellcheck="false">  (상윤)님의 문의 내용</div>
				<textarea rows="" cols="">내용입력</textarea>
				</div>
				<!-- /.box-body -->

				<div class="box-footer">
					<button type="button" class="btn btn-warning" id="modifyBtn">목록</button>
					<button type="button" class="btn btn-danger" id="removeBtn">수정</button>
					<button type="button" class="btn btn-primary" id="goListBtn">삭제</button>
					<div data-text-content="true" style="border-top-left-radius: 30px; border-top-right-radius: 30px; border-bottom-right-radius: 30px; border-bottom-left-radius: 30px; text-align: center; line-height: 20px; color: rgb(255, 255, 255); font-size: 12px; box-shadow: none; background-color: rgb(26, 188, 156);" class>작성일자 : 2017-08-12 16:00:30</div>
				</div>



			</div>
			<div class="row">
		<div class="col-md-12">

			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">댓글 부분</h3>
				</div>
				<div class="box-body">
					 <input class="form-control" type="text"
						placeholder="재능교환 버그를 해결하였습니다." id="newReplyText">
						<input type="button" value="수정">
						<input type="button" value="삭제">
						

				</div>
				<!-- /.box-body -->
				<div class="box-footer">
				<input type="text" value="댓글을 작성하시오">
					<button type="button" class="btn btn-primary" id="replyAddBtn">입력</button>
				</div>
			</div>


			<!-- The time line -->
		

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>

		</div>
		<!-- /.col -->
	</div>

</body>
</html>