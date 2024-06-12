<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>:::사원정보:::</title>
		<script>
			function find(){
				let deptno = document.getElementById("deptno").value;
				//이 값을 서블릿으로 보냄
				
				location.href="sawonlist.do?deptno="+deptno;
			}
			
			window.onload = function(){
				let deptno= document.getElementById("deptno");
				let dept_array = [0, 10, 20, 30, 40, 50];
				
				for(let i=0;i<dept_array.length;i++){
					if('${param.deptno}' == dept_array[i]){//파라미터의 deptno값과 i의 값이 일치할때
						deptno[i].selected = true;
					//<select>내부 <option>은 각자 index값이 부여됨.(0, 1, 2, ...)
					//파라미터로 보내는 값과 일치하는 index번호의 값을 <select>에 고정시킴.
						break;
					}
				}
				
			}
		</script>
	</head>
		<body>
		<div align="center">
				<select id="deptno">
					<option value="0">::부서를 선택하세요::</option>
					<option value="10">총무부</option>
					<option value="20">영업부</option>
					<option value="30">전산실</option>
					<option value="40">관리부</option>
					<option value="50">경리부</option>
				</select>
				<input type="button" value="검색" onclick="find();">
			</div>
			<table border="1" align="center">
				<caption>사원목록</caption>
				<tr>
					<td>사번</td>
					<td>이름</td>
					<td>성별</td>
					<td>부서번호</td>
					<td>직책</td>
					<td>입사일</td>
					<td>상사번호</td>
					<td>급여</td>
				</tr>
				<c:forEach var="vo" items="${ list }">
					<tr>
						<td>${ vo.sabun }</td>
						<td>${ vo.saname }</td>
						<td>${ vo.sagen }</td>
						<td>${ vo.deptno }</td>
						<td>${ vo.sajob }</td>
						<td>
						${ fn:split(vo.sahire,' ')[0] }<!-- 데이터를 공백 기준으로 나눔. -->
						<!-- 날짜에 시간이 같이 들어간 경우가 종종 있다 -->
						</td>
						<td>${ vo.samgr }</td>
						<td>${ vo.sapay }</td>
					</tr>
				</c:forEach>
			</table>
		</body>
</html>