<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%-- .jsp --%>
<%@include file="../include/header.jsp"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var lastmsg = $('#msglast').val(); // 기존에 있던 메신저의 마지막행값
		var str = '012535678';
		var tel1 = '${tel[0]}';
		var tel2 = '${tel[1]}';
		var tel3 = '${tel[2]}';
		var tel = tel1 + "-" + tel2 + "-" + tel3;

		$("#pass1").change(function() { //비밀번호 유효성 체크

			var val = $("#pass1").val();


			var passPattern1 = /^.*(?=.{6,12})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
			var passPattern2 = /^[0-9a-zA-Z]*[0-9]{4,}[0-9a-zA-Z]*$/;

			if (val == "" || val == null)
				document.getElementById('pass_1').innerHTML = "<font color='red'>비밀번호를 입력하세요.</font>";
			else if (!passPattern1.test(val))
				document.getElementById('pass_1').innerHTML = "<font color='red'>올바른 비밀번호 형식이 아닙니다.</font>";
		}) //pass1.focusout


		$("#pass1").focusin(function() { //비밀번호 확인 잘못되고  다시 입력할 때 메시지 없애기
			document.getElementById('pass_1').innerHTML = "";

		}) //pass2_focusin
		$("#pass2").change(function() { //비밀번호 확인 입력시 위의 비밀번호와 일치하는지 체크

			var val1 = $("#pass1").val();
			var val2 = $("#pass2").val();

			if ((val1 != val2) || val2 == "")
				document.getElementById('pass_1').innerHTML = "<font color='red'>비밀번호가 일치하지 않습니다.</font>";

		}) //pass2_focusout	

		$("#nickName").change(function() { //닉네임 중복체크

			$.ajax({
				url : "/j/nickName",
				type : "post",
				data : {
					nickName : $("#nickName").val()
				},
				success : function(data) {

					var val = $('#nickName').val();
					if (data == 'duplicate')
						$('#nickName_1').html("<font color='red'>중복된 별명입니다.</font>").css("color", "red");
					else if (data == 'use' && val != '')
						$('#nickName_1').html("<font color='blue'>사용 가능한 별명입니다.</font>").css("color", "green");
					else if (val == '' || val == null)
						$('#nickName_1').html("<font color='red'>닉네임을 입력해주세요.</font>").css("color", "red");
				}
			})
		}) //nickName_focusout

		$("#nickName").focusin(function() { //잘못된 닉네임 입력후 다시 입력할 때 메시지 없애기
			//$('#email_1').innerHTML="";
			document.getElementById('nickName_1').innerHTML = "";

		}) //focusin   

		$("#tel1").change(function() { //전화번호 유효값체크

			var val = $(this).val();
			var telPattern = /^[0-9]{3,4}$/;

			if (val == "" || val == null)
				document.getElementById('tel_1').innerHTML = "<font color='red'>전화번호를 입력하세요.</font>";
			else if (!telPattern.test(val))
				document.getElementById('tel_1').innerHTML = "<font color='red'>숫자만 입력하세요.</font>"

		}) //tell1   

		$("#tel1").focusin(function() { //잘못된 전화번호 입력후 다시 입력할 때 메시지 없애기
			//$("#pass_1").innerHTML="";
			document.getElementById('tel_1').innerHTML = "";

		}) //tel1.focusin

		$("#tel2").focusin(function() { //잘못된 전화번호 입력후 다시 입력할 때 메시지 없애기
			//$("#pass_1").innerHTML="";
			document.getElementById('tel_1').innerHTML = "";

		}) //tel2.focusin

		$("#tel3").focusin(function() { //잘못된 전화번호 입력후 다시 입력할 때 메시지 없애기
			//$("#pass_1").innerHTML="";
			document.getElementById('tel_1').innerHTML = "";

		}) //tel3.focusin


		$("#tel2").change(function() { //전화번호 입력값 유효성 체크

			var val = $(this).val();
			var telPattern = /^[0-9]{3,4}$/;

			if (val == "" || val == null)
				document.getElementById('tel_1').innerHTML = "<font color='red'>전화번호를 입력하세요.</font>";
			else if (!telPattern.test(val))
				document.getElementById('tel_1').innerHTML = "<font color='red'>숫자만 입력하세요.</font>"

		}) //tell2

		$("#tel3").change(function() { //전화번호 값 유효성 체크

			var val = $(this).val();
			var telPattern = /^[0-9]{3,4}$/;

			if (val == "" || val == null)
				document.getElementById('tel_1').innerHTML = "<font color='red'>전화번호를 입력하세요.</font>";
			else if (!telPattern.test(val))
				document.getElementById('tel_1').innerHTML = "<font color='red'>숫자만 입력하세요.</font>"
		}) //tell3  


		$(document).on('click', '#update', function() {
			for (var i = 1; i < lastmsg + 1; i++) {
				if ($('#upmesID' + i).val() == '') {
					alert("기존 메신저에 값이 존재하지 않습니다.");
					return false;
				}
			}
			$.ajax({
				url : "/m/mod/result",
				type : "post",
				data : {
					memNO : $('#memNO').val(),
					pass : $('#pass1').val(),
					nickName : $('#nickName').val(),
					tel : tel
				},
				dataType : "html",
				success : function(result) {
					if (result.match("1")) { //수정성공시
						for (var i = 1; i <= lastmsg; i++) { //기존에 있는 메신저의 양만큼 수정을 실행 
							$.ajax({
								url : "/m/mod/messenger/up",
								type : "post",
								data : {
									no : i + '',
									memNO : $('#memNO').val(),
									mesDF : $('#upmesDF' + i + ' option:selected').val(),
									id : $('#upmesID' + i).val()
								}
							});
						}
						alert("수정이 완료되었습니다\n다시 로그인해 주세요.");
						location.href = "/l/confirm"

					} else {
						alert("실패입니다");
					}
				}
			});
		});

		var no = ''; //메신저 추가시 비교용
		for (var i = 1; i < 4; i++) {
			if (!$('#no' + i).length) {
				no = i + "";
				break;
			}
		}
		if (lastmsg >= 3) {
			$('#addmsgMAX').hide();
		} else {
			$('#addmsgMAX').show();
		}
		//메신저 행 추가
		$(document).on('click', '[name="addButton"]', function() {
			if ($('#msg').val() == '') {
				alert('메신저 아이디 값을 입력해 주세요');
			} else {
				$.ajax({
					url : "/m/mod/messenger/add",
					type : "post",
					data : {
						no : no,
						memNO : $('#memNO').val(),
						mesDF : $('#select_box option:selected').val(),
						id : $('#msg').val()
					},
					success : function(result) {
						if (result == "clientmsgAddSUCCESS") {
							alert('메신저가 추가되었습니다.');
							location.href = '/m/mod';
						}
					}
				});
			}
		});
		//기존에 있던 메신저 제거
		$(document).on('click', '#removemsg', function() {
			if (lastmsg == 1) {
				alert("최소 1개의 메신저를 보유해야 합니다.");
			} else {
				$.ajax({
					url : "/m/mod/messenger/del",
					type : "post",
					data : {
						no : $(this).prev().val(),
						memNO : $('#memNO').val()
					},
					success : function(result) {
						if (result === "clientmsgDelSUCCESS") {
							alert('메신저가 삭제되었습니다.');
							location.href = '/m/mod';

						}
					}
				});
			}
		});
	})
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

			<div
				style="color: #5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225, 143, 225, 0.5) 3px 3px 14px;">
				<h5>회원 정보수정</h5>
			</div>

			<br>
			<div class="panel panel-default">
				<div style="background-color: #89729E;" class="panel-heading">
					<h3 style="color: #FFF;" class="panel-title">
						<b>계정정보</b>
					</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<label class="col-md-2 form-label"> <span
							class="glyphicon glyphicon-globe"></span> <span
							class="glyphicon-class">회원분류</span>
						</label>
						<div class="col-md-4">
							<c:choose>
								<c:when test="${clientMemberVO.personDF eq 'D_PE01'}">일반회원</c:when>
								<c:otherwise>관리자</c:otherwise>
							</c:choose>
						</div>
						<label class="col-md-2 form-label"> <span
							class="glyphicon glyphicon-globe"></span> <span
							class="glyphicon-class">아이디</span>
						</label>
						<div class="col-md-4">${clientMemberVO.email }</div>
					</div>
					<div class="row">
						<label class="col-md-2 form-label"> <span
							class="glyphicon glyphicon-lock"></span> <span
							class="glyphicon-class">비밀번호</span>
						</label>
						<div class="col-md-3">
							<input type="password" value="${clientMemberVO.pass }" id="pass1"
								class="form-control" style="width: 80px; display: inline-block;">
						</div>
					</div>

					<div class="row">
						<label class="col-md-2 form-label"> <span
							class="glyphicon glyphicon-lock"></span> <span
							class="glyphicon-class">비밀번호확인</span>
						</label>
						<div class="col-md-4">
							<input type="password" value="${clientMemberVO.pass }" id="pass2"
								class="form-control" style="width: 80px; display: inline-block;">
							<div id="pass_1"></div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="panel panel-default">
				<div style="background-color: #89729E;" class="panel-heading">
					<h3 style="color: #FFF;" class="panel-title">
						<b>개인정보</b>
					</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<label class="col-md-2 form-label"> <span
							class="glyphicon glyphicon-user"></span> <span
							class="glyphicon-class">이름</span>
						</label>
						<div class="col-md-4">${clientMemberVO.name }</div>
						<label class="col-md-2 form-label"> <span
							class="glyphicon glyphicon-pencil"></span> <span
							class="glyphicon-class">닉네임</span>
						</label>
						<div class="col-md-4">
							<input type="text" value="${clientMemberVO.nickName }"
								id="nickName" class="form-control" style="width: 80px; display: inline-block;">
							<div id="nickName_1"></div>
						</div>
					</div>
					<div class="row">
						<label class="col-md-2 form-label"> <span
							class="glyphicon glyphicon-calendar"></span> <span
							class="glyphicon-class">생년월일</span>
						</label>
						<div class="col-md-4">${clientMemberVO.birth }</div>
						<label class="col-md-2 form-label"> <span
							class="glyphicon glyphicon-heart"></span> <span
							class="glyphicon-class">성별</span>
						</label>
						<div class="col-md-4">
							<c:choose>
								<c:when test="${clientMemberVO.sex eq '1'}">남자</c:when>
								<c:otherwise>여자</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="row">
						<label class="col-md-2 form-label"> <span
							class="glyphicon glyphicon-phone-alt"></span> <span
							class="glyphicon-class">전화번호</span>
						</label> <span class="col-md-4"> <input type="text"
							value="${tel[0] }" id="tel1" class="form-control" style="width: 60px; display: inline-block;"> -<input
							type="text" value="${tel[1] }" id="tel2" class="form-control" style="width: 65px; display: inline-block;">
							-<input type="text" value="${tel[2] }" id="tel3"
							class="form-control" style="width: 65px; display: inline-block;">
							<div id="tel_1"></div>
						</span> <label class="col-md-2 form-label"> <span
							class="glyphicon glyphicon-calendar"></span> <span
							class="glyphicon-class">가입일</span>
						</label>
						<div class="col-md-4">${clientMemberVO.joinDate }</div>
					</div>
				</div>
			</div>
			<br>
			<div class="panel panel-default">
				<div style="background-color: #89729E;" class="panel-heading">
					<h3 style="color: #FFF;" class="panel-title">
						<b>메신저</b>
					</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<label class="col-md-2 form-label" style="height: 20px"> <span
							class="glyphicon glyphicon-envelope"></span> <span
							class="glyphicon-class">메신저목록</span>
						</label>
					</div>
					<c:forEach items="${clientMessengerVO }" var="my"
						varStatus="status">
						<div class="row">
							<!-- 회원이 등록한 메신저 수정-->
							<span class="col-md-6"> <select
								id="upmesDF${status.count }"
								class="btn btn-default dropdown-toggle">
									<c:forEach items="${messengerVOlist}" var="list">
										<c:choose>
											<c:when test="${my.name eq list.name}">
												<option selected="selected" value="${list.mesDF }">${list.name }</option>
											</c:when>
											<c:otherwise>
												<option value="${list.mesDF }">${list.name }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
							</select> <input type="text" value="${my.id}" id="upmesID${status.count }" class="form-control" style="width: 200px; display: inline-block;">
								<input type="hidden" value="${my.no }" id="no${my.no }">
								<input type=button value='삭제' id='removemsg'
								class="btn btn-danger"> <c:if test="${status.last}">
									<input type="hidden" value="${status.count}" id="msglast">
									<br>
								</c:if>
							</span>
						</div>
					</c:forEach>
					<div class="row">
						<label class="col-md-2 form-label" style="height: 20px"> <span
							class="glyphicon glyphicon-envelope"></span> <span
							class="glyphicon-class">메신저추가</span>
						</label>
					</div>
					<div class="row">
						<span class="col-md-6">
							<div id="addmsgMAX">
								<form id="megform">
									<!-- 메신저 추가로 입력하기-->
									<select id="select_box" class="btn btn-default dropdown-toggle">
										<c:forEach items="${messengerVOlist}" var="messenger">
											<option value="${messenger.mesDF }">${messenger.name }</option>
										</c:forEach>
									</select> <input type="text" id="msg" class="form-control" style="width: 200px; display: inline-block;"> <input name="addButton"
										type="button" value="추가" class="btn btn-primary"><br>

								</form>
							</div>
						</span>
					</div>
				</div>
			</div>
			<div align="center">
				<input type="hidden" value="${clientMemberVO.memNO} " id="memNO">
				<button id="update" type="button" class="btn btn-warning">수정</button>
				<button id="reset" type="button" class="btn btn-danger">취소</button>
			</div>
		</div>
	</div>
</section>
<%@include file="../include/footer.jsp"%>
