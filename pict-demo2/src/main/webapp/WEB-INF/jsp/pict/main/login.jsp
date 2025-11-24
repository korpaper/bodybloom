<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Body Bloom - World Of The Best GYM</title>
	<link href="../../../../../css/egovframework/pict/reset.css" rel="stylesheet">
	<link href="../../../../../css/egovframework/pict/login.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- 
	<script src="/rsa/rsa.js"></script>
	<script src="/rsa/jsbn.js"></script>
	<script src="/rsa/prng4.js"></script>
	<script src="/rsa/rng.js"></script>
	-->
	<script>

		$( document ).ready(function() {
		    console.log( "ready!" );
		});
		var msg = "${message}";
		if(msg != "" && msg != null){
			alert(msg);
		}
		function fn_login2(){
			var option = "width = 1000, height = 600, top = 100, left = 200, location = no"
			window.open("https://kcloud.kangwon.ac.kr/login?return_url=http://localhost:8080/sso.do", "강원대학교 통합로그인", option)

		}
		function fn_login() {
			
			// rsa 암호화
			//var rsa = new RSAKey();
			//rsa.setPublic($('#RSAModulus').val(),$('#RSAExponent').val());
			
			if ($("#id").val() == "") {
				alert("아이디를 입력하세요.");
				$("#id").focus();
				return false;
			} else {
				//$("#adminId").val(rsa.encrypt($("#id").val()));
				$("#adminId").val($("#id").val());
			}
			
			if ($("#password").val() == "") {
				alert("비밀번호를 입력하세요.");
				$("#password").focus();
				return false;
			} else {
				//$("#adminPw").val(rsa.encrypt($("#pw").val()));
				$("#adminPw").val($("#password").val());
			}
			document.loginForm.action = "/login";
			document.loginForm.submit();
			
		}
	</script>
</head>
<body>
	<div class="login-wrapper">
	    <div class="login-wrap">
        	<h1 class="login-title"><img src="/front_img/logo.png" alt="라이징스타" style="width:100%"></h1>
	        <div class="login-box">
		        <form action="#" id="entryForm" name="entryForm" method="post">
	                <div class="login-inner">
	                	<div class="login-item">
	                		<label for="id" class="title">ID*</label>
	                    	<input type="text" id="id" class="input" placeholder="아이디를 입력하세요" onkeypress="if(event.keyCode == 13){fn_login();}" autocomplete="off">
	                	</div>
	                	<div class="login-item">
	                		<label for="password" class="title">Password*</label>
	                    	<input type="password" id="password" class="input" placeholder="비밀번호를 입력하세요" onkeypress="if(event.keyCode == 13){fn_login();}" autocomplete="off">
	                	</div>
		                <button type="button" class="login-btn" onclick="javascript:fn_login();">Login</button>
		                <!-- <button type="button" class="btn" onclick="javascript:fn_login2();">학사</button> -->
	                </div>
	            </form>
	        </div>
	    </div>
	</div>
	
	<form action="#" id="loginForm" name="loginForm" method="post">
		<%-- 
		<input type="hidden" id="RSAModulus" value="${RSAModulus}"/>
		<input type="hidden" id="RSAExponent" value="${RSAExponent}"/>
		--%>
		<input type="hidden" name="adminId" id="adminId" value="">
		<input type="hidden" name="adminPw" id="adminPw" value="">
	</form>
</body>
</html>