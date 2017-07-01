<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>

<!-- Main content -->
<section class="content">
	<center>
		<div class="box box-primary">

			<!-- /.box-header -->
			<form role="form" method="post">
				<div data-text-content="true"
					style="font-weight: bold; font-size: 18px" class>고객문의 등록</div>
				<div data-text-content="true"
					style="font-weight: bold; font-size: 18px; background-color: rgb(224, 224, 224);"
					class spellcheck="false">문의 정보</div>
				<table>
					<tr>
						<th>카테고리</th>
						<br>
						<td><select>
								<option >재능교환</option>
								<option>교환후기</option>
								<option>재능등록</option>
						</select></td>
						<br>
					</tr>
					<br>
					<tr>
						<th>공개여부</th>
						<td><select>
								<option>공개</option>
								<option>비공개</option>
						</select></td>
						<br>
					</tr>
					<br>

				</table>
					<div class="form-group">
						<label for="writer">작성자</label> <input type="text" id="writer"
							name="writer" class="form-control" placeholder="작성자">

				<div class="box-body">
					<div class="form-group">
						<label for="title">문의글 제목</label> 
						<input type="text" id="title"
							name='title' class="form-control" placeholder="제목">
					</div>
					<div class="form-group">
						<label for="content">문의 내용</label>
						<textarea class="form-control" name="content" rows="3"
							id="content" placeholder="내용 ..."></textarea>
					</div>
					</div>
				</div>


				<div class="box-footer">
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="button" class="btn btn-primary">취소</button>
				</div>
			</form>


		</div>

	</center>
</section>

<%@include file="../include/footer.jsp" %>