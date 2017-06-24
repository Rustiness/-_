<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
</head>
<body>
   회원정보수정<br><br>
       <table  cellpadding="1">
      <tr>
        <td colspan="2" height="100">계정정보</td>
        <tr><td>아이디(이메일주소)</td><td><input type="text"></td></tr>
       <tr><td>비밀번호</td><td><input type="password"></tr>
       <tr><td>비밀번호 확인</td><td><input type="password"></td></tr>
        
        <tr><td colspan="2" height="100">개인정보</td></tr><br>
            <tr><td>이름</td><td><input type="text"></td></tr>
         <tr><td>닉네임</td><td><input type="text"></td></tr>              
           <tr><td>성별</td><td><input type="radio">남성 <input type="radio">여성</td></tr>
           <tr><td>생년월일</td>
           <td><select><option>선택</option></select>
           <select><option>선택</option></select>
           <select><option>선택</option></select></td></tr>
           <tr><td>핸드폰번호</td><td><input type="text" size="4">
           -<input type="text" size="4">
           -<input type="text" size="4"></td></tr>
           <tr><td>SNS / 메신저1</td><td><select><option>선택</option></select><input type="text"></td></tr>   
           <tr><td>SNS / 메신저2</td><td><select><option>선택</option></select><input type="text"></td></tr>  
          
          <tr><td colspan="2" height="100" align="center" ><input type="submit" value="등록">
           <button>취소</button></td></tr>
             
     </table>   
 </center>       
</body>
</html>