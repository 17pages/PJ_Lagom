<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- %는 스크립트릿 : java 코딩을 쓸수있게함. -->
<!-- include file : 해당 파일을 여기에 include하라는 것 / header+include가 합쳐짐-->
<%@ include file="include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LAGOM</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css">
<style type="text/css">
div.header_wrap {
	position: fixed;
	top: 0;
	z-index: 999;
	width: 100%;
	background-color: white;
	box-shadow: 0 0 1px 1px rgba(20, 23, 28, .1), 0 3px 1px 0
		rgba(20, 23, 28, .1);
	z-index: 999;
}

div.header_content {
	width: 1400px;
	margin: 0 auto;
	height: 65px;
	box-sizing: border-box;
	display: flex;
	justify-content: space-between;
	/*크기와 상관없이 가운데 세로가 수평정렬됨*/
	align-items: center;
}
/*이런거 배치할때 flex쓰는거*/
.header_content_logo {
	
}

.header_content_search {
	
}

.header_content_search_group {
	display: flex;
	align-items: center;
	background-color: #f2f3f5;
	border-radius: 2px;
}

.header_content_search_input {
	background-color: transparent;
	border-color: transparent;
	font-size: 13px;
	width: 260px;
	height: 44px;
	border-radius: 2px;
	padding: 10px 12px;
	outline: none;
	/*input 태그 focus시 파랑테두리*/
}

.header_content_search_btn {
	/* transparent : 투명으로 해줌*/
	background-color: transparent;
	border-color: transparent;
	width: 44px;
	height: 44px;
	cursor: pointer;
	color: #8a6d5c;
	border-top-right-radius: 2px;
	border-bottom-right-radius: 2px;
}

.header_content_search_btn:hover {
	background-color: #8a6d5c;
	color: white;
}

.header_content_nav {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 320px;
}

form {
	margin: 0 auto;
}

.header_content_member {
	/*width: 160px;*/
	display: flex;
	align-items: center;
	/*남아있는 여백을 space-between을 써서 끝으로 밀어버림 그래서 버튼 사이에
			여백이 있어보임.*/
	justify-content: space-between;
	flex-direction: row; /*default(생략가능)*/
}

.header_content_member>div {
	padding: 10px 0px 10px 3px;
}

.header_content_dropdwon_group {
	position: relative;
}

.header_content_dropdown_wrap:hover .header_dropdown {
	display: block;
}

.header_content_dropdwon_group>a {
	display: inline-block;
	padding: 12px 15px;
	font-weight: 600;
	border: 1px solid transparent;
	border-radius: 2px;
	height: 45px;
	color: #506763;
	/*글자를 수직으로 정렬하기 위해서. height랑 맞춰서. */
	line-height: 19px;
}

.header_content_dropdown_wrap:hover>div>a, .header_content_member_cart:hover>a
	{
	background-color: rgba(20, 23, 28, .05);
	border-color: rgba(20, 23, 28, .05);
}

.header_content_member_cart>a {
	display: inline-block;
	width: 45px;
	height: 45px;
	color: #506763;
	border: 1px solid transparent;
	text-align: center;
	padding: 12px;
	line-height: 19px;
}

.header_content_logo_img {
	max-width: 130px;
	vertical-align: middle;
}

.header_dropdown_menu {
	border-bottom-left-radius: 2px;
	border-bottom-right-radius: 2px;
	box-shadow: 0 4px 16px rgba(20, 23, 28, .15);
	background-color: white;
	padding: 10px 0;
}

.header_dropdown_menu a {
	display: inline-block;
	font-size: 15px;
	color: #505763;
	text-align: center;
	padding: 5px 15px;
	font-weight: 400;
	width: 130px;
	position: relative;
	z-index: 100;
}

.header_dropdown_menu a:hover {
	color: #668699;
	background-color: #f2f3f5;
}

.header_dropdown {
	position: absolute;
	top: 50px;
	left: 0;
	display: none;
}

.arrow {
	position: absolute;
	top: -6px;
	left: 14px;
	width: 15px;
	height: 15px;
	transform: rotate(45deg);
	background-color: white;
	border-color: transparent transparent #fff transparent;
	z-index: 99;
}

