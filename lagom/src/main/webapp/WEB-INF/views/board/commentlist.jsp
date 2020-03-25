<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
<!-- 컨트롤러에서 댓글 담아서 옮  -->
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="MM-dd" var="today"/>
	<div class="view_post_comment">
							<div class="comment_header">
								<span>
								<i class="fa fa-commenting"></i><strong>댓글 [${list.size()}]</strong>
								<!-- 댓글의 총 카운트 수 list.size() -->
								</span>
							</div>
							<c:forEach items="${list}" var="list">
							<div class="comment_content_wrap">
								<div class="comment_row">
									<div class="comment_info">
										<div>
											<span>${list.writer}</span>
										</div>
											<div class="comment_btn">
											<div>
											<fmt:formatDate value="${list.regdate}" pattern="MM-dd HH:mm"/>	
											</div>	
												<div class="comment_plus">
													<button class="comment_re">
														대댓글
													</button>
													<button class="comment_re">
													추천
													</button>
													<button class="comment_decl">
													신고
													</button>
												</div>
											</div>
									</div>
									
									<div class="comment_content">
										<span>${list.content}</span>
									</div>
								</div>
								<div class="comment_row re">
									<div class="comment_info">
										<div>
											<span>닉네임</span>
										</div>
										
										
										
										<div class="comment_btn">
									    	<div class="comment_plus">
												<button class="comment_re">
													대댓글
												</button>
												<button class="comment_heart">
												추천
												</button>
												<button class="comment_decl">
												신고
												</button>
											</div>
										</div>
									</div>
									<div class="comment_content">
										<span>여기에는 댓글이 들어간드아아~</span>
									</div>
								</div>	
							</div>
							</c:forEach>
						
							<div class="comment_msg_no">
								<i class="fa fa-commenting loading"></i>
							새로운 댓글이 없습니다.</div>
							<div class="comment_reflesh">
								<button class="comment_more"><strong>새로운 댓글 확인하기</strong></button>
							</div>

							<div class="comment_add">
								<div class="add_commnet_back"></div>
								<div class="add_commnet">
									<div class="commentEdit">
										<textarea id="editCommentTextarea" placeholder="댓글을 입력하세요." style="resize: none;"></textarea>
									</div>
									<button type="button" class="comment_submit">댓글쓰기</button> 
								</div>
							</div>
						</div>
</body>
</html>