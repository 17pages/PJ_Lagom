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
	width: 350px;
	height: 170px;
	padding: 25px 25px;
	background-color: white;
	box-shadow: 0 4px 10px 0 rgba(0, 0, 0, 0.2), 0 4px 20px 0
		rgba(0, 0, 0, 0.19);
	border-radius: 2px;
	overflow: hidden;
}

.basicrecheck_close {
	position: absolute;
	top: 7px;
	right: 7px;
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

.basicmodal_recheck {
	font-weight: 700;
	font-size: 18px;
	text-align: center;
	padding-top: 15px;
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
			<div class="basicrecheck_close">
				<button>
					<i class="fas fa-times"></i>
				</button>
			</div>

			<div class="basicmodal_recheck">
				<span>모달~모달~</span>
			</div>

			<div class="basicbtn_wrap">
				<span>
					<a href="#" class="basicbtn_choice btn_no">취소</a>
				</span> 
				<span>
					<a href="#" class="basicbtn_choice btn_yes">확인</a>
				</span>
			</div>
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	

	$(document).on('click', '.recheck_close', function() {
		$('.basicmodal_wrap').css('display', 'none');
	});

	$(document).on('click', '.btn_no', function() {
		$('.basicmodal_wrap').css('display', 'none');
	});
</script>
</html>