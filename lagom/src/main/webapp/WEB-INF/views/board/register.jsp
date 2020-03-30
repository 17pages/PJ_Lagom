<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<script src="https://kit.fontawesome.com/825f57de13.js" crossorigin="anonymous"></script>
<style type="text/css">
*{	
box-sizing: border-box;
}

body, h1, h2, h3, h4, h5, h6, ul, p {
margin : 0;
padding : 0;
}

h2{
	font-weight: 600;
}

body {
background-color: #f5f6f7;
font-size : 14px;
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
article{
	display: block;
}	
.view_write_wrap{
width: 100%;
margin : 65px 0 auto;
background-color: #f1f1f2;
}
.view_write_content_wrap{
min-width: 1280px;
margin : 0 auto;
padding-bottom: 150px;
}
.view_write_content{
width: 1050px;
margin : 0 auto;
max-width: 100%;
box-sizing: border-box;
position: relative;
border : 0px solid #000;
background-color : #fff;
padding : 5px 15px;
}

/*head*/
.write_head{
	position: relative;
	display: flex;
	align-items: center;
	padding: 5px 0;
	border-bottom : 1px solid #e2e2e2;
}
.writeboard_name{
	display: flex;
	align-items: center;
	padding : 10px 0;
}
.writeboard_name_icon{
	width: 18px;
	height: 18px;
	font-size: 14px;
	font-weight:500;
	margin:0 5px 0 0;
	text-align: center;
}

/*등록버튼*/
.wirte_content_btn{
	position: relative;
	display: flex;
	justify-content: space-between;
	padding : 15px 0;
	width: 100%;
}
.wirte_content_btn a{
	padding : 6px 14px;
	font-size: 15px;
	font-weight: bold;
	color: white;
	background-color: #636363; 
	border : 1px solid #636363;
	border-radius: 3px;

}
/*작성자칸*/
.write_writer, .write_select, .wirte_title_wrap{
	display: flex;
	width: 100%;
	padding : 10px 15px;
	border-bottom:1px solid #e2e2e2;
}

.write_writer{	
	display: flex;
	align-items: center;
	position: relative;
	height: 36px;
	padding : 10px 15px;
	background-color : #fafafa;
}
.write_icon{
	padding-right: 10px;
}
.writer_name{
	font-size: 17px;
	font-weight: bold;
}

/*카테고리 선택*/
.write_select > label {
	font-weight: bold;
	padding-right : 10px;
}

/*제목란*/
.wirte_title_wrap{
	align-items: center;

}
.write_title{
	font-weight: bold;
	font-size: 14px;
	padding-right: 24px;

}
#write_title{
	width: 600px;
	height: 30px;
}

/*게시글등록*/
.write_content{
	padding: 10px 15px;
	height: 500px;
	border-bottom:1px solid #e2e2e2;

}

.write_textarea{
	resize: none;

}
/*첨부파일*/
.add_attachments{
	display: flex;
	width: 100%;
	padding : 10px 15px;
	border-bottom:1px solid #e2e2e2

}
.add_attachments > span {
	font-weight : bold;
}
.addfile_title{
	padding-right: 11px;
}
.drag_file{
	width: 920px;
	height: 110px;
	border : 2px dashed #9bafc1;
	text-align: center;
	line-height: 100px;

}
.addfile_title{
	font-weight: bold;
}


</style>
</head>
<body>
<div class="view_write_wrap">
		<div class="view_write_content_wrap">
			<form action="" method="">
			<div class="view_write_content">
				
				<div class="write_head">
					<div class="writeboard_name">
						<span class="writeboard_name_icon"><i class="far fa-edit"></i></span>
						<h2><a href="#">게시글 등록</a></h2>
					</div>
				</div>

				<div class="write_writer">
					<div class="write_icon"><i class="fas fa-user"></i></div>
					<div class="writer_name">user</div>
				</div>
				
				<div class="write_select">
					<label>
						게시판 
					</label> 
					<select id="board">
						<option value="free">자유게시판</option>
						<option value="qna">Q & A</option>
						<option value="review">Review</option>
					</select>
				</div>


				<div class="wirte_title_wrap">
					<div class="write_title">제목</div>
					<div><input type="text" name="write_title" id="write_title" placeholder="제목을 입력해주세요."></div>
				</div>


				<div class="write_content">
					<textarea style="width: 100%; height: 480px;" class="write_textarea"></textarea>
				</div>


				<div class="add_attachments"> 
					<div class="addfile_title"><span>첨부파일</span></div>
					<div class="drag_file">
						<i class="fas fa-file-import"></i>
						<span>파일을 올려주세요.</span>
					</div>

				</div>
				
				<div class="wirte_content_btn">
					<a href="#">취소</a>
					<a href="#">글 등록</a>
				</div>

			</div>
			</form>
			
		</div>
		
	</div>


</body>
</html>