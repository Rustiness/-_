<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- .jsp --%>
<%@include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {

		//================== 셀렉트 추가 ==================//
		var talWantCount = 1; //id, name 인덱스 생성 카운트
		var talHaveCount = 1; //id, name 인덱스 생성 카운트
		//원하는 재능 시작
		$(document).on("click", "#talWantAdd", function () {
			//console.log($("#talWantField div").length);
			if ($("#talWantField div").length > 4) {
				return;
			}

			var div = document.createElement('div');
			div.id = 'talWantSelect_' + talWantCount;
			//	div.attr("id", 'talWantSelect-'+talWantCount);

			$($(div)).html($('#talWantSelect_0').html()); //div.innerHTML = document.getElementById('room_type').innerHTML;
			$('#talWantField').append(div); //document.getElementById('field').appendChild(div);

			$('div#talWantSelect_' + talWantCount + ' select#talWantCate_0').attr("id", 'talWantCate_' + talWantCount);  //카테고리 아이디 변경
			$('div#talWantSelect_' + talWantCount + ' select#talWantDiv_0').attr("id", 'talWantDiv_' + talWantCount); //항목 아이디 등록
			$('div#talWantSelect_' + talWantCount + ' div input#talWantAdd').remove(); //추가 버튼 제거
			$('div#talWantSelect_' + talWantCount + ' div input#talWantDel').attr("id", 'talWantDel_' + talWantCount); //삭제 버튼 아이디 등록
			//$('#talWantField div#talWantSelect-'+talWantCount+' div input#talWantAdd').attr("id", 'talWantAdd-'+talWantCount);
			//$('#talWantAdd-'+talWantCount).attr('style', 'display:none;');
			$("#talWantCate_" + talWantCount + " .selCateDefult").attr('style', ''); // 카테고리선택 문장 표시
			$("#talWantDiv_" + talWantCount + " .divDefult").attr('style', '');

			var divReset = "<select id=talWantDiv_" + talWantCount + " name='talWantDiv' class='form-control'>";
			divReset += "<option class='divDefult' value='none'>  </option>";
			$("#talWantDiv_" + talWantCount).html(divReset);
			$('#talWantDel_' + talWantCount).attr('style', 'background-color:#900725; border-color:#ae2631;'); //숨김취소

			$('div#talWantSelect_' + talWantCount).addClass("col-md-offset-2 form-inline col-md-10"); //위치 조정
			talWantCount++; //등록 카운트
		});
		//원하는 재능 끝
		//보유한 재능 시작
		$(document).on("click", "#talHaveAdd", function () {
			if ($("#talHaveField div").length > 4) {
				return;
			}

			var div = document.createElement('div');
			div.id = 'talHaveSelect_' + talHaveCount;

			$($(div)).html($('#talHaveSelect_0').html());
			$('#talHaveField').append(div);

			$('div#talHaveSelect_' + talHaveCount + ' select#talHaveCate_0').attr("id", 'talHaveCate_' + talHaveCount);  //카테고리 아이디 변경
			$('div#talHaveSelect_' + talHaveCount + ' select#talHaveDiv_0').attr("id", 'talHaveDiv_' + talHaveCount) //항목 아이디 등록
			$('div#talHaveSelect_' + talHaveCount + ' div input#talHaveAdd').remove(); //추가 버튼 제거
			$('div#talHaveSelect_' + talHaveCount + ' div input#talHaveDel').attr("id", 'talHaveDel_' + talHaveCount); //삭제 버튼 아이디 등록
			$("#talHaveCate_" + talHaveCount + " .selCateDefult").attr('style', ''); // 카테고리선택 문장 표시
			$("#talHaveDiv_" + talHaveCount + " .divDefult").attr('style', '');

			var divReset = "<select id=talHaveDiv_" + talHaveCount + " name='talHaveDiv' class='form-control'>";
			divReset += "<option class='divDefult' value='none'>  </option>";
			$("#talHaveDiv_" + talHaveCount).html(divReset);
			$('#talHaveDel_' + talHaveCount).attr('style', 'background-color:#900725; border-color:#ae2631;'); //숨김취소

			$('div#talHaveSelect_' + talHaveCount).addClass("col-md-offset-2 form-inline col-md-10"); //위치 조정
			talHaveCount++; //등록 카운트
		});
		//보유한 재능 끝
		//====================================//

		//재능 등록
		$(document).on('click', '#btnSend', function() {
			console.log("등록");

			var talWantDivSel = $('#talWantField div div select[name="talWantDiv"] option:selected:not([value="none"])'); //선택된 것 중 none이 아닌것만!
			var talWantDivData = talWantDivSel.map(function () {
				return $(this).val();
			}).get().join(); //맵으로 된 오브젝트 값을 가져온 후 배열화
			console.log('talWantDivData:' + talWantDivData);

			var talHaveDivSel = $('#talHaveField div div select[name="talHaveDiv"] option:selected:not([value="none"])'); //선택된 것 중 none이 아닌것만!
			var talHaveDivData = talHaveDivSel.map(function () {
				return $(this).val();
			}).get().join(); //맵으로 된 오브젝트 값을 가져온 후 배열화
			console.log('talHaveDivData:' + talHaveDivData);

			$.ajax({
				type : 'post',
				url : '/tec/app/',
				data : {
					talDocNO:$('#talDocNO').val(),
					title:$('#title').val(),
					content:$('#description').val(),
					talWantDiv: talWantDivData,
					talHaveDiv: talHaveDivData
				},
				dataType:"text",
				success : function(result) {
					if(result.match("success")) {
						alert('등록성공');
					} else if (result.match("fail_title")) {
						alert('신청 메세지의 제목을 입력하세요.');
					} else if (result.match("fail_content")) {
						alert('신청 메세지의 내용을 입력하세요.');
					} else if (result.match("fail_talWantDiv")) {
						alert('원하는 재능항목을 설정하세요.');
					} else if (result.match("fail_talHaveDiv")) {
						alert('보유한 재능항목을 설정하세요.');
					} else if (result.match("fail")) {
						alert('등록실패');
					} else if (result.match("fail2")) {
						alert('널포인트');
					}
				}

			});

		});

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
				type: 'post',
				url: '/tec/app/' + selCateNO,
				dataType: 'json',
				success: function (data) {
					var listDiv = "<select id=" + divID + " name=" + divName + " class='form-control' onclick='selDiv(this);'>";
					listDiv += "<option class='divDefult' value='none'>항목 선택</option>";
					$.each(data, function (index, item) {
						//console.log("talDivDF=" +item.talDivDF + " talDivName=" + item.talDivName);
						listDiv += "<option value=" + item.talDivDF + ">" + item.talDivName + "</option>";
					});
					listDiv += "</select>";
					$("#" + selCateID + " .selCateDefult").attr('style', 'display:none;');
					$(obj).parent().children('#' + divID).html(listDiv);  //선택한 카테고리의 항목 추가
				}//success
			});
		}
	}
