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
								<input type="hidden" class="replyListCnt" value="${list.size()}">
								<!-- list.size는 comment꺼임 -->
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
											<div style="padding-right:7px;">
											<fmt:formatDate value="${list.regdate}" pattern="MM-dd HH:mm"/>	
											</div>	
												<div class="comment_plus">
													<button class="comment_re" style="padding:0;">
														대댓글
													</button>
													<button class="comment_re" style="padding:0;">
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
							<c:if test="${list.size() == 0}">
							<div class="comment_content_wrap">
								<div class="comment_row">
									<div class="comment_info">
										<div>
											<span>관리자</span>
										</div>
											<div class="comment_btn">
											<div class="comment_time">
											<fmt:formatDate value="${now}" pattern="MM-dd HH:mm"/>	
											</div>	
											</div>
									</div>
									
									<div class="comment_content">
										<span>등록된 게시글이 없습니다.</span>
									</div>
								</div>
							</div>
							</c:if>
						
							<div class="comment_msg_no">
								<i class="fa fa-commenting loading"></i>
							새로운 댓글이 없습니다.</div>
							<div class="comment_reflesh">
								<button type="button" class="comment_more"><strong><i class="fas fa-sync-alt"></i> 새로운 댓글 확인하기</strong></button>
							</div>
							
							<c:choose>
								<c:when test="${empty userid}">
								<div class="comment_add">
								<div class="add_commnet_back"></div>
								<div class="add_commnet">
									<div class="commentEdit comment_nologin">
										<textarea id="editCommentTextarea" placeholder="로그인을 하셔야 댓글을 등록할 수 있습니다." style="resize: none; cursor:pointer;" readonly></textarea>
									</div>
									<button type="button" class="comment_submit_nologin" style="cursor : default;" readonly>댓글쓰기</button> 
								</div>
							</div>
								</c:when>
							<c:otherwise>
							<form class="frm_reply">
							<input type="hidden" name="bno" class="reply_bno">
							<input type="hidden" name="type" class="reply_type">
							<input type="hidden" name="writer" class="reply_writer">
							<div class="comment_add">
								<div class="add_commnet_back"></div>
								<div class="add_commnet">
									<div class="commentEdit">
										<textarea id="editCommentTextarea" name="content" placeholder="댓글을 입력하세요." style="resize: none;"></textarea>
									</div>
									<button type="button" class="comment_submit">댓글쓰기</button> 
								</div>
								<div class="comment_msg_nono"><span>댓글을 입력해주세요.</span></div>
							</div>
							</form>
							</c:otherwise>
							</c:choose>
						</div>
</body>
</html>