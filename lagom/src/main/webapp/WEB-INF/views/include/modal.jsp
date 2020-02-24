<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/825f57de13.js"
	crossorigin="anonymous">
	
</script>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css">
<style type="text/css">
/*모달*/
.modal_wrap {
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
	width: 350px;
	height: 150px;
	padding: 30px 25px;
	background-color: white;
	box-shadow: 0 4px 10px 0 rgba(0, 0, 0, 0.2), 0 4px 20px 0
		rgba(0, 0, 0, 0.19);
	border-radius: 2px;
	overflow: hidden;
}

.recheck_close {
	position: absolute;
	top: 7px;
	right: 7px;
}

.recheck_close>button {
	color: rgb(142, 142, 142);
	border: none;
	background: white;
	font-size: 30px;
	cursor: pointer;
	outline: none;
}

.recheck_close>button:hover {
	color: black;
}

.btn_wrap {
	display: flex;
	justify-content: space-around;
}

.btn_choice {
	display: flex;
	justify-content: space-around;
	background-color: #8a6d5c;
	color: white;
	font-size: 15px;
	font-weight: 700;
	margin: 20px 10px;
	padding: 13px 15px;
	width: 100px;
	height: 40px;
	border-radius: 2px;
}

.modal_recheck {
	font-weight: 700;
	font-size: 18px;
	text-align: center;
	padding-top: 15px;
}

.btn_yes:hover {
	background-color: #158bd1;
	border-color: transparent;
}

.btn_no:hover {
	background-color: #158bd1;
	border-color: transparent;
}

.button_small:hover {
	background-color: #158bd1;
	border-color: transparent;
}
</style>
</head>
<body>
	<div class="modal_wrap">
		<div class="modal_content">
			<div class="recheck_close">
				<button>
					<i class="fas fa-times"></i>
				</button>
			</div>

			<div class="modal_recheck">
				<span> 정말 탈퇴하시겠습니까?</span>
			</div>

			<div class="btn_wrap">
				<span><a href="#" class="btn_choice btn_no">취소</a></span> <span><a
					href="#" class="btn_choice btn_yes">확인</a></span>
			</div>
		</div>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).on('click', '.button_small', function() {
		//login 버튼 클릭시 modal창 open
		$('.modal_wrap').css('display', 'flex');
	});

	$(document).on('click', '.recheck_close', function() {
		$('.modal_wrap').css('display', 'none');
	});

	$(document).on('click', '.btn_no', function() {
		$('.modal_wrap').css('display', 'none');
	});
</script>
</html>