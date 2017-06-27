<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">고객문의</h3>
					<select><option>내용</option><option>제목</option><option>작성자</option></select>
				         <input type="text" value="검색하세요">
				         <button type="submit" class="btn btn-search">검색</button>
				</div>
				<div class="box-body">
					<table class="table table-bordered" cellpadding="10">
						<tr>
							<th style="width: 10px">NO.</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>공개여부</th>
							<th>상태</th>
						</tr>

						<c:forEach  var = "i" begin = "1" end = "9">

							<tr>
								<td>${i }</td>
								<td>카테고리${i }</td>
								<td><a>제목 예) 교환후기에서 알수없는 오류가 발생해요${i}</a></td>
								<td>상윤${i}</td>
								<td>2017-02-22 19:00:00</td>
								<td>공개 or 비공개</td>
								<td>대기 or 답변완료</td>
							</tr>

						</c:forEach>

					</table>
				</div>
				<!-- /.box-body -->
			


				<div class="box-footer">
				         
                        <button type="button" class="btn btn-primary">문의등록</button>
					<div class="text-center">
					       
						<ul class="pagination">

							
								<a>&laquo;</a>
							

							<c:forEach var = "i" begin = "1" end = "9">
								
									
									<a>${i}</a>
								
							</c:forEach>

							
								<a>&raquo;</a>
			
						</ul>
					</div>

				</div>
				<!-- /.box-footer-->
			</div>
			</center>
</body>
</html>