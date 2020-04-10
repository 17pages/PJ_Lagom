<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
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
.wirte_content_btn > button{
	padding : 6px 14px;
	font-size: 15px;
	font-weight: bold;
	color: white;
	background-color: #636363; 
	border : 1px solid #636363;
	border-radius: 3px;
	cursor : pointer;

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
	height: 550px;
	border-bottom:1px solid #e2e2e2;

}

.write_textarea{
	resize: none;

}
/*첨부파일*/
.input_wrap{
	
	width: 100%;
	padding : 10px 15px;
	border-bottom:1px solid #e2e2e2

}
.input_wrap > span {
	font-weight : bold;
}
.input_wrap>ul {
display : flex;
}
.input_wrap > ul > li {
padding-right : 15px;

}
.board_div{
	padding-right: 11px;
}
.fileDrop{
	width: 100%;
	height: 110px;
	border : 2px dashed #9bafc1;
	text-align: center;
	line-height: 100px;
	margin-bottom : 7px;

}
.board_div{
	font-weight: bold;
}

.mailbox-attachment-info {
display : flex;
justify-content : space-between;
align-items : center;
background-color : #e7e9ec;
border : 1px solid #e7e9ec;
}
/*경고*/
.err_msg{
padding-left : 10px;
color : #d95339;
font-size : 14px;
display : none;
}


</style>
</head>
<body>
<div class="view_write_wrap">
		<div class="view_write_content_wrap">
			
			<div class="view_write_content">
				
				<div class="write_head">
					<div class="writeboard_name">
						<span class="writeboard_name_icon"><i class="far fa-edit"></i></span>
						<h2><a href="#" class="writeboard_header">게시글 등록</a></h2>
					</div>
				</div>
				<form:form id="frm_board">
				<div class="write_writer">
					<div class="write_icon"><i class="fas fa-user"></i></div>
					<div class="writer_name">${name}
						<input type="hidden" value="${name}" name="writer">
					</div>
				</div>
				
				<div class="write_select">
					<label>
						게시판 
					</label> 
					<!-- name은 DTO에 쓴거랑 맞추기 // select값은 value가 넘어옴-->
					<select class="board_type" name="type">
						<option value="free">자유게시판</option>
						<option value="qna" >Q & A</option>
						<option value="review">Review</option>
					</select>
				</div>


				<div class="wirte_title_wrap">
					<div class="write_title">제목</div>
					<div><input type="text" name="title" id="write_title" placeholder="제목을 입력해주세요." value="${one.title}"></div>
					<div class="err_msg">제목을 입력해주세요.</div>
				</div>
				<!-- 등록/수정 페이지를 공유하고 있음. 그런데 등록 페이지 (컨트롤에서)에는 one이라는 데이터를 보내지 않기때문에 새로 글쓸때에는 제목이 없는것
				고로, 수정할때만 컨트롤에서 one을 가져오니까욘..! -->


				<div class="write_content">
					<script type="text/javascript" src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
					<textarea style="width: 100%; min-height: 480px; min-width:987px;" class="write_textarea" id="board_content" name="view_content">${one.view_content}</textarea>
				</div>


				<div class="input_wrap form_group"> 
					
					<div class="fileDrop">
					<p> <i class="fas fa-file-import"></i><span>파일을 올려주세요.</span></p>
					</div>
					<!-- 첨부파일 들어오면 목록 띄우려고 ul만듦 -->
						<ul class="mailbox-attachments clearfix uploadedList"></ul>
				</div>
				
				<div class="wirte_content_btn">
					<button type="button" class="write_no_btn">취소</button>
					<button type="button" class="write_yes_btn">글 등록</button>
				</div>

			</div>
			</form:form>
			
		</div>
		
	</div>
	</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script id="fileTemplate" type="text/x-handlebars-template">
	<li>
		<div class="mailbox-attachment-icon has-img">
		<center><img src="{{imgSrc}}" alt="Attachment" class="s_img"></center>
		</div>
		<div class="mailbox-attachment-info">
			<a href="{{originalFileUrl}}" class="mailbox-attachment-name">
				<i class="fa fa-paperclip"></i> {{originalFileName}}
			</a>
			<span class="btn btn-default btn-xs pull-right delBtn" data-src="{{basicFileName}}">
				<i class="fas fa-times"></i>
			</span>
		</div>
	</li>
