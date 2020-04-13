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

.board_wrap{

width: 100%;
margin : 65px 0 auto;
background-color: #f1f1f2;
}
.board_content_wrap{
min-width: 1280px;
margin : 0 auto;
padding-bottom: 150px;
}

.board_content{
	width: 1050px;
	margin : 0 auto;
	max-width: 100%;
	box-sizing: border-box;
	position: relative;
	border : 0px solid #000;
	background-color : #fff;
	padding : 5px 15px;
}

.board_title{
	width: 100%;
	height: 40px;
	line-height: 40px;
	background-color: #fff;
	border : 0px solid #EFEFEF;
	margin-top: 30px;
	margin-bottom : 20px;
}
.board_title .title_box{
	width: 250px;
	text-align: center;
	height: 40px;
	margin : 0 auto;
	border-top: 1px solid #E1E1E1;
	border-bottom: 1px solid #E1E1E1;
}
.title_box{
	width: 100%;
	height: 40px;
	line-height: 40px;
	background-color: #FFF;
	border : 0px solid #EFEFEF;
	margin-top: 30px;
	margin-bottom : 50px;
}

.board_table_list{
	margin-top : 5px;
}

/*정렬*/
.board_sort_choice{
	display: flex;
	justify-content: space-between;
	padding: 0 -4px;
}
.board_sort_choice_c{
	display: flex;
}
.board_sort_choice_c a {

	padding-right: 5px;
	margin-right: 5px;
	font-weight: bold;
	padding-bottom: 3px;
}




/*테이블*/
table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	table-layout: fixed;
	word-wrap: break-word;
	word-break: keep-all;
}
.board_table_wrap table tr {
	border-bottom: 1px solid #ddd;
}
tr{
	display: table-row;
	vertical-align: inherit;
	border-color : inherit;
}
.board_table_wrap table tr td{
	line-height: 44px;
	color: #333;
	font-size: 13px;
	text-align: center;
	font-weight: normal;
}

.board_table_wrap table tr th{
	line-height: 44px;
	color: #333;
	font-size: 13px;
	text-align: center;
	font-weight: bold;

}

.board_table_list thead th{
	color: #9d9d9d;
	font-weight: bold;
	border-top: 1px solid #e5e5e5;
	border-bottom: 1px soid #e5e5e5;
}

.title_name{
	font-weight: bold;
	font-size: 15px;
}
.tb_left{
	text-align: left;
	padding : 0 10px;
}
.tb_left_wrap{
	display: flex;
	align-items: center;
	align-content: flex-start;
	

}

.tb_img{
	width: 58px;
	height : 24px;
	display: flex;
	justify-content: center;
}

thead{
background-color:#cdbcb3;
}
.reply_cnt{
color : #ff5e00;
padding-left: 3px;
font-weight: bold;
cursor:default;

}


/*글쓰기버튼, 검색창*/
.board_write_btn{
	width: 100%
	border : 0px solid #000;
}
.bbs_sch{
	margin-top : 20px;
	margin-bottom: 10px;
	float: left;

}
fieldset {
	border : 0 none;
	margin : 0;
	padding : 0;
	display: block;
	margin-inline-
}

.board_search{
	display: flex;
	align-items: center;
	background-color: #E1E1E1;
	border-radius: 2px;
}
.board_search_input{
	background-color: transparent;
	border-color: transparent;
	font-size: 13px;
	width: 260px;
	height: 44px;
	border-radius: 2px;
	padding: 10px 12px;
	outline: none;
/*input 태그 focus시 파랑테두리*/
}
.board_search_btn {
	/* transparent : 투명으로 해줌*/
	background-color: transparent;
	border-color: transparent;
	width : 44px;
	height: 44px;
	cursor : pointer;
	color: #636363;
	border-top-right-radius: 2px;
	border-bottom-right-radius: 2px;
}
.board_search_btn:hover{
	background-color: #636363;
	color: white;
}
.frm_search {
	margin: 0 auto;
}
.board_write_btn{
	display: flex;
	align-items: center;
	justify-content: flex-end;
	padding: 20px 25px;
}
.board_write_btn_wrap{
	padding-left: 11px;

}
.write_btn{
	display: inline-block;
	padding : 6px 10px;
	line-height: 20px;
	background-color : #636363;
	border : none;
	color: #fff;
	text-decoration: none;
	font-size: 12px;
	font-weight: bold;
	letter-spacing: 0px;
	cursor: pointer;
	outline: none;
	border-radius : 3px;
}
.search_result{
display : flex;
align-items:center;

}
.reset_bnt{
cursor : pointer;
padding-top : 3px;
}

