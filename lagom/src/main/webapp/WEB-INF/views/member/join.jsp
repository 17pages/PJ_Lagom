<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../include/include.jsp"%>
<!-- 헤더추가할사람 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/825f57de13.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"	href="${path}/resources/css/common.css">
<style type="text/css">
* {
	font-family: Dotum, '돋움', Helvetica, sans-serif;
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

.container {
	
}

.join_content {
	width: 430px;
	margin: 0 auto;
}

.join_sns {
	padding: 20px 0;
	text-align: center;
	font-size: 12px;
	margin-bottom: 2px;
	color: #3d3c3c;
}

.join_sns>sns_logo {
	width: 100%;
	height: 78px;
	display: flex;
	justify-content: space-around;
	align-items: center;
	padding-top: 10px;
}

.sns_wrap {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100px;
	border-bottom: 1px solid #d7d6d6;
	text-align: center;
}

.naver, .facebook, .kakao {
	padding: 0 15px;
}

.row_group {
	overflow: hidden;
	width: 100%;
}

.join_title {
	margin: 16px 0 8px;
	font-size: 14px;
	font-weight: 700;
	color: black;
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

.addr_mail {
	display: flex;
	align-items: center;
}

.ps_box1 {
	display: flex;
	flex-direction: left;
	text-align: center;
	position: relative;
	width: 170px;
	height: 51px;
	border: 1px solid #dadada;
	padding: 10px 14px 10px 14px;
	background: #fff;
	vertical-align: top;
	margin-bottom: 2px;
}

.int_id {
	padding-right: 40px;
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
	margin: 9px 0 -2px;
	font-size: 12px;
	line-height: 14px;
	color: red;
	height: 15px;
	visibility: hidden;
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

.bir_wrap {
	display: table;
	width: 100%;
}

.bir_mm, .bir_dd {
	padding-left: 10px;
}

.bir_yy, .bir_mm, .bir_dd {
	display: table-cell;
	table-layout: fixed;
	width: 147px;
	vertical-align: middle;
}

.sel {
	background: #fff url('https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif') 100% 50% no-repeat;
	background-size: 20px 8px;
	width: 100%;
	height: 29px;
	font-size: 15px;
	line-height: 18px;
	color: #000;
	border: none;
	-webkit-appearance: none;
}

.choice {
	font-size: 12px;
	font-weight: 400;
	color: #8e8e8e;
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

.btn_agree {
	/*color: white;*/
	/*background-color: #8a6d5c;*/
	border-radius: 2px;
	border: none;
}

.addr_btn {
	width: 100px;
	height: 41px;
	margin-left: 7px;
}

.btn_agree:hover {
	background-color: #158bd1;
	border-color: transparent;
}

.birthday_span {
	font-size: 11px;
	font-weight: 400;
	color: #158bd1;
}

/*Footer*/
#footer {
	padding: 15px 0;
}

#footer>ul {
	/*4개일때 상 우 하 좌 (시계방향) 3개일때 상 좌우 하 2개일때 상하 좌우*/
	margin: 0 auto 9px;
	text-align: center;
}

#footer * {
	font-size: 11px;
	line-height: normal;
	list-style: none;
	color: #333;
}

#footer>ul>li {
	display: inline;
	padding: 0 5px 0 7px;
	border-left: 1px solid #dadada;
}

#footer>ul>li a:hover {
	color: #158bd1;
	text-decoration: underline;
}

#footer ul li:first-child {
	/*first child 첫번째 자식만*/
	/*!important 우선순위가 제일 높음 그래서 무조건 적용됨, 자주 쓰면 안됨
			 선택자라서 li:first-child 처럼 붙여써야함 공백있으면 안됨*/
	border-left: 0px !important;
}

#addr_logo {
	width: 63px;
	height: 11px;
}

#address {
	margin: 0 auto;
	text-align: center;
}

#address * {
	font: 9px verdana;
}

#address a {
	font-weight: bold;
}

#address a:hover {
	color: #158bd1;
}
 </style>
 </head>
