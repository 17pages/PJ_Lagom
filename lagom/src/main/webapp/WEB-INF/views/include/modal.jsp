<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/825f57de13.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<style type="text/css">
/*모달*/
.basicmodal_wrap {
	top:0;
	position: fixed;
	z-index: 1500;
	background-color: rgba(0, 0, 0, 0.4);
	overflow: auto;
	width: 100%;
	height: 100%;
	display : flex;
	justify-content: center;
	align-items: center;
}

.basicmodal_content {
	position: relative;
	width: 410px;
	height: 200px;
	padding: 5px 10px 13px 20px;
	background-color: white;
	box-shadow: 0 4px 10px 0 rgba(0, 0, 0, 0.2), 0 4px 20px 0
		rgba(0, 0, 0, 0.19);
	border-radius: 2px;
	overflow: hidden;
}
.basicrecheck_wrap{
display : flex;
align-items : center;
justify-content : space-between;
}

.basicrecheck_close {
	
	top: 7px;
	right: 7px;
}
.basicrecheck_msg{
    font-weight: 900;
    font-size: 16;
    color : #8a6d5c;
    
}

.basicrecheck_close>button {
	color: rgb(142, 142, 142);
	border: none;
	background: white;
	font-size: 30px;
	cursor: pointer;
	outline: none;
}

.basicrecheck_close>button:hover {
	color: black;
}

.basicbtn_wrap{
	display: flex;
	justify-content: space-around;
}

.basicbtn_choice {
	display: flex;
	justify-content: center;
	background-color: #8a6d5c;
	color: white;
	font-size: 15px;
	font-weight: 700;
	margin: 20px 10px;
	padding: 11px 15px;
	width: 100px;
	height: 40px;
	border-radius: 2px;
}

.msg_title {
	font-weight: 700;
	font-size: 18px;
	text-align: center;
	padding-top : 17px;
	padding-bottom: 12px;
}
.msg_content {
	font-size : 13px;
	text-align : center;
}

.basicbtn_yes:hover {
	background-color: #158bd1;
	border-color: transparent;
}

.basicbtn_no:hover {
	background-color: #158bd1;
	border-color: transparent;
}

.basicbutton_small:hover {
	background-color: #158bd1;
	border-color: transparent;
}
</style>
</head>
<body>
	<div class="basicmodal_wrap">
		<div class="basicmodal_content">
			<div class ="basicrecheck_wrap">
			<div class="basicrecheck_msg">LAGOM 알림</div>
			<div class="basicrecheck_close">
				<button>
					<i class="fas fa-times"></i>
				</button>
			</div>
			</div>
			<div class="basicmodal_recheck msg_title">
				<span>회원가입을 축하드립니다.</span>
			</div>
			<div class="basicmodal_recheck msg_content">
				<span>인증메일을 보냈습니다. <br>인증하셔야만 사이트 활동이 가능합니다.</span>
			</div>

			<div class="basicbtn_wrap">
				
					<a href="#" class="basicbtn_choice basicbtn_no">취소</a>
				 
				
					<a href="#" class="basicbtn_choice basicbtn_yes">확인</a>
				
			</div>
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).on('click', '.basicrecheck_close', function() {
		$('.basicmodal_wrap').css('display', 'none');
	});

	$(document).on('click', '.btn_no', function() {
		$('.basicmodal_wrap').css('display', 'none');
	});
	
	$(function(){
		var id='${id}';
		var email='${email}';
		var key='${key}';
		
		var join_main_txt = id+'님 회원가입을 축하드립니다.';
		var join_sub_txt = email+'으로 인증메일을 보냈습니다. 인증하셔야만 사이트 활동이 가능합니다.';
		var auth_main_txt = id+'님 이메일 인증되셨습니다.';
		var auth_sub_txt = '지금부터 사이트 활동이 가능합니다. 감사합니다.';
		
		if(key=='join') {
			$('.msg_title').text(join_main_txt); //메인 텍스트
			$('.msg_content').text(join_sub_txt);	//서브텍스트
			$('.basicbtn_no').css('display','none');	//취소버튼 제거
			$('.basicmodal_wrap').css('display', 'flex');	//모달창 출력
		}else if(key=='auth'){
			$('.msg_title').text(auth_main_txt);
			$('.msg_content').text(auth_sub_txt);
			$('.basicbtn_no').css('display','none');
			$('.basicmodal_wrap').css('display', 'flex');
		}
		$('.basicbtn_yes').on('click', function(){
			$('.basicmodal_wrap').css('display', 'none');
		});
		$('.basicrecheck_close').on('click', function(){
			$('.basicmodal_wrap').css('display', 'none');
		});
		
	});
</script>
</html>