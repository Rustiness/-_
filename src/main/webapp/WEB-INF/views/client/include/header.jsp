<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<html>
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
<head>
	<link rel="shortcut icon" href="favicon_16.ico"/>
	<link rel="bookmark" href="favicon_16.ico"/>
	<!-- site css -->
	<link rel="stylesheet" href="/resources/tempBootflatAdmin/dist/css/site.min.css">
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,800,700,400italic,600italic,700italic,800italic,300italic" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/resources/tempBootflatAdmin/dist/js/site.min.js"></script>

	<!-- 내꺼 -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	var log = '${clientMemberVO.memNO }';
		$(document).ready(function () { //DOM이 준비되고
			if (log == '') { //세션값이 없을경우
				$('#onlogin').hide(); // ID가 onlogin인 요소를 show();
			} else { // 그 외에는
				$('#unlogin').hide(); // ID가 unlogin인 요소를 hide();
			}
		});

		$(document).on('click', '#gologin', function () { //로그인 페이지로
			location.href = "/l/confirm";
		});

		$(document).on('click', '#logout', function () { //로그아웃
			location.href = "/l/logout";
		});

		$(document).on('click', '#join', function () { //회원가입
			location.href = "/j/terms";
		});

		$(document).on('click', '#userallinfo', function () { //회원가입
			location.href = "/m/info";
		});

		$(document).on('click', '#tecclistaa', function () { //알림함
			location.href = "/tecc/list";
		});
	</script>
</head>
<%-- header.jsp --%>
<body>
<nav style="background-color: #5a3259;" role="navigation" class="navbar navbar-custom">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button data-target="#bs-content-row-navbar-collapse-5" data-toggle="collapse" class="navbar-toggle" type="button">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<b><a style="color: #fff;" href="/lte" class="navbar-brand">LTE : Life Talent Exchange</a></b>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div id="bs-content-row-navbar-collapse-5" class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-left">
				<li class="active"><a href="/intro"><b>재능교환이란?</b></a></li>

				<li class="dropdown">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#"><b>교환정보</b><b class="caret"></b></a>
					<ul role="menu" class="dropdown-menu">
						<li class="disabled"><a href="/tec/list">교환신청 수신함</a></li>
						<li class="disabled"><a href="/te/list">연결된 재능목록</a></li>
					</ul>
				</li>
				<li class="active"><a href="/tr/list"><b></b>교환후기</b></a></li>
				<li class="active"><a href="/c/list"><b>고객센터</b></a></li>
				<!-- <li class="disabled"><a href="#">Link</a></li> -->
			</ul>
			<ul id="unlogin" class="nav navbar-nav navbar-right">
				<li class="active">
					<input type="button" class="btn btn-info navbar-btn" id="gologin" value="로그인"/>
					<input type="button" class="btn btn-info navbar-btn" id="join" value="회원가입"/>
				</li>
			</ul>
			<ul id="onlogin" class="nav navbar-nav navbar-right" type="hidden">
				<li>
					<%--<input type="button" class="btn btn-info navbar-btn" id="tecclistaa" value="알림함"/>--%>
					<input type="button" class="btn btn-info navbar-btn" id="userallinfo" value="계정정보"/>
					<p class="navbar-text"><a class="navbar-link" href="">${clientMemberVO.nickName }(${clientMemberVO.name }) 님</a>
					</p>
					<input type="button" class="btn btn-danger navbar-btn" id="logout" value="로그아웃"/>
				</li>
			</ul>
			<input type="hidden" value="${clientMemberVO.memNO }" id="memNO">
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>
</body>
</html>