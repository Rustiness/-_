<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<html>
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" href="favicon_16.ico" />
<link rel="bookmark" href="favicon_16.ico" />
<!-- site css -->
<link rel="stylesheet"
	href="/resources/tempBootflatAdmin/dist/css/site.min.css">

<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,800,700,400italic,600italic,700italic,800italic,300italic"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="/resources/tempBootflatAdmin/dist/js/site.min.js"></script>
<!-- 내꺼 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var log = '${SUCCESS.memNO }';
	$(document).ready(function() { //DOM이 준비되고
		if (log == '') { //세션값이 없을경우
			$('#onlogin').hide(); // ID가 onlogin인 요소를 show();
		} else { // 그 외에는
			$('#unlogin').hide(); // ID가 unlogin인 요소를 hide();        
		}
	});

	$(document).on('click', '#gologin', function() { //로그인 페이지로
		location.href = "/l/confirm";
	});

	$(document).on('click', '#logout', function() { //로그아웃
		location.href = "/l/logout";
	});

	$(document).on('click', '#join', function() { //회원가입
		location.href = "/j/terms";
	});

	$(document).on('click', '#userallinfo', function() { //회원가입
		location.href = "/m/info";
	});

	$(document).on('click', '#tecclistaa', function() { //알림함
		location.href = "/tecc/list";
	});
</script>
</head>
<%-- header.jsp --%>
<body>

	<div id="bs-content-row-navbar-collapse-5"
		class="collapse navbar-collapse" style="background-color: gray">
		<div class="navbar-header">
			<button data-target="#bs-content-row-navbar-collapse-5"
				data-toggle="collapse" class="navbar-toggle" type="button">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<input type="button" value="Talent Exchange" class="btn btn-default">
		</div>

		<ul class="nav navbar-nav navbar-right">
			<input type="hidden" value="${SUCCESS.memNO }" id="memNO">
			<li class="active" id="unlogin"><input type="button" value="로그인"
				id="gologin" class="btn btn-default"> <input type="button"
				value="회원가입" id="join" class="btn btn-default"></li>
			<li class="active" id="onlogin"><input type="button" value="알림함"
				id="tecclistaa" class="btn btn-default"> <input
				type="button" value="계정정보" id="userallinfo" class="btn btn-default">
				${SUCCESS.name } 님 <input type="button" value="로그아웃" id="logout"
				class="btn btn-default"></li>

		</ul>
		<ul class="nav navbar-nav navbar-left">
			<li class="active"><input type="button" value="재능교환이란?"
				class="btn btn-default">
			<li class="dropdown"><a data-toggle="dropdown"
				class="dropdown-toggle" href="#">재능 항목 <b class="caret"></b></a>
				<ul role="menu" class="dropdown-menu">
					<li><a href="#">디자인</a></li>
					<li class="divider"></li>
					<li><a href="#">문서</a></li>
					<li class="divider"></li>
					<li><a href="#">번역</a></li>
					<li class="divider"></li>
					<li><a href="#">컨텐츠제작</a></li>
					<li class="divider"></li>
					<li><a href="#">마케팅</a></li>
					<li class="divider"></li>
					<li><a href="#">상담&노하우</a></li>
					<li class="divider"></li>
					<li><a href="#">IT&프로그래밍</a></li>
				</ul></li>
			<input type="button" value="교환후기" class="btn btn-default">
			<input type="button" value="소모임" class="btn btn-default">
			<input type="button" value="고객센터" class="btn btn-default">

			</li>
		</ul>
	</div>

	<li class="dropdown"><a data-toggle="dropdown"
		class="dropdown-toggle" href="#">Silverbux <b class="caret"></b></a>
		<ul role="menu" class="dropdown-menu">
			<li class="dropdown-header">Setting</li>
			<li><a href="#">Action</a></li>
			<li class="divider"></li>
			<li class="active"><a href="#">Separated link</a></li>
			<li class="divider"></li>
			<li class="disabled"><a href="#">Signout</a></li>
		</ul></li>

</body>
</html>