/*New표시*/
.twincle_eff{
	animation-name: twinkle;
	animation-duration: 1.2s;
	animation-iteration-count: infinite;
}
.new_color{
	color: #ff2f3b;
	padding: 3px 5px;
	font-weight : bold;
	font-size : 12px;
	cursor : default;
}
@keyframes twinkle{
0%{	opacity : 0;}
100%{opacity : 1;}
}



/*paging*/
.board_paging_wrap{
	text-align: center;
	padding : 10px;
}

.board_paging{
	display: inline-block;
}

.board_paging a {
	color: black;
	float: left;
	padding : 8px 10px;
	text-decoration: none;
	border-radius: 3px;
	font-weight : bold;
}


.board_paging a:hover:not(.active){
	background-color : #ebe5e2;
}
#check_color{
    border: 0px solid black;
    background-color: #ccbcb5;
    color: white;
}
.empty_val{
withd : 20px;
height : 20px;
}
</style>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>

<div class="board_wrap">
<header>
	<div class="header">
		<h1 class="Lagom_logo">
			<a href="${path}/" class="l_logo"></a>
				</h1>
			</div>
</header>
		<div class="board_content_wrap">
			<div class="board_content">
				<div class="board_data">
					<div class="page_body">
						<div class="board_title">
							<div class="title_box">
								<span class="title_name">자유게시판</span>
							</div>
						</div>
						<div class="board_sort">
							<div class="board_sort_choice">
								
								<div class="search_result">
								<c:if test="${!empty map.keyword}">
									<div><span>"<span style="font-weight:bold">${map.keyword}</span>" 검색결과 <span style="font-weight:bold">${map.count}</span>건 검색되었습니다.</span></div>
									<div class="reset_bnt"><a href="${path}/board/list"><img src="${path}/resources/img/icons8-cancel-30.png" width="20px"></a></div>
								</c:if>
								</div>
								
								<div class="board_sort_choice_c">
									<div><a href="${path}/board/list?sort_option=new&keyword=${map.keyword}" id="sort_new">최신순</a></div>
									<div><a href="${path}/board/list?sort_option=cnt&keyword=${map.keyword}" id="sort_cnt">조회순</a></div>
									<div><a href="${path}/board/list?sort_option=good&keyword=${map.keyword}" id="sort_good">추천순</a></div>
									<div class="last_choice" id=""><a href="${path}/board/list?sort_option=reply&keyword=${map.keyword}" id="sort_reply">댓글순</a></div>
								</div>
								
							</div>
						</div>
						<div class="board_table_list board_table_wrap">
							<table>
								<colgroup>
									<col width="70px">
									<col width="*">
									<col width="100px">
									<col width="60px">
									<col width="60px">
									<col width="90px">
									<col width="60px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">
											<div class="tb_num">NO.</div>
										</th>
										<th scope="col">
											<div class="tb_title">TITLE</div>
										</th>
										<th scope="col">
											<div class="tb_id">NAME</div>
										</th>
										<th scope="col">
											<div class="tb_count">HITS</div>
										</th>
										<th scope="col">
											<div class="tb_reco">GOOD</div>
										</th>
										<th scope="col">
											<div class="tb_date">DATE</div>
										</th>
										<th scope="col">
											<div class="tb_date">첨부파일</div>
										</th>
									</tr>
								</thead>
								<!-- 게시글 -->
								<c:forEach items="${map.list}" var="list">
								<fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd" var="regdate"/>
									
									
								<tbody>
									<tr>
										<td>
											<div class="tb_num">${list.bno}</div>
										</td>
										<td>
											<div class="tb_left_wrap">
												<div class="tb_left" id="title">
													<c:if test="${list.re_level !=0}">
														<c:forEach begin="1" end="${list.re_level}">
															<img class=empty_val src="${path}/resources/img/icons8-down-right-50.png">
														</c:forEach>
														RE:
													</c:if>
													<a href="${path}/board/view/${list.bno}">${list.title}</a>
													<span class="reply_cnt">[${list.replycnt}]</span>
												
													<c:if test="${today == regdate}">
														<span class="new_color twincle_eff">N</span>
													</c:if>	
												</div>
											</div>
										</td>
										<td>
											<div class="tb_id">${list.writer}</div>
										</td>
										<td>
											<div class="tb_id">${list.viewcnt}</div>
										</td>
										<td>
											<div class="tb_id">${list.goodcnt}</div>
										</td>
										<td>
											<div class="tb_id">
												<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd" var="update"/>
												<c:choose>
													<c:when test="${today == update}">
														<fmt:formatDate value="${list.updatedate}" pattern="HH:mm:ss"/>
													</c:when>
													<c:otherwise>
														<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd"/>
													</c:otherwise>
												</c:choose>
											</div>
										</td>
										<td>
										<c:choose>
										<c:when test="${listCnt == 0}">
											<div class="tb_id tb_img"><img src="${path}/resources/img/icons8-clipboard-26 gray.png"></div>
										</c:when>
										<c:otherwise>
											<div class="tb_id tb_img"><img src="${path}/resources/img/icons8-clipboard-26.png"></div>
										</c:otherwise>
										</c:choose>
										</td>
										
									</tr>
								</tbody>
								</c:forEach>
							</table>
						</div>
						<div class="board_write_btn">
							<div class="border_content_search">
								<form name="frm_search" action="${path}/board/list" method="GET">
									<div class="board_search">
										<input type="text" name="keyword" placeholder="검색어를 입력하세요." class="board_search_input" value="${map.keyword}">
										<button type="submit" class="board_search_btn"><i class="fas fa-search"></i></button>
									</div>
								</form>
							</div>
							
							<div class="board_write_btn_wrap">
							<button class="write_btn"><div class="write_btn">글쓰기</div></button>
							</div>
							
						</div>
						<div class="board_paging_wrap">
							<div class="board_paging">
							
							<c:if test="${map.pager.curBlock > 1}">
								<a href="${path}/board/list?curPage=${map.pager.blockBegin-10}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="page_left"><i class="fas fa-angle-left"></i></a>
								<a href="${path}/board/list?curPage=1&sort_option=${map.sort_option}&keyword=${map.keyword}" class="">1</a>
								<a style="cursor:default"><span>...</span></a>
							</c:if>
							<!-- foreach=for문과 같음..반복할때마다 나오는 값을 num에 넣겠다.  -->
								<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
									<c:choose>
										<c:when test="${num == map.pager.curPage}">
											<a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}" id="check_color">${num}</a>
										</c:when>
										<c:otherwise>
											<a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}" >${num}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<c:if test="${map.pager.curBlock < map.pager.totBlock}">
								<a style="cursor:default"><span>...</span></a>
								<a href="${path}/board/list?curPage=${map.pager.totPage}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="">${map.pager.totPage}</a>
								<a href="${path}/board/list?curPage=${map.pager.blockEnd + 1}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="page_right"><i class="fas fa-angle-right"></i></a>
								
							</c:if>
								
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	$(function(){
		var sort_option = '${map.sort_option}';
		if(sort_option != null) {
			$('#sort_' + sort_option).css('color', '#236bcc');
			$('#sort_' + sort_option).css('border-radius', '5px');
			$('#sort_' + sort_option).css('font-weight', 'bold');
		}
		
		
	
	});
	
	$(document).on('click','.write_btn',function(){
		//alert("ㄱㄱ");
		location.href='${path}/board/write';
		
	});
	
	

		
	</script>
</body>
</html>