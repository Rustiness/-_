<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr>
재능등록<br>
	등록단계: [1단계 보유한 재능]>[<font color="blue">2단계 원하는 재능</font>]>[내용확인]<br>
	재능글 제목<br>
	<input type="button" value="원하는 재능 이전글 가져오기"><br>
	1단계: 보유한 재능 정보<br>
	<table>
	<tr>
	<td>보유한 재능 <input type="text"></td>
	<td><input type="text"><br></td>
	<td><input type="button" value="-"><br></td>
	</tr>
	</table>

	<table>
	<tr>
	<td>보유한 재능</td>
	<td><input type="text"></td>
	<td><input type="text"></td>
	<td><input type="button" value="+"><br></td>
	</tr>		
	</table>
 	보유한 재능 내용<br>
 	<textarea rows="10" cols="50" name="contents" value="내용을 입력해주세요"></textarea><br>
 	<input type="button" value="다음단계">
 	<input type="button" value="작성취소">
 			
</body>
</html>