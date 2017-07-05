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
	 
	  $("#confirmForm").submit(function(){
		  
	  //window.location.reload(true);
	    location.replace(localhost/j/confirm);
		  //$('email').empty();
		// var a=$('#email').val();
		// alert(a);
		// document.getElementById('email').value = "";
		 /* document.getElementById('name').value = "";
		 document.getElementById('nickName').value = ""; */
		 /* document.getElementById('sex').value = null
		 document.getElementById('birth').value = null
		 document.getElementById('tell').value = ""; */
	}) 
  
});//document.ready
	
</script>

<!-- Main content -->
<section class="content">

 회원가입<br><br>
   <form method="post" id="confirmForm">
       <table cellpadding="1" >
      
        <!-- <input type="hidden" id="personDF" name="personDF"> --> <!-- value가 없으면 쓸모없음 -->
       <!--  <input type="hidden" id="joinDate" name="joinDate"> -->
        <!-- <input type="hidden" id="state" name="state"> -->
        <!-- <input type="hidden" id="latestDate" name="latestDate"> -->
        
        <tr> <td colspan="2" height="100">계정정보</td>
        
        <tr><td>아이디(이메일주소)</td>
        <td><input type="text" id="email" name="email" size="28" maxlength="30">
        <div id="email_1" style="color:red; font-size:11px;"></div></td></tr>
        
       <tr><td>비밀번호</td>
       <td><input type="password" name="pass1" id="pass1" maxlength="12">
       <div id="pass_1" style="color:red; font-size:11px;"></div></td></tr>
        <tr><td colspan="2">
        <font color=green size="1">
             최소 6자, 최대 12자 (영문과 숫자를 이용, 영문은 대소문자를 구분)</font></td></tr>
             
        <tr><td>비밀번호 확인</td>
        <td><input type="password" name="pass2" id="pass2" maxlength="12">
        <div id="pass_2" style="color:red; font-size:11px;"></div></td></tr>
        
        <tr><td colspan="2" height="100">개인정보</td></tr>
            <tr><td>이름</td><td><input type="text" name="name" id="name" maxlength="12">
            <div id="name_1" style="color:red; font-size:11px;"></div></td></tr>
            
         <tr><td>닉네임</td><td><input type="text" id="nickName" name="nickName">
         <div id="nickname_1" style="color:red; font-size:11px;"></div></td></tr>  
         <tr>
		   <td>성별</td><td>
		   남성<input type="radio" name="sex" value="1" id="sex">
		   여성<input type="radio" name="sex" value="2" id="sex">
           </td></tr>	
			           
           
           <tr><td>생년월일</td>
           <td><input type="date" name="birth" id="birth"></td></tr>
           <tr><td>핸드폰번호</td><td>
              <input type="text" name="tel1" id="tel1" size="4" maxlength="3">
           - <input type="text" name="tel2" id="tel2" size="4" maxlength="4">
           - <input type="text" name="tel3" id="tel3" size="4" maxlength="4">
           <div id="tel_1" style="color:red; font-size:11px;"></div></td></tr>
           
          <!--  <tr><td>회원가입일</td></tr>
           <td><input type="hidden"></td></tr> -->
           
           
           
           <tr><td>SNS / 메신저1</td><td>
         <select> <!-- 메신저1 목록 불러오기 -->
		 <c:forEach items="${list }" var="list"  >
          
           <option value="${list.mesDF }">${list.name } </option>

          </c:forEach> 

         </select> 
     
           <input type="text" name="msgID_1" id="msgID_1" size="15">
           <div id="msgID_11" style="color:red; font-size:11px;"></div></td></tr>
              
           <tr><td>SNS / 메신저2</td><td>
          <select>
           <c:forEach items="${list }" var="list"  >
          
           <option value="${list.mesDF }">${list.name } </option>

          </c:forEach> 
          </select>
           <input type="text" name="msgID_2" id="msgID_2" size="15">
           <div id="msgID_22" style="color:red; font-size:11px;"></div></td></tr>  
          
          <tr><td colspan="2" height="100" align="center" >
          <input type="submit" value="등록" >
           <button onclick="window.close()">취소</button></td></tr>
       
     </table>   
     </form>    
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