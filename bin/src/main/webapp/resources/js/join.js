function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';
                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
 function checkForm() {
		if ($("#id").val() == "") {
			alert("아이디를 입력하지 않으셨습니다.");
			$("#id").focus();
			return false;
		} else if ($("#idc").val() != false) {
			alert("아이디 형식이 맞지 않습니다 .");
			$("#id").focus();
			return false;
		} else if ($("#pwd").val() == "") {
			alert("비밀번호를 입력하지 않으셨습니다.");
			$("#pwd").focus();
			return false;
		} else if ($("#pwd2").val() == "") {
			alert("비밀번호 확인을 입력하지 않으셨습니다.");
			$("#pwd2").focus();
			return false;
		} else if ($("#name").val() == "") {
			alert("이름을 입력하지 않으셨습니다.");
			$("#name").focus();
			return false;
		} else if ($("#email").val() == "") {
			alert("메일주소를 입력하지 않으셨습니다.");
			$("#email").focus();
			return false;
		} else if ($("#sample6_postcode").val() == "") {
			alert("주소를 입력하지 않으셨습니다.");
			$("#sample6_postcode").focus();
			return false;
		} else if ($("#sample6_address").val() == "") {
			alert("나머지 주소를 입력하지 않으셨습니다.");
			$("#sample6_address").focus();
			return false;
		} else if ($("#phone").val() == "") {
			alert("휴대폰 번호를 입력하지 않으셨습니다.");
			$("#phone").focus();
			return false;
		} else
			return;
	}
 $(function() {
		//아이디
		$("#id").keyup(function() {
			var id = $.trim($(this).val());
			$(this).val(id);
			$("#idInfo").load("idCheck.mem?id=" + id);
		});
		//비밀번호
		var c_pwd = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/);
		$('#pwd')
				.keyup(
						function() {
							if (!c_pwd.test($("#pwd").val())) {
								$('span[name=c_pwd]').text('');
								$('span[name=c_pwd]')
										.html(
												"<span style='color:red;'><i class='fa fa-remove'>최소 8자리 숫자, 문자, 특수문자 각각 1개 이상 포함</i></span>");
							} else {
								$('span[name=c_pwd]').text('');
								$('span[name=c_pwd]')
										.html(
												"<span style='color:blue;'><i class='fa fa-check'></i></span>");
							}
							$('span[name=c_pwd2]').text('');
						});
		$("#pwd").blur(function() {
			if (!c_pwd.test($("#pwd").val())) {
				$("#pwd").val("");
			}
		});
		//비밀번호 확인
		$('#pwd2')
				.keyup(
						function() {
							if ($('#pwd').val() != $('#pwd2').val()) {
								$('span[name=c_pwd2]').text('');
								$('span[name=c_pwd2]')
										.html(
												"<span style='color:red;'><i class='fa fa-remove'>비밀번호가 일치하지 않습니다</i></span>");
							} else {
								$('span[name=c_pwd2]').text('');
								$('span[name=c_pwd2]')
										.html(
												"<span style='color:blue;'><i class='fa fa-check'></i></span>");
							}
						});
		$("#pwd2").blur(function() {
			if ($('#pwd').val() != $('#pwd2').val()) {
				$("#pwd2").val("");
			}
		});
		//이름
		var c_name = RegExp(/^[A-Za-z가-힣]{2}/);
		$('#name')
				.keyup(
						function() {
							if (!c_name.test($("#name").val())) {
								$('span[name=c_name]').text('');
								$('span[name=c_name]')
										.html(
												"<span style='color:red;'><i class='fa fa-remove'>이름형식이 맞지 않습니다</i></span>");
							} else {
								$('span[name=c_name]').text('');
								$('span[name=c_name]')
										.html(
												"<span style='color:blue;'><i class='fa fa-check'></i></span>");
							}
						});
		$("#name").blur(function() {
			if (!c_name.test($("#name").val())) {
				$("#name").val("");
			}
		});
		//이메일
		var c_email = RegExp(/^[\w\.-]{1,64}@[\w\.-]{1,252}\.\w{2,4}$/);
		$('#email')
				.keyup(
						function() {
							if (!c_email.test($("#email").val())) {
								$('span[name=c_email]').text('');
								$('span[name=c_email]')
										.html(
												"<span style='color:red;'><i class='fa fa-remove'>이메일 형식이 맞지 않습니다</i></span>");
							} else {
								$('span[name=c_email]').text('');
								$('span[name=c_email]')
										.html(
												"<span style='color:blue;'><i class='fa fa-check'></i></span>");
							}
						});
		$("#email").blur(function() {
			if (!c_email.test($("#email").val())) {
				$("#email").val("");
			}
		});
		//핸드폰번호
		var c_phone = RegExp(/^(010|011)[-\s]?\d{3,4}[-\s]?\d{4}$/);
		$('#phone')
				.keyup(
						function() {
							if (!c_phone.test($("#phone").val())) {
								$('span[name=c_phone]').text('');
								$('span[name=c_phone]')
										.html(
												"<span style='color:red;'><i class='fa fa-remove'>휴대전화 형식이 맞지 않습니다 .</i></span>");
							} else {
								$('span[name=c_phone]').text('');
								$('span[name=c_phone]')
										.html(
												"<span style='color:blue;'><i class='fa fa-check'></i></span>");
							}
						});
		$("#phone").blur(function() {
			if (!c_phone.test($("#phone").val())) {
				$("#phone").val("");
			}
		});
	});	