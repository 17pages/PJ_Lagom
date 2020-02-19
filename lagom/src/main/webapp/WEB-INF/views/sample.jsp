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
	<input type="text" name="user">
	<input type="password" name="pass">
	<button type="submit">POST</button>
	</form>
	 

</body>
</html>