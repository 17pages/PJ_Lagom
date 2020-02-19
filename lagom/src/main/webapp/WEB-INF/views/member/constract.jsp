<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%> <!--헤더 추가 안하고 디자인만 하실분  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/825f57de13.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<style type="text/css">
/*Coommon*/
/*기본적으로 태그에 margin 또는 padding이 있어서 0으로 만들어줌, 그렇지 않으면 깨짐*/
* {
	box-sizing: border-box;
	/*앞에꺼 없으면 뒤로 감. 있는거 까지 */
	font-family: Dotum, 돋움, Helvetica, sans-serif;
}

body, ul, h1, h2, h3, h4, h5, h6 {
	margin: 0;
	padding: 0;
}

body {
	background-color: #f5f6f7;
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
/*Header*/
#header {
	height: 169px;
	padding-top: 62px;
	position: relative;
}

#container {
	position: relative;
}

#footer {
	height: 81px;
	text-align: center;
	padding: 30px 0px 15px 0px;
}

.naver_logo {
	font-size: 2em;
}

.n_logo {
	display: block;
	width: 250px;
	height: 90px;
	background: url('${path}/resources/img/logo_brown - copy.png') 50% 50%;
	background-size: cover;
	margin: 0 auto;
}

.lang {
	position: absolute;
	top: 14px;
	right: 0px;
}

.langselect {
	font-size: 12px;
	font-weight: 400;
	height: 30px;
	padding: 6px 8px 5px 7px;
	min-width: 98px;
	color: #333;
	border: 1px solid #ccc;
	/*select의 삼각형 버튼 없애버림*/
}

.lang>select {
	background: url('${path}/resources/img/sel_arr.gif') 100% 50% no-repeat;
	-webkit-appearance: none;
	background-color: white;
}

/*Container*/
.join_content {
	width: 460px;
	margin: 0 auto;
}

.terms {
	margin-bottom: 16px;
	background-color: white;
	border: 1px solid #dadada;
}

.terms_span>input {
	position: absolute;
	right: 1px;
	top: 50%;
	width: 22px;
	/*-를 줘서 들어가게함*/
	margin-top: -11px;
	visibility: hidden;
}

.terms_p {
	display: block;
	padding: 15px;
	margin: 0px;
	position: relative;
}

.terms_span>label {
	background: url('${path}/resources/img/check_off.gif') 100% 50% no-repeat;
	display: block;
	line-height: 20px;
	height: 58px;
	top: -1px;
	font-style: 14px;
	font-weight: 700;
}

.terms_span {
	position: relative;
	display: block;
	height: 58px;
}

.terms_span>input:checked+label {
	background-image: url('${path}/resources/img/icons8-checked-24.png');
}

.terms_ul {
	padding-bottom: 7px;
}

.terms_ul_li1 {
	border-top: 1px solid #f0f0f0;
}

ul.terms_ul>li {
	display: block;
	padding: 13px 15px 7px;
}

.ul_li_span {
	position: relative;
	display: block;
	height: 24px;
}

.label1 {
	height: 24px;
	font-size: 14px;
	font-weight: 700;
	line-height: 24px;
	position: absolute;
	color: #333;
	top: 0px;
	left: 0px;
	width: 100%;
}

.span_only {
	color: #158bd1;
	font-size: 12px;
	font-weight: 400;
}

.ul_li_span>input {
	visibility: hidden;
	position: absolute;
	right: 1px;
	width: 22px;
	height: 22px;
	margin-top: -11px;
	top: 50%;
}

.ul_li_span>label {
	background: url('${path}/resources/img/check_off.gif') 100% 50% no-repeat;
	display: block;
}

.ul_li_span>input:checked+label {
	background-image: url('${path}/resources/img/icons8-checked-24.png');
}

.terms_box {
	position: relative;
	box-sizing: border-box;
	height: 88px;
	margin-top: 11px;
	padding: 8px 10px;
	border: 1px solid #f0f0f0;
	background-color: #f7f7f7;
	overflow: auto;
}

h3.article_title {
	font-size: 12px;
	font-weight: 700;
	line-height: 16px;
	color: #666;
}

.article>p {
	display: block;
	font-size: 12px;
	line-height: 16px;
	color: #666;
}

.span_select {
	color: #969696;
	font-size: 12px;
	font-weight: 400;
}

.err_check_msg {
	height: 24px;
	font-size: 12px;
	line-height: 14px;
	color: #f46665;
	display: block;
}

.err_check {
	visibility: hidden;
}

.btn_double_area {
	margin: 10px -5px 0px;
	overflow: hidden;
}

.btn_double_area>span {
	display: block;
	float: left;
	width: 50%;
}

.btn_type {
	width: 96%;
	margin: 0px 5px;
	font-size: 20px;
	font-weight: 600;
	line-height: 61px;
	display: block;
	box-sizing: border-box;
	height: 61px;
	padding-top: 1px;
	text-align: center;
	cursor: pointer;
	
}

.btn_default {
	color: #333;
	border: 1px solid #e7e7e7;
	background-color: #fff;
}

.btn_agree {
	color: #fff;
	border: 1px solid #8a6d5c;
	background-color: #8a6d5c;
}

.group_join {
	margin: 20px 0px 65px;
	text-align: center;
	color: #666;
	font-size: 12px;
}

.group_join>a {
	text-decoration: underline;
	color: #333;
}

.btn_agree:hover {
	background-color: #158bd1;
	border-color: transparent;
}
</style>

