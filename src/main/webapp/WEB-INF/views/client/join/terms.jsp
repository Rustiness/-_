<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>

<style>
   table {
      border: 1px solid
      border-collapse: collapse;
      border-color: black;
      }
</style>
<script type="text/javascript">

    function back()
  {
	window.history.back();
  }
</script>
<!-- Main content -->
<section class="content">
 회원가입동의<br><br>
   
    LTE이용약관
      <table border=1 style="border-collapse:collapse; border:1px; border-color:black;" >
      <tr><td><pre>
      제 1장 총칙
 제 1조 (약관의 적용)재능교환 션은 지정된 웹사이트 홈페이지
  (www.realaudition.com)에 이용약관을 게시하는 방법
 으로 공지합니다.제 2조 (목적)이 이용약관(이하 '약관')은 
 ㈜케이티(이하 '회사')와 이용고객(이하 '회원')간에 회사가 
제공하는 리얼오디션
      </pre></td></tr></table><br>
    
  개인정보 보호정책<br>
       <table border=1 style="border-collapse:collapse; border:1px; border-color:black;">
       <tr><td><pre>
 섬머임팩트(이하 “회사”라 합니다.)는 회원님의 프라이버시
   (privacy)를 매우 소중하게 생각하고 있으며, 재능교환 
 서비스(이하 "서비스"라 합니다.)의 원활한 제공과 필요한
 최소한의 개인정보를 회원님으로부터 수집하는 것을 원칙으로
 하고 있습니다.회사는 법률의 규정에 의해 허용되거나 회원님의
 동의가 있는 경우를 제외하고는 회원님의 개인정보를 제3자 에게
 제공하지 않음은 물론 개인정보가 외부로 유출되지 않도록 항상 
 최선을 다하고 있으며, 다음과 같은 
       </pre></td></tr>
       </table><br> 
       상기내용에 동의하십니까?<br><br>
       <input type="button" onclick="location.href='http://localhost/confirm'" value="동의"></button> 
       <button onclick="back()">이전화면 </button>

</section>

<%@include file="../include/footer.jsp" %>