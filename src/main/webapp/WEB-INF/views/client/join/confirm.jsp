<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var inputID = 1; //메신저추가시 아이디 비교용
	var msgmaxcount = 1; // 행최고치계산용
	
$(document).ready(function () {
	$("#email").change(function(){
		
		 $.ajax({                 //이메일 중복체크
				url : "/j/id",
				type : "post",
				data : {
					  email:$("#email").val()
					},
				success : function(data){
					var val=$('#email').val();
					var emailPattern=/^[a-z][a-zA-Z0-9_-]{2,11}@([a-z\d\.-]+)\.[a-z\.]{2,6}$/;
					var emailPattern1=/^[0-9][a-zA-Z0-9_-]{2,11}@([a-z\d\.-]+)\.[a-z\.]{2,6}$/;
					var emailPattern11=/^[0-9][a-zA-Z0-9\.]{2,30}$/;
					var emailPattern2=/^[a-z][a-zA-Z0-9_-]{2,11}([a-z\d\.-]+)\.[a-z\.]{2,6}$/;
					var emailPattern3=/^[a-z][a-zA-Z0-9_-]{2,11}@([a-z\d\.-]+)[a-z\.]{2,6}$/;
					var str='';
					if(data=='duplicate')
						
						$('#email_1').html("중복된 아이디입니다.").css("color","red");
					else if(data=='use' && emailPattern.test(val))
						
						$('#email_1').html("사용 가능한 아이디입니다.").css("color","green");
					
				    else if(val==""||val==null)
						
					    $('#email_1').html("아이디(이메일)를 입력하세요").css("color","red");
					
				    else if(emailPattern1.test(val) || emailPattern11.test(val) )
				    	$('#email_1').html("맨 앞자리에 숫자가 들어가면 안됩니다.").css("color","red");
					
				    else if(emailPattern2.test(val))
				    	$('#email_1').html("이메일 형식에 '@'가 들어가야 합니다.").css("color","red");
					
				    else if(emailPattern3.test(val))
				    	$('#email_1').html("이메일형식에 '.'이 없습니다.").css("color","red");
					
				    else if(!emailPattern.test(val) || !emailPattern1.test(val) || !emailPattern2.test(val) || !emailPattern3.test(val))
					    $('#email_1').html("이메일 형식이 아닙니다").css("color","red");

					   /* if(emailPattern1.test(val))
					    	$('#email_1').html("맨 앞자리에 숫자가 들어가면 안됩니다.").css("color","red");
						
					    else if(emailPattern2.test(val))
					    	$('#email_1').html("이메일 형식에 '@'가 들어가야 합니다.").css("color","red");
						
					    else if(emailPattern3.test(val))
					    	$('#email_1').html("이메일형식에 '.'이 없습니다.").css("color","red");
				
			 } */
		}//success	
	})//ajax
		
}) //email
	
	$("#email").focusin(function(){ //잘못된 이메일 입력 후 다시 입력할 때 메시지 없애기
		//$('#email_1').innerHTML="";
		document.getElementById('email_1').innerHTML = "";
		
	})//focusin
	
	//$("#email").focusout(function(){
		
		 /* var val=$(this).val();
		 var emailPattern=/^[a-z][a-z0-9_-]{3,11}@([a-z\d\.-]+)\.[a-z\.]{2,6}$/;
		 
		 if(val==""||val==null)
				document.getElementById('email_1').innerHTML = "아이디(이메일)를 입력하세요.";
			
		else if(!emailPattern.test(val)) 
				document.getElementById('email_1').innerHTML="이메일 형식이 아닙니다."; */
		
	//})//email
	
	
	$("#nickName").change(function(){ //닉네임 중복체크
		
		 $.ajax({
				url : "/j/nickName",
				type : "post",
				data : {
					  nickName:$("#nickName").val()
					},
				success : function(data){	
					
				  var val= $('#nickName').val();
					if(data=='duplicate')
						$('#nickname_1').html("중복된 별명입니다.").css("color","red");
					else if(data=='use' && val!='')
						$('#nickname_1').html("사용 가능한 별명입니다.").css("color","green");
					else if(val=='' || val==null)
						$('#nickname_1').html("닉네임을 입력해주세요.").css("color","red");
				}	
		})
  })//nickname_focusout

     $("#nickName").focusin(function(){ //잘못된 닉네임 입력후 다시 입력할 때 메시지 없애기
	   //$('#email_1').innerHTML="";
	  document.getElementById('nickname_1').innerHTML = "";
	
 })//focusin
	        
	
	$("#pass1").change(function(){ //비밀번호 유효성 체크
		
		 var val=$(this).val();
		 var flag=false;
		 var flag2=false;
		    for(var i=0; i<str.length; i++){
		    	if(str.length - i < 4)  break;//str.length --> 4 (길이가 4를 벗어나면 break)
		    	   // 4-        0
		    	   // 4-        1
		      // console.log(i+":"+ str.charAt(i) +":"+str.charCodeAt(i)); 
		    	
		         if(val.charCodeAt(i+1) - val.charCodeAt(i) == 1){//0과1
		        	 if(val.charCodeAt(i+2)- val.charCodeAt(i+1) == 1){//1과2
		        		 if(val.charCodeAt(i+3) - val.charCodeAt(i+2) == 1){//2와3
		        			  //연속된 네자리 수 발견!!
		        			  flag=true;
		        			  break;
		        		 }
		        	 }
		         }
		    }//for
		    
		    //if(flag)  console.log("연속된 수 발견!!");
		 //   else console.log("연속된 수 없음!!");
		    for(var i=0; i<str.length; i++){
		    	if(str.length - i < 4)  break;
		    	if(val.charCodeAt(i+1) - val.charCodeAt(i) == 0){//0과1
		        	 if(val.charCodeAt(i+2)- val.charCodeAt(i+1) == 0){//1과2
		        		 if(val.charCodeAt(i+3) - val.charCodeAt(i+2) == 0){//2와3
		        			  //연속된 같은 수 발견!!
		        			  flag2=true;
		        			  break;
		        		 }
		        	 }
		         }
		    }//for
		    	
		
		 var passPattern1=/^.*(?=.{6,12})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
         var passPattern2=/^[0-9a-zA-Z]*[0-9]{4,}[0-9a-zA-Z]*$/;    
		 //[0-9]*[a-z]*[A-Z]*$/; //[0-9a-zA-Z]*
		 
		if(val==""||val==null)
			document.getElementById('pass_1').innerHTML = "비밀번호를 입력하세요.";
		
		else if(!passPattern1.test(val)) 
			document.getElementById('pass_1').innerHTML="올바른 비밀번호 형식이 아닙니다.";
			
		
		 /* else if (passPattern2.test(val))
		    document.getElementById('pass_1').innerHTML="연속된 숫자를 입력하셨습니다."; */
		 else if (flag || flag2)
			document.getElementById('pass_1').innerHTML="연속된 숫자를 입력하셨습니다.";
}) //pass1.focusout
   
    $("#pass1").focusin(function(){ //잘못된 비밀번호 입력후 다시 입력할 때 메시지 없애기
    	//$("#pass_1").innerHTML="";
    	document.getElementById('pass_1').innerHTML = "";
    	
})//pass1.focusin


    $("#pass2").change(function(){ //비밀번호 확인 입력시 위의 비밀번호와 일치하는지 체크
	
	    var val1=$(this).val();
	    var val2=$("#pass1").val();
	   // var passPattern=/^[a-zA-Z0-9]{6,12}$/;
	
	   if((val1 != val2)||val2=="")
		   document.getElementById('pass_2').innerHTML = "비밀번호가 일치하지 않습니다.";
	
 }) //pass2_focusout	
	   
	$("#pass2").focusin(function(){ //비밀번호 확인 잘못되고  다시 입력할 때 메시지 없애기
		//$("#pass_2").innerHTML="";
		 document.getElementById('pass_2').innerHTML = "";
     
 })//pass2_focusin
 
    $("#tel1").change(function(){ //전화번호 유효값체크
		
	 var val=$(this).val();
	 var telPattern=/^[0-9]{3,4}$/;
	 
	if(val==""||val==null)
		document.getElementById('tel_1').innerHTML = "전화번호를 입력하세요.";
	
	else if(!telPattern.test(val)) 
		document.getElementById('tel_1').innerHTML="숫자만 입력하세요."
		
  }) //tell1   
  
     $("#tel1").focusin(function(){ //잘못된 전화번호 입력후 다시 입력할 때 메시지 없애기
  	//$("#pass_1").innerHTML="";
  	  document.getElementById('tel_1').innerHTML = "";
  	
})//tel1.focusin

     $("#tel2").focusin(function(){//잘못된 전화번호 입력후 다시 입력할 때 메시지 없애기
  	//$("#pass_1").innerHTML="";
    	document.getElementById('tel_1').innerHTML = "";
  	
})//tel2.focusin

      $("#tel3").focusin(function(){ //잘못된 전화번호 입력후 다시 입력할 때 메시지 없애기
  	//$("#pass_1").innerHTML="";
  	  document.getElementById('tel_1').innerHTML = "";
  	
})//tel3.focusin

  
    $("#tel2").change(function(){//전화번호 입력값 유효성 체크
		
		 var val=$(this).val();
		 var telPattern=/^[0-9]{3,4}$/;
		 
		if(val==""||val==null)
			document.getElementById('tel_1').innerHTML = "전화번호를 입력하세요.";
		
		else if(!telPattern.test(val)) 
			document.getElementById('tel_1').innerHTML="숫자만 입력하세요."
			
	  }) //tell2
	  
	$("#tel3").change(function(){ //전화번호 값 유효성 체크
			
			 var val=$(this).val();
			 var telPattern=/^[0-9]{3,4}$/;
			 
			if(val==""||val==null)
				document.getElementById('tel_1').innerHTML = "전화번호를 입력하세요.";
			
			else if(!telPattern.test(val)) 
				document.getElementById('tel_1').innerHTML="숫자만 입력하세요."
	 }) //tell3   			
    
	 $("#name").change(function(){ //이름값 유효성 체크
		 
		 var val=$(this).val();
			if(val==""||val==null)
				document.getElementById('name_1').innerHTML = "이름을 입력하세요.";
	 })
	 
	 $("#name").focusin(function(){//이름값 출력된 메시지 없애기
		 document.getElementById('name_1').innerHTML = "";
		  });
	 
		/* 메신저 추가용 */
		//메신저 행 추가
		$(document).on('click', '[name="addButton"]', function() {
			$.ajax({
				url : "/j/msgJson",
				type : "get",
				dataType : "JSON",
				success : function(data) {
					var selectlist = "<div><select class='btn btn-default dropdown-toggle' id='select_box" + inputID + "'>";
					$.each(data, function(index, m) { // db에 있는 메신저목록을 가져와서 하단의 div에 넣는다
						selectlist += "<option value=" + m.mesDF + " id=" + m.mesDF + ">" + m.name + "</option>";
					});
					selectlist += "<select > <input type=text id='msg" + inputID + "'> <input type=button value='삭제' id='deletemsg' class='btn btn-danger' ></div>";
					inputID++;
					msgmaxcount++;
					$('#megform').append(selectlist);
						if(msgmaxcount == 3){	//버튼 3개 초과면 추가버튼 사라짐
							$('#addmax').hide();
					}
					
				}
			});
		});

		//메신저 추가한거 제거
		$(document).on('click', '#deletemsg', function() {
			msgmaxcount--;
			if(msgmaxcount == 2){	//버튼 3개 미만이면 추가버튼 보임
				$('#addmax').show();
			}
			$(this).parent(this).remove();
		});

		//데이터 전달하기 기본정보
		document.getElementById('insert').onclick = function() {
			for(var i=0; i<msgmaxcount; i++){
				if($('#msg'+i).val()==''){
					alert("메신저에 값을 입력하세요");
					return false;
				}
			}
			var tel = $('#tel1').val() + "-" + $('#tel2').val() + "-" + $('#tel3').val();
			var sex = $('input:radio[name="sex"]:checked').val();
			$.ajax({
				url : "/j/confirm",
				type : "post",
				data : {
					email : $('#email').val(),
					pass : $('#pass1').val(),
					name : $('#name').val(),
					nickName : $('#nickName').val(),
					birth : $('#birth').val(),
					sex : sex,
					tel : tel
				},
				dataType : "text",
				success : function(result) {
					result = result.split(":");
					
					if (result[0].match("success")) { //가입성공 (메세지제외한상태)
						var mesCount= 1;
						var mesNO = ''; //메신저테이블에 들어갈 NO

						var mesDF = '';
						var mesid = '';
						var memNO = result[1];
						for (var i = 0; i < inputID; i++) {
							if($('#select_box'+i+' option:selected').val() !== undefined){
								mesNO += mesCount+',';
								mesDF += $('#select_box'+i+' option:selected').val() + ",";
								mesid += $('#msg' + i + '').val() + ",";
								mesCount++;
							}
						}
						//메세지테이블추가작업
						$.ajax({
							url : "/j/confirm/messenger",
							type : "post",
							data : {
								No : mesNO,
								memNO : memNO,
								mesDF : mesDF,
								id : mesid
							},
						    success : function(result){
						    	if(result.match("success")){
						    		location.href="/j/res?memNO="+memNO;
						    	}
						    }
						});
					} else { //가입실패
						alert('가입실패!!');
						location.href = "/j/confirm";
					}
				}
			});
	};//클릭시
});//document.ready
	
