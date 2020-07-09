<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원리스트</title>
<script type="text/javascript">
	$(function() {	
		if(eval('${!empty param.message}')){
			 	BootstrapDialog.show({
		 	    title: '알럿창',
		 	    message: '성공적으로 삭제되었습니다.'
		 		});
		}
	
		if('${flag}'=='true'){
		 	BootstrapDialog.show({
	 	    title: '알림',
	 	    message: 'D드라이브에 pdf 생성이 완료되었습니다.!'
	 		});
		}
		
		var sido = getSido();
		//거주지 박스에 값 넣는 부분
		$('select[name=search_sido]').append(sido);

		$('select[name=search_sido]').on(
				'change',
				function() {
					var selectSido = $('select[name=search_sido]').val();
					var gugun = getGugun(selectSido);
					for (i = 1; i < gugun.length; i++) {
						$('select[name=search_gugun]').append(
								'<option value = "'+gugun[i]+'">' + gugun[i]
										+ '</option>');
					}
				});

		// 휴대폰 앞자리 select 넣는부분
		var hplist = settingDisernNum();
		$('select[name=search_hp1]').append(hplist);

		// 생년월일 selectbox에 값넣는 부분
		$('select[name=search_year]').append(getYearsOptions(new Date()));

		$('select[name=search_month]').append(getMonthOptions());

		// 월이 선택되면 그에 맞는 일이 셀렉트박스에 들어간다.
		$('select[name=search_month]').on(
				'change',
				function() {
					$('select[name=search_day] option').remove();
					$('select[name=search_day]').append(
							'<option value="">선택하세요</option>');
					var thisyear = $('select[name=search_year]').val();
					var thismonth = new Date($(this).val());
					for (i = 1; i < getLastDate(thismonth); i++) {
						if (i < 10) {
							$('select[name=search_day]').append(
									'<option value = "0'+i+'">' + 0 + i
											+ '</option>');
						} else {
							$('select[name=search_day]').append(
									'<option value = "'+i+'">' + i
											+ '</option>');
						}
					}

				});

		$('#searchbtn')
				.on(
						'click',
						function() {
							var form = $('<form action="/admin/member/memberMgr.do" method="post"></form>');
							var search_base = $('<input name = "search_keyword" value="'
									+ $('select[name=search_keyword]').val()
									+ '"></input>')
							var search = $('<input name="search_keycode" value="'
									+ $('input[name=search_keycode]').val()
									+ '"></input>');
							var add1 = $('<input name = "mem_add1" value="'
									+ $('select[name=search_sido]').val()
									+ '"></input>');
							var add2 = $('<input name = "mem_add2" value="'
									+ $('select[name=search_gugun]').val()
									+ '"></input>');
							var mem_hp = "";
							if ($('select[name=search_hp1]').val() != "") {
								mem_hp = $('select[name=search_hp1]').val();
								if ($('input[name=search_hp2]').val() != "") {
									mem_hp += "-"
											+ $('input[name=search_hp2]').val();
									if ($('input[name=search_hp3]').val() != "") {
										mem_hp += "-"
												+ $('input[name=search_hp3]')
														.val();
									}
								}

							}

							var mem_bir = "";
							if ($('select[name=search_year]').val().length == 4) {
								mem_bir = $('select[name=search_year]').val();
								if ($('select[name=search_month]').val().length == 2) {
									mem_bir += "-"
											+ $('select[name=search_month]')
													.val();
									if ($('select[name=search_day]').val().length == 2) {
										mem_bir += "-"
												+ $('select[name=search_day]')
														.val();
									}
								}
							}
							var bir = $('<input name = "mem_bir" value="'+mem_bir +'"></input>');
							var search_calendar = $('<input name="search_calendar" value="'
									+ $('input[name=search_calendar]:checked')
											.val() + '"></input>')
							var hp = $('<input name = "mem_hp" value="'+mem_hp+'"></input>');
							form.append(hp);
							form.append(search);
							form.append(search_base);
							form.append(add1);
							form.append(add2);
							form.append(bir);
							form.append(search_calendar);
							form.appendTo('body');
							form.submit();
						});

		$('.memberList tr').on('click', function() {
			var id = $(this).find('td:eq(1)').text();
			location.href = '/admin/member/memberView.do?mem_id='+id;
		});
		
		$('select[name=search_count]').val('${param.count}');
		
		//페이지네이션 부분
		$('select[name=search_count]').on('change', function() {
			var count = $('select[name=search_count]').val();
			location.href = '/admin/member/memberMgr.do?count=' + count;
		});
		
		$('#selectAll').click(function() {
			$('.check_child').prop('checked',this.checked);
		});
		
		$('#excel').click(function(){
			var selects = [];
			$('.check_child:checked').each(function(){
				selects.push($(this).prop("id"));
			});
			
			var form = $('<form action="/admin/member/memberExcel.do" method="post" ></form>');
			var input = $('<input type = "hidden" name="selects" value="'+ selects +'" ></input>');
			
			form.append(input);
			form.appendTo('body');
			form.submit();
		});
		
		$('#pdf').on('click',function(){
			var selects = [];
			$('.check_child:checked').each(function(){
				selects.push($(this).prop("id"));
			});
			
			var form = $('<form action="/admin/memberPdf.do" method="post" ></form>');
			var input = $('<input type = "hidden" name="selects" value="'+ selects +'" ></input>');
			
			form.append(input);
			form.appendTo('body');
			form.submit();
			
		});
		
		$('#mail').on('click',function(){
			var message  = prompt('메세지를 입력해주세요');
			var selects = [];
			$('.check_child:checked').each(function(){
				selects.push($(this).prop("id"));
			});
			
			var form = $('<form action="/admin/mail.do" method="post" ></form>');
			var input1 = $('<input type = "hidden" name="selects" value="'+ selects +'" ></input>');
			var input2 = $('<input type = "hidden" name="message" value="'+ message +'" ></input>');
			
			form.append(input1);
			form.append(input2);
			form.appendTo('body');
			form.submit();
	     });

	});
