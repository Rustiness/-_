<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {

		var talWantCount = 1; //id, name 인덱스 생성 카운트

		//목록으로 돌아가기
		$("#goListBtn").click(function() {




			self.location = "/tb/list";



		});


		//이전단계로 이동
		$("#backBtn").on("click", function() {
		
		          self.location = "/tb/write1s"+"?title="+$(".title").val()+"&contentHave="+$(".contentHave").val()+"&contentWant="+$(".contentWant").val();
		          $(".title").val("");
		          $(".contentHave").val("");
			
			
			
		});


		//원하는 재능 시작
		$(document).on("click", "#talWantAdd", function() {
			//console.log($("#talWantField div").length);
			if ($("#talWantField div").length > 4) {
				return;
			}

			var div = document.createElement('div');
			div.id = 'talWantSelect_' + talWantCount;
			//	div.attr("id", 'talWantSelect-'+talWantCount);

			$($(div)).html($('#talWantSelect_0').html()); //div.innerHTML = document.getElementById('room_type').innerHTML;
			$('#talWantField').append(div); //document.getElementById('field').appendChild(div);

			$('div#talWantSelect_' + talWantCount + ' select#talWantCate_0').attr("id", 'talWantCate_' + talWantCount); //카테고리 아이디 변경
			$('div#talWantSelect_' + talWantCount + ' select#talWantDiv_0').attr("id", 'talWantDiv_' + talWantCount).attr("name", 'talWantName_' + talWantCount); //항목 아이디 및 네임 등록
			$('div#talWantSelect_' + talWantCount + ' div input#talWantAdd').remove(); //추가 버튼 제거
			$('div#talWantSelect_' + talWantCount + ' div input#talWantDel').attr("id", 'talWantDel_' + talWantCount); //삭제 버튼 아이디 등록
			//$('#talWantField div#talWantSelect-'+talWantCount+' div input#talWantAdd').attr("id", 'talWantAdd-'+talWantCount);
			//$('#talWantAdd-'+talWantCount).attr('style', 'display:none;');
			$("#talWantCate_" + talWantCount + " .selCateDefult").attr('style', ''); // 카테고리선택 문장 표시
			$("#talWantDiv_" + talWantCount + " .divDefult").attr('style', '');

			var divReset = "<select id=talWantDiv_" + talWantCount + " name=talWantName_" + talWantCount + " class='form-control'>";
			divReset += "<option class='divDefult' value='none'>  </option>";
			$("#talWantDiv_" + talWantCount).html(divReset);
			$('#talWantDel_' + talWantCount).attr('style', ''); //숨김취소

			$('div#talWantSelect_' + talWantCount).addClass("col-md-offset-2 form-inline col-md-10"); //위치 조정
			talWantCount++; //등록 카운트
		});
		//원하는 재능 끝


	});
	//셀렉트 카테고리 항목 제거
	function delSelect(obj) {
		$(obj).parent().parent().remove();
	}

	function selDiv(obj) {
		var selDivID = $(obj).attr("id").toString(); // 선택 셀렉트 ID
		var selDivNO = $("#" + selDivID + " option:selected").val(); //선택한 값
		if (selDivNO != 'none') {
			$("#" + selDivID + " .divDefult").attr('style', 'display:none;');
		}
	}

	//카테고리 셀렉트 선택
	var temp = null;
	function selCate(obj) {
		var selCateID = $(obj).attr("id").toString(); // 선택 셀렉트 ID
		var selCateNO = $("#" + selCateID + " option:selected").val(); //선택한 값
		var divID = $(obj).next().attr("id").toString(); // 형제노드 셀렉트 ID
		var divName = $(obj).next().attr("name").toString(); // 형제노드 셀렉트 name
		//console.log("selCateID="+selCateID + " divID="+ divID);
		//if (selCateNO != temp && selCateNO != 'none'){ //카테고리 연속DB가져오기 방지
		if (selCateNO != 'none') {
			temp = selCateNO;
			$.ajax({
				type : 'post',
				url : '/tec/app/' + selCateNO,
				dataType : 'json',
				success : function(data) {
					var listDiv = "<select id=" + divID + " name=" + divName + " class='form-control' onclick='selDiv(this);'>";
					listDiv += "<option class='divDefult' value='none'>항목 선택</option>";
					$.each(data, function(index, item) {
						//console.log("talDivDF=" +item.talDivDF + " talDivName=" + item.talDivName);
						listDiv += "<option value=" + item.talDivDF + ">" + item.talDivName + "</option>";
					});
					listDiv += "</select>";
					$("#" + selCateID + " .selCateDefult").attr('style', 'display:none;');
					$(obj).parent().children('#' + divID).html(listDiv); //선택한 카테고리의 항목 추가
				} //success
			});
		}
	}
