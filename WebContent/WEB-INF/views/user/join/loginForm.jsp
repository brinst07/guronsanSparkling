<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css" type="text/css">
<title>회원관리 관리자 로그인</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
	

		if(eval('${!empty param.message}')){ /* 비교 할 대상 정확히 */
			alert('${param.message}');
		}
		
		
		//로그인 버튼을 클릭하면 전송하는 로직
		$('.loginBtn').click(function(){
			const mem_id = $('input[name=mem_id]').val();
			const mem_pass = $('input[name=mem_pass]').val();
			const checked = $('input[name=saveID]').is(':checked');
			let form = $('<form action="${pageContext.request.contextPath}/user/join/loginCheck.do" method="post"></form>');
			let inputID= $('<input type="hidden" value="'+mem_id+'" name="mem_id">');
			let inputPWD = $('<input type="hidden" value="'+mem_pass+'" name="mem_pass">');
			form.append(inputID);
			form.append(inputPWD);
			$(document.body).append(form);
			form.submit();
		});
		
		
	
	});
</script>
</head>
<body>
공개키 값 : ${publicKeyMap['publicModulus']} | ${publicKeyMap['publicExponent'] }
	<table width="770" border="0" align="center" cellpadding="0"
		cellspacing="0" style="margin: 90px;">
		<tr>
			<td height="150" align="center"><img src="${pageContext.request.contextPath }/image/p_login.gif" /></td>
		</tr>
		<tr>
			<td height="174"
				style="background: url(${pageContext.request.contextPath }/image/login_bg.jpg); border: 1px solid #e3e3e3;">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="260" height="110" align="center"
							style="border-right: 1px dotted #736357;">
							<img src="${pageContext.request.contextPath }/image/logo.jpg" />
						</td>
						<td>
							<table border="0" align="center" cellpadding="5"
								cellspacing="0">
								<tr>
									<td><b>아이디</b></td>
									<td><input type="text" name="mem_id" class="box" tabindex="3" height="18" /></td>
									<td rowspan="2">
										<img src="${pageContext.request.contextPath }/image/login.gif" class="loginBtn"/>
									</td>
								</tr>
								<tr>
									<td><b>패스워드</b></td>
									<td><input type="password" name="mem_pass" class="box" tabindex="3" height="18" /></td>
								</tr>
								<tr>
									<td colspan="2">
										<a href="${pageContext.request.contextPath }/user/member/memberForm.do">회원가입</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
