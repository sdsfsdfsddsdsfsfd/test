<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSON(Javascript Object Notation) : 서로 다른 플랫폼에서 데이터를 교환하기 위한 표기법  -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			//가장 단순한 형태의 JSON 표기법
			let p = {'name':'일길동','age':20, 'tel':'010-1111-1111'};
			//map 처럼 key값, value값 함께있는 형태의 데이터를 사용함. 중간에 :으로 데이터 연결함.
			//제이슨 형태의 데이터를 p가 받음
			
			//JSP에서 JSON 해독 방법
			document.write("이름 : " + p.name + "<br>");
			document.write("나이 : " + p.age + "<br>");
			document.write("전화번호 : " + p.tel + "<br>");
			document.write("전화번호 : " + p['tel']);//동일한 방식임.
			
			document.write("<hr>");//정수는''으로 묶어도 되고 안묶어도 ㄱㅊ
			let sido=[ {'name':'일길동','age':30},
					   {'name':'이길동','age':32},
					   {'name':'삼길동','age':35} ];//다차원 형태의 배열. 여러 데이터 가져옴.
			
			document.write( sido[0].name + "/" + sido[0].age + "<br>");
			document.write( sido[1].name + "/" + sido[1].age + "<br>");
			document.write( sido[2].name + "/" + sido[2].age + "<br>");
			//Jason의 다차원 구조배열
			//1차원 배열 형태도 있음.
			
			//혼합형
			document.write("<hr>");
			
			let course = { 'name' : '백엔드개발과정',
						   'start' : '2024-02-01',
						   'end' : '2024-08-01',
						   'sub' : ['java','jsp','javascript'],
						   'student' : [ {'name':'홍길동', 'age':25}, {'name':'박길동','age':27}]};
			
			document.write("과목이름 : " + course.name + "<br>");
			document.write("시작일 : " + course.start + "<br>");
			document.write("종료일 : " + course.end + "<br><br>");
			
			document.write("과목 : " + course.sub[0] + "/" + 
									  course.sub[1] + "/" +
									  course.sub[2] + "<br><br>");
			document.write("학생들"+"<br>");
			document.write("1. " + course.student[0].name + "<br>");
			document.write("2. " + course.student[1].name + "<br>");
			document.write("3. " + course.student[2].name + "<br>");
			// 
			//document.write("학생 : " + course.student[0].name + "/" + course.student[0].age+"<br>");
			//
			
		</script>
	</head>
		<body>
			<!-- 자바로 서버에 요청하면 서버에서 자바로 돌려줌
			자바에서 요청한걸 자바에 맞게 돌려야 한다면 불편함.(자바에서도 요청, 안드로이드에서도 요청, 등등등)
			언어에 맞게 돌려주는게 어려움
			그래서 약속이 되어있는 표기법으로 보냄.(공용어같은건가?)
			결과값만 보내.
			각자 언어에서 풀어서 각자 언어에 맞게 사용함.
			공통된 형태의 데이터를 보내니까 풀어서 사용할줄만 알면 좋죠. 공공데이터같은거 요청하면 데이터 넘어오는것 완전히 언어별로 동일함.
			제이슨 타입으로 넘겨줍니다.
			JSP에서는 어떤 식으로 풀어보는지 배울거게요. -->
		</body>
</html>