.header_content_nav>div {
	padding: 10px 0;
}

/*모달 로그인 창*/
.modal_wrap {
	top: 0;
	position: fixed;
	z-index: 1000;
	background-color: rgba(0, 0, 0, 0.4);
	overflow: auto;
	width: 100%;
	height: 100%;
	display: none;
	justify-content: center;
	align-items: center;
}

.modal_content {
	position: relative;
	width: 360px;
	height: 593px;
	padding: 25px 25px;
	background-color: white;
	box-shadow: 0 4px 10px 0 rgba(0, 0, 0, 0.2), 0 4px 20px 0
		rgba(0, 0, 0, 0.19);
	border-radius: 2px;
	overflow: hidden;
}

.login_close {
	position: absolute;
	top: 7px;
	right: 7px;
}

.login_close>button {
	color: rgb(142, 142, 142);
	border: none;
	background: white;
	font-size: 30px;
	cursor: pointer;
	outline: none;
}

.login_close>button:hover {
	color: #8a6d5c;
}

.modal_header {
	display: block;
	text-align: center;
}

.modal_header_link {
	display: block;
	margin: 25px 0 5px 0;
}

.btn_login {
	display: block;
	background-color: #8a6d5c;
	color: white;
	font-size: 17px;
	width: 100%;
	height: 50px;
	margin: 20px 0;
	padding: 13px 15px;
	line-height: 1.41;
	text-align: center;
	font-weight: bold;
	border-radius: 4px;
	border: none;
}

.btn_login:hover {
	background-color: #158bd1;
	border-color: transparent;
}

div.div_input {
	background-color: #ebeded;
	width: 100%;
	height: 50px;
	margin: 0;
	font-size: 15px;
	line-height: 50px;
	color: #424242;
	padding: 0 15px;
	margin-bottom: 10px;
	position: relative;
}

span.input_box {
	display: block;
	/*넘어간 것을 숨김*/
	overflow: hidden;
}

input.input_login {
	border-width: 0px;
	width: 260px;
	padding: 7px 0px 6px 0px;
}

#input_id, #input_pw {
	outline: none;
	width: 100%;
	height: 100%;
	background-color: #ebeded;
}

.input_pw {
	position: relative;
}

.pw_eye {
	display: flex;
	align-items: center;
	position: absolute;
	color: #aaa;
	font-size: 17px;
	top: 0px;
	right: 7px;
	cursor: pointer;
	height: 50px;
	line-height: 50px;
	width: 30px;
	text-align: center;
}

.member {
	display: flex;
	color: #3d3c3c;
	font-size: 13px;
	justify-content: center;
	text-align: center;
	font-weight: bold;
}

.simple {
	padding: 20px 0;
	font-size: 0;
	text-align: center;
	font-size: 12px;
	margin-bottom: 2px;
	color: #3d3c3c;
}

.sns_wrap {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100px;
	border-bottom: 1px solid #d7d6d6;
	text-align: center;
}

.simple>sns_logo {
	width: 100%;
	height: 78px;
	display: flex;
	justify-content: space-around;
	align-items: center;
	padding-top: 10px;
}

.naver, .facebook {
	padding: 0 9px;
}

.modal_notuser {
	text-align: center;
	display: flex;
	justify-content: center;
	font-weight: bold;
	color: #747474;
	cursor: pointer;
}

.modal_notuser:hover {
	text-decoration: underline;
}

/*top_btn*/
.fix_btn {
	z-index: 1000;
	position: fixed;
	right: 20px;
	color: black;
	width: 70px;
	height: 70px;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 30px;
	cursor: pointer;
}
/*display, justify-content, align-items : 자식 가운데에 위치하게 하고 싶을때 사용함.*/

/*0.3초만에 커짐*/
.fix_btn>i {
	transition: transform .3s;
}
/*font-size의 1.3배*/
.fix_btn:hover>i {
	transform: scale(1.3);
}

.conn_btn, .close_btn {
	bottom: 20px;
	background-color: #39569c;
}

.top_btn {
	z-index: 2000;
	bottom: 39px;
	position: fixed;
}

