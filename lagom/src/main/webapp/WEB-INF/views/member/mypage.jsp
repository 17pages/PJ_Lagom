<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYPAGE</title>
<script src="https://kit.fontawesome.com/825f57de13.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css">
	<style type="text/css">
		*{

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
		}
		a{
			text-decoration : none;
			color: inherit;
		}

		.wrap {
		width: 500px;
		margin: 0 auto;
		
		}

		.container{
		background : #fff;
		border-top: 1px dotted #444444;
		border-bottom: 1px dotted #444444;
		padding: 15px 0;

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
		.header_content {
			position: relative;
			padding: 0 0 0 5px;
			
		}

		.profile_wrap{
			
		}
		.profile_icon{
			background-color: #e7e9ea;
			width: 60px;
			height: 60px;
			border-radius : 100px;
			margin-right: 30px;
			margin-bottom:45px;
		}
		.profile_content{
			display: flex;
			align-items: center;
			padding-left: 65px;
			padding-bottom: 17px;
		}
		.mypage_button_wrap
		{
			width: 370px;
			margin-left: 70px;
			padding: 10px 0;

		}
		.mypage_button_contain{
			display: flex;
			justify-content: center;
		}
		.profile_name{
			font-size: 15px;
			 
		}
		.mypage_button{
		border-radius : 3px;
		background-color : #585b5c;
		color : white;
		margin-right: 20px;
		width: 110px;
		height:35px;
		font-size : 13px;
		font-weight : 700;
		text-align: center;
		border : none;
		outline:none;
		cursor : pointer;
		}

		.profile_main{
			font-weight: bold;
		}
	td{
		padding : 5px;
		font-size: 13px;
	}

	table tr td:first-child {
		font-weight: bold;
		text-align: center;
		background-color : #e7e9ea;
	}

	table tr td:last-child {
	padding-left : 10px;
	}
	.profile_icon img:last-child{
		margin-top: 15px;
		margin-left:-40px;
	}
	.profile_icon_point{
		display: flex;
		justify-content: center;
		align-items: center;
		padding-top: 20px;
		margin-right:3px;
		font-size: 15px;
	}
	.profile_icon_point>img{
		margin-right : 10px;
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

		<div class="header_content">
					<h3 class="header_title">내 정보</h3>
		</div>
		<section>
			<form>
				<div class="container">
					<div class="profile_wrap">
					<div class="profile_content">
						<div class="profile_icon">
							<img src="${path}/resources/img/icons8-person-64.png" width="60px", height="60px">
							<div class="profile_icon_point">
							<img src="${path}/resources/img/icons8-p-50.png" width="20px">
							<span><strong>50</strong></span>
							</div>
						</div>
						
						<div class="profile_contain">
						<div class="profile_content_wrap">
							<div class="profile_title">
								<table>
									<tr>
										<td>ID</td>
										<td>aaa@aaa.com</td>
									</tr>
									<tr>
										<td>이름</td>
										<td>admin</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>cottondg100@gamil.com</td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td>010-1234-5678</td>
									</tr>
									<tr>
										<td>주소</td>
										<td>광주광역시 북구 중흥로 ㅇㅇㅇㅇ</td>
									</tr>
								</table>
							</div>
						</div>
						</div>
					</div>
					
				
					<div class="mypage_button_wrap">
						<div class="mypage_button_contain">
							<div> 
								<sapn>
								 <button type="button" href="${path}/member/update" id="btn_update" class="mypage_button">정보수정</button>
								</sapn>
							</div>
							<div> 
								<span>
									<button type="button" href="${path}/member/pwupdate" id="btn_pwupdate" class="mypage_button">비밀번호 변경</button>
								</span>
							</div>
							<div>
							 	<span>
							 		<button type="button" href="${path}/member/drop" id="btn_out" class="mypage_button">회원탈퇴</button>
							 	</span>
							 </div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
	</div>

</body>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
$('#btn_update').click(function(){
	location.href="${path}/member/update"
});
$('#btn_pwupdate').click(function(){
	location.href="${path}/member/pwupdate"
});
$('#btn_out').click(function(){
	location.href="${path}/member/drop"
});

</script>
</html>