</script>
<!-- Main content -->
<section class="content">
	<div class="container-fluid">
		<div class="row row-offcanvas row-offcanvas-left">
			<%@include file="../include/lefter.jsp"%>

			<div class="col-xs-12 col-sm-9 content">

				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<a href="javascript:void(0);" class="toggle-sidebar"><span
								class="fa fa-angle-double-left" data-toggle="offcanvas"
								title="Maximize Panel"></span></a>재능 패널
						</h3>
					</div>
					<div class="panel-body">
						<div align="left">
							<div class="panel panel-default">
								<div class="panel-body">
									<div align="left">
										<h4>재능등록</h4>
									</div>
									<br>
									<h5>
										등록단계: [1단계 보유한 재능]>[ <font color="blue">2단계 원하는 재능</font>]>[내용확인]
									</h5>
									<br>
									<div class="panel panel-default">
										<div class="panel-heading">
											<h1 class="panel-title">
												<b><font size="5">2단계: 원하는 재능 정보 입력</font></b>
											</h1>
										</div>
										<br> <input type="button" value="원하는 재능 이전글 가져오기">

										<form action="/tb/write" role="form" method="get">

											<div class="form-group">
												<label class="col-md-2 control-label">1단계: 보유한 재능 정보</label>
												<div class="col-md-10">
													<input type="text" value="${TalBoardVO.title }"
														class="title" name="title" class="form-control"> <input
														type="text" value="${TalBoardVO.contentHave }"
														class="contentHave" name="contentHave"
														class="form-control"> 원하는 재능 내용<br>
												</div>
											</div>



											<%--원하는 재능 셀렉트 시작--%>
											<div id="talWantField" class="form-group">
												<label class="col-md-2 control-label">원하는 재능</label>
												<div id="talWantSelect_0" class="form-inline col-md-10">
													<div class="form-inline">
														<select class="form-control" id="talWantCate_0"
															onclick="selCate(this);">
															<option class="selCateDefult" value="none">카테고리
																선택</option>
															<c:forEach items="${listUseCate}" var="itemC">
																<option value="${itemC.talCateDF }">${itemC.name }</option>
															</c:forEach>
														</select> <select id="talWantDiv_0" name="talWantDiv_0"
															class="form-control" onclick="selDiv(this);">
															<option class="divDefult" value="none"></option>
														</select> <input type="button" class="btn btn-info btn-sm"
															id="talWantAdd" value="추가"> <input type="button"
															class="btn btn-info btn-sm remove" id="talWantDel"
															value="삭제" onclick="delSelect(this);"
															style="display: none;">
													</div>
												</div>
											</div>
											<%--원하는 재능 셀렉트 끝--%>

											<div class="form-group">
												<label class="col-md-2 control-label" for="description">원하는
													재능 내용</label>
												<div class="col-md-10">
													<textarea required="" class="form-control contentWant"
														placeholder="Description" rows="10" cols="30"
														id="contentWant" name="contentWant" >${TalBoardVO.contentWant}</textarea>
												</div>
											</div>


											<div class="form-group">
												<div class="col-md-offset-2 col-md-10">
													<input type="button" value="이전단계" id="backBtn" class="btn btn-info"> <input
														type="submit" value="다음단계" id="nextBtn" class="btn btn-info"> <input
														type="button" value="작성취소" id="goListBtn" class="btn btn-info">
												</div>
											</div>
										</form>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp"%>