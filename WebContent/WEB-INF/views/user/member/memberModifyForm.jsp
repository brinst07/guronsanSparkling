<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
<script>
$(function(){
	var sido = getSido();
	//거주지 박스에 값 넣는 부분
	$('select[name=mem_add1]').append(sido);

	$('select[name=mem_add1]').on('change',
		function() {
		$('select[name=mem_add2] option').remove();
		var selectSido = $('select[name=mem_add1]').val();
		var gugun = getGugun(selectSido);
		for (i = 1; i < gugun.length; i++) {
			$('select[name=mem_add2]').append(
				'<option value = "'+gugun[i]+'">' + gugun[i]
					+ '</option>');
			}
		}
	);
	
	
	 var mem_sido = '${LOGIN_MEMBERINFO.mem_add1}';
	 $('select[name=mem_add1]').val(mem_sido).attr("selected","selected");

	 var mem_gugun = '${LOGIN_MEMBERINFO.mem_add2}';
	 $('select[name=mem_add2]').append('<option value="${LOGIN_MEMBERINFO.mem_add2}">${LOGIN_MEMBERINFO.mem_add2}</option>'); 
	 $('select[name=mem_add2] option[value="'+mem_gugun+'"]').attr('selected',"selected");	 
	 
	 
	 
	 var mem_calendar = '${LOGIN_MEMBERINFO.mem_calendar}';
	 
	 if(mem_calendar=='solar'){
		 $('input[value=solar]').attr("checked","checked");
	 }else{
		 
		 $('input[value=lunar]').attr("checked","checked");
	 }
	 
	 var mem_hometel = '${LOGIN_MEMBERINFO.mem_hometel}'.split("-"); 
	
	 $('select[name=mem_hometel1]').val(mem_hometel[0]).attr("selected","selected");
     $('input[name=mem_hometel2]').val(mem_hometel[1]);
     $('input[name=mem_hometel3]').val(mem_hometel[2]);
     
     var mem_comtel = '${LOGIN_MEMBERINFO.mem_comtel}'.split("-");
     $('select[name=mem_comtel1]').val(mem_comtel[0]).attr("selected","selected");
     $('input[name=mem_comtel2]').val(mem_comtel[1]);
     $('input[name=mem_comtel3]').val(mem_comtel[2]);	
     
     var mem_hp = '${LOGIN_MEMBERINFO.mem_hp}'.split("-");
     $('select[name=mem_hp1]').val(mem_hp[0]).attr("selected","selected");
     $('input[name=mem_hp2]').val(mem_hp[1]);
     $('input[name=mem_hp3]').val(mem_hp[2]);	
     
     var mem_zip = '${LOGIN_MEMBERINFO.mem_zip}'.split("-");
     $('input[name=mem_zip1]').val(mem_zip[0]);
     $('input[name=mem_zip2]').val(mem_zip[1]);	
     
     var mem_mail = '${LOGIN_MEMBERINFO.mem_mail}'.split("@");
     $('input[name=mem_mail1]').val(mem_mail[0]);
     $('select[name=mem_mail2]').val(mem_mail[1]).attr("selected","selected");
     
     
     $('form').submit(function(){       
    	 $('input[name=mem_zip]').val($('input[name=mem_zip1]').val()+'-'+$('input[name=mem_zip2]').val());
         $('input[name=mem_hometel]').val($('select[name=mem_hometel1]').val()+'-'+$('input[name=mem_hometel2]').val()+'-'+$('input[name=mem_hometel3]').val());
         $('input[name=mem_mail]').val($('input[name=mem_mail1]').val()+'@'+$('select[name=mem_mail2]').val());
         $('input[name=mem_comtel]').val($('select[name=mem_comtel1]').val()+'-'+$('input[name=mem_comtel2]').val()+'-'+$('input[name=mem_comtel3]').val());
         $('input[name=mem_hp]').val($('select[name=mem_hp1]').val()+'-'+$('input[name=mem_hp2]').val()+'-'+$('input[name=mem_hp3]').val());
      	
        
     	/* var mem_pass = $('input[name=mem_pass]').val();
   		if (!mem_pass.validationPWD()) {
   			alert('비밀번호를 바르게 입력해주세요');
   			return false;
   		} */
   		
   		var mem_hometel2 = $('input[name=mem_hometel2]').val();
   		var mem_hometel3 = $('input[name=mem_hometel3]').val();
   		if (!mem_hometel2.validationHOMETEL2()) {
   			alert('집전화번호를 바르게 입력해주세요');
   			return false;
   		}  		
   		if (!mem_hometel3.validationHOMETEL3()) {
   			alert('집전화번호를 바르게 입력해주세요');
   			return false;
   		}  				
   		
   	 	var mem_comtel2 = $('input[name=mem_comtel2]').val();
   		var mem_comtel3 = $('input[name=mem_comtel3]').val();
   		if (!mem_comtel2.validationCOMTEL2()) {
   			alert('회사전화번호를 바르게 입력해주세요');
   			return false;
   		}  		
   		if (!mem_comtel3.validationCOMTEL3()) {
   			alert('회사전화번호를 바르게 입력해주세요');
   			return false;
   		}  		
   		
   		var mem_hp2 = $('input[name=mem_hp2]').val();
   		var mem_hp3 = $('input[name=mem_hp3]').val();
   		if (!mem_hp2.validationHP2()) {
   			alert('휴대전화번호를 바르게 입력해주세요');
   			return false;
   		}
   		if (!mem_hp3.validationHP3()) {
   			alert('휴대전화번호를 바르게 입력해주세요');
   			return false;
   		}
   		
   		if (!mem_mail.validationMAIL()) {
   			alert('이메일을 바르게 입력해주세요');
   			return false;
   		}  		  	
   		
   		/* var mem_like = $('input[name=mem_like]').val();
   		if (!mem_like.validationLIKE()) {
   			alert('취미를 바르게 입력해주세요');
   			return false;
   		}
   		
     	var mem_job = $('input[name=mem_job]').val();
   		if (!mem_job.validationJOB()) {
   			alert('직업을 바르게 입력해주세요');
   			return false;
   		} */
         
      });
      
      $('#btn2').click(function(){
    	 location.replace("${pageContext.request.contextPath}/user/freeboard/freeboardList.do"); 
      });
      $('#btn3').click(function(){
    	 location.replace("${pageContext.request.contextPath}/user/member/deleteMemberInfo.do?mem_id=${LOGIN_MEMBERINFO.mem_id }"); 
      });
});


