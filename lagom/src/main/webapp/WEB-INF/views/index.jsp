<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<script src="https://kit.fontawesome.com/825f57de13.js" crossorigin="anonymous"></script>
<style type="text/css">
div.content_wrap {
	margin-top: 65px;
	width: 100%;
	background-color: #f1f1f2;
}

div.content {
	width: 1400px;
	margin: 0 auto;
	max-width: 100%;
	min-height: 1px;
	box-sizing: border-box;
}

a {
	color: none;
	text-decoration: none;
}

/*중간 네비*/
.shortcut_list {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: start;
	justify-content: space-around;
	flex-wrap: wrap;
	box-sizing: border-box;
	margin: 20px 180px;
	padding-top: 5px;
}

.row {
	align-items: center;
}

.shortcut_list_item_link_title {
	display: block;
	text-align: center;
	font-weight: bold;
	line-height: 2;
	font-size: 15px;
	margin: 4px 0px 10px;
	color: #141414;
}

.shortcut_list_item_link_img {
	
	border-radius: 5px;
	width: 100px;
	height: 80px;
	padding: 0 10px;
	margin: 4px;
	transition: all ease 0.7s;
}
.shortcut_list_item_link_img:hover{
		transform: scale(1.1);
}


.round {
	overflow: hidden;
	border-radius: 3px;
}
/*홈스윗홈*/
.today_home_jarang {
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	-moz-align-items: center;
	align-items: center;
	margin-bottom: 15px;
	
}

.today_home_sweet_home {
	font-weight: 700;
	font-size: 18px;
	color: #000;
	margin-top : 7px;
	margin-bottom: 10px;
}

.sweet_story_imgwrap {
	position: relative;
	overflow: hidden;
	border-radius: 6px;
	height: 180px;
	width: 270px;
}

.sweet_story_content_title {
	font-weight: bold;
	line-height: 1.3;
	text-overflow: ellipsis;
	overflow: hidden;
	word-wrap: break-word;
	color: black;
	font-size: 15px;
}

.sweet_story_content {
	padding: 16px 1px;
	height: 122px;
	box-sizing: border-box;
}

.sweet_story_profile {
	margin-top: 5px;
	font-weight: 400;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	align-items: center;
}

.col {
	-ms-flex-preferred-size: 0;
	flex-basis: 0;
	-ms-flex-positive: 1;
	flex-grow: 1;
	max-width: 100%;
	position: relative;
	width: 100%;
	min-height: 1px;
	box-sizing: border-box;
	padding-right: 5px;
	padding-left: 5px;
}

.home_sweet_content {
	-webkit-box-align: stretch;
	-webkit-align-items: stretch;
	-moz-align-items: stretch;
	align-items: stretch;
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-flex-wrap: wrap;
	-moz-flex-wrap: wrap;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	box-sizing: border-box;
	margin-right: -10px;
	margin-left: -10px;
	padding : 0 10px;
	
}

.col-md-3 {
	padding-right: 10px;
	padding-left: 10px;
}

.home_sweet_content_item {
	padding-right: 10px;
	padding-left: 10px;
	width: 286px;
}

.article {
	display: block;
}

.sweet_story_link {
	display: flex;
	flex-direction: column;
}

.sweet_story_profile_img {
	display: inline-block;
	border-radius: 100%;
	margin-right: 5px;
	background-size: cover;
	background-position: 50%;
	width: 20px;
	height: 20px;
}

.sweet_story_img {
	transition: all ease 0.7s;
	width: 100%;
}

.sweet_story_img:hover {
	transform: scale(1.1);
}

.sweet_home_content_menu_wrap {
	display: flex;
	flex-direction: column;
	align-items: stretch;
}

.sweet_content_menu {
	flex: 1 0 auto;
	display: flex;
	flex-direction: column;
	margin: -.5px 0;
	overflow: hidden;
	align-items: stretch;
	width: 170px;
	padding-right: 10px;
	padding-right: 10px;
}

.sweet_content_choice {
	height: 45px;
	align-items: center;
	diplay: flex;
	justify-content: left;
	margin: .5px 0;
	padding-left: 13px;
	padding-top: 13px;
	background-color: #ededed;
	transition: background-color .1s;
}

.sweet_content_choice:hover {
	background-color: #dadada;
}

.sweet_content_content {
	align-items: center;
	display: flex;
	justify-content: space-between;
	padding-right : 13px;
}

.sweet_content_content>.title {
	display: flex;
	font-size: 13px;
	font-weight: 700;
	color: #424242;
}

