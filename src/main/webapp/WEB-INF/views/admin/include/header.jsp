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
    <link href="/resources/tempBootflatAdmin/bootflat-admin/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/tempBootflatAdmin/dist/css/site.min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
    var log = '${memberList[0].memNO }';
    $(document).ready(function () {
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
		location.href = "/admin";
	});
	
	$(document).on('click', '#Adlogout', function() { //로그인화면으로
		location.href = "/ad/logout";
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
<style>
.margin{
margin-left: auto;
margin-right: auto;
}

</style>

<body>


<div>
	<div id="onAdlogin">
		<div><input type="button" value="로그인" id="Adlogin"></div>
	</div>					
	<div id="unAdlogin">
		<div style="margin-left: 1200px">${memberList[0].name } 님<input type="button" value="로그아웃" id="Adlogout" class="btn btn-xs btn-danger" ></div>
	</div>					
	
	<div align="center">
	<input type="button" value="회원 목록" id="gomemberlist" class="btn btn-successzz"> &nbsp;&nbsp;
	<input type="button" value="직원 목록" id="goadminlist" class="btn btn-successzz"> &nbsp;&nbsp;<input type="button" value="재능글 목록" id="gotalentlist" class="btn btn-successzz"> &nbsp;&nbsp;
	<input type="button" value="교환신청 목록" id="gorequestlist" class="btn btn-successzz">&nbsp;&nbsp; <input type="button" value="교환 목록" id="goexchangelist" class="btn btn-successzz">&nbsp;&nbsp; 
	<input type="button" value="교환후기 목록" id="goreviewlist" class="btn btn-successzz"> &nbsp;&nbsp;<input type="button" value="고객문의 목록" id="gocounsellist" class="btn btn-successzz"> &nbsp;&nbsp;
	</div>


</div>
</body>
</html>