.fa-chevron-up:befor {
	content: "\f077";
}
</style>
</head>
<body>
	<div class="modal_wrap">
		<div class="modal_content">
			<div class="login_close">
				<button>
					<i class="fas fa-times"></i>
				</button>
			</div>

			<div class="modal_header">
				<a href="#" class="modal_header_link"> <span class="icon_lagom"><img
						src="${path}/resources/img/logo_brown.png" width="160px"
						height="80px"></span>
				</a>
			</div>


			<div class="modal_login">
				<form name="frm_login" action="loginCheck" method="POST">
					<div class="div_input" id="logom_id">
						<input type="email" placeholder="이메일" class="input_login"
							id="input_id" required> <span class="input_box"></span>
					</div>
					<div class="div_input" id="logam_pw">
						<div class="input_pw">
							<input type="password" placeholder="비밀번호" class="input_login"
								id="input_pw" required minlength="6" maxlength="18"> <span
								class="pw_eye"> <i class="fas fa-eye-slash"></i>
							</span>
						</div>
					</div>


					<div>
						<button type="submit" class="btn_login">로그인</button>
					</div>
				</form>

				<div class="member">
					<a href="#">아이디찾기</a>&nbsp; <span class="si">|</span>&nbsp; <a
						href="#">비밀번호찾기</a>&nbsp; <span class="si">|</span>&nbsp; <a
						href="${path}/member/constract">회원가입</a>
				</div>


				<div class="simple" id="simple">
					<span class="simple">SNS 계정으로 간편 로그인</span>
					<div class="sns_wrap">
						<div class="sns_logo">
							<a href="#" class="naver"><img
								src="${path}/resources/img/naver_round.png" width="48px"
								height="48px"></a>
						</div>
						<div class="sns_logo">
							<a href="#" class="facebook"><img
								src="${path}/resources/img/facebook_logo2.png" width="48"
								height="48"></a>
						</div>
						<div class="sns_logo">
							<a href="#" class="facebook"><img
								src="${path}/resources/img/ic-kakao.svg" width="50" height="50"></a>
						</div>
					</div>
				</div>

			</div>

			<div class="modal_notuser">
				<span>비회원 주문 조회하기</span>
			</div>
		</div>
	</div>











	<header>
		<div class="top_btn fix_btn">
			<i class="fas fa-chevron-up"></i>
		</div>
		<div class="header_wrap">
			<div class="header_content">
				<div class="header_content_logo">
					<a href="#"> <img class="header_content_logo_img"
						src="${path}/resources/img/logo_brown.png"> <span></span>
					</a>
				</div>

				<div class="header_content_nav">
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdwon_group">
							<!-- 네비게이션 -->
							<a href="#" class="magicline"><i class="fas fa-bars"></i>
								카테고리</a>
							<div class="header_dropdown">
								<div class="arrow"></div>
								<ul class="header_dropdown_menu">
									<li><a href="#">가구</a></li>
									<li><a href="#">패브릭</a></li>
									<li><a href="#">주방</a></li>
									<li><a href="#">생활용품</a></li>
									<li><a href="#">홈데코</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="header_content_dropdwon_group">
						<a href="#" class="magicline">스토어</a>
					</div>
					<div class="header_content_dropdwon_group">
						<a href="#" class="magicline">커뮤니티</a>
					</div>
				</div>

				<div class="header_content_search">
					<form name="frm_search" action="" method="GET">
						<div class="header_content_search_group">
							<input type="text" name="keyword" placeholder="상품검색"
								class="header_content_search_input">
							<button type="button" class="header_content_search_btn">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</form>

				</div>


				<div class="header_content_member">
					<!-- div(first) 로 더 크게 감싸버림  드롭다운 메뉴는 드롭다운 그룹에서는 나갔지만 first로 묶어놨으니까 포지션을 다르게 주었어도 작동함.-->
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdwon_group">
							<a href="#" class="user"><i class="fas fa-user"></i></a>

							<!-- dropdown 메뉴 -->
							<div class="header_dropdown">
								<div class="arrow"></div>
								<ul class="header_dropdown_menu">
									<li><a href="#">주문/배송조회</a></li>
									<li><a href="#">위시리스트</a></li>
									<li><a href="#">마이포인트</a></li>
									<li><a href="#">1:1 문의</a></li>
									<li><a href="#">회원정보수정</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div>
						<div class="header_content_member_cart">
							<a href="#"><i class="fas fa-shopping-cart"></i></a>
						</div>
					</div>
					<!-- div는 diplay특성이 inline-block -->
					<div>
						<button type="button" class="btn btn-basic login_open">로그인</button>
					</div>
					<div>
						<button type="button" class="btn btn-primary" id="header_btn_join">회원가입</button>
					</div>
				</div>
			</div>
		</div>

	</header>