.sweet_content_content>.title>.arrow_in {
	flex: 0 0 auto;
	margin-left: 3px;
	vertical-align: 1px;
	width: 5px;
	height: 5px;
	border: 1px solid #757575;
	border-width: 1px 1px 0 0;
	transform: rotate(45deg);
}

.text {
	color: #141414;
	font-weight: bold;
	font-size: 15px;
}

.arrow_img {
	width: 12px;
	height: 12px;
}

/*제품-추천*/
.more_plus {
	color: #158bd1;
	margin-top: 10px;
	font-weight: 900;
}

.today_home_reco, .today_special_reco {
	display: flex;
	margin-right: 15px;
}
.today_reco, .home_jarang, .special_reco{
width : 1040px;
background-color : white;
margin-left : 174px;
margin-bottom : 15px;
padding : 5px;
}

.today_reco_itemwrap {
	
	display: flex;
}

.today_special_itemwrap {
	
	display: flex;
	justify-content: center;
}

.item_wrap {
	width: 300px;
	height: 300px;
	padding: 0 10px;
}

.special_wrap {
	width: 500px;
	height: 400px;
	padding: 0 10px;
}

.reco_item, .special_item {
	padding: 5px 0;
}

.special_img {
	
}

.item_img, .special_img {
	display: flex;
	overflow: hidden;
	justify-content: center;
	border-radius: 6px;
}

.item_img_p, .special_img_p {
	width: 100%;
	height: 100%;
	border-radius: 6px;
	transition: all ease 0.7s;
}

.special_img_p:hover {
	transform: scale(1.1);
}

.item_img_p:hover {
	transform: scale(1.1);
}

.item_content, .special_content {
	margin-left: 5px;
}

.item_header, .special_header {
	margin-top: 10px;
	margin-bottom: 5px;
}

.item_brand, .special_brand {
	display: block;
	font-size: 11px;
	line-height: 13px;
	color: #757575;
	margin-bottom: 9px;
}

.item_name, .special_name {
	font-weight: bold;
	display: block;
	font-size: 15px;
	font-weight: 600;
	line-height: 19px;
	color: #424242;
	transition: opacity .1s;
	max-height: 57px;
	overflow: hidden;
	text-overflow: ellipsis;
	word-wrap: break-word;
}

.item_content_content {
	display: block;
	font-size: 17px;
	line-height: 23px;
	font-weight: 700;
}

.item_discount {
	color: #f77;
	margin-right: 2px;
}

.item_price {
	color: #000;
	font-size: 17px;
	line-height: 23px;
	font-weight: 700;
}

/* 홈 배너*/
/*GLOBALS*/
* {
	margin: 0;
	padding: 0;
	list-style: none;
}

a {
	text-decoration: none;
	color: #666;
}

a:hover {
	color: none;
}

body, hmtl {
	background: #ecf0f1;
	font-family: 'Anton', sans-serif;
}

#wrapper {
	width: 1000px;
	margin: 50px auto;
	height: 600px;
	position: relative;
	color: #fff;
	text-shadow: rgba(0, 0, 0, 0.1) 2px 2px 0px;
}

#slider-wrap {
	width: 1000px;
	height: 600px;
	position: relative;
	overflow: hidden;
	align-items: center;
}

#slider-wrap ul#slider {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
}

#slider-wrap ul#slider li {
	float: left;
	position: relative;
	width: 1000px;
	height: 600px;
}

#slider-wrap ul#slider li>div {
	position: absolute;
	top: 20px;
	left: 35px;
}

#slider-wrap ul#slider li>div h3 {
	font-size: 36px;
	text-transform: uppercase;
}

#slider-wrap ul#slider li>div span {
	font-family: Neucha, Arial, sans serif;
	font-size: 21px;
}

#slider-wrap ul#slider li img {
	display: block;
	width: 100%;
	height: 100%;
}

/*btns*/
.btns {
	position: absolute;
	width: 50px;
	height: 60px;
	top: 50%;
	margin-top: -25px;
	line-height: 57px;
	text-align: center;
	cursor: pointer;
	background: rgba(0, 0, 0, 0.1);
	z-index: 100;
	-webkit-user-select: none;
	-moz-user-select: none;
	-khtml-user-select: none;
	-ms-user-select: none;
	-webkit-transition: all 0.1s ease;
	-moz-transition: all 0.1s ease;
	-o-transition: all 0.1s ease;
	-ms-transition: all 0.1s ease;
	transition: all 0.1s ease;
}

.btns:hover {
	background: rgba(0, 0, 0, 0.3);
}

