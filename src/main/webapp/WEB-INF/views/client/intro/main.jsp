<%--
   Created
   User: hi000
   Date: 2017-07-10
   Time: 오후 11:56
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<link rel="stylesheet" type="text/css" href="/resources/sample/main.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () { //DOM이 준비되고
			$('.base').clone().addClass('overlay').appendTo('.landing');
			$('.cta').hover(function () {
				$('.overlay').toggleClass('over');
			});

			/*--------------------
			 Codepen Preview Tile
			 --------------------*/
			setTimeout(function () {
				$('.overlay').addClass('over').delay(600).queue(function () {
					$(this).removeClass("over").dequeue();
				});
			}, 400)
		});
	</script>
</head>
<%-- .jsp --%>
<body>
<!--

Follow me on
Dribbble: https://dribbble.com/supahfunk
Twitter: https://twitter.com/supahfunk
Codepen: https://codepen.io/supah/

-->
<div class="landing">
	<div class="base">

		<div class="image">
			<img src="/resources/sample/main_flower.jpg"/>
		</div>

		<div class="copy">
			<div class="logo">
			</div>
			<div class="title">
				<small> 삶에서 얻은 『재능』의 가치있는 교환</small>
				LTE : Life Talent Exchange
			</div>
			<div class="text">
				내가 가진 재능을 다른 재능과 맞바꿀순 없을까?<br>
				아직 나의 재능을 모르겠어, 내 재능을 만들 수 있는 공간 없을까?<br>
				내 재능을 나누고 싶어! 이 재능을 필요로 하는 사람에게 나눠줄 공간이 없을까?<br><br>
			</div>
			<a class="cta" href="/tb/list">재능 교환 시작하기</a>
		</div>
	</div>
</div>

</body>
</html>