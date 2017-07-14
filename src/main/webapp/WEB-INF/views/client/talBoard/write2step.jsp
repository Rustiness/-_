<%--
   Created
   User: simpact
   Date: 2017-06-30
   Time: 오후 6:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%-- .jsp --%>
<%@include file="../include/header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<%-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) --%>
<script type="text/javascript"
	src="/resources/SE2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" id="SE2">
	var oEditors = [];
	$(function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "contentWant", //textarea에서 지정한 id와 일치해야 합니다.
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI: "/resources/SE2/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
				fOnBeforeUnload : function(){

				}
			},
			fOnAppLoad : function(){
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				//oEditors.getById["description"].exec("PASTE_HTML", ['${talExcConnVO.content}']);
			},
			fCreator: "createSEditor2"
		});
	});
</script>
<script>
	$(document).ready(function() {
		
            $(document).on("click", ".choice", function() {
			
			
			var title = $(this).find('.titleChoi').val();
			var contentHave = $(this).find('.contentHaveChoi').val();
			var contentWant = $(this).find('.contentWantChoi').val();
		   
			
			$("#title").val('');
			$("#contentHave").val('');
			$("#contentWant").val('');
			$("#title").val(title);
			$("#contentHave").val(contentHave);
			$("#contentWant").val(contentWant);

			
		});
		
		
		
		
		
		
		
		
		

		var talWantCount = 1; //id, name 인덱스 생성 카운트

		//목록으로 돌아가기
		$("#goListBtn").click(function() {


			  

			self.location = "/tb/list";



		});


		//이전단계로 이동
		$("#backBtn").on("click", function() {

		 	//location.href = "/tb/write1s" + "?title=" + $("#title").val() + "&contentHave=" + $("#contentHave").val() + "&contentWant=" + $(".contentWant").val();
			
			
			
		 	$.ajax({
				type : 'post',
				url : '/tb/write1s/',
				data : {
					title : $('.title').val(),
					contentHave : $('.contentHave').val(),
					contentWant :oEditors.getById["contentWant"].getIR(),
					talHaveDiv : $('.talHaveDiv').val(),
					memNO :  $('#memNO').val()
					
				},
				dataType : "text",
				success : function(result) {
					if(result.match("success")) {
					
						self.location ='/tb/write1s'+'?memNO='+$('#memNO').val();
					} else if (result.match("fail_title")) {
						alert('제목을 입력하세요.');
					} else if (result.match("fail_talHaveDiv")) {
						alert('보유한 재능항목을 설정하세요.');

					} else if (result.match("fail_haveContent")) {
						alert('보유한 재능내용을 입력하세요.');
					}
						
						
				}
			}); 
 


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
			$('div#talWantSelect_' + talWantCount + ' select#talWantDiv_0').attr("id", 'talWantDiv_' + talWantCount); //항목 아이디 및 네임 등록
			$('div#talWantSelect_' + talWantCount + ' div input#talWantAdd').remove(); //추가 버튼 제거
			$('div#talWantSelect_' + talWantCount + ' div input#talWantDel').attr("id", 'talWantDel_' + talWantCount); //삭제 버튼 아이디 등록
			//$('#talWantField div#talWantSelect-'+talWantCount+' div input#talWantAdd').attr("id", 'talWantAdd-'+talWantCount);
			//$('#talWantAdd-'+talWantCount).attr('style', 'display:none;');
			$("#talWantCate_" + talWantCount + " .selCateDefult").attr('style', ''); // 카테고리선택 문장 표시
			$("#talWantDiv_" + talWantCount + " .divDefult").attr('style', '');

			var divReset = "<select id=talWantDiv_" + talWantCount + " name='talWantDiv' class='form-control'>";
			divReset += "<option class='divDefult' value='none'>  </option>";
			$("#talWantDiv_" + talWantCount).html(divReset);
			$('#talWantDel_' + talWantCount).attr('style', ''); //숨김취소

			$('div#talWantSelect_' + talWantCount).addClass("col-md-offset-2 form-inline col-md-10"); //위치 조정
			talWantCount++; //등록 카운트
		});
		//원하는 재능 끝






		//원하는 재능 보내기
		$(document).on('click', '#talSend', function() {



			//원하는 재능 항목
			var talWantDivSel = $('#talWantField div div select[name="talWantDiv"] option:selected:not([value="none"])'); //선택된 것 중 none이 아닌것만!
			var talWantDivData = talWantDivSel.map(function() {
				return $(this).val();
			}).get().join(); //맵으로 된 오브젝트 값을 가져온 후 배열화
			console.log('talWantDivData:' + talWantDivData);

			$.ajax({
				type : 'post',
				url : '/tb/write2s/',
				data : {
					talDocNO : $('#talDocNO').val(),
					title : $('.title').val(),
					memNO : $('#memNO').val(),
					contentHave : $('.contentHave').val(),
					contentWant  :oEditors.getById["contentWant"].getIR(),
					talHaveDiv : $('.talHaveDiv').val(),
					talWantDiv : talWantDivData
				},
				dataType : "text",
				success : function(result) {
					if(result.match("success")) {
					
						self.location ='/tb/write';
					} else if(result.match("fail_talWantDiv")) {
						alert('원하는 재능항목을 설정하세요.');
					}  else if(result.match("fail_WantContent")) {
						alert('원하는 재능내용을 입력하세요.');
					}
						
						
				}
			});

		});
		
		
		$(document).on('click', '#beforeTalBtn', function() {
			var memNO = $("#memNO").val();

			$.ajax({
				type : 'post',
				url : '/tb/write1s/tal/' + memNO,
				dataType : 'json',
				success : function(result) {
					$("#title").val("");
					$("#contentHave").val("");
					$("#contentWant").val("");
					$('#title').val(result.title);
					$('#contentHave').val(result.contentHave);
					$('#contentWant').val(result.contentWant);

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
				type : 'post',
				url : '/tb/write1s/' + selCateNO,
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
					<div class="panel-heading" style="background-color:#875F9A;">
						<h3 class="panel-title" style="color:#FFF;">
							<a href="javascript:void(0);" class="toggle-sidebar"><span
								class="fa fa-angle-double-left" data-toggle="offcanvas"
								title="Maximize Panel"></span></a>재능 패널
						</h3>
					</div>
					<div class="panel-body">
						<div align="left">
							<div class="panel panel-default">
								<div class="panel-body">
									<div style="color:#5B3256; font-weight: bold; border-width: 0px; border-style: none; text-shadow: rgba(225,143,225,0.5) 3px 3px 14px;">
							<h4>재능등록</h4>

						</div>
									<br>
									<h5>
										등록단계: [1단계 보유한 재능]>[ <font color="blue">2단계 원하는 재능</font>]>[내용확인]
									</h5>
									<br>
									<div class="panel panel-default">
										<div class="panel-heading" style="background-color:#875F9A;">
											<h3 class="panel-title" style="color:#FFF;">
												<b><font size="5">2단계: 원하는 재능 정보 입력</font></b>
											</h3>
										</div>
										<br> <input type="button" value="원하는 재능 이전글 가져오기"
											id="beforeTalBtn" data-toggle="modal"
											data-target="#beforeTalModal">

										<form method="post" action="">

											<div class="form-group">
												<label class="col-md-2 control-label">1단계: 보유한 재능 정보</label>
												<div class="col-md-9">
													<input type="hidden" value="${talHaveDiv}" id="talHaveDiv"
														class="talHaveDiv"> <input type="hidden"
														value="${TalBoardVO.memNO}" id="memNO" class="memNO">
														<input type="hidden" value="${TalBoardVO.title }" id="title"
														class="title">
														<input type="hidden" value="${TalBoardVO.contentHave}" id="contentHave"
														class="contentHave">
														<h4>제목 :</h4><h5 class="title" id="title">${TalBoardVO.title }</h5>
													<h4>보유재능 :</h4>
													<div style="min-height: 80px;" novalidate=""
														class="form-horizontal jumbotron-contents">
														<h5 class="contentHave" id="contentHave">${TalBoardVO.contentHave}</h5></div>
													원하는 재능 내용<br>
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
														</select> <select id="talWantDiv_0" name="talWantDiv"
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
														id="contentWant" name="contentWant">${TalBoardVO.contentWant}</textarea>
												</div>
											</div>


											<div class="form-group">
												<div class="col-md-offset-2 col-md-10">
													<input type="button" value="이전단계" id="backBtn"
														class="btn btn-info"> <input type="button"
														value="다음단계" id="talSend" class="btn btn-info"> <input
														type="button" value="작성취소" id="goListBtn"
														class="btn btn-info">
												</div>
											</div>
										</form>
									</div>
								</div>
								<%-- Modal 시작--%>
								<div class="modal fade" id="beforeTalModal" tabindex="-1"
									role="dialog" aria-labelledby="bigModal" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="acceptModalLabel">이전 재능글 선택</h4>
											</div>
											<div class="modal-body">


												<label>제목</label><label>보유한 재능</label><label>원하는 재능</label><label>작성일</label>

												<c:forEach items="${beforeTal}" var="list">
													<div class="choice" data-dismiss="modal">
														<input type="hidden" value="${list.title }"
															class="titleChoi"> <input type="hidden"
															value="${list.contentHave }" class="contentHaveChoi">
														<input type="hidden" value="${list.contentWant }"
															class="contentWantChoi"> <span class="titleChoi">${list.title}</span>
														<span class="contentHaveChoi">${list.contentHave}</span> <span
															class="contentWantChoi">${list.contentWant}</span>

													</div>
													<br>
												</c:forEach>


											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">취소</button>

											</div>
										</div>
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