</script>

<!-- Main content -->
<section class="content">
	<div class="container-fluid">
		<!--documents-->
		<div class="row row-offcanvas row-offcanvas-left">
			<%@include file="../include/lefter.jsp" %>
			<div class="col-xs-12 col-sm-9 content">
				<div class="panel panel-default">
					<div style="background-color:#875F9A;" class="panel-heading">
						<h3 style="color:#FFF;" class="panel-title"><a href="javascript:void(0);" class="toggle-sidebar"><span class="fa fa-angle-double-left" data-toggle="offcanvas" title="Maximize Panel"></span></a>재능 패널</h3>
					</div>
					<div class="panel-body">
						<%-- CONTENT 시작--%>
						<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
							<h5>교환신청</h5>
						</div>
						<div class="panel panel-default">
							<div style="background-color:#89729E;" class="panel-heading">
								<h3 style="color:#FFF;" class="panel-title"><b>신청 대상정보</b></h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<label class="col-md-2 form-label">닉네임</label>
									<div class="col-md-4">talent87</div>
									<label class="col-md-2 form-label">보유한 재능</label>
									<div class="col-md-4">#영문번역 #주식투자</div>
								</div>
								<div class="row form-inline">
									<label class="col-md-2 form-label">신청 대상 재능글</label>
									<div class="col-md-10">
										<span class="">저에게 피아노를 가르쳐주세요~!!!!zzz저에게 피아노를 가르쳐주세요~!!!!zzz</span>
										<input style="background-color:#5B3256; border-color:#89729E;" type="button" class="btn btn-info btn-xs" value="팝업창">
									</div>
									<div id="talDocNO" value="재능글NO" title="재능글번호" style="display:none;"/>
								</div>
							</div>
						</div>


							<div class="panel panel-default">
								<div style="background-color:#89729E;" class="panel-heading">
									<div style="color:#FFF;" class="panel-title"><b>신청 정보</b>
									</div>

									<div class="panel-options">
										<a class="bg" data-target="#sample-modal-dialog-1" data-toggle="modal" href="#sample-modal"><i class="entypo-cog"></i></a>
										<a data-rel="collapse" href="#"><i class="entypo-down-open"></i></a>
										<a data-rel="close" href="#!/tasks" ui-sref="Tasks"><i class="entypo-cancel"></i></a>
									</div>
								</div>

								<div class="panel-body">
								<div novalidate="" role="form" class="form-horizontal">
									<form>
									<div>
										<div class="form-group">
											<label class="col-md-2 control-label">제목</label>
											<div class="col-md-10">
												<input type="text" required="" placeholder="Title" id="title" class="form-control" name="title">
											</div>
										</div>
										<%--원하는 재능 셀렉트 시작--%>
										<div id="talWantField" class="form-group">
											<label class="col-md-2 control-label">원하는 재능</label>
											<div id="talWantSelect_0" class="form-inline col-md-10">
												<div class="form-inline">
													<select class="form-control" id="talWantCate_0" onclick="selCate(this);">
														<option class="selCateDefult" value="none">카테고리 선택</option>
														<c:forEach items="${listUseCate}" var="itemC">
															<option value="${itemC.talCateDF }">${itemC.talCateName }</option>
														</c:forEach>
													</select>
													<select id="talWantDiv_0" name="talWantDiv" class="form-control" onclick="selDiv(this);">
														<option class="divDefult" value="none"></option>
													</select>
													<input style="background-color:#5B3256; border-color:#89729E;" type="button" class="btn btn-info btn-sm" id="talWantAdd" value="추가">
													<input type="button" class="btn btn-info btn-sm remove" id="talWantDel" value="삭제" onclick="delSelect(this);" style="background-color:#900725; border-color:#ae2631; display:none;">
												</div>
											</div>
										</div>
										<%--원하는 재능 셀렉트 끝--%>
										<%--보유한 재능 셀렉트 시작--%>
										<div id="ttest"></div>
										<div id="talHaveField" class="form-group">
											<label class="col-md-2 control-label">보유한 재능</label>
											<div id="talHaveSelect_0" class="form-inline col-md-10">
												<div class="form-inline">
													<select class="form-control" id="talHaveCate_0" onclick="selCate(this);">
														<option class="selCateDefult" value="none">카테고리 선택</option>
														<c:forEach items="${listUseCate}" var="itemC">
															<option value="${itemC.talCateDF }">${itemC.talCateName }</option>
														</c:forEach>
													</select>
													<select id="talHaveDiv_0" name="talHaveDiv" class="form-control" onclick="selDiv(this);">
														<option class="divDefult" value="none"></option>
													</select>
													<input style="background-color:#5B3256; border-color:#89729E;" type="button" class="btn btn-info btn-sm" id="talHaveAdd" value="추가">
													<input type="button" class="btn btn-info btn-sm remove" id="talHaveDel" value="삭제" onclick="delSelect(this);" style="background-color:#900725; border-color:#ae2631; display:none;">
												</div>
											</div>
										</div>
										<%--보유한 재능 셀렉트 끝--%>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label" for="description">신청내용</label>
										<div class="col-md-10">
											<textarea required="" class="form-control" placeholder="Description" rows="10" cols="30" id="description" name="description"></textarea>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-offset-2 col-md-10">
											<input style="background-color:#5B3256; border-color:#89729E;" class="btn btn-info" type="button" id="btnSend" value="전송"/>
											<input style="background-color:#900725; border-color:#ae2631;" class="btn btn-info" type="button" value="취소"/>
										</div>
									</div>
									</form>
								</div>
									<%-- CONTENT 끝--%>
								</div><!-- panel body -->
							</div>
					</div><!-- content -->
				</div>
			</div>
		</div>
	</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>