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
					<h3 class="box-title">교환후기</h3>
				</div>
				 <select><option>NO.</option><option>받은재능</option><option>제목</option><option>만족도</option><option>작성자</option><option>작성일</option></select>
			<input type="text" value="검색하세요">
			<button type="submit" class="btn btn-search">검색</button>
				<div class="box-body">
				       
					<table class="table table-bordered" cellpadding="10">
						<tr bgcolor="#cceeff">
							<th style="width: 10px">NO.</th>
							<th>받은재능</th>
							<th>제목</th>
							<th>만족도</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>

						<c:forEach  var = "i" begin = "1" end = "9">

							<tr>
								<td>${i }</td>
								<td>재능${i }</td>
								<td><a>제목 예) 재호가 말대꾸해요 마음에 안들어요${i}</a></td>
								<td><a>100%</a></td>
								<td>상윤${i}</td>
								<td>2017-05-23 19:00:00</td>
								<td>조회수${i}</td>
							</tr>

						</c:forEach>

					</table>
				</div>
				<!-- /.box-body -->
			


				<div class="box-footer">
                        <button type="submit" class="btn btn-primary">후기 작성</button>
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