<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>▒ LTE : ADMIN ▒</title>
  <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	var log = '${AdSUCCESS.memNO }';
	$(document).ready(function() { //DOM이 준비되고
		if (log == '') { //세션값이 없을경우
			$('#unAdlogin').hide(); // ID가 onlogin인 요소를 show();
		}else { // 그 외에는
			$('#onAdlogin').hide(); // ID가 unlogin인 요소를 hide();        
		}
	});

	$(document).on('click', '#gomain', function() { //메인으로
		location.href = "/ad";
	});

	$(document).on('click', '#Adlogin', function() { //로그인화면으로
		location.href = "/ad";
	});

	$(document).on('click', '#gomemberlist', function() { //회원목록으로
		location.href = "/ad/m/list";
	});

	$(document).on('click', '#goadminlist', function() { //직원목록으로
		location.href = "/ad/e/list";
	});

	$(document).on('click', '#gotalentlist', function() { //재능목록으로
		location.href = "/ad/tb/list";
	});

	$(document).on('click', '#gorequestlist', function() { //교환신청목록으로
		location.href = "/ad/tec/list";
	});

	$(document).on('click', '#goexchangelist', function() { //교환목록으로
		location.href = "/ad/te/list";
	});

	$(document).on('click', '#goreviewlist', function() { //교환후기 목록으로 
		location.href = "/ad/tr/list";
	});

	$(document).on('click', '#gocounsellist', function() { //고객문의목록으로
		location.href = "/ad/c/list";
	});

	$(document).on('click', '#goreportlist', function() { //신고 목록으로
		location.href = "/ad/r/list";
	});

	
</script> 
</head>
<%-- header.jsp --%>
<body>
<div>
	<div id="onAdlogin"><input type="button" value="로그인" id="Adlogin"></div>
	<div id="unAdlogin"><input type="button" value="로그아웃" id="Adlogout"></div>
	
	<input type="button" value="메인" id="gomain"> <input type="button" value="회원 목록" id="gomemberlist"> 
	<input type="button" value="직원 목록" id="goadminlist"> <input type="button" value="재능글 목록" id="gotalentlist"> 
	<input type="button" value="교환신청 목록" id="gorequestlist"> <input type="button" value="교환 목록" id="goexchangelist"> 
	<input type="button" value="교환후기 목록" id="goreviewlist"> <input type="button" value="고객문의 목록" id="gocounsellist"> 
	<input type="button" value="신고 목록" id="goreportlist"> 
	


</div>
</body>
</html>