</script>
<script type="text/javascript">
	var flag = '${flag}';
	console.log('flag :' + flag);
	
	//Handlebars 파일템플릿 컴파일
	var fileTemplate = Handlebars.compile($("#fileTemplate").html());
	
	$(function(){
		//alert('데이터 : ' + '${one}');
		
		//register ==> 게시글 등록과 게시글 수정 공유중
		// 등록과 수정을 선택하는 
		//${one}의 값이 있으면 수정페이지 로딩 
		if(flag =='update'){
			//수정페이지로 디자인 변경
			$('.writeboard_header').text('게시글 수정');
			$('.write_yes_btn').text('수정');
			//SelectBox 값으로 selected
			$('.board_type').val('${one.type}').attr('selected', 'selected');
			
		}else if (flag == 'answer'){
			$('.writeboard_header').text('답글');
			$('.write_yes_btn').text('작성');
			$('.board_type').val('${one.type}').attr('selected', 'selected')
											   .attr('onFocus', 'this.initialSelect=this.selectedIndex')
											   .attr('onChange', 'this.selectedIndex=this.initialSelect');
			$('#write_title').val('RE: ' + '${one.title}').attr('readonly', 'readonly');
		}
			//1. 웹브라우저에  drag&drop 시 파일이 열리는 문제 (기본효과)
			// : 기본효과를 막을거임!
			$('.fileDrop').on('dragenter dragover', function(e){
				e.preventDefault();
			});
			
			//2. 사용자가 파일을 drop했을 때
			$('.fileDrop').on('drop', function(e){
				e.preventDefault();
				
				var files=e.originalEvent.dataTransfer.files; //드래그에 전달된 첨부파일 // 배열로 들어가게됨
				var file=files[0]; // 그중 하나만 꺼내옴 // 가장 첫번째로 넣었던거
				
				var formData = new FormData(); // 폼 객체 생성
				formData.append('file', file) // 폼에 파일 1개 추가
				
				//서버에 파일 업로드 // 제이쿼리코드
				$.ajax({
					url : '${path}/upload/uploadAjax',
					data : formData,
					datatype : "text",
					processData : false, // 쿼리스트링 방식(url로 보내겠다는 뜻) 생성X
					contentType : false, // 서버단으로 전송하는 데이터 타입을 multipart로 만듦 // 반드시 셋팅해야함. 
					//false로 주게 되면 multipart가 됨 첨부파일을 넣으려면 multipart를 써야함. 확장팩 개념 
					type : 'POST', //첨부파일 보낼대는 무조건 post 
					success : function(data){//이 data가 받는게 datatype // ajaxuploadcontroller에서 return이 여기로 들어옴. //파일경로+성공200
						console.log(data);
						//data : 업로드한 파일 정보와 http 상태 코드
						printFiles(data); // 첨부파일 출력 메서드 호출
					}
					
				});
			});
			//버튼을 눌렀을때 디자인, 로컬가서도 삭제되게 할거임 
			$('.uploadedList').on('click', '.delBtn', function(event){
				var bno = '${one.bno}'; 
				var that = $(this);
				
				//게시글 등록시
				if(bno == ''){
					//alert('bno=' + bno);
					$.ajax({
						url : '${path}/upload/deleteFile',
						type : 'POST',
						data : {fileName : $(this).attr('data-src')},
						success : function(data){ // 성공하면 deleted들어있음
							if(data == 'deleted'){
								that.parents('li').remove();//parents는 내부모의 부모의 부모 등등.. 특정것을 찾으라는거 =내조상중에 li찾아라
							} //remove는 태그 없애버림 
						}, error : function(){
							alert('System Error!!');
						}
					});
				}else{//게시글 수정시
					
				}
							
			});
	});
	//파일 정보 처리
	function getFileInfo(fullName) { // 2020..... 이거 
		var originalFileName;   // 화면에 출력할 파일명
		var imgSrc;             //썸네일 of 파일아이콘 이미지 파일
		var originalFileUrl;    //원본파일 요청 URL
		var uuidFileName;       //날짜경로를 제외한 나머지 파일명
		var basicFileName = fullName; //삭제시 값을 전달하기 위한
		
		//이미지 파일이면
		if(checkImageType(fullName)){
			imgSrc = "${path}/upload/displayFile?fileName=" + fullName; // 썸네일 이미지 링크
			uuidFileName=fullName.substr(14); // 순수이미지 이름만 남음 s_까지 잘림 
			var originalImg = fullName.substr(0, 12) + fullName.substr(14); // 0은포함 12는 미포함. //원본이미지
			//원본 이미지 요청 링크
			originalFileUrl = "${path}/upload/displayFile?fileName=" + originalImg;
		}else{
			imgSrc = "${path}/resources/img/file-icon.png";//파일 아이콘 이미지 링크
			uuidFileName = fullName.substr(12);
			//파일 다운로두 요청 링크
			originalFileUrl = "${path}/upload/displayFile?fileName=" + fullName;
		}
		originalFileName=uuidFileName.substr(uuidFileName.indexOf("_")+1);
		//파일이름 안나오면 여기 체크하기
		
		//전체 파일명의 크기가 14보다 작으면 그대로 이름 출력, 14보다 크면 실행 
		 	 if(originalFileName.length > 14) {
			 //앞에서부터 11글자 자름
			 var shortName = originalFileName.substr(0,10);
			 //.을 기준으로 배열 생성
			 var formatVal = originalFileName.split(".");
				 //formatVal = originalFileName.substr(originalFileName.length-3)
			 //파일명에 .이 여러개 들어가 있을수도 있음
			 // 배열크기를 구해와서 무조건 맨 마지막 확장자부분 출력되게 함
			 var arrNum = formatVal.length -1;
			 //맨 처음 문자열 10글자 + ... + 확장자
			 originalFileName = shortName + "..." + formatVal[arrNum];
		 }
		 return {originalFileName: originalFileName, imgSrc: imgSrc, originalFileUrl: originalFileUrl, fullName: fullName, basicFileName: basicFileName}
			//
	} 
	
	
	
	//첨부파일 출력
	function printFiles(data) {
		//파일 정보 처리
		var fileInfo = getFileInfo(data);
		console.log(fileInfo);
		//Handlebars 파일 템플릿에 파일 정보들을 바인딩하고 HTML생성
		var html  = fileTemplate(fileInfo);
		html += "<input type='hidden' class='file' value='" + fileInfo.fullName+"'>";
		//Handlebars 파일 템플릿 컴파일을 통해 생성된 HTML을 DOM에 주입
		$(".uploadedList").append(html);
		//이미지 파일인 경우 aaaaaaaaaaaaaaaa파일 템플릿에 lightbox속성 추가
		if(fileInfo.fullName.substr(12,2) === "s_"){
			//마지막에 추가된 첨부파일 템플릿 선택자
			var that = $(".uploadedList li").last();
			//lightbox속성추가
			that.find(".mailbox-attachment-name").attr("data-lightbox", "uploadImages");
			//파일 아이콘에서 이미지 아이콘으로 변경
			that.find(".fa-paperclip").attr("class", "fa fa-camera");
			}
	}
	
	function getOriginalName(fileName){
		if(checkImageType(fileName)) { //이미지 파일이면 skip
			return;
		}
		var idx=fileName.indexOf("_")+1; // uuid를 제외한 파일이름
		return fileName.substr(idx);
	}
	function getImageLink(fileName){
		if(!checkImageType(fileName)){ // 이미지 파일이 아니면 skip
			return;
		}
		var front=fileName.substr(0,12); // 연월일 경로
		var end=fileName.substr(14); //s_ 제거
		return front+end;
	}
	function checkImageType(fileName){
		var pattern = /jpg|gif|png|jpeg/i; // 정규표현식(대소문자 무시)
		return fileName.match(pattern); //규칙에 맞으면 true //파일 이름 비교해서 pattern이 있는지 확인하는거 
	}
	
	//첨부파일 리스트를 출력하는 함수
	function listAttach(){
		var listCnt = 0;
		$.ajax({
			type : "post",
			url : "${path}/board/getAttach/${one.bno}",
			async: false,
			success : function(list){
				//list : json
				//console.log(list);
			listCnt = list.length;
			
			/*console.log(list.length);*/
			/*
				jQuery each()는 반복문
				i와 e는 index와 element로
				json에서 {0: "apple.png"}일 때
				index는 0, element는 apple.png가 됨
			*/
			$(list).each(function(i,e){
				/*console.log(list)*/
				printFiles(e); // 첨부파일 출력 메서드 호출
			
				});
			}
		});
		return listCnt;
	}
	
	$(document).on('click', '.write_no_btn', function(){
		var referer = '${header.referer}';
		//console.log('이전 URL : ' + referer);
		var index= referer.indexOf('/board/list');
		//console.log('index :' + referer.indexOf('/board/list'))
		
		if(index != '-1'){
			//글목록에서 글쓰기 버튼들어왔을때
			location.href='${header.referer}';
		} else if('${one}' != ''){
			location.href = '${path}/board/view/${one.bno}';
		} else{
				//외부에서 들어왔을때
			location.href='${path}/board/list';	
		}
		//location.href='${header.referer}';
	});
	
	$(document).on('click', '.write_yes_btn', function(){
		//유효성체크 (제목)
		var title = $('#write_title').val();
		if(title == '' || title.legnth == 0) {
			//에러메세지 '제목을 입력해주세요.'
			$('.err_msg').css('display', 'block');
			return false;
		}else{
			//서버로 전송
			//alert('서버로 ㄱㄱ');
			//스마트 에디터 값을 #board_content에 넣으라는 뜻
			oEditors.getById["board_content"].exec("UPDATE_CONTENTS_FIELD", []);
			
			//정규식을 통해 HTMl태그를 제거 한 순수 txt만 추출
			var view_content = $('#board_content').val();
			console.log('view_content : ' + view_content);
			//스마트 에디터 값 다 들어가있음

			var search_content = view_content.replace(/(<([^>]+)>)/ig,"").replace("&nbsp;","");
			console.log('search_content : ' + search_content);
			//순수텍스트만 ㅇㅇ
			
			//form태그의 게시글등록 버튼을 눌렀을때 append( 폼태그의 끝에 추가)
			$('#frm_board').append('<textarea id="search_content" name="search_content"></textarea>');
			$('#search_content').val(search_content);
			
			$('#frm_board').submit();
			//alert('서버로 ㄱㄱ');
		}
	});
	
	$(document).on('keyup', '#write_title', function(){
		var len = $(this).length;
		
		if(len !=0){
			$('.err_msg').css('display', 'none');
		}
	});

</script>
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
 		oAppRef: oEditors,
 		elPlaceHolder: "board_content",
 		sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
 		fCreator: "createSEditor2"
	});
</script>


</html>