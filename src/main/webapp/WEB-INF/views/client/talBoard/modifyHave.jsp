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
			elPlaceHolder: "contentHave", //textarea에서 지정한 id와 일치해야 합니다.
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

		$("#goReadBtn").click(function() {
			self.location = 'read' + '?talDocNO=' + '${TalBoardVO.talDocNO}' + '&loginMem=' + '${loginMem}' + '&page=${cri.page}&perPageNum=${cri.perPageNum}'
				+ '&searchType=${cri.searchType}&keyword=${cri.keyword}';
		});

		var talHaveCount = 1; //id, name 인덱스 생성 카운트

		//보유한 재능 시작
		$(document).on("click", "#talHaveAdd", function() {
			if ($("#talHaveField div").length > 4) {
				return;
			}


			var div = document.createElement('div');
			div.id = 'talHaveSelect_' + talHaveCount;

			$($(div)).html($('#talHaveSelect_0').html());
			$('#talHaveField').append(div);

			$('div#talHaveSelect_' + talHaveCount + ' select#talHaveCate_0').attr("id", 'talHaveCate_' + talHaveCount); //카테고리 아이디 변경
			$('div#talHaveSelect_' + talHaveCount + ' select#talHaveDiv_0').attr("id", 'talHaveDiv_' + talHaveCount); //항목 아이디 및 네임 등록
			$('div#talHaveSelect_' + talHaveCount + ' div input#talHaveAdd').remove(); //추가 버튼 제거
			$('div#talHaveSelect_' + talHaveCount + ' div input#talHaveDel').attr("id", 'talHaveDel_' + talHaveCount); //삭제 버튼 아이디 등록
			$("#talHaveCate_" + talHaveCount + " .selCateDefult").attr('style', ''); // 카테고리선택 문장 표시
			$("#talHaveDiv_" + talHaveCount + " .divDefult").attr('style', '');

			var divReset = "<select id=talHaveDiv_" + talHaveCount + " name='talHaveDiv' class='form-control'>";
			divReset += "<option class='divDefult' value='none'>  </option>";
			$("#talHaveDiv_" + talHaveCount).html(divReset);
			$('#talHaveDel_' + talHaveCount).attr('style', ''); //숨김취소

			$('div#talHaveSelect_' + talHaveCount).addClass("col-md-offset-2 form-inline col-md-10"); //위치 조정
			talHaveCount++; //등록 카운트

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
					<div class="panel-heading" style="background-color: #875F9A;">
						<h3 class="panel-title" style="color: #FFF;">
							<a href="javascript:void(0);" class="toggle-sidebar"><span
								class="fa fa-angle-double-left" data-toggle="offcanvas"
								title="Maximize Panel"></span></a>재능 패널
						</h3>
					</div>
					<div class="panel-body">
						<div class="panel-heading" align="left"
							style="background-color: #875F9A;">
							<h4 class="panel-title" style="color: #FFF;">재능수정</h4>
						</div>
						<form action="/tb/modHave" role="form" method="post">
							<div class="panel panel-default">
								<div class="form-group">
									<label class="col-md-2 control-label">제목</label>
									<div class="col-md-10">
										<input type="text" required="" placeholder="Title" id="title"
											class="form-control" name="title"
											value="${TalBoardVO.title }">
									</div>
								</div>




								<input type="hidden" name="contentWant" id="contentWant"
									value="${TalBoardVO.contentWant}"> <input type='hidden'
									name='page' value="${cri.page}"> <input type='hidden'
									name='perPageNum' value="${cri.perPageNum}"> <input
									type='hidden' name='searchType' value="${cri.searchType}">
								<input type='hidden' name='keyword' value="${cri.keyword}">
								<input type="hidden" value="${TalBoardVO.talDocNO }"
									id="talDocNO" name="talDocNO"> <input type="hidden"
									value="${loginMem }" id="loginMem" name="loginMem"> <input
									type="button" value="보유한 재능 이전글 가져오기"> <br> 보유한 재능
								정보 <br>




								<%--보유한 재능 셀렉트 시작--%>
								<div id="talHaveField" class="form-group">
									<label class="col-md-2 control-label">보유한 재능</label>

									<c:forEach items="${readDivHave}" var="readDivHave">

										<div id="talHaveField" class="form-group">

											<div id="talHaveSelect_0" class="form-inline col-md-10">
												<div class="form-inline">
													<select id="talHaveCate_0" class="form-control"
														onclick="selCate(this)">
														<c:forEach items="${listUseCate}" var="itemC">
															<c:if test="${itemC.talCateDF eq readDivHave.talCateDF }">
																<option>${itemC.name }</option>
															</c:if>
														</c:forEach>
														<c:forEach items="${listUseCate}" var="itemC">
															<option value="${itemC.talCateDF }">${itemC.name }</option>
														</c:forEach>

													</select> <select id="talHaveDiv_0" name="talHaveDiv"
														class="form-control" onclick="selDiv(this);">
														<option class="divDefult" value="none">${readDivHave.talDivName}</option>
													</select><input type="button" class="btn btn-info btn-sm"
														id="talHaveAdd" value="추가"> <input type="button"
														class="btn btn-info btn-sm remove" id="talHaveDel"
														value="삭제" onclick="delSelect(this);"
														style="display: none;">


												</div>
											</div>
										</div>




									</c:forEach>
								</div>
								<%--보유한 재능 셀렉트 끝--%>



								<div class="form-group">
									<label class="col-md-2 control-label" for="description">보유한
										재능 내용</label>
									<div class="col-md-10">
										<textarea rows="10" cols="50" id="contentHave"
											name="contentHave" value="내용을 수정해 주세요">${TalBoardVO.contentHave }</textarea>
									</div>
								</div>
								<br>
								<div class="form-group">
									<div class="col-md-offset-2 col-md-10">
										<input type="submit" value="보유한 재능 수정" class="btn btn-info">
										<input type="button" value="수정취소" id="goReadBtn"
											class="btn btn-info">
									</div>
								</div>
							</div>
						</form>
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
											<input type="hidden" value="${list.title }" class="titleChoi">
											<input type="hidden" value="${list.contentHave }"
												class="contentHaveChoi"> <input type="hidden"
												value="${list.contentWant }" class="contentWantChoi">

											<span class="titleChoi">${list.title}</span> <span
												class="contentHaveChoi">${list.contentHave}</span> <span
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

</section>

<%@include file="../include/footer.jsp"%>