<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
 	$(document).on('click', '#update', function() {
		location.href="/m/upchkPassform";
 	});
 	
 	$(document).on('click', '#delete', function() {
		location.href=" /m/delchkPassform";
 	});
 	
</script>
<style>
      body {			
        background-color: #4E2C4C;
        color: #C1C3C6
      }
</style>
<!-- Main content -->
<section class="content">
<div class="panel panel-default">
					<div>
						<input type="hidden" name="page" value="1"> <input type="hidden" name="perPageNum" value="10">
						<input type="hidden" name="searchType" value="">
						<input type="hidden" name="keyword" value="">
					</div>
					<div class="panel-body">
						
						<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
							<h5>회원 정보보기</h5>
						</div>
						
						<br>
						<div class="panel panel-default">
							<div style="background-color:#89729E;" class="panel-heading">
								<h3 style="color:#FFF;" class="panel-title"><b>계정정보</b></h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-globe"></span>
             							<span class="glyphicon-class">회원분류</span>
             						</label>
									<div class="col-md-4"><c:choose>
        													<c:when test="${clientMemberVO.personDF eq 'D_PE01'}">일반회원</c:when>
															<c:otherwise>관리자</c:otherwise>       
       													 </c:choose>
       								</div>
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-globe"></span>
            				 			<span class="glyphicon-class">아이디</span>
            				 		</label>
									<div class="col-md-4">${clientMemberVO.email }</div>
								</div>
							</div>
						</div>
						<br>
						<div class="panel panel-default">
							<div style="background-color:#89729E;" class="panel-heading">
								<h3 style="color:#FFF;" class="panel-title"><b>개인정보</b></h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<label class="col-md-2 form-label">
										 <span class="glyphicon glyphicon-user"></span>
            							 <span class="glyphicon-class">이름</span>
             						</label>
									<div class="col-md-4">${clientMemberVO.name }</div>
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-pencil"></span>
             							<span class="glyphicon-class">닉네임</span>
            				 		</label>
									<div class="col-md-4">${clientMemberVO.nickName }</div>
								</div>
								<div class="row">
									<label class="col-md-2 form-label">
										 <span class="glyphicon glyphicon-calendar"></span>
           							     <span class="glyphicon-class">생년월일</span>
             						</label>
									<div class="col-md-4">${clientMemberVO.birth }</div>
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-heart"></span>
             							<span class="glyphicon-class">성별</span>
            				 		</label>
									<div class="col-md-4">
										<c:choose>
           									<c:when test="${clientMemberVO.sex eq '1'}">남자</c:when>
           									<c:otherwise>여자</c:otherwise>
           								</c:choose>
           							</div>
								</div>
								<div class="row">
									<label class="col-md-2 form-label">
										 <span class="glyphicon glyphicon-phone-alt"></span>
            							 <span class="glyphicon-class">전화번호</span>
             						</label>
									<div class="col-md-4">${clientMemberVO.tel }</div>
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-calendar"></span>
            						    <span class="glyphicon-class">가입일</span>
            				 		</label>
									<div class="col-md-4">${clientMemberVO.joinDate }</div>
								</div>
							</div>
						</div>
						<br>
						<div class="panel panel-default">
							<div style="background-color:#89729E;" class="panel-heading">
								<h3 style="color:#FFF;" class="panel-title"><b>메신저</b></h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-envelope"></span>
            						    <span class="glyphicon-class">메신저목록</span><br>
             						</label>
								</div>
            						    <c:forEach items="${clientMessengerVO }" var="list">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.name} : ${list.id} <br>
									   </c:forEach>
										
							</div>
						</div>
						<div align="center">
							<button id="update" type="button" class="btn btn-warning">수정</button>
        					<button id="delete" type="button" class="btn btn-danger">탈퇴</button>
						</div>
				</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>