<body>
	<div class="wrap">
		<header>
			<div class="header">
				<h1 class="Lagom_logo">
					<a href="${path}/" class="l_logo"></a>
				</h1>
			</div>
		</header>

		<section>
			<%--<form name="frm_member" action="${path}/member/join" method="POST" id="frm_member">--%>
			<form:form id="frm_member" modelAttribute="memberDTO" autocomplete="on">
				<div class="container">
					<div class="join_content">
						<div class="join_sns" id="simple">

							<span class="simple">SNS계정으로 간편하게 회원가입</span>
							<div class="sns_wrap">
								<div class="sns_logo">
									<a href="${path}/" class="naver"> <img
										src="${path}/resources/img/naver_round.png" width="48px" height="48px">
									</a>
								</div>

								<div class="sns_logo">
									<a href="#" class="facebook"> <img
										src="${path}/resources/img/facebook_logo2.png" width="48px"
										height="48px">
									</a>
								</div>

								<div class="sns_logo">
									<a href="#" class="kakao"> <img
										src="${path}/resources/img/ic-kakao.svg" width="50" height="50">
									</a>
								</div>
							</div>
						</div>

						<div class="row_group">

							<div class="join_row">
								<h3 class="join_title">
									<label for="id">이메일</label>
								</h3>
								<span class="ps_box int_id"> <input type="email" id="uid"
									name="id" class="int">
								</span> <span class="error_next_box">필수 정보입니다.</span>
							</div>


							<div class="join_row">
								<h3 class="join_title">
									<label for="pswd1">비밀번호</label>
								</h3>
								<span class="pw">8자이상, 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span> <span
									class="ps_box int_pass"> <input type="text" id="upw"
									name="pw" class="int"> <span class="step_url">
										<span class="pw_lock"></span>
								</span>
								</span> <span class="error_next_box">필수 정보입니다.</span>
							</div>


							<div class="join_row">
								<h3 class="join_title">
									<label for="pswd2">비밀번호 재확인</label>
								</h3>
								<span class="ps_box int_pass"> <input type="text"
									id="urpw" name="rpw" class="int"> <span
									class="step_url"> <span class="repw_lock"></span>
								</span>
								</span> <span class="error_next_box">필수 정보입니다.</span>
							</div>
						</div>


						<div class="row_group">
							<div class="join_row">
								<h3 class="join_title">
									<label for="name">이름</label>
								</h3>
								<span class="ps_box"> <input type="text" id="uname"
									name="name" class="int">
								</span> <span class="error_next_box">필수 정보입니다.</span>
							</div>



							<div class="join_row">
								<h3 class="join_title">
									<label for="email">본인 확인 이메일</label>
								</h3>
								<span class="ps_box"> <input type="text" id="uemail"
									name="email" class="int" placeholder="e-mail">
								</span> <span class="error_next_box">필수 정보입니다.</span>
							</div>

							<div class="join_row">
								<h3 class="join_title">
									<label for="phone">휴대전화</label>
								</h3>
								<span class="ps_box"> <input type="tel" id="uphone"
									name="phone" class="int" placeholder="'-'없이 입력 예)01012345678">
								</span> <span class="error_next_box">필수 정보입니다.</span>
							</div>


							<div class="join_row join_addr">
								<h3 class="join_title">
									<label for="addr">주소</label>
								</h3>
								<div class="addr_wrap">
									<div class="addr_mail">
										<span class="ps_box ps_box1"> 
										<input name = "postcode" type="text"
											id="sample6_postcode" class="int addr_only"
											placeholder="우편번호(5자리)" value="12345" readonly>
										</span> <span> <input type="button"
											onclick="sample6_execDaumPostcode()" class="addr_btn"
											id="btn_post" value="우편번호 찾기">
										</span>
									</div>

									<div class="addr_addr">
										<span class="ps_box"> <input name="addr1" type="text" id="sample6_address"
											name="mail" class="int addr_only" placeholder="주소"
											value="광주 북구 중흥동" readonly>
										</span>
									</div>

									<div class="addr_detail">
										<span class="ps_box"> <input name="addr2" type="text"
											id="sample6_detailAddress" name="mail" class="int"
											placeholder="상세주소">
										</span> <span class="error_next_box">필수 정보입니다. </span>
									</div>

								</div>
							</div>


						</div>

						<div class="btn_double_area">
							<span>
								<button type="button" href="#" id="btn_join" class="btn_type">가입하기</button>
							</span>
						</div>
					</div>
				</div>
			<%--</form>--%>
			</form:form>
		</section>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#selmail').change(function(){
			var url = $(this).val();

			if(url != 'directVal'){
				$('#email_url').val(url)
							   .prop('readonly', true);
			}else{
				$('#email_url').val('')
							   .removeAttr('readonly')
							   .focus();
			}
		});
	});

	$(function(){
		//비정상적인 접근인지 판단
		
		var flag = '${flag}';
		if(flag == 0){
			location.href="${path}/member/constract";
		}
		
		//@sessionAttributes값 확인
		//console.log('el tag : '+${memberDTO.locon})
		
		
		//비밀번호가 유효한 값인지 체크해주는 flag값
		var pwFlag = false;

		//유효성체크 여부를 알려주는 배열
		var checkArr = new Array(6).fill(false);
		//printCheckArr(checkArr);

		//유효성체크 모두 통과 or 불통 여부를 알려주는 변수
		var checkAll = true;

	
			
		// id유효성 체크 : 
		// #uid인 input태그의 값을 가져와서 체크
		// trim : 좌우여백삭제 (사이공백은 못없앰)
		$('#uid').keyup(function(){
			var id = $(this).val().trim(); 
			//사용자가 입력한 값의 좌우여백을 제거하고 id에 입력
			var result = joinValidate.checkId(id);
			//validation.js의 checkId로 유효성체크를 실행 후
			//결과를 result에 담음(code, desc)

			if(result.code == 0){
				checkArr[0] = true;
			}else{
				checkArr[0] = false;
			}


			//유효성체크 결과로 테두리색과 err메시지를 출력하는
			//함수 실행
			ckDesign(result.code, result.desc, 0, 0);
		});

		//비밀번호 유효성 체크
		$('#upw').keyup(function(){
			// 1. 사용자가 입력한 값 받기
			var pw = $.trim($(this).val());
			var rpw = $.trim($('#urpw').val());
		
			// 2. 유효성체크하기
			var result = joinValidate.checkPw(pw, rpw);
				if(result.code == 0 || result.code==10 || result.code==6){
					pwFlag=true;
				}else{
					pwFlag=false;
				}
				if(result.code == 10 ){
					checkArr[1] = 'true';
					$('.ps_box:eq(2)').css('border', '2px solid #3885ca');
					$('.error_next_box:eq(2)').css('visibility', 'visible')
											  .text(result.desc)
											  .css('color', '#3885ca');				  
				}else if(result.code ==6){
					checkArr[1] = false;
					$('.ps_box:ep(2)').css('border', '2px solid #d05339');
				}else{
					checkArr[1] = false;
				}
				


			//3. 체크 결과에 따라 디자인하기
			ckDesign(result.code, result.desc, 1, 1);
			});
		//비밀번호 재확인 유효성체크
			$('#urpw').keyup(function(){
				var pw = $.trim($('#upw').val());
				var rpw = $.trim($('#urpw').val());
			// console.log(pw+', '+rpw);
				var result = joinValidate.checkRpw(pw, rpw, pwFlag);
			
				if(result.code == 10 ){
					checkArr[1] = true;
					$('.ps_box:eq(1)').css('border', '2px solid #3885ca');
					$('.error_next_box:eq(1)').css('visibility', 'visible')
					  						  .text(result.desc)
											  .css('color', '#3885ca');	

				}else if(result.code ==6) {
					checkArr[1] = false;
					$('.ps_box:eq(1)').css('border', '2px solid #3885ca');
				}else{
					checkArr[1]=false;
				}
				
					ckDesign(result.code, result.desc, 2, 2);
		     		});

		//이름 유효성체크
		$('#uname').keyup(function(){
			var name = $.trim($(this).val());
			var result = joinValidate.checkName(name);

			if(result.code == 0) {
				checkArr[2] = true;
			}else {
				checkArr[2] = false;
			}

			ckDesign(result.code, result.desc, 3,3);
		});

		//전화번호 유효성체크
		$('#uphone').keyup(function(){
			var phone = $.trim($('#uphone').val());
			var result = joinValidate.checkPhone(phone);
			
			if(result.code == 0) {
				checkArr[3] = true;
				
			}else {
				checkArr[3] = false;
			
			}
		

			ckDesign(result.code, result.desc, 5, 5);
		});
		//email 유효성 체크
		$('#uemail').keyup(function(){
			var email = $.trim($('#uemail').val());
			var result = joinValidate.checkEmail(email);
			
			if(result.code == 0) {
				checkArr[4] = true;
				
			}else {
				checkArr[4] = false;
				
			}
		

			ckDesign(result.code, result.desc, 4,4);
		});

		$('.addr_only').click(function(){
			//사용자가 우편번호 또는 주소 input을 클릭했을때!
			$('#btn_post').click();
		});
		//상세주소를 클릭하면
		$('#sample6_detailAddress').click(function(){
			var addrPost = $('#sample6_postcode').val();
			if(addrPost == '' || addrPost.length == 0){
				$('#btn_post').click();
			}
		});
		//주소 유효성체크
		$('#sample6_detailAddress').keyup(function(){
			var addrDetail= $.trim($(this).val());
			var addrPost = $('#sample6_postcode').val();
			//console.log('우편번호: '+addrPost+' 상세주소 : ' +addrDetail);
			var result = joinValidate.checkAddr(addrDetail, addrPost);

			if(result.code ==3){//우편번호 & 주소 X
				checkArr[5] = false;
				ckDesign(result.code, result.desc, 6, 6);
				ckDesign(result.code, result.desc, 7, 6);
				
			}else if(result.code ==0) {// 성공
				checkArr[5] = true;
				ckDesign(result.code, result.desc, 6, 6);
				ckDesign(result.code, result.desc, 7, 6);
				ckDesign(result.code, result.desc, 8, 6);
				
			}else{//상세주소 통과X 한 모든 경우
				checkArr[5] = false;
				ckDesign(result.code, result.desc, 8, 6);
				
			}

		});
		//버튼 활성화
		$('.int').keyup(function(){
			var checkAll = true;

			for(var i = 0; i<checkArr.length; i++) {
				if(!checkArr[i]) {
					checkAll = false;
				}
			}
			if(checkAll){
				$('#btn_join').addClass('btn-primary');
				//$('#btn_join').prop('disabled', false);
				$('#btn_join').css('cursor', 'pointer');
			}else {
				$('#btn_join').removeClass('btn-primary');
				//$('#btn_join').prop('disabled', true);
				$('#btn_join').css('cursor', 'no-drop');
			}

		});

		//회원가입 버튼 클릭!
		$('#btn_join').click(function(){
			printCheckArr(checkArr);
			var invalidAll = true;
			//유효성체크가 전부 true이면
			for(var i = 0; i<checkArr.length; i++) {
				if(!checkArr[i]) {
					invalidAll =false;
					  $('.error_next_box:eq('+i+')').css('visibility', 'visible')
												      .css('color', '#d05339');


				}
			}



			if(invalidAll){
				alert('회원가입 성공!');
				//submit : form태그 안에 있는 데이터들을 서버단으로 전송
				//action : 목적지(membercontroller '/join')
				//method : 방법(POST : 숨겨서)
				$('#frm_member').submit();
			}else{
				alert('유효성체크를 진행해주세요!');
			}

			//하나라도 false이면

		});

	});

		function ckDesign(code, desc, line, msg) {
			if(code ==0 || code==10) { //통과 o
				$('.ps_box:eq('+line+')').css('border', '2px solid #3885ca');
				$('.error_next_box:eq('+msg+')').css('visibility', 'visible')
												.text(desc)
												.css('color', '#3885ca');
				return true;
			
			}else{ // 통과 X
					//테두리 색상변경
				$('.ps_box:eq('+line+')').css('border', '2px solid #d95339');
				//에러메시지 출력
				$('.error_next_box:eq('+msg+')').css('visibility', 'visible')
												.text(desc)
												.css('color', '#d05339');
 	 			return false;		
			}
		}
		//개발시 사용 : 유효성체크 전체여부를 출력해주는 함수 (true, false)
		function printCheckArr(checkArr){
			for(var i=0; i< checkArr.length; i++){
				console.log(i+'번지 : ' + checkArr[i]);
			}

		}
		
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr+extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

</html>