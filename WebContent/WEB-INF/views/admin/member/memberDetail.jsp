<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원상세정보</title>
<script type="text/javascript">
	$(function(){
		var mem_add1 = '${member.getMem_add1()}';
		var mem_add2 = '${member.getMem_add2()}';
		var sido = getSido();
		//거주지 박스에 값 넣는 부분
		$('select[name=mem_sido]').append(sido);
		$('select[name=mem_sido]').on('change',function(){
			$('select[name=mem_gugun] option').remove();
			$('select[name=mem_gugun]').append('<option >선택하세요</option>');
			var selectSido = $('select[name=mem_sido]').val();
			var gugun = getGugun(selectSido);
			for(i=1; i<gugun.length; i++){
				$('select[name=mem_gugun]').append('<option value = "'+gugun[i]+'">'+gugun[i]+'</option>');
			}
		});
		
		// 휴대폰 앞자리 select 넣는부분
		var hplist = settingDisernNum();
		$('select[name=mem_hp1]').append(hplist);
		var hp = '${member.getMem_hp()}';
		var hp = hp.split('-');
		$('#mem_hp2').val(hp[1]);
		$('#mem_hp3').val(hp[2]);
		$('select[name=mem_hp1]').val(hp[0]);
		
		// 생년월일 selectbox에 값넣는 부분
		$('select[name=mem_year]').append(getYearsOptions(new Date()));
		
		$('select[name=mem_month]').append(getMonthOptions());
		
		var mem_bir = '${member.getMem_bir()}';
		mem_bir = mem_bir.split("-");
		mem_bir1 = mem_bir[2].split(" ");
		
		// 월이 선택되면 그에 맞는 일이 셀렉트박스에 들어간다.
		$('select[name=mem_month]').on('change',function(){
			$('select[name=mem_day] option').remove();
			$('select[name=mem_day]').append('<option>선택하세요</option>');
			var thisyear = $('select[name=mem_year]').val();
			var thismonth = new Date(thisyear + "-" +$(this).val());
			for(i=1; i<getLastDate(thismonth); i++){
				if(i<10){
				$('select[name=mem_day]').append('<option value = "0'+i+'">'+0+i+'</option>');
				}else{
				$('select[name=mem_day]').append('<option value = "'+i+'">'+i+'</option>');
				}
			}
			
		});
		$('select[name=mem_year]').val(mem_bir[0]);
		$('select[name=mem_month]').val(mem_bir[1]);
		
		var thisyear = $('select[name=mem_year]').val();
		var thismonth = new Date(thisyear + "-" +$(this).val());
		for(i=1; i<getLastDate(thismonth); i++){
			if(i<10){
			$('select[name=mem_day]').append('<option value = "0'+i+'">'+0+i+'</option>');
			}else{
			$('select[name=mem_day]').append('<option value = "'+i+'">'+i+'</option>');
			}
		}
	
		$('select[name=mem_day]').val(mem_bir1[0]);
		
		var email = '${member.getMem_mail()}';
		email = email.split("@");
		$('#mem_mail1').val(email[0]);
		$('#mem_mail2').val(email[1]);
		
		$('select[name=mem_sido] option[value="'+mem_add1+'"]').attr('selected',true);
		var selectSido = $('select[name=mem_sido]').val();
		var gugun = getGugun(selectSido);
		for(i=1; i<gugun.length; i++){
			$('select[name=mem_gugun]').append('<option value = "'+gugun[i]+'">'+gugun[i]+'</option>');
		}
		$('select[name=mem_gugun] option[value="'+mem_add2+'"]').attr('selected',true);
		
		var birCheck = '${member.getMem_calendar()}';
		if(birCheck == 1){
			$('input:radio[value=solar]').prop('checked',true);
		}else if(birCheck == 2){
			$('input:radio[value=lunar]').prop('checked',true);			
		}
		
		//update 문을 처리하기위한 Action 메소드로 보낸다.
		
		
		$('#updateMember').on('click',function(){
			if($('#mem_pass').val() != $('#mem_pass_confirm').val()){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			var form = $('<form action = "/admin/memberUpdate.do" method="post" ></form>');
			var id = $('<input type="hidden" name="mem_id" value="'+ $('input[name=mem_id]').val() +'"></input>');
			var pass = $('<input type="hidden" name="mem_pass" value="'+ $('#mem_pass').val() +'"></input>');
			var mail = $('<input type="hidden" name="mem_mail" value="'+ $('#mem_mail1').val() +"@"+ $('#mem_mail2').val()+'"></input>');
			var mem_add1 = $('<input type="hidden" name="mem_add1" value= "'+ $('select[name=mem_sido]').val() +'"></input>')
			var mem_add2 = $('<input type="hidden" name="mem_add2" value= "'+ $('select[name=mem_gugun]').val() +'"></input>')
			var hp = $('select[name=mem_hp1]').val() + "-" + $('input[name=mem_hp2]').val() + "-" + $('input[name=mem_hp3]').val();
			var mem_hp = $('<input type="hidden"  name="mem_hp" value="'+ hp +'"></input>');
			var solnar = $('input[name=mem_calendar]:checked').val();
			if(solnar == 'solar'){
				solnar = "1";
			}else{
				solnar = "2";
			}
			var mem_calendar = $('<input type="hidden" name="mem_calendar" value="'+ solnar +'"></input>');
			var bir = $('select[name=mem_year]').val()+"-"+$('select[name=mem_month]').val()+"-"+$('select[name=mem_day]').val();
			var mem_bir = $('<input type="hidden"  name="mem_bir" value="'+ bir +'"></input>');
			form.append(pass);
			form.append(id);
			form.append(mail);
			form.append(mem_add1);
			form.append(mem_add2);
			form.append(mem_hp)
			form.append(mem_calendar);
			form.append(mem_bir);
			form.appendTo('body');
			form.submit();
		});
		
		$('#deleteMember').on('click',function(){
			var id = '${member.getMem_id() }';
			location.href='/admin/deleteMember.do?mem_id='+id;
		});
	});
</script>
</head>
<body onload="setInitContents();">
<div class="wrap">	
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="memberMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790">
				<div id="container">
					<div class="title">회원정보</div>
					<form method="post" name="updateMemberForm" >
						<table border="0" cellspacing="1" cellpadding="1">
							<tr>
								<th><span class="r">*</span>이름</th>
								<td><label name="mem_name" class="mem_name">${member.getMem_name() }</label></td>
							</tr>
							<tr>
								<th><span class="r">*</span>아이디</th>
								<td><label name="mem_id" class="mem_id">${member.getMem_id() }</label>
									<input type="hidden" name="mem_id" value="${member.getMem_id() }"/>
								</td>
							</tr>
							<tr>
								<th><span class="r">*</span>비밀번호</th>
								<td><input name="mem_pass" type="text" id="mem_pass" size="20" value="${member.getMem_pass() }"/></td>
							</tr>
							<tr>
								<th><span class="r">*</span>비밀번호 확인</th>
								<td><input name="mem_pass_confirm" type="text" id="mem_pass_confirm" size="20"  value="${member.getMem_pass() }"/></td>
							</tr>
							<tr>
								<th>이메일 주소</th>
								<td>
									<input name="mem_mail1" type="text" id="mem_mail1" size="20" />@
									<input name="mem_mail2" type="text" id="mem_mail2" size="20" /> 
								</td>
							</tr>
							<tr>
								<th>거주지</th>
								<td>
									<select style="width: 130px; margin-right: 10px;" name="mem_sido">
											<option selected="selected">선택하세요</option>
									</select>
									
									<select style="width: 130px;" name="mem_gugun">
										<option selected="selected">선택하세요</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><select style="width: 100px;" name="mem_hp1">
										<option selected="selected">선택하세요</option>
									</select> - 
									<input name="mem_hp2" type="text" id="mem_hp2" size="20" value="hp[1]"/> - 
									<input name="mem_hp3" type="text" id="mem_hp3" size="20" value="hp[2]"/>
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>
									<input type="radio" name="mem_calendar" value="solar" />양력
									<input type="radio" name="mem_calendar" value="lunar" />음력 
									<select style="width: 130px; margin-left: 10px;" name="mem_year">
										<option selected="selected">선택하세요</option>
									</select> 
									<select style="width: 130px;" name="mem_month">
										<option selected="selected">선택하세요</option>
									</select> 
									<select style="width: 130px;" name="mem_day">
										<option selected="selected">선택하세요</option>
									</select>
								</td>
							</tr>
						</table>
						<div style="float: right;">
							<input class="btn2" type="button" value="변경내용 저장" id="updateMember"/>
							<input class="btn3" type="button" value="탈퇴" id="deleteMember"/>
							<input class="btn2" type="reset" value="취소" />
						</div>
					</form>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>