#next {
	right: -50px;
	border-radius: 7px 0px 0px 7px;
}

#previous {
	left: -50px;
	border-radius: 0px 7px 7px 7px;
}

#counter {
	top: 30px;
	right: 35px;
	width: auto;
	position: absolute;
}

#slider-wrap.active #next {
	right: 0px;
}

#slider-wrap.active #previous {
	left: 0px;
}

/*bar*/
#pagination-wrap {
	min-width: 20px;
	margin-top: 560px;
	margin-left: auto;
	margin-right: auto;
	height: 15px;
	position: relative;
	text-align: center;
}

#pagination-wrap ul {
	width: 100%;
}

#pagination-wrap ul li {
	margin: 0 4px;
	display: inline-block;
	width: 5px;
	height: 5px;
	border-radius: 50%;
	background: #fff;
	opacity: 0.5;
	position: relative;
	top: 0;
}

#pagination-wrap ul li.active {
	width: 12px;
	height: 12px;
	top: 3px;
	opacity: 1;
	box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
}

.fa-arrow-left, .fa-arrow-right {
	margin-top: 25px;
}

/*Header*/
h1, h2 {
	text-shadow: none;
}

h1 {
	color: #666;
	text-transform: uppercase;
	font-size: 36px;
}

h2 {
	color: black;
	font-family: Neucha, Arial, sans serif;
	font-size: 18px;
	margin-bottom: 30px;
}

/*ANIMATION*/
#slider-wrap ul, #pagination-wrap ul li {
	-webkit-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-moz-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-o-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-ms-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	transition: all 0.3s cubic-bezier(1, .01, .32, 1);
}