function zipcodePopup(){	
	var url = '${pageContext.request.contextPath}/user/member/zipcodeSearchForm.do';
	var opts = 'width=400px, height=450px, status=no, resizable=no, scrollbars=no';
	window.open(url,'우편번호검색',opts);	
};

function idPicOpenPopup(){
	var url = '/user/join/idPicFileuploadForm.do';
	var opts = 'width=400px, height=450px, status=no, resizable=no, scrollbars=no';
	window.open(url,'증명사진',opts);	
	
};
function alertPrint(msg) {
	   BootstrapDialog.show({
	       title: '알림',
	       message: msg
	   }); 
	   return false;
	}
</script>
</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
</style>
<body>
<form name="memberForm" action="${pageContext.request.contextPath }/user/member/updateMemberInfo.do" method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td><input type ="hidden" name="mem_id" value="${LOGIN_MEMBERINFO.mem_id }"></td>
	<td><input type ="hidden" name="mem_name" value="${LOGIN_MEMBERINFO.mem_name }"></td>
	<td><input type ="hidden" name="mem_regno1" value="${LOGIN_MEMBERINFO.mem_regno1 }"></td>
	<td><input type ="hidden" name="mem_regno2" value="${LOGIN_MEMBERINFO.mem_regno2 }"></td>
	<td><input type ="hidden" name="mem_bir" value="${LOGIN_MEMBERINFO.mem_bir }"></td>
	</tr>
	
	
	
	
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">성 명</td>
		<td>
			<input type="text" name="mem_name" value="${LOGIN_MEMBERINFO.mem_name }" disabled="disabled"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">주민등록번호</td>
		<td>
			<input type="text" name="mem_regno1" size="6" value="${LOGIN_MEMBERINFO.mem_regno1 }" disabled="disabled"/>
  			<input type="text" name="mem_regno2" size="7" value="${LOGIN_MEMBERINFO.mem_regno2 }" disabled="disabled"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">생년월일</td>
		<td>
			<input type="hidden" name="mem_bir"/>
			<input type="text" name="mem_bir1" value="${LOGIN_MEMBERINFO.mem_bir }" disabled="disabled"/>
			<input type="radio" name="mem_calendar" value="solar" checked="checked">양력 
			<input type="radio" name="mem_calendar" value="lunar">음력
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">아이디</td>
		<td>
			<input type="text" id="mem_id" name="mem_id" value="${LOGIN_MEMBERINFO.mem_id }" disabled="disabled">
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호</td>
		<td>
			<input type="text" name="mem_pass" value="${LOGIN_MEMBERINFO.mem_pass }" /> 4 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호확인</td>
		<td>
			<input type="text" name="mem_pass_confirm" value="${LOGIN_MEMBERINFO.mem_pass }" /> 4 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<td class="fieldName" width="100px" height="25">전화번호</td>
		<td>
			<div>
			<input type="hidden" name="mem_hometel"/>
			<select name="mem_hometel1">
				<option value="02">02</option>
				<option value="031">031</option>
				<option value="032">032</option>								        	
				<option value="033">033</option>				        	
				<option value="041">041</option>
				<option value="042">042</option>				        	
				<option value="043">043</option>				        	
				<option value="051">051</option>				        	
				<option value="052">052</option>
				<option value="053">053</option>				        					        	
				<option value="061">061</option>
				<option value="062">062</option>
				<option value="063">063</option>				        					        					        	
				<option value="064">064</option>				        					        					        	
				<option value="070">070</option>				        					        					        	
				<option value="0412">0412</option>				        					        					        	
			</select>	- 	
			<input type="text" name="mem_hometel2" size="4" value="" /> - 
			<input type="text" name="mem_hometel3" size="4" value="" />
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">회사 전화번호</td>
		<td>
			<div>
			<input type="hidden" name="mem_comtel"/>
			<select name="mem_comtel1">
				<option value="02">02</option>
				<option value="031">031</option>
				<option value="032">032</option>								        	
				<option value="033">033</option>				        	
				<option value="041">041</option>
				<option value="042">042</option>				        	
				<option value="043">043</option>				        	
				<option value="051">051</option>				        	
				<option value="052">052</option>
				<option value="053">053</option>				        					        	
				<option value="061">061</option>
				<option value="062">062</option>
				<option value="063">063</option>				        					        					        	
				<option value="064">064</option>				        					        					        	
				<option value="070">070</option>	
				<option value="0412">0412</option>				        					        					        	
			</select>	- 	
			<input type="text" name="mem_comtel2" size="4" value="" /> - 
			<input type="text" name="mem_comtel3" size="4" value="" />
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">핸드폰</td>
		<td>
			<input type="hidden" name="mem_hp"/>
			<select name="mem_hp1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>				        	
				<option value="017">017</option>				        	
				<option value="019">019</option>				        	
			</select>	-
			<input type="text" name="mem_hp2" size="4" value="" /> - 
			<input type="text" name="mem_hp3" size="4" value="" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">이메일</td>
		<td>
			<input type="hidden" name="mem_mail" />
			<input type="text" name="mem_mail1" value="" /> @
			<select name="mem_mail2">
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				<option value="gmail.com">gmail.com</option>				
			</select>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
		
	<tr>
		<td class="fieldName" width="100px" height="25">주소</td>
		<td>
			<select style="width: 130px;" name="mem_add1">
			<option selected="selected" value="">선택하세요</option>
			</select> 
			
			<select style="width: 130px;" name="mem_add2">
			<option selected="selected" value="">선택하세요</option>
			</select>
		</td>
	</tr>
	<%-- <tr>
		<td class="fieldName" width="100px" height="25">주소</td>
		<td>
			<input type="hidden" name="mem_zip" />
			<input type="text" name="mem_zip1" id="mem_zip1" size="3" value="" /> - 
			<input type="text" name="mem_zip2" id="mem_zip2" size="3" value="" />
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" onclick="zipcodePopup();" type="button">우편번호검색</button><br>
			<input type="text" name="mem_add1" id="mem_add1" value="${LOGIN_MEMBERINFO.mem_add1 }" />
			<input type="text" name="mem_add2" id="mem_add2" value="${LOGIN_MEMBERINFO.mem_add2 }" />
		</td>
	</tr> --%>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">직 업</td>
		<td>
			<input type="text" name="mem_job" value="${LOGIN_MEMBERINFO.mem_job }"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">취 미</td>
		<td>
			<input type="text" name="mem_like" value="${LOGIN_MEMBERINFO.mem_like }"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">수정하기</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="reset">취소</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn3" type="button">회원탈퇴</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>








