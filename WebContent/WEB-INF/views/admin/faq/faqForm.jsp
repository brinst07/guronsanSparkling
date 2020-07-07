<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문 등록</title>
<script>
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#faq_content').summernote({
    		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    // 포커스 처리
    // $('#bo_content').summernote( {focus: true} );
    // 값 취득
    // $('#bo_content').summernote('code');
    // 값 추가
    // $('#bo_content').summernote('code', '<font color="red">추가글</font>');
    // 에디터 제거
    // $('#bo_content').summernote('destroy');
    
// 	BootstrapDialog.show({
// 	    title: '알럿창',
// 	    message: '알럿창으로 활용하세요!'
// 	});
	
// 	BootstrapDialog.show({
//         message: '컨펌 다이얼로그로 활용하세요!',
//         buttons: [{
//             label: 'Button 1'
//         }, {
//             label: 'Button 2',
//             cssClass: 'btn-primary',
//             action: function(){
//                 alert('Hi Orange!');
//             }
//         }, {
//             icon: 'glyphicon glyphicon-ban-circle',
//             label: 'Button 3',
//             cssClass: 'btn-warning'
//         }, {
//             label: 'Close',
//             action: function(dialogItself){
//                 dialogItself.close();
//             }
//         }]
//     });



    $('form[name=faqForm]').submit(function() {
//     	if(!$('#bo_title').val().validationTITLE()){
//     		return alertPrint('제목을 바르게 입력해주세요.'); 
//     	}
//     	if(!$('#bo_nickname').val().validationNICKNAME()){
//     		return alertPrint('대화명을 바르게 입력해주세요.');
//     	}
//     	if(!$('#bo_pwd').val().validationPWD()){
//     		return alertPrint('패스워드를 바르게 입력해주세요.');
//     	}
//     	if(!$('#bo_mail').val().validationMAIL()){
//     		return alertPrint('메일을 바르게 입력해주세요.');
//     	}
    	
    	var faq_content = $('#faq_content').summernote('code');
		$(this).append('<input type="hidden" name="faq_content" value="' + faq_content + '"/>');
    	
		$(this).append('<input type="hidden" name="faq_writer" value="${LOGIN_MEMBERINFO.mem_id}"/>');
		$(this).attr('action', '/guronsan/controller/admin/insertFAQAction.do');
		
		return true;
	});
    
    $('#faqListBTN').on('click', function() {
		location.replace('/guronsan/controller/admin/faqListAction.do');
	});

});
</script>
</head>
<body>



<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="faqMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">자주하는 질문</div>
					<table border="0" cellspacing="1" cellpadding="1">
						


						<form name="faqForm" class="form-horizontal" role="form" action="" method="post"> 
							<div class="form-group">
								<label class="control-label col-sm-2" for="faq_title">제목:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="faq_title" name="faq_title" placeholder="제목 입력...">
								</div>
							</div>
							<!-- <div class="form-group">
								<label class="control-label col-sm-2" for="notice_writer">작성자 대화명:</label>
								<div class="col-sm-10"> 
									<input type="text" class="form-control" id="notice_writer" name="notice_writer" placeholder="대화명 입력...">
								</div>
							</div> -->
						
						
							<div class="form-group">
								<label class="control-label col-sm-2" for="faq_content">내용:</label>
								<div class="col-sm-10"> 
									<div id="faq_content"><p>내용을 입력해주세요...</p></div>
								</div>
							</div>
							<!-- <div class="form-group">
								<label class="control-label col-sm-2" for="file01">첨부파일1:</label>
								<div class="col-sm-10">
									 <input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary">
								</div>
							</div> -->
						
							<div class="form-group"> 
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-info" style="float: right">등록</button>
									<button type="button" class="btn btn-danger" style="float: right">취소</button>
									<button type="button" id="faqListBTN" class="btn btn-primary" style="float: right">목록</button>
								</div>
							</div>
						</form>




 					</div>
				</div>
			</td>
		</tr>
	</table>
</div>








</body>
</html>