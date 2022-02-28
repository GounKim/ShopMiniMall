<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- member/memberForm.jsp -->
<script type="text/javascript">
	
	var httpRequest;
	function req() {
		httpRequest = new XMLHttpRequest();
		
		//요청시 응답처리하는 함수 호출
		httpRequest.onreadystatechange = responseFun;
		
		var id = document.querySelector("#userid").value;
		
		httpRequest.open("get", "MemberIdCheckServlet?userid=" + id, true);	// 비동기
		httpRequest.send(null);	// get방식이면 null
	}
	
	function responseFun(){
	    if(httpRequest.readyState == 4 && httpRequest.status == 200){	// 성공시
	    	var data = httpRequest.responseText;
	    	document.querySelector("#result").innerText=data;
	    }
	}
	
	function pwcheck() {
		var pw = document.querySelector("#passwd").value;
		var pw2 = document.querySelector("#passwd2").value;
		var mesg = "비번 일치";
		
		if (pw != pw2) {
			mesg = "비번 불일치";
		}
		
		document.querySelector("#result2").innerText = mesg;
	}
	
	function validcheck() {
		var id = document.querySelector("#userid").value;
		var pw = document.querySelector("#passwd").value;
		var pw2 = document.querySelector("#passwd2").value;
		
		if (id.length == 0 || pw.length == 0) {
			alert("아이디와 비밀번호는 필수입니다.");
			event.preventDefault();
		} else if (pw2.length == 0) {
			alert("비밀번호를 확인해주세요");
			event.preventDefault();
		}
	}
	
</script>

<form action="MemberAddServlet">
	*아이디:<input type="text" name="userid" id="userid" onkeyup="req()">
	<span id="result" style="color:red"></span>
	<br>
	*비밀번호:<input type="text" name="passwd" id="passwd" ><br>
	*비밀번호확인:<input type="text" name="passwd2" id="passwd2" onkeyup="pwcheck()" >
	<span id="result2" style="color:red"></span>
	<br>
	이름:<input type="text" name="username" ><br>
	<input type="text" name="post" id="sample4_postcode" placeholder="우편번호">
	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소">
	<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소">
	<span id="guide" style="color:#999"></span>
	<br>
	전화번호:<select name="phone1">
  	<option value="010">010</option>
  	<option value="011">011</option>
	</select>-
	<input type="text" name="phone2" >-<input type="text" name="phone3" >
	<br>
	<br>
	이메일:<input type="text" name="email1" id="email1">@
	       <input type="text" name="email2" id="email2" placeholder="직접입력">
	       <select  id="emailSelect">
	        <option value="daum.net">daum.net</option>
	        <option value="naver.com">naver.com</option>
	       </select>
	<br>
	<input type="submit" value="회원가입" onclick="validcheck()" >
	<input type="reset" value="취소">
		
</form>