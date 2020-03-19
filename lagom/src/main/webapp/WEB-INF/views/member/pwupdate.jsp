<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/825f57de13.js"
	crossorigin="anonymous">
	
</script>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css"">
<style type="text/css">
* {
	
	box-sizing: border-box;
}

body, h1, h2, h3, h4, h5, h6, ul, p {
	margin: 0;
	padding: 0;
}

body {
	background-color: #f5f6f7;
	font-size: 12px;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
	color: inherit;
}

.wrap {
	width: 768px;
	margin: 0 auto;
}

.header {
	padding: 40px 0px 20px;
	position: relative;
}

.l_logo {
	display: block;
	width: 250px;
	height: 90px;
	background: url("${path}/resources/img/logo_brown.png") 50% 50%;
	background-size: cover;
	margin: 0 auto;
}

.pwupdate_content {
	width: 430px;
	margin: 0 auto;
}

.pw_group {
	overflow: hidden;
	width: 100%;
}

.pwupdate_line {
	border-bottom: 1px solid #d7d6d6;
}

.pw_title {
	padding: 20px 0px;
	text-align: left;
	font-size: 12px;
}

.ps_box {
	display: flex;
	align-items: center;
	position: relative;
	width: 100%;
	height: 51px;
	border: 1px solid #dadada;
	padding: 10px 14px 10px 14px;
	background: #fff;
	vertical-align: top;
	margin-bottom: 2px;
}

.pw_lock {
	background-image:
		url('https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png');
	background-repeat: no-repeat;
	background-size: 125px 75px;
	cursor: pointer;
	width: 24px;
	height: 24px;
	display: inline-block;
}

.repw_lock {
	background-image:
		url('https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png');
	background-repeat: no-repeat;
	background-size: 125px 75px;
	cursor: pointer;
	width: 24px;
	height: 24px;
	display: inline-block;
	background-position: -27px 0;
}

.int_pass {
	padding-right: 40px;
}

.int {
	display: block;
	position: relative;
	width: 100%;
	height: 29px;
	padding-right: 25px;
	line-height: 29px;
	border: none;
	background: #fff;
	font-size: 15px;
	z-index: 10;
	outline: none;
}

.step_url {
	position: absolute;
	right: 13px;
	font-size: 15px;
	color: #8e8e8e;
}

.error_next_box {
	display: block;
	margin-bottom: 8px;
	font-size: 12px;
	line-height: 14px;
	color: red;
	height: 15px;
	visibility: hidden;
}

.btn_double_area {
	margin: 30px 0 9px;
}

.btn_type {
	display: block;
	width: 100%;
	padding: 21px 0 17px;
	font-size: 20px;
	font-weight: 700;
	text-align: center;
	cursor: no-drop;
	border: none;
}
</style>
</head>
<body>
	<div class="wrap">
		<header>
			<div class="header">
				<h1 class="Lagom_logo">
					<a href="#" class="l_logo"></a>
				</h1>
			</div>
		</header>

		<section>
			<form:form  id="frm_member" modelAttribute="memberDTO" autocomplete="on">
				<div class="container">
					<div class="pwupdate_content">
						<div class="pwupdate_line"></div>


						<div class="pw_group">
							<div class="pw_row"></div>
							<div class="pw_title">
								<span><strong>* 안전한 비밀번호로 내 정보를 보호</strong>하세요.</span><br>
								<span>* 다른 아이디/사이트에서 사용한 적 없는 비밀번호</span><br> 
								<span>*	이전에 사용한 적 없는 비밀번호가 안전합니다.</span>
							</div>
						</div>

						<div class="pw_group">
							<div class="pw_row">
								<h3 class="join_title">
									<label for="pswd1">현재 비밀번호</label>
								</h3>

								<span class="ps_box int_pass"> 
									<input type="password" id="nowpw" name="nowpw" class="int"> 
									<span class="step_url"> <span class="pw_lock"></span>
								</span>
								</span> <span class="error_next_box">필수 정보입니다.</span>
							</div>


							<div class="pw_row">
								<h3 class="join_title">
									<label for="pswd1">수정할 비밀번호</label>
								</h3>
								<span class="pw">8자이상, 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span> 
								<span class="ps_box int_pass"> <input type="password" id="upw" name="pw" class="int"> 
								<span class="step_url">	<span class="pw_lock"></span> </span>
								</span> 
								<span class="error_next_box">필수 정보입니다.</span>
							</div>

							<div class="pw_row">
								<h3 class="join_title">
									<label for="pswd2">비밀번호 재확인</label>
								</h3>
								<span class="ps_box int_pass"> 
									<input type="password" id="urpw" name="rpw" class="int"> 
									<span class="step_url">	<span class="repw_lock"></span>	</span>
								</span> 
								<span class="error_next_box">필수 정보입니다.</span>
							</div>
						</div>

						<div class="btn_double_area">
							<span>
								<button type="button" href="#" id="btn_join" class="btn_type">수정하기</button>
							</span>
						</div>
					</div>
				</div>
			</form:form>
		</section>