</head>
<body>
	<div class="wrap">
		<header>
			<!-- div는 내용이 없으면 자리차지를 안하기때문에 나오지 않음. width, height를 줘야함 -->
			<div id="header">
				<h1 class="naver_logo">
					<a href="${path}/" class="n_logo"></a>
				</h1>
				<div class="lang">
					<!-- static -->
					<select class="langselect">
						<option>한국어</option>
						<option>English</option>
						<option>中文(简体)</option>
						<option>中文(台灣)</option>
					</select>
				</div>
			</div>
		</header>

		<section>
			<div id="container">
				<form class="join_content" name="" action="" method="">
					<div class="terms">
						<p class="terms_p">
							<span class="terms_span"> <input type="checkbox" id="cbox">
								<label for="cbox"> 이용약관, 개인정보 수집 및 이용,<br> 위치정보
									이용약관(선택),<br> 프로모션 안내 메일 수신(선택)에 모두 동의합니다.
							</label>
							</span>
						</p>

						<ul class='terms_ul'>
							<li class="terms_ul_li1"><span class="ul_li_span"> <input
									type="checkbox" id="cons_box1" class="ckboxs"> <label
									for="cons_box1" class="label1"> Lagom 이용약관 동의 <span
										class="span_only">(필수)</span>
								</label>
							</span>
								<div class="terms_box">
									<div class="article">
										<h3 class="article_title">여러분을 환영합니다.</h3>
										<p>
											Lagom 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 Lagom 서비스의
											이용과 관련하여 Lagom 서비스를 제공 하는 Lagom 주식회사(이하 ‘Lagom’)와 이를 이용하는
											Lagom 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 Lagom 서비스
											이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다 <br> Lagom 서비스를 이용하시거나
											Lagom 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로,
											잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
										</p>
									</div>
								</div></li>

							<li class="terms_ul_li2"><span class="ul_li_span"> <input
									type="checkbox" id="cons_box2" class="ckboxs"> <label
									for="cons_box2" class="label1"> 개인정보 수집 및 이용에 대한 안내 <span
										class="span_only">(필수)</span>
								</label>
							</span>
								<div class="terms_box">
									<div class="article">

										<p>정보통신망법 규정에 따라 Lagom에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의
											수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>
										<h3 class="article_title">1. 수집하는 개인정보</h3>
									</div>
								</div></li>

							<li class="terms_ul_li3"><span class="ul_li_span"> <input
									type="checkbox" id="cons_box3" class="ckboxs"> <label
									for="cons_box3" class="label1"> 위치정보 이용약관 동의 <span
										class="span_select">(선택)</span>
								</label>
							</span>
								<div class="terms_box">
									<div class="article">

										<p>
											위치정보 이용약관에 동의하시면, <strong>위치를 활용한 광고 정보 수신</strong> 등을 포함하는
											Lagom 위치기반 서비스를 이용할 수 있습니다.
										</p>
										<h3 class="article_title">제 1 조 (목적)</h3>
									</div>
								</div></li>

							<li class="terms_ul_li4"><span class="ul_li_span"> <input
									type="checkbox" id="cons_box4" class="ckboxs"> <label
									for="cons_box4" class="label1"> 이벤트 등 프로모션 알림 메일 수신 <span
										class="span_select">(선택)</span>
								</label>
							</span></li>
						</ul>
					</div>

					<div class="err_check">
						<span class="err_check_msg">Lagom 이용약관과 개인정보 수집 및 이용에 대한 안내
							모두 동의해주세요.</span>
					</div>

					<div class="btn_double_area">
						<span><button type="button" class="btn_type btn_default" id="cons_btn_cancel">취소</button></span> 
						<span><button type="button" class="btn_type btn_agree" id="cons_btn_agree">확인</button></span>
					</div>
				</form>

				<div class="group_join">
					회사, 동아리 등 단체에서 사용할 ID가 필요하세요? <a href="#">단체 회원 가입</a>
				</div>
			</div>
		</section>

	</div>

</body>
<script type="text/javascript">
	$(document).ready(function(){
		/*전체선택 체크시 전체 체크 or 전체 체크해제*/
		$('#cbox').on('click', function(){
			var flag = $(this).is(':checked');//체크여부(bool값)
			if(flag==true){
				$('.ckboxs').prop('checked', true); //체크
			}else{
				$('.ckboxs').prop('checked', false);//체크해제, checked쓸때는 prop함수쓰기~
			}
			
		});
		/*선택체크가 모두 체크되면 전체체크버튼 True
		  선택체크가 하나라도 체크해제이면 전체체크버튼 False*/
		  $('.ckboxs').on('click', function(){
			  var ckLen = $('.ckboxs:checkbox:checked').length;//class가 ckboxs중에서 checked된것만 알려달라
			  
			  if(ckLen !=4){
				  $('#cbox').prop('checked', false);
			  }else{
				  $('#cbox').prop('checked', true);
			  }
		  });
		/*확인버튼 클릭시 필수체크(2개) 체크유무 유효성 체크*/
		$('#cons_btn_agree').on('click', function(){
			var agree_one = $('#cons_box1').is(':checked');
			var agree_two = $('#cons_box2').is(':checked');
			var agree_three = $('#cons_box3').is(':checked');
			var agree_four = $('#cons_box4').is(':checked');
			
			/*console.log('동의1 : ' + agree_one);
			console.log('동의2 : ' + agree_two);
			console.log('동의3 : ' + agree_three);
			console.log('동의4 : ' + agree_four);*/
			
			if(agree_one == false || agree_two == false) {
				$('.err_check').css('visibility', 'visible');
				return false;
			}
			
			location.href="${path}/member/join?useon="+agree_one
													+"&primaryon="+agree_two
													+"&locon="+agree_three
													+"&eventon"+agree_four;
		
		});
		/*취소버튼 클릭시 INDEX페이지로 이동*/
		$('#cons_btn_cancel').on('click', function(){
			location.href='${path}/';
		});
	});
</script>
</html>