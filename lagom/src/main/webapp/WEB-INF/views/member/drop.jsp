<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script src="https://kit.fontawesome.com/825f57de13.js"	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css"">
<style type="text/css">
		*{	
			font-family: Dotum,'돋움',Helvetica,sans-serif;
			box-sizing: border-box;

		}

		body, h1, h2, h3, h4, h5, h6, ul, p {
			margin : 0;
			padding : 0;
		}

		body {
			background-color: #f5f6f7;
			font-size : 12px;

		}

		ul{
			list-style: none;
			margin : 0px;
			padding: 0px;
		}

		a{
			text-decoration : none;
			color: inherit;
		}
		.wrap{
			width: 768px;
			margin : 0 auto;
			
		}
		
		.header {
			padding : 40px 0px 20px;
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
		.header_title {
			height: 16px;
			line-height: 16px;
			vertical-align: middle;
			display : inline-block;
			margin: 5px 5px 10px 0;
			color: #444444;
			font-weight : bold;
			font-size : 16px;

		}
		.container{
			background : #fff;
			border-top: 1px dotted #444444;
			border-bottom: 1px dotted #444444;
			padding: 15px 0;


			
			 
		}
		.header_content {
			position: relative;
			padding: 0 0 5px 5px;
			margin-bottom: 5px;
		}
	
		.header_content li{
			padding-left: 10px;
			color: #333
			font-size : 12px;
			background : url('${path}/resources/img/blet_bar.gif') 0 8px no-repeat;
		}


		.header_content > ul> li {

			font-size : 13px;
			
		}
		.middle {
			text-align: center;
			font-size : 14px;
			font-weight : bold;
			color : #8a6d5c;
		}
		.md30 {
			margin-top: 23px;
		}
		.md10{
			margin-bottom : 20px;
		}
		.sec_content{
			width: 722px;
			padding: 10px 10px 20px 10px;
			border: 7px solid #fff;
			margin : 0 auto;

		}
		.sec_from1, .sec_from1_2 {
			padding-bottom: 10px;
			border-bottom: 1px dotted black;


		}
		.sec_from1_2{
			margin-top: 10px;

		}
		.sec_font{
			color: #444444;
		}

		.sec_from1_2 ul {
			margin-left: 200px;
			margin-top : -10px;
			line-height: 20px;
		}
		.sec_from1 ul{
			margin-left: 200px;
			margin-top : -10px;
			line-height: 20px;

		}
		

		table tr td {
			color : #3e3e3e;
			font-size : 12px;
			line-height: 18px;
		}

		td {
			width: 500px;
			display : table-cell;
			vertical-align: inherit;
		}
		.sec_textbox{
			margin-left : 30px;
			margin-top : -20px;
			
		}
		
		.sec_textarea {
			width: 470px;
			height: 86px;
			margin-left : 170px;
			margin-top: 8px;
		}
		.pw_check{
			widows: 726px;
			padding: 15px;
			background: #fff;
			text-align: center;


		}
		.pw_check > p {
			font-size : 13px;
		}

		.pw_check_pass_btn{
			vertical-align: middle;
			text-align: center;
			margin-top: 10px;

			
		}


		.pw_check_btn{
			margin-top: 10px;
		}

		.drop_yes{
			border-radius: 2px;
			color: white;
			font-weight : 700;
			font-size: 15px;
			padding: 8px;
			cursor:no-drop;
			border:none;

		}

		
		/*모달*/
		.modal_wrap {
			position : fixed;
			z-index: 1000;
			background-color: rgba(0,0,0,0.4);
			overflow: auto;
			width : 100%;
			height: 100%;
			display: none;
			justify-content: center;
			align-items: center;

		}
		.modal_content {
			position: relative;
			width : 350px;
			height : 170px;
			padding : 31px 25px;
			background-color: white;
			box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
			border-radius : 2px;
			overflow: hidden;
			
		}
		.recheck_close{
			position: absolute;
			top : 7px;
			right: 7px;
		}
		.recheck_close > button {
			color: rgb(142, 142, 142);
			border : none;
			background : white;
			font-size: 30px;
			cursor: pointer;
			outline: none;
		}
		.recheck_close>button:hover{
			color : black;
		}

		.btn_wrap {
			display : flex;
			justify-content: space-around;
		}
		.btn_choice{
			display : flex;
			justify-content: space-around;
			background-color: #8a6d5c;
			color: white;
			font-size: 15px;
			font-weight : 700;
			margin: 20px 10px;
			padding: 13px 15px;
			width: 100px;
			height : 40px;
			border-radius: 2px;

		
		}
		.modal_recheck{
			font-weight :700;
			font-size: 18px;
			text-align: center;
			padding-top: 15px;
		}

		.btn_yes:hover{
			background-color: #158bd1;
			border-color: transparent;
		}
		.btn_no:hover{
			background-color: #158bd1;
			border-color: transparent;
		}
	
		.error_next_box {
	display: block;
	margin: 4px 0 -2px;
	padding-left : 28px;
	font-size: 12px;
	line-height: 14px;
	color: red;
	height: 15px;
	visibility: hidden;
}
</style>
</head>
<body>
<%@ include file="../include/modal.jsp"%>


	<div class="wrap">
		<header>
			<div class="header">
				<h1 class="Lagom_logo">
					<a href="#" class="l_logo"></a>
				</h1>
			</div>
		</header>
		
		<section>
			
				<div class="container">
					<div class="header_content">
						<h3 class="header_title">회원탈퇴</h3>
							<ul>
								<li>회원 탈퇴시 적립금, 예치금, 쿠폰, 마일리지, LAGOM상품권 등의 LAGOM 통장이 자동삭제 됩니다.</li>
								<li><font color="red">출고 이전 주문이 있을 경우 상품 배송 처리 문제로 탈퇴 불가합니다.(주문 취소 혹은 출고 이후 탈퇴 가능)</font></li>
								<li>고객님의 거래내역은 전자상거래 등에서의 소비자보호에 관한 법률 제6조 및 동법 시행령 제 6조에 의거하여 표시 및 광고에<br>관한 기록은 6월, 계약 또는 청약 철회 등에 관한 기록은 5년, 대금결제 및 재화 공급 등의 공급에 관한 기록은 5년, 소비자 불만<br> 또는 분쟁처리에 관한 기록은 3년간 기록됩니다.</li>
								<li></li>
							</ul>
					</div>
							<p class="middle md30">고객님께서 느끼신 Lagom의 부족한 점을 지적해 주세요.</p>
							<p class="middle md10">소중하게 반영하겠습니다.</p>

			<div class="sec_content">
				<div class="sec_from1">
					<p class="sec_from_cb">
						<span class="sec_font">
							<strong>1. 상품관련</strong>
						</span>
					</p>
						<ul>
							<table>
								<tbody>
									<tr>
									<td>
										<span class="sec_li">
											<input id="" type="checkbox" name="">
											<label for="">가격불만</label>
										</span>
									</td>
									<td>
										<input id="" type="checkbox" name="">
										<label for="">상품 품질 불만</label>
									</td>
								</tr>
								<tr>
								<td>
									<input id="" type="checkbox" name="">
										<label for="">찾는 상품 없음</label>
								</td>
								<td>
									<input id="" type="checkbox" name="">
										<label for="">상품 정보 부족</label>
								</td>
								</tr>
								<tr>
									<td><input id="" type="checkbox" name="">
										<label for="">그 외</label></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</ul>
				</div>
				<div class="sec_from1_2">
					<p class="sec_form_cb">
						<span class="sec_font">
							<strong>2. 서비스관련</strong>
						</span>
						
					</p>
					<ul>
						<table>
							<tbody>
								<tr>
									<td>
										<span class="sec_li">
											<input id="" type="checkbox" name="">
											<label for="">결제불안</label>
										</span>
									</td>
									<td>
										<input id="" type="checkbox" name="">
										<label for="">회원 특혜 부족</label>
									</td>
								</tr>
								<tr>
								<td>
									<input id="" type="checkbox" name="">
										<label for="">불친절</label>
								</td>
								<td>
									<input id="" type="checkbox" name="">
										<label for="">배송 상태 불만</label>
								</td>
								</tr>
								<tr>
									<td>
										<input id="" type="checkbox" name="">
										<label for="">배송 시간 지연</label>
									</td>
									<td>
										<input id="" type="checkbox" name="">
										<label for="">사이트 불편</label>
									</td>
								</tr>
								<tr>
									<td>
										<input id="" type="checkbox" name="">
										<label for="">컨텐츠 불만</label>
									</td>
									<td>
										<input id="" type="checkbox" name="">
										<label for="">그 외</label>
									</td>
								</tr>
							</tbody>
						</table>
					</ul>
				</div>
				<div class="sec_from1_2">
					<p class="sec_form_cb">
						<span class="sec_font">
							<strong>3. 시스템/기타</strong>
						</span>
						
					</p>
					<ul>
						<table>
							<tbody>
								<tr>
									<td>
										<span class="sec_li">
											<input id="" type="checkbox" name="">
											<label for="">시스템 에러</label>
										</span>
									</td>
									<td>
										<input id="" type="checkbox" name="">
										<label for="">상품 검색 불편</label>
									</td>
								</tr>
								<tr>
								<td>
									<input id="" type="checkbox" name="">
										<label for="">개인정보 & 보안 불안</label>
								</td>
								<td>
									<input id="" type="checkbox" name="">
										<label for="">그 외</label>
								</td>
								</tr>
							</tbody>
						</table>
					</ul>
				</div>
				<div class="sec_from1_2">
					<p class="sec_form_cb">
						<span class="sec_font">
							<strong>4. Lagom에 한마디</strong>
						</span>
						
					</p>
					<div class="sec_textbox">
						<textarea name="" id="" class="sec_textarea" rows="5" cols="41"></textarea>
					</div>
				</div>
			</div>
			<div class="pw_check">
				<p>
					본인 확인을 위해 비밀번호를 입력한 후, "탈퇴확인"버튼을 눌러주세요.<br>(회원 탈퇴시 나의 계정과 나의 주문의 <strong style="color: red;">모든 정보와 DB가 삭제되며,<br>1년 내 재가입 / 회원구매에 제약이 있으니</strong> 신중하게 탈퇴신청을 해주세요.)<br>
				</p>
				<div class="pw_check_btn">
					<label for="pw_check_pass"><strong>비밀번호 :</strong>
					</label>
					<span class="pw">
						<input type="password" id="upw" name="pw" class="int">
					</span>
					</span> <span class="error_next_box">필수 정보입니다.</span>
				</div>
				<div class="pw_check_pass_btn">
						<button class="drop_yes" id="drop_yes" >탈퇴확인</button>
				</div>
			</div>

			</div>
			
		</section>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	
	$(function(){
		var checkArr= false;
		
		$('#upw').keyup(function(){
			var pw = $(this).val();
			//console.log(pw);
			// return 4개중에 1개 올거임 (validation에 있는애들중에)
			var result = joinValidate.checkNowpw(pw);
			console.log(result.code+","+result.desc);
			
			var color='';
			if(result.code == 100) {
				color='#3885CA';
				checkArr = true;
			
			}else{
				color='#d95339';
				checkArr = false;
			}
			$('.error_next_box:eq(0)').css('visibility','visible')
			.text(result.desc)
			.css('color',color);
			
			ckColorBtn();
		});
		
		function ckColorBtn(){
			
			if (checkArr) {
				$('#drop_yes').addClass('btn-primary');
				//$('#btn_join').prop('disabled', false);
				$('#drop_yes').css('cursor', 'pointer');
			} else {
				$('#drop_yes').removeClass('btn-primary');
				//$('#btn_join').prop('disabled', true);
				$('#drop_yes').css('cursor', 'no-drop');
			}
		}
		$('#drop_yes').click(function(){
			//alert('클릭됨');
			//var checkAll = true;
			//for(var i=0; i < checkArr.length; i++){
				//if(!checkArr[i]{
					// checkall=false;}}
			
			if(checkArr == false){
				$('.error_next_box:eq(0)').css('visibility', 'visible');
			} else {
				$('.basicmodal_wrap').css('display','flex');
			}
		});
				
				$('#basicbtn_yes').click(function(){
					//alert('탈퇴 ㄱㄱ')
					location.href='${path}/member/dropAction';
				});
	});
	
</script>
		
</html>