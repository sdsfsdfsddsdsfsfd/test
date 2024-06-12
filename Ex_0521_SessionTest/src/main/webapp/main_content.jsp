<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
		</style>
	</head>
		<body>
			<jsp:include page="check_login.jsp"/><!-- 외부페이지 띄움, 로그인 한 후 접근할 수 있는 페이지에 필요한 코드 -->
			<!-- include : 실행되기 전에 다른 jsp(check_login.jsp)를 먼저 실행함 -->
			메인페이지<br>
			${ user.name }님 환영합니다!
			<br>
			<input type="button" value="로그아웃" onclick="location.href='logout.do'">
		</body>
</html>