</script>
</head>
<body>
	<div class="wrap">
		<table width="1000" border="0" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td width="180"><jsp:include page="memberMenu.jsp"></jsp:include></td>
				<td width="30">&nbsp;</td>
				<td width="790">
					<div id="container">
						<div class="title">회원관리</div>
						<form name="search_form">
							<table border="0" cellspacing="1" cellpadding="1">
								<tr>

									<th width="120">기본검색</th>
									<td><select style="width: 130px;" name="search_keyword">
											<option selected="selected" value="" value="">선택하세요</option>
											<option id="mem_name" value="mem_name">이름</option>
											<option id="mem_id" value="mem_id">아이디</option>
									</select> <input name="search_keycode" type="text" size="20" /></td>
								</tr>
								<tr>
									<th>거주지</th>
									<td><select style="width: 130px;" name="search_sido">
											<option selected="selected" value="">선택하세요</option>
									</select> <select style="width: 130px;" name="search_gugun">
											<option selected="selected" value="">선택하세요</option>
									</select></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><select style="width: 100px;" name="search_hp1">
											<option selected="selected" value="">선택하세요</option>
									</select> - <input name="search_hp2" type="text" id="search_hp2"
										size="20" /> - <input name="search_hp3" type="text"
										id="search_hp3" size="20" /></td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td><input type="radio" name="search_calendar"
										value="solar" checked="checked" />양력 <input type="radio"
										name="search_calendar" value="lunar" />음력 <select
										style="width: 130px;" name="search_year">
											<option selected="selected" value="">선택하세요</option>
									</select> <select style="width: 130px;" name="search_month">
											<option selected="selected" value="">선택하세요</option>
									</select> <select style="width: 130px;" name="search_day">
											<option selected="selected" value="">선택하세요</option>
									</select></td>
								</tr>
							</table>
							<div style="padding-top: 5px; text-align: right;">
								<input class="btn1" type="reset" value="초기화" /> <input
									class="btn1" type="button" value="검색하기" id="searchbtn" />
							</div>
						</form>
						<div style="padding-top: 5px;" id="search_totalMembers">
							<label class="totalmembers"></label> <select
								style="width: 50px; float: right;" name="search_count">
								<option selected="selected" value="10">10</option>
								<option value="25">25</option>
								<option value="50">50</option>
							</select>
						</div>
						<div style="height: 15px;"></div>
						<table border="0" cellspacing="1" cellpadding="1">
							<thead>
								<tr>
									<th width="10%"><input type="checkbox" name="selectTotal"
										class="checkbox_align" id="selectAll" />&nbsp;선택</th>
									<th width="20%">아이디</th>
									<th>이름</th>
									<th>생일</th>
									<th>메일</th>
								</tr>
							</thead>
							<tbody class="memberList">
								<c:forEach var="member" items="${memberList }">
									<tr>
										<td><input type="checkbox" name="select"
											class="check_child" id="${member['mem_id'] }" /></td>
										<td class="td">${member['mem_id']}</td>
										<td class="td">${member['mem_name']}</td>
										<td class="td">${member['mem_bir']}</td>
										<td class="td">${member['mem_mail']}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div align="center">
							<input class="publishingCoupon" type="button" value="선택회원 메일발송"
								style=" float: left;" id="mail" /> <span class="pagingHtml"></span> <input
								class="btn2" type="button" value="Excel작성" style="float: right;"  id="excel"/>
							<input class="btn2" type="button" value="PDF작성"
								style="float: right; margin-right: 5px;"  id="pdf"/>
						</div>
						${pagination }
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>