</script>

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
							<h5>회원가입</h5>
						</div>
						
						<form method="post" id="confirmForm">
						<div class="panel panel-default">
							<div style="background-color:#89729E;" class="panel-heading">
								<h3 style="color:#FFF;" class="panel-title"><b>계정정보</b></h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-globe"></span>
             							<span class="glyphicon-class">아이디(이메일)</span>
             						</label>
									<div class="col-md-4">
										<input type="text" id="email" name="email" maxlength="30">
										<div id="email_1" style="color: red; font-size: 11px;"></div>
       								</div>
								</div>
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-lock"></span>
             							<span class="glyphicon-class">비밀번호</span>
             						</label>
									<div class="col-md-4">
										<input type="password" name="pass1" id="pass1" maxlength="12">
       								</div>
								</div>
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-lock"></span>
             							<span class="glyphicon-class">비밀번호확인</span>
             						</label>
									<div class="col-md-4">
										<input type="password" name="pass2" maxlength="12">
										<div id="pass_1" style="color: red; font-size: 11px;"></div>
										<div id="pass_2" style="color: red; font-size: 11px;"></div>
       								</div>
								</div>
								<div class="row" style="margin-left: 191px">
									<font color=green size="1"> 최소 6자, 최대 12자 (영문과 숫자를 이용, 영문은 대소문자를 구분)</font>
								</div>
							</div>
						</div>
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
									<div class="col-md-4">
										<input type="text" name="name" id="name" maxlength="12">
										<div id="name_1" style="color: red; font-size: 11px;"></div>
									</div>
								</div>
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-pencil"></span>
             							<span class="glyphicon-class">닉네임</span>
            				 		</label>
									<div class="col-md-4">
										<input type="text" id="nickName" name="nickName">
										<div id="nickname_1" style="color: red; font-size: 11px;"></div>
									</div>
								</div>
								<div class="row">
									<label class="col-md-2 form-label">
										 <span class="glyphicon glyphicon-calendar"></span>
           							     <span class="glyphicon-class">생년월일</span>
             						</label>
									<div class="col-md-4">
										<input type="date" name="birth" id="birth">
									</div>
								</div>
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-heart"></span>
             							<span class="glyphicon-class">성별</span>
            				 		</label>
									<div class="col-md-4">
           								남성<input type="radio" name="sex" value="1" checked="checked">
           								여성<input type="radio" name="sex" value="2">
           							</div>
           						</div>
								
								<div class="row">
									<label class="col-md-2 form-label">
										 <span class="glyphicon glyphicon-phone-alt"></span>
            							 <span class="glyphicon-class">전화번호</span>
             						</label>
									<div class="col-md-4">
									<input type="text" name="tel1" id="tel1" size="4" maxlength="3"> - 
									<input type="text" name="tel2" id="tel2" size="4" maxlength="4"> - 
									<input type="text" name="tel3" id="tel3" size="4" maxlength="4">
									<div id="tel_1" style="color: red; font-size: 11px;"></div>
									</div>
								</div>
							</div>
						</div>
						</form>
						<div class="panel panel-default">
							<div style="background-color:#89729E;" class="panel-heading">
								<h3 style="color:#FFF;" class="panel-title"><b>메신저</b></h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<label class="col-md-2 form-label">
										<span class="glyphicon glyphicon-envelope"></span>
            						    <span class="glyphicon-class">메신저</span><br>
             						</label>
								</div>
            						    <div>
            						    	<form id="megform" action="/j/confrim/messenger">
											<select id="select_box0" class="btn btn-default dropdown-toggle">
												<c:forEach items="${list }" var="list">
													<option value="${list.mesDF }" id="${list.mesDF }">${list.name }</option>
												</c:forEach>
											</select> 
											<input type="text" id="msg0"> 
											<input name="addButton" type="button" value="추가" id="addmax" class="btn btn-info navbar-btn">
											</form>
										</div>
							</div>
						</div>
						<div align="center">
							<button id="insert" type="button" class="btn btn-primary">등록</button>
							<button onclick="window.close()" class="btn btn-danger" type="button">취소</button>
						</div>
				</div>
	</div>
</section>
<script type="text/javascript">
    var str='012535678';
    //       01234
    
    var flag=false;
    for(var i=0; i<str.length; i++){
    	if(str.length - i < 4)  break;//str.length --> 4 (길이가 4를 벗어나면 break)
    	   // 4-        0
    	   // 4-        1
      // console.log(i+":"+ str.charAt(i) +":"+str.charCodeAt(i)); 
    	
         if(str.charCodeAt(i+1) - str.charCodeAt(i) == 1){//0과1
        	 if(str.charCodeAt(i+2)- str.charCodeAt(i+1) == 1){//1과2
        		 if(str.charCodeAt(i+3) - str.charCodeAt(i+2) == 1){//2와3
        			  //연속된 네자리 수 발견!!
        			  flag=true;
        			  break;
        		 }
        	 }
         }
    }//for
    
    if(flag)  console.log("연속된 수 발견!!");
    else console.log("연속된 수 없음!!");
    
  </script>

<%@include file="../include/footer.jsp" %>