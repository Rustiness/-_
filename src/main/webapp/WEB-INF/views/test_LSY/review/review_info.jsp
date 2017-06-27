<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">교환후기 상세정보</h3>
				</div>
				<!-- /.box-header -->


				<div class="box-body">
				<div data-text-content="true" style="font-weight: bold; font-size: 24px; border-width: 0px; border-style: none; text-shadow: rgba(0, 0, 0, 0.5) 3px 3px 14px;" class>좋은 재능을 얻었어요~!!</div>	
				<div data-text-content="true" style="font-weight: bold; font-size: 18px; background-color: rgb(224, 224, 224);" class>   교환 정보</div>
				<table>
				<tr><th><div data-text-content="true" style="font-size: 16px; font-weight: bold;" class spellcheck="false">받은  재능</div></th>
				<td><div data-text-content="true" style="font-size:16px;" class>피아노</div></td>
				<th><div data-text-content="true" style="font-size: 16px; font-weight: bold;" class spellcheck="false">교환자 닉네임</div></th>
				<td><div data-text-content="true" style="font-size:16px;" class>x7360</div></td>
				<th><div data-text-content="true" style="font-size: 16px; font-weight: bold;" class spellcheck="false">만족도</div></th>
				<td><div data-text-content="true" style="font-size:16px;" class>80%</div></td>
				</tr>
				</table>
				<div data-text-content="true" style="font-weight: bold; font-size: 18px; background-color: rgb(224, 224, 224);" class spellcheck="false">  (x7360)님의 교환후기</div>
				<textarea rows="" cols=""></textarea>
				</div>
				<!-- /.box-body -->

				<div class="box-footer">
					<button type="submit" class="btn btn-warning" id="modifyBtn">수정</button>
					<button type="submit" class="btn btn-danger" id="removeBtn">삭제</button>
					<button type="submit" class="btn btn-primary" id="goListBtn">목록으로</button>
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
						placeholder="댓글입니다." id="newReplyText">
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