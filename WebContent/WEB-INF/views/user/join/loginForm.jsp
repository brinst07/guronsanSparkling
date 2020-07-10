<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css" type="text/css">
<title>회원관리 관리자 로그인</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type='text/javascript' src="${pageContext.request.contextPath }/js/crypto/jsbn.js"></script>
<script type='text/javascript' src="${pageContext.request.contextPath }/js/crypto/rsa.js"></script>
<script type='text/javascript' src="${pageContext.request.contextPath }/js/crypto/prng4.js"></script>
<script type='text/javascript' src="${pageContext.request.contextPath }/js/crypto/rng.js"></script>
<script type="text/javascript">
	$(function(){
	

		if(eval('${!empty param.message}')){ /* 비교 할 대상 정확히 */
			alert('${param.message}');
		}
		
		
		//로그인 버튼을 클릭하면 전송하는 로직
		$('#loginbtn').click(function(){
			
			
		    var modulus = '${publicKeyMap["publicModulus"]}';
       	    var exponent = '${publicKeyMap["publicExponent"]}';
       	    
       		var rsaObject = new RSAKey();
       	    rsaObject.setPublic(modulus, exponent);
       	    var encryptID = rsaObject.encrypt($('input[name=mem_id]').val());
      	    var encryptPWD = rsaObject.encrypt($('input[name=mem_pass]').val());
      	    
			const mem_id = $('input[name=mem_id]').val();
			const mem_pass = $('input[name=mem_pass]').val();
			const checked = $('input[name=saveID]').is(':checked');
			let form = $('<form action="${pageContext.request.contextPath}/user/join/loginCheck.do" method="post"></form>');
			let inputID= $('<input type="hidden" value="'+encryptID+'" name="mem_id">');
			let inputPWD = $('<input type="hidden" value="'+encryptPWD+'" name="mem_pass">');
			form.append(inputID);
			form.append(inputPWD);
			$(document.body).append(form);
			form.submit();
		});
		
		
	
	});
</script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<style type="text/css">

/* BASIC */

html {
  background-color: #56baed;
}

body {
  font-family: "Poppins", sans-serif;
  height: 100vh;
}

a {
  color: #92badd;
  display:inline-block;
  text-decoration: none;
  font-weight: 400;
}

h2 {
  text-align: center;
  font-size: 16px;
  font-weight: 600;
  text-transform: uppercase;
  display:inline-block;
  margin: 40px 8px 10px 8px; 
  color: #cccccc;
}



/* STRUCTURE */

.wrapper {
  display: flex;
  align-items: center;
  flex-direction: column; 
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 20px;
}

#formContent {
  -webkit-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  background: #fff;
  padding: 30px;
  width: 90%;
  max-width: 900px;
  position: relative;
  padding: 0px;
  -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  text-align: center;
}

#formFooter {
  background-color: #f6f6f6;
  border-top: 1px solid #dce8f1;
  padding: 25px;
  text-align: center;
  -webkit-border-radius: 0 0 10px 10px;
  border-radius: 0 0 10px 10px;
}



/* TABS */

h2.inactive {
  color: #cccccc;
}

h2.active {
  color: #0d0d0d;
  border-bottom: 2px solid #5fbae9;
}



/* FORM TYPOGRAPHY*/

input[type=button], input[type=submit], input[type=reset]  {
  background-color: #56baed;
  border: none;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 20px 40px 20px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
  background-color: #39ace7;
}

input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}

input[type=text], input[type=password] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 85%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

input[type=text]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}
, input[type=password]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}

input[type=text]:placeholder {
  color: #cccccc;
}
, input[type=password]:placeholder {
  color: #cccccc;
}



/* ANIMATIONS */

/* Simple CSS3 Fade-in-down Animation */
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

.fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
}

.fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}

.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}

.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}

.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
}

/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
  display: block;
  left: 0;
  bottom: -10px;
  width: 0;
  height: 2px;
  background-color: #56baed;
  content: "";
  transition: width 0.2s;
}

.underlineHover:hover {
  color: #0d0d0d;
}

.underlineHover:hover:after{
  width: 100%;
}



/* OTHERS */

*:focus {
    outline: none;
} 

#icon {
  width:100%;
}

</style>
</head>
<body>
<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="${pageContext.request.contextPath }/image/hobbang.gif" id="icon" alt="User Icon" />
    </div>

    <!-- Login Form -->
   
      <input type="text" id="login" class="fadeIn second" name="mem_id" placeholder="login">
      <input type="password" id="password" class="fadeIn third" name="mem_pass" placeholder="password">
      <input type="button" class="fadeIn fourth" value="Log In" id="loginbtn">
   

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="${pageContext.request.contextPath }/user/member/memberForm.do">회원가입~</a>
    </div>

  </div>
</div>

<!-- 	<table width="770" border="0" align="center" cellpadding="0" -->
<!-- 		cellspacing="0" style="margin: 90px;"> -->
<!-- 		<tr> -->
<%-- 			<td height="150" align="center"><img src="${pageContext.request.contextPath }/image/p_login.gif" /></td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td height="174" -->
<%-- 				style="background: url(${pageContext.request.contextPath }/image/login_bg.jpg); border: 1px solid #e3e3e3;"> --%>
<!-- 				<table width="100%" border="0" cellpadding="0" cellspacing="0"> -->
<!-- 					<tr> -->
<!-- 						<td width="260" height="110" align="center" -->
<!-- 							style="border-right: 1px dotted #736357;"> -->
<%-- 							<img src="${pageContext.request.contextPath }/image/logo.jpg" /> --%>
<!-- 						</td> -->
<!-- 						<td> -->
<!-- 							<table border="0" align="center" cellpadding="5" -->
<!-- 								cellspacing="0"> -->
<!-- 								<tr> -->
<!-- 									<td><b>아이디</b></td> -->
<!-- 									<td><input type="text" name="mem_id" class="box" tabindex="3" height="18" /></td> -->
<!-- 									<td rowspan="2"> -->
<%-- 										<img src="${pageContext.request.contextPath }/image/login.gif" class="loginBtn"/> --%>
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td><b>패스워드</b></td> -->
<!-- 									<td><input type="password" name="mem_pass" class="box" tabindex="3" height="18" /></td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td colspan="2"> -->
<%-- 										<a href="${pageContext.request.contextPath }/user/member/memberForm.do">회원가입</a> --%>
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 							</table> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 				</table> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
</body>
</html>
