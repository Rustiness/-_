<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp" %>
<%-- .jsp --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" >
	function addtalent(){
		var memNO = '${clientMemberVO.memNO}';
		location.href="/tb/write1s?page=1&perPageNum=10&searchType&keyword=&memNO="+memNO;
	}
</script>

<!-- Main content -->
<section class="content">
<div class="panel panel-default">
							<div style="background-color:#89729E;" class="panel-heading">
								<h3 style="color:#FFF;" class="panel-title"><b>회원가입이 완료되었습니다. 보유한 재능을 등록하고 재능교환을 시작하세요.</b></h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-plus"></span>
             							<span class="glyphicon-class">
             								<a onclick="addtalent()">등록하러가기</a>
             							</span>
             						</label>
									<div class="col-md-4">
       								</div>
								</div>
							</div>
						</div>
<input type="button" value="재능등록">

</section>

<%@include file="../include/footer.jsp" %>