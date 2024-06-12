<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//쿠키(삭제, 허용 등)-->어떤 사이트에 방문했을때, 사이트가 사용하고 있는 서버 쪽에서 클라이엔트에게 설치해주는 기록이 담긴 파일
	//Cookie : 인터넷 사용자가 웹사이트를 방문할 경우 그 사이트가 사용중인 서버에서
	//클라이언트에게 설치하는 기록 정보파일.
	//이는 사용자가 같은 웹사이트를 방문 할 때마다 읽히고, 수시로 새로운 정보로 갱신된다.
	Cookie cookie = new Cookie("A","Test_A.jsp");//누군가가 들어오면 pc에 기록을 남김
	response.addCookie(cookie);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
		<body>
			Test_A.jsp ...^^<br>
			<a href="Test_B.jsp">:)</a>
		</body>
</html>