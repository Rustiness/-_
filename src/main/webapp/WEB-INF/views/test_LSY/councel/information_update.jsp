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
				
			</div>
			<!-- /.box-header -->

			<form role="form" method="post">
				<div data-text-content="true"
					style="font-weight: bold; font-size: 18px" class>고객문의 수정</div>
				<div data-text-content="true"
					style="font-weight: bold; font-size: 18px; background-color: rgb(224, 224, 224);"
					class spellcheck="false">문의 정보</div>
				<table>
					<tr>
						<th>카테고리</th>
						<td><input type="text" value="재능교환" readonly></td>
					</tr>
					<tr>
						<th>공개여부</th>
						<td><input type="text" value="공개" readonly></td>
					</tr>


				</table>

				<div data-text-content="true" style="font-size: 16px;" class>문의
					제목</div>
				<input type="text" id="title" value="문의 제목을 수정해주세요">
				<div data-text-content="true" style="font-size: 16px;" class>문의
					내용</div>
				<textarea data-text-content="true" data-min-width="100"
					data-min-height="60" style="color: rgb(94, 94, 94);"
					spellcheck="false" class>문의 내용을 수정해주세요.</textarea>
				<!-- /.box-body -->

				<div class="box-footer">
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-primary">취소</button>
				</div>
			</form>






		</div>

</body>
</html>