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
.board_view_wrap{
width: 100%;
margin : 0 auto;
background-color: #f1f1f2;

}
.view_content_wrap{
min-width: 1280px;
margin : 65px 0 auto;
padding-bottom: 150px;

}
.view_content{
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
.view_head{
	position: relative;
	display: flex;
	align-items: center;
	padding: 5px 0;
	border-bottom : 1px solid #e2e2e2;
}
.viewboard_name{
	display: flex;
	align-items: center;
	padding : 10px 0;
}
.viewboard_name_icon{
	width: 18px;
	height: 18px;
	font-size: 14px;
	font-weight:500;
	margin:5px 5px 0 0;
	text-align: center;

}

/*글제목*/
.view_title{
	display: flex;
	justify-content: space-between;
	width: 100%;
	padding : 10px 0;
	border-bottom:1px solid #516b82;

}
.view_title .view_subject{
	
	vertical-align: middle;
	height: 100%;
	font-size : 15px;
	word-break: break-all;
	line-height: 2.65;
	padding : 0 10px 0 0;	
}

.view_replycnt {
	display: block;
	height: 40px;
	padding : 1px 0;
	border-radius: 2px;
	width: 40px;
	vertical-align: middle;
	text-align: center;
	background-color: #e2e2e2;
	border : 1px solid #e2e2e2;
	margin-right: 6px;
}
.view_goodcnt{
	display: block;
	height: 40px;
	padding : 1px 0;
	border-radius: 2px;
	width: 40px;
	vertical-align: middle;
	text-align: center;
	background-color: #e2e2e2;
	border : 1px solid #e2e2e2;
}
.view_addfile{
	margin-left : 6px;
	display: block;
	height: 40px;
	padding : 8px 0;
	border-radius: 2px;
	width: 40px;
	vertical-align: middle;
	text-align: center;
	background-color: #e2e2e2;
	border : 1px solid #e2e2e2;
}
.view_detail_menu{
	display: flex;

}


/*닉네임*/
.view_info{
	display: flex;
	align-items: center;
	justify-content: space-between;
	position: relative;
	height: 36px;
	padding : 10px 15px;
	background-color : #fafafa;

}
.post_nickname{
	display: flex;
	height: 16px;
}
.view_info_viewcnt{
	display: flex;
	justify-content: center;
	align-items: center;

}
.view_post_count .view_info{
	top: -1px;
	position: relative;
	margin : 0 5px;

}

.view_post_count{
	display: flex;
	justify-content: center;
	align-items: center;
}
.view_info_viewcnt{
	display: flex;
	justify-content: center;
	align-items: center;
}
.post_author{
	float: right;
	display: flex;
	align-items: center;
	justify-content: space-between;
	font-size : 11px;
	color: #666;
	padding-left: 5px;

}
/*본문내용*/
.post_content_wrap{
	
	
	border-radius: 0 0 2px 2px;
	}

.post_content_content_wrap{
	border : 1px solid #f1f1f1;
}	

.post_author .post_content_wrap{
	display: flex;
	align-items: center;
	justify-content: space-between;
	font-size : 11px;
	color: #666;
	padding : 0 0 15px;
}


.post_content .post_content_wrap{
	word-break: break-all;
	margin : 15px 0;
}

.post_article{
	border : 0px solid blue;
	width: 100%;
	height: 50px;
	margin : 15px 0;

}
.post_article .fr-view{

	position: relative;
	font-size: 14px;
	line-height: 1.5;
	overflow: hidden;
}

.post_content_content_wrap{
	padding : 10px;
}

.post_plus_bnt{
	position: relative;
	display: flex;
	justify-content: center;
	padding : 15px 0;
	width: 100%;
}
.post_decl_bnt{
	border : 1px solid #D7625e;
	background-color : #D7625e;
}
.post_scrap_bnt{
	border : 1px solid #516b82;
	background-color : #516b82;
}

.post_reco_bnt{
	border : 1px solid #516b82;
	background-color : #516b82;
}
.post_decl_bnt, .post_scrap_bnt, .post_reco_bnt{
	color: #fff;
	padding : 9px 10px;
	margin : 0 1px;
	border-radius: 2px;
	cursor: pointer;
}

/*버튼*/
.view_content_btn{
	position: relative;
	display: flex;
	justify-content: space-between;
	padding : 15px 0;
	width: 100%;
}
.view_btn_left a{
	padding : 6px 14px;
	font-size: 15px;
	font-weight: bold;
	color: white;
	background-color: #516b82; 
	border : 1px solid #516b82;
	border-radius: 3px;
}
.view_btn_right a{
	padding : 6px 14px;
	font-size: 15px;
	font-weight: bold;
	color: white;
	background-color: #516b82; 
	border : 1px solid #516b82;
	border-radius: 3px;
}

/*댓글창*/
.comment_content_wrap{
	margin-bottom: 20px;
}

.view_post_comment{
	margin : 30px 0 0 0;
	border : 0px solid black;
}
.comment_header{
	display: flex;
	justify-content: space-between;
	font-size: 13px;
	color: #516b82;
	padding : 10px;
}
.fa-commenting{
	padding-right: 5px;
}
.comment_row{
	position: relative;
	padding : 0;
	margin : 0 0 5px 0;
	border-radius: 2px;
}
.comment_info{
position: relative;
display: flex;
justify-content: space-between;
padding : 7px 10px;
background-color : #f1f1f1;
border-radius: 2px;
	}
.comment_content{
	font-size : 13px;
	padding : 8px 10px;
	}
.comment_msg_no{
	width: 100%;
	height: 50px;
	padding : 17px;
	text-align: center;
	display: none;
}
.loading{
	font-size: 14px;
	margin : 0 3px;
}
.comment_more{
	width: 100%;
	font-size :13px;
	color : #516b82;
	text-align: center;
	padding: 12px 0;
	border : 1px solid rgba(81,107, 130,0.15);
	border-width: 1px 0;
	outline: none;
	overflow: visible;
	margin : 0;
	background-color: transparent;
	cursor: pointer;
}
.re{
	display:none;
	margin : 0 0 5px 28px;
}
.add_commnet{
	position: relative;
	padding : 15px;
	border-radius: 0 0 2px 2px;
	background-color : rgba(81,107,130,0.15);
}
.commentEdit{
	display: table-cell;
	float: left;
	width: 89%;
}
.commentEdit textarea{
	width: 100%;
	line-height: 19px;
	min-height: 79px;
	height: 86px;
	padding: 10px 15px;
	font-size : 13px;
	border : 1px solid #37475A;
	border-radius: 2px 0 0 2px;
	background-color : #fff;
	word-break: break-word;
	overflow: hidden;
	resize: none;

}
.commentEdit textarea:focus{
	outline: none;
}
.add_commnet_back{
	position: absolute;
	top : -88px;
}

.comment_submit{
	display: table-cell;
	color: #fff;
	width: 106px;
	height: 86px;
	font-size : 13px;
	vertical-align: middle;
	border-radius: 0 2px 2px 0;
	background-color : #37475A;
	border : 1px solid #232f2e;
	border-left: 0;
	outline: none;
	overflow: visible;
	padding: 0;
	margin : 0;
	cursor: pointer;

}
.comment_re, .comment_heart, .comment_decl{
	color: #516b82;
	cursor: pointer;
	border-radius: 0;
	border : none;
	outline: none;
	overflow: hidden;

}
.comment_decl{
	color: #d7625e;
	padding: 0 0 0 10px;
	margin : 0 0 0 10px;
	border-left: 1px dotted #ccc;
}
.comment_btn{
display : flex;
}

</style>
</head>
<body>
<%@ include file="../include/modal.jsp"%>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
<div class="board_view_wrap">
		<div class="view_content_wrap">
			<div class="view_content">
				<div class="view_data">
					<div class="view_page_body">
						
						<div class="view_head">
							<div class="viewboard_name">
								<span class="viewboard_name_icon"><i class="far fa-comments"></i></span>
								<h2><a href="#">자유게시판</a></h2>
							</div>
						</div>
						<fmt:formatDate value="${one.updatedate}" pattern="yyyy-MM-dd" var="regdate"/>
						<div class="view_title">
							<h3 class="view_subject">
								<span>${one.title}</span>
							</h3>
							
							<div class="view_detail_menu">
								<div class="view_replycnt">
									<span><strong>${one.replycnt}</strong><br>댓글</span>
								</div>
								<div class="view_goodcnt">
									<span><strong>${one.goodcnt}</strong><br>추천</span>
								</div>
								<div class="view_addfile">
									<img src="${path}/resources/img/icons8-clipboard-26.png" width="20px" height="20px">
									
								</div>
							</div>
						</div>

						<div class="view_info">
							<div class="view_info_name">
								<span class="post_name">
									<span class="post_nickname">${one.writer}</span>
								</span>
							</div>
							<div>
							<div class="view_info_viewcnt">
								<div class="view_post_count">
									<span><i class="far fa-eye"></i></span>
									<strong>${one.viewcnt}</strong>
								</div>
								<div class="post_author">
								<span>
									<span><i class="far fa-clock">
									<fmt:formatDate value="${one.updatedate}" pattern="yyyy-MM-dd HH:mm:ss"/>
									</i></span>
								</span>
							</div>
							</div>

							</div>
						</div>

						<div class="post_content_wrap">
							<div class="post_content_content_wrap">
							

							<div class="post_content">
								<article>
									<div class="post_article fr-view">
										<p>글내용~</p>
									</div>
								</article>
							</div>

							<div class="post_plus_bnt">
								<button class="post_reco_bnt"><i class="far fa-thumbs-up"></i> 추천</button>
								<button class="post_scrap_bnt"><i class="fas fa-bookmark"></i> 스크랩</button>
								<button class="post_decl_bnt"><i class="fas fa-ban"></i> 신고</button>
							</div>
							</div>



							<div class="view_content_btn">
								<div class="view_btn_left">
								
								<!-- header.referer : (무조건)이전페이지로 보내줌 -->
									<a href="${header.referer}" ><span>목록</span></a>
									<a href=""><span>답글</span></a>
								</div>
								<c:if test="${name == one.writer}">
								<div class="view_btn_right">
									<a href="#"><span>수정</span></a>
									<a href="#" class="post_delete_btn"><span >삭제</span></a>
								</div>
								</c:if>
							</div>
						</div>
					<!-- 댓글창 -->
					<div id="listReply"></div>
					
					</div>
				</div>
			</div>
		</div>
	</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script type="text/javascript">
		$(function(){ // document.ready.fuction
			//페이지로딩 되자마자 호출하는 것. 
			listReply();
		//삭제버튼 클릭시 모달창 open
			$('.post_delete_btn').click(function(){
				$('.basicmodal_wrap').css('display','flex');
			});
		
		//삭제 알림 모달창에서 확인버튼 click -> 게시글 삭제
		$('#basicbtn_yes').click(function(){
			//alert("test");
			location.href='${path}/board/delete?bno=${one.bno}';
		});
		
		});
		//댓글 목록 출력 함수 (댓글 출력할때마다 바뀌어야 해서, 빈도수가 높기 때문에 함수로 만듦)
		//여기가 호출됨.
		function listReply(){
			$.ajax({
				type: "get",
				url: "${path}/reply/list?bno=${one.bno}",//어디에 소속된bno 리플인지 알기 위해서!, reply 컨트롤러에서 list를 찾고 bno를 받아라
				success: function(result){
					//result : responsText 응답텍스트(html)
						$("#listReply").html(result);
					}
		          });
		        }
		</script>
</body>
</html>