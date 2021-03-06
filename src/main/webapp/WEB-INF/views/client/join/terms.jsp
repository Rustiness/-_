<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%-- .jsp --%>
<%@include file="../include/header.jsp"%>

<style>
table {
	border: 1px solid border-collapse: collapse;
	border-color: black;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).on('click', '#agree', function() {
		location.href = "/j/confirm";
	});


	function back() {
		window.history.back();
	}
</script>
<!-- Main content -->
<section class="content">

	<div class="panel panel-default">
		<div>
			<input type="hidden" name="page" value="1"> <input
				type="hidden" name="perPageNum" value="10"> <input
				type="hidden" name="searchType" value=""> <input
				type="hidden" name="keyword" value="">
		</div>
		<div class="panel-body">

			<div style="color: #5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225, 143, 225, 0.5) 3px 3px 14px;">
				<h5>약관동의</h5>
			</div>
			<br>
			<div class="panel panel-default">
				<div style="background-color: #89729E;" class="panel-heading">
					<h3 style="color: #FFF;" class="panel-title">
						<b>LTE이용약관 </b>
					</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-5">
							<pre>
      제 1장 총칙
 제 1조 (약관의 적용)재능교환 션은 지정된 웹사이트 홈페이지
  (www.realaudition.com)에 이용약관을 게시하는 방법
 으로 공지합니다.제 2조 (목적)이 이용약관(이하 '약관')은 
 ㈜케이티(이하 '회사')와 이용고객(이하 '회원')간에 회사가 
      </pre>
						</div>
					</div>
				</div>
				<div style="background-color: #89729E;" class="panel-heading">
					<h3 style="color: #FFF;" class="panel-title">
						<b>개인정보 보호정책</b>
					</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-5">
							<pre>섬머임팩트(이하 “회사”라 합니다.)는 회원님의 프라이버시
   (privacy)를 매우 소중하게 생각하고 있으며, 재능교환 
 서비스(이하 "서비스"라 합니다.)의 원활한 제공과 필요한
 최소한의 개인정보를 회원님으로부터 수집하는 것을 원칙으로
 하고 있습니다.회사는 법률의 규정에 의해 허용되거나 회원님의
 동의가 있는 경우를 제외하고는 회원님의 개인정보를 제3자 에게
 제공하지 않음은 물론 개인정보가 외부로 유출되지 않도록 항상 
      </pre>
						</div>
					</div>
				</div>
				<div align="center"><h4>상기내용에 동의하십니까?</h4></div>
			</div>

			<div align="center">
				<button id="agree" type="button" class="btn btn-primary">동의</button>
				<button onclick="back()" class="btn btn-warning" type="button">이전화면</button>
			</div>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp"%>