</body>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	//document붙는애들은 독단으로 쓰겠다는 것 ==> 전역변수 만들었을때 공유 안함
	// 안붙은 애들은 공유해서 쓰겠다. ===> 전역변수만들었을때 공유하겠음
	//그래서 쓰고 싶으면 $(document).ready(function(){}) 안에 넣어줘야함.

	$(document).ready(function() {
		var pwFlag = false;
		var checkArr = new Array(2).fill(false);
		//var name ='응~' <- upw, urpw 가 다 쓸수 있음.
		// $(document).ready(function(){}); == $(function(){}); 같음 약식표현임.
		$('#nowpw').keyup(function() {
			var nowpw = $(this).val();
			//console.log('입력 :' + nowpw); 체크하는법
			//code 1,2, 6, 100 이 올수있음
			var result = joinValidate.checkNowpw(nowpw);
 				console.log("code:" + result.code);
				ckDesign(result.code, result.desc, 0, 0);

				if (result.code == 100) {
					checkArr[0] = true;
				} else {
					checkArr[0] = false;
				}
			});

		$('#upw').keyup(function() {
			var nowpw = $.trim($('#nowpw').val());
			var pw = $.trim($('#upw').val());
			var rpw = $.trim($('#urpw').val());

			var result = joinValidate.checkPw(nowpw, pw, rpw);
			if (result.code == 0 || result.code == 10 || result.code == 6) {
				pwFlag = true;
			} else {
				pwFlag = false;
			}

			ckDesign(result.code, result.desc, 1, 1);

			if (result.code == 10) {
				checkArr[1] = true;
					$('.ps_box:eq(1)').css('border', '1px solid #3885ca');
					$('.error_next_box:eq(1)').css('visibility','visible')
											  .text(result.desc).css('color', '#3885ca');
			} else if (result.code == 6) {
				checkArr[1] = false;
					$('.ps_box:eq(1)').css('border','2px solid #3885ca');
							} else {
								checkArr[1] = false;
							}
						});
				//비밀번호 재확인 유효성체크
				$('#urpw')
						.keyup(
								function() {
									var pw = $.trim($('#upw').val());
									var rpw = $.trim($('#urpw').val());

									var result = joinValidate.checkRpw(pw, rpw,
											pwFlag);

									if (result.code == 10) {
										checkArr[1] = true;
										$('.ps_box:eq(1)').css('border',
												'1px solid #3885ca');
										$('.error_next_box:eq(1)').css(
												'visibility', 'visible').text(
												result.desc).css('color',
												'#3885ca');

									} else if (result.code == 6) {
										checkArr[1] = false;
										$('.ps_box:eq(1)').css('border',
												'2px solid #3885ca');
									} else {
										checkArr[1] = false;
									}

									ckDesign(result.code, result.desc, 2, 2);
								});

				$('.int').keyup(function() {
					printCheckArr(checkArr);
					ckColorBtn();
				});
				function ckColorBtn() {
					var checkAll = true;
					for (var i = 0; i < checkArr.length; i++) {
						if (!checkArr[i]) {
							checkAll = false;
						}
					}
					if (checkAll) {
						$('#btn_join').addClass('btn-primary');
						//$('#btn_join').prop('disabled', false);
						$('#btn_join').css('cursor', 'pointer');
					} else {
						$('#btn_join').removeClass('btn-primary');
						//$('#btn_join').prop('disabled', true);
						$('#btn_join').css('cursor', 'no-drop');
					}
				}

				$('#btn_join').click(
						function() {
							var invalidAll = true;
							//유효성체크가 전부 true이면
							for (var i = 0; i < checkArr.length; i++) {
								if (!checkArr[i]) {
									invalidAll = false;
									$('.error_next_box:eq(' + i + ')').css(
											'visibility', 'visible').css(
											'color', '#d05339');
								}
							}

							if (invalidAll) {
								$('#frm_member').submit();
							} else {
								alert('유효성체크를 진행해주세요!');
							}
						});

			});

	function ckDesign(code, desc, line, msg) {
		if (code == 0 || code == 10 || code == 100) { //통과 o
			$('.ps_box:eq(' + line + ')').css('border', '1px solid #3885ca');
			$('.error_next_box:eq(' + msg + ')').css('visibility', 'visible')
					.text(desc).css('color', '#3885ca');

			return true;

		} else { // 통과 X
			//테두리 색상변경
			$('.ps_box:eq(' + line + ')').css('border', '2px solid #d95339');
			//에러메시지 출력
			$('.error_next_box:eq(' + msg + ')').css('visibility', 'visible')
					.text(desc).css('color', '#d05339');
			return false;
		}
	}
	function printCheckArr(checkArr) {
		for (var i = 0; i < checkArr.length; i++) {
			console.log(i + '번지 : ' + checkArr[i]);
		}
	}
</script>



</html>