</style>
</head>
<body>
	<%@ include file="include/modal.jsp"%>
	<div class="content_wrap">
		<div class="content">
			<div id="wrapper">
				<div id="slider-wrap">
					<a href="#">
						<ul id="slider">
							<li><img src="${path}/resources/img/wall-416060_1280.png"></li>
							<li><img
								src="${path}/resources/img/kitchen-2165756_1280.png"></li>
							<li><img src="${path}/resources/img/pillow-1890940_1280.png"></li>
						</ul>
					</a>

					<div class="btns" id="next">
						<i class="fa fa-arrow-right"></i>
					</div>
					<div class="btns" id="previous">
						<i class="fa fa-arrow-left"></i>
					</div>
					<div id="counter"></div>

					<div id="pagination-wrap">
						<ul>
						</ul>
					</div>
				</div>
			</div>
			<nav class="container shortcut">
				<ul class="row shortcut_list">
					<li class="shortcut_list_item"><a href="#"
						class="shortcut_list_item_link">
							<div class="round">
								<div class="shortcut_list_item_link_img">
									<img src="${path}/resources/img/icons8-discount-100.png"
										width="80px" height="80px">
								</div>
							</div>
							<div class="shortcut_list_item_link_title">핫딜</div>
					</a></li>
					<li class="shortcut_list_item"><a href="#"
						class="shortcut_list_item_link">
							<div class="round">
								<div class="shortcut_list_item_link_img">
									<img src="${path}/resources/img/icons8-gold-medal-80.png"
										width="80px" height="80px">
								</div>
							</div>
							<div class="shortcut_list_item_link_title">베스트</div>
					</a></li>

					<li class="shortcut_list_item"><a href="#"
						class="shortcut_list_item_link">
							<div class="round">
								<div class="shortcut_list_item_link_img">
									<img src="${path}/resources/img/icons8-person-at-home-100.png"
										width="80px" height="80px">
								</div>
							</div>
							<div class="shortcut_list_item_link_title">나혼자산다</div>
					</a></li>
					<li class="shortcut_list_item"><a href="#"
						class="shortcut_list_item_link">
							<div class="round">
								<div class="shortcut_list_item_link_img">
									<img src="${path}/resources/img/icons8-two-hearts-100.png"
										width="80px" height="80px">
								</div>
							</div>
							<div class="shortcut_list_item_link_title">신혼가구</div>
					</a></li>
					<li class="shortcut_list_item"><a href="#"
						class="shortcut_list_item_link">
							<div class="round">
								<div class="shortcut_list_item_link_img">
									<img src="${path}/resources/img/icons8-event-accepted-160.png"
										width="80px" height="80px">
								</div>
							</div>
							<div class="shortcut_list_item_link_title">이벤트</div>
					</a></li>

				</ul>
			</nav>
			
			
			<div class="today_reco">
				<header class="today_home_reco">
					<h2 class="col today_home_sweet_home">신상품</h2>
					<a href="#" class="more_plus">더보기</a>
				</header>
				<div class="today_reco_itemwrap">
					<c:forEach items="${NewPdt}" var="pdt">
						<div class="item_wrap">
							<a href="#" class="item_click">
								<div class="item_content_wrap">
									<article class="reco_item">
										<div class="item_img">
											<img src= "${path}/resources/img/${pdt.p_img}"
												class="item_img_p">
										</div>

										<div class="item_content">
											<div class="item_header">
												<span class="item_brand">${pdt.pmemo}</span> <span class="item_name">${pdt.pname}
												</span>
											</div>
											<span class="item_content_content"> <span
												class="item_discount">30%</span> <span class="item_price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${pdt.price}"/></span>
												
											</span>
										</div>
									</article>
								</div>
							</a>
						</div>
					</c:forEach>



				</div>
			</div>
			<div class="home_jarang">
				<header class="today_home_jarang"></header>
				<h2 class="col today_home_sweet_home">홈 스윗 홈</h2>
				<ul class="col-md3 home_sweet_content">
					<li class="home_sweet_content_item">
						<article class="sweet_story">
							<a href="#" class="sweet_story_link">
								<div class="sweet_story_imgwrap">
									<img src="${path}/resources/img/living-room-2732939_640.jpg"
										class="sweet_story_img" height="180px" width="281px">
								</div>
								<div class="sweet_story_contentwrap">
									<div class="sweet_story_content">
										<div class="sweet_story_content_title">
											지중해의 분위기를 담은 안락하고 포근한 인테리어<br>
										</div>
										<div class="sweet_story_profile">
											<img src="${path}/resources/img/157957395311769597.png"
												class="sweet_story_profile_img"> <span
												class="sweet_story_profile_name">채은</span>
										</div>
									</div>
								</div>
							</a>
						</article>
					</li>
					<li class="home_sweet_content_item">
						<article class="sweet_story">
							<a href="#" class="sweet_story_link">
								<div class="sweet_story_imgwrap">
									<img src="${path}/resources/img/home-1680800_1280.jpg"
										height="180px" width="270px" class="sweet_story_img">
								</div>
								<div class="sweet_story_contentwrap">
									<div class="sweet_story_content">
										<div class="sweet_story_content_title">
											하루종일 햇살이 가득한 집안!<br> <br>
										</div>
										<div class="sweet_story_profile">
											<img src="${path}/resources/img/1574398519_121336_1.png"
												class="sweet_story_profile_img"> <span
												class="sweet_story_profile_name">라잌썬</span>
										</div>
									</div>
								</div>
							</a>
						</article>
					</li>
					<li class="home_sweet_content_item">
						<article class="sweet_story">
							<a href="#" class="sweet_story_link">
								<div class="sweet_story_imgwrap">
									<img src="${path}/resources/img/living-room-2155353_640.jpg"
										height="180px" width="270px" class="sweet_story_img">
								</div>
								<div class="sweet_story_contentwrap">
									<div class="sweet_story_content">
										<div class="sweet_story_content_title">
											오래된 사무실을 모던하게 뒤바꾼 인테리어를 소개합니다.<br>
										</div>
										<div class="sweet_story_profile">
											<img src="${path}/resources/img/158139823400438836.png"
												class="sweet_story_profile_img"> <span
												class="sweet_story_profile_name">원투고홈</span>
										</div>
									</div>
								</div>
							</a>
						</article>
					</li>
					<div class="sweet_home_content_menu_wrap">
						<div class="sweet_content_menu">
							<a href="#" class="sweet_content_choice">

								<div class="sweet_content_content">
									<span class="text">집구경</span>
									<div class="arrow_in">
										<img src="${path}/resources/img/icons8-double-right-24.png"
											class="arrow_img">
									</div>
								</div>
							</a> <a href="#" class="sweet_content_choice">

								<div class="sweet_content_content">
									<span class="text">노하우</span>
									<div class="arrow_in">
										<img src="${path}/resources/img/icons8-double-right-24.png"
											class="arrow_img">
									</div>
								</div>
							</a> <a href="#" class="sweet_content_choice">

								<div class="sweet_content_content">
									<span class="text">물건 보러가기</span>
									<div class="arrow_in">
										<img src="${path}/resources/img/icons8-double-right-24.png"
											class="arrow_img">
									</div>
								</div>
							</a>
						</div>

					</div>
				</ul>
			</div>

			<div class="today_reco">
				<header class="today_home_reco">
					<h2 class="col today_home_sweet_home">추천제품</h2>
					<a href="#" class="more_plus">더보기</a>
				</header>
				<div class="today_reco_itemwrap">
					<c:forEach items="${BestPdt}" var="pdt">
						<div class="item_wrap">
							<a href="#" class="item_click">
								<div class="item_content_wrap">
									<article class="reco_item">
										<div class="item_img">
											<img src= "${path}/resources/img/${pdt.p_img}"
												class="item_img_p">
										</div>

										<div class="item_content">
											<div class="item_header">
												<span class="item_brand">마틸라</span> <span class="item_name">${pdt.pname}
												</span>
											</div>
											<span class="item_content_content"> <span
												class="item_discount">30%</span> <span class="item_price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${pdt.price}"/></span>
											</span>
										</div>
									</article>
								</div>
							</a>
						</div>
					</c:forEach>



				</div>
			</div>

			<div class="special_reco">
				<header class="today_special_reco">
					<h2 class="col today_home_sweet_home">단독 기획</h2>
					<a href="#" class="more_plus">더보기</a>
				</header>

				<div class="today_special_itemwrap">
					<div class="special_wrap">
						<a href="#" class="special_click">
							<div class="special_content_wrap">
								<article class="special_item">
									<div class="special_img">
										<img src="${path}/resources/img/desk.png"
											class="special_img_p">
									</div>
									<div class="special_content">
										<div class="special_header">
											<span class="special_brand">최대할인 적용!</span> <span
												class="special_name">신학기 브랜드위크</span>
										</div>
									</div>
								</article>
							</div>
						</a>
					</div>

					<div class="special_wrap">
						<a href="#" class="special_click">
							<div class="special_content_wrap">
								<article class="special_item">
									<div class="special_img">
										<img src="${path}/resources/img/sal.png" class="special_img_p">
									</div>
									<div class="special_content">
										<div class="special_header">
											<span class="special_brand">프리미엄 브랜드</span> <span
												class="special_name">친환경 디자인 모음전</span>
										</div>
									</div>
								</article>
							</div>
						</a>
					</div>

					<div class="special_wrap">
						<a href="#" class="special_click">
							<div class="special_content_wrap">
								<article class="special_item">
									<div class="special_img">
										<img src="${path}/resources/img/elec.png"
											class="special_img_p">
									</div>
									<div class="special_content">
										<div class="special_header">
											<span class="special_brand">#필수 #요즘대세 #인기상품</span> <span
												class="special_name">자취 필수 가전</span>
										</div>
									</div>
								</article>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">




	//current position
	var pos = 0;
	//number of slides
	var totalSlides = $('#slider-wrap ul li').length;
	//get the slide width
	var sliderWidth = $('#slider-wrap').width();

	$(document).ready(function() {

		/*****************
		 BUILD THE SLIDER
		 *****************/
		//set width to be 'x' times the number of slides
		$('#slider-wrap ul#slider').width(sliderWidth * totalSlides);

		//next slide    
		$('#next').click(function() {
			slideRight();
		});

		//previous slide
		$('#previous').click(function() {
			slideLeft();
		});

		/*************************
		 //*> OPTIONAL SETTINGS
		 ************************/
		//automatic slider
		var autoSlider = setInterval(slideRight, 3000);

		//for each slide 
		$.each($('#slider-wrap ul li'), function() {

			//create a pagination
			var li = document.createElement('li');
			$('#pagination-wrap ul').append(li);
		});

		//counter
		countSlides();

		//pagination
		pagination();

		//hide/show controls/btns when hover
		//pause automatic slide when hover
		$('#slider-wrap').hover(function() {
			$(this).addClass('active');
			clearInterval(autoSlider);
		}, function() {
			$(this).removeClass('active');
			autoSlider = setInterval(slideRight, 3000);
		});

	});//DOCUMENT READY

	/***********
	 SLIDE LEFT
	 ************/
	function slideLeft() {
		pos--;
		if (pos == -1) {
			pos = totalSlides - 1;
		}
		$('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

		//*> optional
		countSlides();
		pagination();
	}

	/************
	 SLIDE RIGHT
	 *************/
	function slideRight() {
		pos++;
		if (pos == totalSlides) {
			pos = 0;
		}
		$('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

		//*> optional 
		countSlides();
		pagination();
	}

	/************************
	 //*> OPTIONAL SETTINGS
	 ************************/
	function countSlides() {
		$('#counter').html(pos + 1 + ' / ' + totalSlides);
	}

	function pagination() {
		$('#pagination-wrap ul li').removeClass('active');
		$('#pagination-wrap ul li:eq(' + pos + ')').addClass('active');
	}
</script>
</html>