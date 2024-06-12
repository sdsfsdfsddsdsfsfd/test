<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="js/httpRequest.js"></script>
		<script>
			window.onload = function(){//페이지 로드와 함께 가장 먼저 동작하는 영역
				
				//재생하고자 하는 비디오 목록 얻어오기
				let url = "movie_list_json.jsp";//여기로 감.
				sendRequest(url, null, resFn, "GET");
			}
			function resFn(){
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText;
					//alert(data);
					
					//얻어온 data를 실제 json구조로 변환
					//문장형태->json구조로 변환됨.
					//데이터를 자바스크립트 코드로 전환.
					//let json = eval(data);
					
					//데이터를 자바스크립트 객체로 전환. ''만 사용 가능.
					let json = JSON.parse(data);
					//let json = (new Function('return '+data))();//return 후 띄어쓰기!
					
					//select 태그에 option추가
					let movie_select = document.getElementById("movie_select");
					
					for(let i=0;i<json.length;i++){
						let option = document.createElement("option");
						option.innerHTML = json[i].title;
						option.value=json[i].path;
						movie_select.appendChild(option);
					}//for
					
				}//if
				
			}//resFn()
			
			function movie_play(){
				let path = document.getElementById("movie_select").value;
				let my_video = document.getElementById("my_video");
				
				my_video.src = path;
				my_video.stop();//자동 재생. 자동재생 원하지 않으면 stop().
			}//movie_play
		</script>
		<style>
		#my_video{margin:20px;}
		</style>
	</head>
		<body>
			<select id="movie_select" onchange="movie_play();">
				<!-- 선택이 바뀌면 movie_play 호출함. -->
				<option>:::재생할 영상을 선택하세요:::</option>
			</select>
			<br>
			<video src="" id="my_video" controls="controls"
			width="320" height="240"><!-- src : 영상 경로, controls : 노출 혹은 안보이게 -->
			
			</video>
		</body>
</html>