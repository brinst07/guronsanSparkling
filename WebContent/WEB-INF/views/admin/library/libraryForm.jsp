<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 등록</title>
<script>
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#library_content').summernote({
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
	$('#filesubmit').on('click',function(){
		var content =$('#library_content').summernote('code');
		$('input[name=hiddencontent]').val(content);
		$('input[name=id]').val('${LOGIN_MEMBERINFO}');
		$('form[name=libraryForm]').submit();
	});
});
</script>
</head>
<body>

<form name="libraryForm" class="form-horizontal" role="form" action="/admin/libraryFileUpload.do" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label class="control-label col-sm-2" for="library_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="library_title" placeholder="제목 입력...">
			<input type="hidden" name="id" value=""/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="library_writer">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" name="library_writer" placeholder="대화명 입력...">
		</div>
	</div>


	<div class="form-group">
		<label class="control-label col-sm-2" for="library_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="library_content">내용을 입력해주세요...</div>
			<input type="hidden" value="" name="hiddencontent">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="file01">첨부파일1:</label>
		<div class="col-sm-10">
			 <input type="file" class="filestyle"  name="file01" data-buttonName="btn-primary">
		</div>
	</div>

	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-info" style="float: right" id="filesubmit">등록</button>
			<button type="button" class="btn btn-danger" style="float: right">취소</button>
			<button type="button" class="btn btn-primary" style="float: right">목록</button>
		</div>
	</div>
</form>
</body>
</html>