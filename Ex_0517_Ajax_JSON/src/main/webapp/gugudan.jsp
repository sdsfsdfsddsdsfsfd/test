<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- Ajax(Asynchronus Javascript&XML) : 비동기 통신
    자바스크립트를 이용한 백그라운트 통신기술로써 하나의 웹페이지 안에서
    변경사항이 발생한 특정한 일부분에 대해서만 부분 갱신이 가능해 짐. -->
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- Ajax 연동을 위한 httpRequest.js참조(오타 주의!!) -->
		<script src="js/httpRequest.js"> /* 
		주소 안에 있는 변수들을 마음대로 쓸 수 있음. 참조해 가져온게 있다면 무언갈 정의할 수 없음(함수, 변수 등) */
			//자바 스크립트 영역
		</script>
		<script>
			function send(){
				let dan = document.getElementById("dan").value;
				//유효성 체크 했다 치고
				//dan을 Ajax를 통해 서버로 전달
				let url = "gugudan_ajax.jsp";
				let param = "dan="+dan;//파라미터도 같이 보냄.
				
				sendRequest(url, param, resultFn, "GET");
				//sendRequest(url, 전송할 파마미터, 콜백메서드, 전송방식);
				//콜백메서드 : 알아서 복귀해주는 메서드. 이름은 임의로 지을수 있음.
				//페이지 전환되면 작업 끝난후, resultFn으로 되돌아옴. 
			}//send()
			
			function resultFn(){
				console.log(xhr.readyState + "/" + xhr.status);
				//xhr.readyState, xhr.status 두개 외워.
				/*xhr.readyState : 만약 0=> 초기화 오류(나오면 안되요)
									1,2,3-> 로딩중
									4-> 페이지 로드 완료
				xhr.status : 200-> 이상없음
								404, 500,...->경로, 서버에러 등 의 오류
				*/
				if(xhr.readyState == 4 && xhr.status == 200){
					//콜백으로 수신된 데이터를 읽어오기
					let data = xhr.responseText;
					
					//alert(data);
					//jsp의 연산 코드가 콜백됨.
					
					let disp = document.getElementById("disp");
					disp.innerHTML = data;//화면새로고침 아니고 일부분만 갱신됨.
				}
			}
		</script>
		<sytle>
			#disp{background:yellow;}
		</sytle>
	</head>
		<body>
			<!-- Ajex라는 기술을 확인할거에요. 
			준비해놓은 자바스크립트 파일이 필요함. 인터넷 어디서든 쉽게 얻을 수 있어요. -->
			
			단 : <input id="dan">
			<input type="button" value="확인" onclick="send();">
			<br>
			<div id="disp"></div>
			
			
			
			
			
			
			
			
		</body>
</html>