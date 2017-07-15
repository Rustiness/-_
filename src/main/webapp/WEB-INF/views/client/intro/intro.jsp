<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>

<%--<link rel="stylesheet" type="text/css" href="/resources/sample/intro.css">--%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/plugins/ScrollToPlugin.min.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/plugins/CSSPlugin.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/TweenMax.min.js"></script>
<!-- Main content -->
<script type="text/javascript">
	$(document).ready(function () { //DOM이 준비되고
		$(".carousel").swipe({

			swipe: function (event, direction, distance, duration, fingerCount, fingerData) {

				if (direction == 'left') $(this).carousel('next');
				if (direction == 'right') $(this).carousel('prev');

			},
			allowPageScroll: "vertical"

		});
	});
</script>
<script type="text/javascript">

</script>
<script type="text/css">

</script>
<section>
	<section class="content">
		<div class="container-fluid">
			<div style="height: 570px" class="panel-body">
				<div class="page-header text-center">
					<h2>삶에서 얻은 재능을 교환하는<br>
						Life Talent Exchange!!</h2>
				</div>


				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<div style="width:1400px; height:350px; background-image: url('/resources/sample/intro_01.jpg');">
								<br>
								<br>
								<div><h3 style="color: #fff; line-height:60px;">
									&nbsp;&nbsp;평소 필요하고 관심있었던,<br>
									&nbsp;&nbsp;그러나 돈과 시간이 없어서 배우는 것을 망설였었던<br>
									&nbsp;&nbsp;바로 그 새로운 재능.<br>
									&nbsp;&nbsp;자신이 가진 여러분의 멋진 재능으로 새로운 재능을 가지세요.<br>
								</div></h3>
							</div>
						</div>
						<div class="item">
							<div style="width:1400px; height:350px; background-image: url('/resources/sample/intro_02.jpg');">
								<br>
								<br>
								<div><h3 style="color: #fff; line-height:60px;">
									&nbsp;&nbsp;여러분의 멋진 그 재능.<br>
									&nbsp;&nbsp;가치있는 일에 쓰고 싶지 않나요?<br>
								    &nbsp;&nbsp;내 재능이 누군에게는 삶의 희망, 꿈이 될 수 있습니다.<br>
									&nbsp;&nbsp;재능이 필요하거나 재능을 나눌 수 있는 멋진 당신을 환영합니다.<br><br>
							</div></h3>
							</div>
						</div>
						<div class="item">
							<div style="width:1400px; height:350px; background-image: url('/resources/sample/intro_03.jpg');">
								<br>
								<br>
								<div><h3 style="color: #fff; line-height:50px;">
									&nbsp;&nbsp;여러분의 그 귀한 재능을 발견하지 못하고<br>
									&nbsp;&nbsp;제대로 활용하지 못한다면 그 역시 의미없는 재능일 뿐.<br>
									&nbsp;&nbsp;LTE에서 여러분의 재능을 함께 발견하고 키우고 나누어 보세요.<br>
									&nbsp;&nbsp;그 이상의 가치가 바로 여러분의 눈앞에 펼쳐집니다.<br><br><br>
								</div></h3>
							</div>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			</div>
	</section>

<%@include file="../include/footer.jsp" %>