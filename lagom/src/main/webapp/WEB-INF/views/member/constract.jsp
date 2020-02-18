<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%><!-- 헤더 추가 안하고 디자인만 하실분 --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/825f57de13.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="../../../css/common.css">

</head>
<body>
<div class="wrap">
		<header>
			<!-- div는 내용이 없으면 자리차지를 안하기때문에 나오지 않음. width, height를 줘야함 -->
			<div id="header">
				<h1 class="naver_logo">
					<a href="#" class="n_logo"></a>
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
							<span class="terms_span">
								<input type="checkbox" id="cbox">
								<label for="cbox">
									이용약관, 개인정보 수집 및 이용,<br> 위치정보 이용약관(선택),<br>
									프로모션 안내 메일 수신(선택)에 모두 동의합니다.
								</label>
							</span>
						</p>

						<ul class='terms_ul'>
							<li class="terms_ul_li1">
								<span class="ul_li_span">
									<input type="checkbox" id="li1box" class="ckboxs">
									<label for="li1box" class="label1">
										Lagom 이용약관 동의 <span class="span_only">(필수)</span>
									</label>
								</span>
								<div class="terms_box">
									<div class="article">
										<h3 class="article_title">여러분을 환영합니다.</h3>
										<p>Lagom 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본
										 약관은 다양한 Lagom 서비스의 이용과 관련하여 Lagom 서비스를 제공
										 하는 Lagom 주식회사(이하 ‘Lagom’)와 이를 이용하는 Lagom 서비스
										 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의
										 Lagom 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다
										<br>	
										Lagom 서비스를 이용하시거나 Lagom 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.	
										</p>
									</div>
								</div>
							</li>

							<li class="terms_ul_li2">
								<span class="ul_li_span">
									<input type="checkbox" id="li2box" class="ckboxs">
									<label for="li2box" class="label1">
										개인정보 수집 및 이용에 대한 안내 <span class="span_only">(필수)</span>
									</label>
								</span>
								<div class="terms_box">
									<div class="article">
										
										<p>	정보통신망법 규정에 따라 Lagom에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
										</p>
										<h3 class="article_title">1. 수집하는 개인정보</h3>
									</div>
								</div>
							</li>

							<li class="terms_ul_li3">
								<span class="ul_li_span">
									<input type="checkbox" id="li3box" class="ckboxs">
									<label for="li3box" class="label1">
										위치정보 이용약관 동의 <span class="span_select">(선택)</span>
									</label>
								</span>
								<div class="terms_box">
									<div class="article">
										
										<p>위치정보 이용약관에 동의하시면, <strong>위치를 활용한 광고 정보 수신</strong> 등을 포함하는 Lagom 위치기반 서비스를 이용할 수 있습니다.
										</p>
										<h3 class="article_title">제 1 조 (목적)</h3>
									</div>
								</div>
							</li>
							
							<li class="terms_ul_li4">
								<span class="ul_li_span">
									<input type="checkbox" id="li4box" class="ckboxs">
									<label for="li4box" class="label1">
										이벤트 등 프로모션 알림 메일 수신 <span class="span_select">(선택)</span>
									</label>
								</span>
							</li>
						</ul>
					</div>

					<div class="err_check">
						<span class="err_check_msg">Lagom 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</span>
					</div>

					<div class="btn_double_area">
						<span><a href="#" class="btn_type btn_default">취소</a></span>
						<span><a href="#" class="btn_type btn_agree">확인</a></span>
					</div>
				</form>

				<div class="group_join">
					회사, 동아리 등 단체에서 사용할 ID가 필요하세요? <a href="#">단체 회원 가입</a>
				</div>
			</div>
		</section>
		
		<footer>
			<div id="footer">
			<ul>
				<li><a href="#">이용약관</a></li>
				<li><strong><a href="#">개인정보처리방침</a></strong></li>
				<li><a href="#">책임의 한계와 법적고지</a></li>
				<li><a href="#">회원정보 고객센터</a></li>
			</ul>

			<div id="address">
				<span>Copyright</span>
				<span>ⓒ</span>
				<span><strong><a href="#">LAGOM Corp.</a></strong></span>
				<span>All Rights Reserved.</span>
			</div>
		</div>
		</footer>

	</div>

</body>
</html>