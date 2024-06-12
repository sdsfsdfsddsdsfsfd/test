T<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//시간설정이 되어있지 않은 쿠키는 세션쿠키(브라우저가 종료되면 함께 소멸)
	//자동로그인경우에는 쿠키가 남아있어야 합니다.(쿠키에 영속성 추가해야함.)
    Cookie cookie = new Cookie("B", "Test_B.jsp");
	
	cookie.setMaxAge(60*2);//초단위. 브라우저 종료되도 2분 동안 쿠키 소멸되지 않음.
	//쿠키에 지속성이 추가되면 그 시간동안 영구적으로 보관됨
	//해당 쿠키를 2분간 영구적으로 보관. 시간, 범위가 길어기면 자동 로그인 할 수 있음.
	//자동로그인 맞춰놔도 로그인 다시하는 경우가 쿠키에 대한 정보가 날아갔을 확률이 높다.
	//브라우저 완전히 종료되도 추가적인 데이터를 집어넣거나 로그인 유지하거나 그럴수 있다.
	//자동로그인은 세션과 쿠키의 결합으로 
    response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
		<body>
			Test_B.jsp입니당 :)<br>
			<a href="Test_C.jsp">:(</a>
		</body>
</html>