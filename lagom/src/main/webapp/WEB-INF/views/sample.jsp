<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sample.jsp</title>
</head>
<body>
	<a href="${path}/sample/view?user=배뚱&pass=1234">GET</a>

	<!-- input, textarea, select, radio, check 등 사용자가 입력한 값이나 choice한 값만 / 네임만 써야 받을 수 있음!! -->
	<form action="${path}/sample/view" method="POST">
		<input type="text" name="user"> <input type="password"
			name="pass">
		<button type="submit">POST</button>
	</form>

	<img src="${path}/resources/img/kitchen-2165756_1280.png"
		style="width: 500px; height: 500px;">

	<a href="${path}/sample/sync?name=배뚱아">동기방식</a>
	<button type="button" id="ajax_btn">비동기방식(AJAX)</button>

	<br>

	<div>
		<span>동기 : ${name}</span>
	</div>
	<div>
		<span>비동기 : <span id="ajax_txt"></span></span>
	</div>

</body>
<script type="text/javascript">

$('#ajax_btn').on('click', function(){
	

//type : GET or POST
//URL : 서버단 목적지(RequestMapping으로 받는 요청)
//contentType : 서버단으로 전송하는 데이터의 타입(요즘은 생략해도 자동으로 해줌)
//data : 서버로 전송하는 실제 데이터 
//{key : value, key:value}<-json
//dataType : 서버단에서 view단으로 전송하는 데이터 타입(생략 : String)
//success : AJAX 성공했을 때 작업(DATE : AJAX 서버단 Return값)
//error : AJAX 실패했을 때 작업
//ajex 페이지 전환을 하지 않기때문에(데이터단에 갔다가다 자신에게로 돌아옴 : 못돌아오면 오류남) model못씀 그래서 date를 받음 그 외에도 list,map다 받을 수 있음


$.ajax({
		type: 'POST',
		url: '${path}/sample/ajax?name=뚱깐징어',
		/* data: {name: '뚱깐징어'}, */	
		success: function(data){
			console.log(data);
			$('#ajax_txt').text(data);
			
		},
		error: function(){
			alert('System ERROR :(');
		}
	});
});
</script>
</html>