</body>

<script type="text/javascript">
	//jQuery 문법
	//$('선택자').옵션();
	//$('test').css('color', 'green');
	//$=jQuery
	//('#test') = 선택자(id가 test)
	//.css() = 옵션(글자색을 녹색)

	//jQuery 이벤트 문법(클릭, 포커스, 블러 등)
	//$(document).on('이벤트', '선택자', function(){
	//             이벤트 발생시 동작할 내용들
	//});

	//$(document).on('click', '#test', function(){
	//        	$(this).css('color', 'blue');	
	//	});

	//$(document).on() 	= 문서전체에서
	//('click') 		= 클릭이벤트가 발생하면
	//(#'test') 		= 아이디가 test인
	//function() {} 	= 익명함수 (이름없는 함수)
	// $(this) 			= 나 자신(여기서는 #test)
	// 해석 : 문서전체에서 id가 test인 태그가 클릭되면 나를(#test) 글자색을 blue로
	//        변경해라 

	//로그인 input(id, pw) 에 focus되면 테두리색 변경
	$(document).on('focus', '.div_input', function() {
		$(this).css('border', '1px solid #cac9c9');
	});

	$(document).on('blur', '.div_input', function() {
		$(this).css('border', '1px solid transparent');
	});

	//click 이벤트 실행되는 지 알려면 alert('test') 이거 꼭 해봐야함~ (테스트용도)
	$(document).on('click', '.login_open', function() {
		//login 버튼 클릭시 modal창 open
		$('.modal_wrap').css('display', 'flex');
		$('#input_id').focus();

	});

	//MODAL 창의 X버튼을 클릭하면 MODAL창 Close
	$(document).on(
			'click',
			'.login_close',
			function() {
				$('.modal_wrap').css('display', 'none');
				$('.input_login').val('');
				//$('.frm_login')[0].reset();
				$('.pw_eye').prev().attr('type', 'password');
				$('.pw_eye').html('<i class="fas fa-eye-slash"></i>').css(
						'color', '#AAA');
			});

	//LOGIN modal창 암호 보이기 or 숨기기
	$(document).on(
			'click',
			'.pw_eye',
			function() {
				var code = $(this).prev().attr('type');
				//.찍고 옵션 .찍고 옵션  하는거  : 체이닝 기법
				if (code == 'password') {
					$(this).prev().attr('type', 'text');
					$(this).html('<i class="fas fa-eye"></i>').css('color',
							'#666');
				} else {
					$(this).prev().attr('type', 'password');
					$(this).html('<i class="fas fa-eye-slash"></i>').css(
							'color', '#AAA');
				}

				//값을 가져오는 방법
				// <span class="aaa"> 동토리 </spna>
				// <input type= "text" class="dobby">동비</input>

				//input태그 값 가져오는 방법
				// : 서버단으로 값을 보낼때 사용하는 태그들이 대부분
				// $('.dobby').val();
				//input태그 값 넣는 방법
				// $('.dobby').val('메롱');

				//input태그 이외의 값 가져오는 방법
				//$('.aaa').text();
				//input 태그 이외의 값 넣는 방법
				//$('.aaa').text('뭐시여??');

				//태그의 옵션(attribute)을 가져오고 싶을때
				// $('.dobby').attr('type'); 
				// $('.dobby').attr('class'); 
			});

	$(document).on('click', '#header_btn_join', function() {
		location.href = "${path}/member/constract";
	});

	$(document).ready(function() {

		$('.top_btn').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 800);
		});

	});
</script>
</html>