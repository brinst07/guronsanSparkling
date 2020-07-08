<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="mainURI" value="/09/main.jsp"></c:url>
<c:url var="idCheckURI" value="/09/idCheck.jsp"></c:url>
<c:url var="zipcodeSearchFormURI" value="/09/zipcodeSearchForm.jsp"></c:url>
<c:url var="insertMemberURI" value="/09/insertMember.jsp"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
<script>
$(function(){
      $('form').submit(function(){
     	  $('input[name=mem_bir]').val($('input[name=mem_bir1]').val()+'-'+$('input[name=mem_bir2]').val()+'-'+$('input[name=mem_bir3]').val());
          $('input[name=mem_zip]').val($('input[name=mem_zip1]').val()+'-'+$('input[name=mem_zip2]').val());
          $('input[name=mem_hometel]').val($('select[name=mem_hometel1]').val()+'-'+$('input[name=mem_hometel2]').val()+'-'+$('input[name=mem_hometel3]').val());
          $('input[name=mem_mail]').val($('input[name=mem_mail1]').val()+'@'+$('select[name=mem_mail2]').val());
          $('input[name=mem_comtel]').val($('select[name=mem_comtel1]').val()+'-'+$('input[name=mem_comtel2]').val()+'-'+$('input[name=mem_comtel3]').val());
          $('input[name=mem_hp]').val($('select[name=mem_hp1]').val()+'-'+$('input[name=mem_hp2]').val()+'-'+$('input[name=mem_hp3]').val());
          	  
        var mem_name = $('input[name=mem_name]').val();
        if(!mem_name.validationNAME()){
        	alert('이름을 바르게 입력해주세요');
  			return false;
        }
        var mem_regno1 = $('input[name=mem_regno1]').val();
        if(!mem_regno1.validationREGNO1()){
        	alert('주민번호 앞자리를 바르게 입력해주세요');
  			return false;
        }
        var mem_regno2 = $('input[name=mem_regno2]').val();
        if(!mem_regno2.validationREGNO2()){
        	alert('주민번호 뒷자리를 바르게 입력해주세요');
  			return false;
        }
        var mem_bir1 = $('input[name=mem_bir1]').val();
        if(!mem_bir1.validationBIR1()){
        	alert('년도를 바르게 입력해주세요');
  			return false;
        }
        var mem_bir2 = $('input[name=mem_bir2]').val();
        if(!mem_bir2.validationBIR2()){
        	alert('월을 바르게 입력해주세요');
  			return false;
        }
        var mem_bir3 = $('input[name=mem_bir3]').val();
        if(!mem_bir3.validationBIR3()){
        	alert('일을 바르게 입력해주세요');
  			return false;
        }
    	
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
    	 location.replace("${pageContext.request.contextPath}/user/join/loginForm.do"); 
      });
});
function idCheck(){	
	
	$.ajax({		
		url : '/user/member/idCheck.do',
		data : {mem_id : $('input[class=mem_id]').val()},
		dataType : 'JSON',
		error : function(result){
					alert('error code : ' + result.status + 
							' | message : ' + result.responseText);
				},
		success : function(result){
					//{"flag" : "true" | "false"}
					if(eval(result.flag)){
						alert('사용할수있는 아이디입니다.');
						$('input[id=mem_pass]').focus();
					}else{
						alert('사용할수없는 아이디입니다.');
						$('input[id=mem_id]').val('');
					}
				}
		
	});
};
function zipcodePopup(){	
	var url = '/user/member/zipcodeSearchForm.do';
	var opts = 'width=400px, height=450px, status=no, resizable=no, scrollbars=no';
	window.open(url,'우편번호검색',opts);	
};

function idPicOpenPopup(){
	var url = '/user/join/idPicFileuploadForm.do';
	var opts = 'width=400px, height=450px, status=no, resizable=no, scrollbars=no';
	window.open(url,'증명사진',opts);	
	
};
</script>
</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
</style>
<body>
<form name="memberForm" action="/user/member/insertMemberInfo.do" method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr><td rowspan="13" class="pic" colspan="2" style="vertical-align: bottom; width: 150px; text-align: center;">
			<img src="${pageContext.request.contextPath }/image/btn_pic.gif" alt="사진올리기" class="btn" title="인적사항에 올릴 증명	을 검색합니다." 
				style="cursor: pointer;"
				onclick="idPicOpenPopup();"/><br/>
			<div style="width: 100%" align="center">
				size : 235x315 이하
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">성 명</td>
		<td>
			<input type="text" name="mem_name" value=""/>
		</td>
	</tr>	
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">주민등록번호</td>
		<td>
			<input type="text" name="mem_regno1" size="6" value=""/>
  			<input type="text" name="mem_regno2" size="7" value=""/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">생년월일</td>
		<td>
			<input type="hidden" name="mem_bir" />
			<input type="text" name="mem_bir1" size="4" value="" />년
			<input type="text" name="mem_bir2" size="2" value="" />월
			<input type="text" name="mem_bir3" size="2" value="" />일
			<input type="radio" name="mem_calendar" value="solar" checked="checked">양력 
			<input type="radio" name="mem_calendar" value="lunar">음력
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">아이디</td>
		<td>
			<input type="text" class="mem_id" id="mem_id" name="mem_id">
			<b><a href="javascript:idCheck();">[ID 중복검사]</a></b>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호</td>
		<td>
			<input type="text" name="mem_pass" value="" /> 8 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호확인</td>
		<td>
			<input type="text" name="mem_pass_confirm" value="" /> 8 ~ 20 자리 영문자 및 숫자 사용
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
			<input type="hidden" name="mem_zip" />
			<input type="text" name="mem_zip1" id="mem_zip1" size="3" value="" /> - 
			<input type="text" name="mem_zip2" id="mem_zip2" size="3" value="" />
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" onclick="zipcodePopup();" type="button">우편번호검색</button><br>
			<input type="text" name="mem_add1" id="mem_add1" value="" />
			<input type="text" name="mem_add2" id="mem_add2" value="" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">직 업</td>
		<td>
			<input type="text" name="mem_job" value=""/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">취 미</td>
		<td>
			<input type="text" name="mem_like" value=""/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">가입하기</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="reset">취소</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>








