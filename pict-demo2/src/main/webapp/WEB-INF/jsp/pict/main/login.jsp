<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
   	<link href="../../../../../css/egovframework/pict/reset.css" rel="stylesheet">
	<style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700;800&display=swap');
        html, input, select, textarea, button {
            font-family: 'Open Sans', -apple-system, BlinkMacSystemFont, sans-serif !important;
        }
		body {
			background: linear-gradient(135deg, #63C9B6 0%, #A67C52 100%);
			min-height: 100vh;
			display: flex;
			align-items: center;
			justify-content: center;
			position: relative;
			overflow: hidden;
		}
		body::before {
			content: '';
			position: absolute;
			width: 200%;
			height: 200%;
			background: radial-gradient(circle, rgba(255,255,255,0.1) 1px, transparent 1px);
			background-size: 50px 50px;
			animation: moveBackground 20s linear infinite;
		}
		@keyframes moveBackground {
			0% { transform: translate(0, 0); }
			100% { transform: translate(50px, 50px); }
		}
	    .login-wrap {
		    width: 100%;
		    max-width: 450px;
		    padding: 20px;
		    position: relative;
		    z-index: 1;
	    }
	    .login-box {
		    margin: 0 auto;
		    background: rgba(255, 255, 255, 0.95);
		    border-radius: 30px;
		    padding: 50px 40px;
		    box-shadow: 0 30px 80px rgba(0, 0, 0, 0.2);
		    backdrop-filter: blur(10px);
		    border: 1px solid rgba(255, 255, 255, 0.3);
	    }
	    .login-title {
	    	margin-bottom: 15px;
	    	text-align: center;
	    }
	    .login-title img {
	    	max-width: 200px;
	    	filter: drop-shadow(0 4px 8px rgba(0, 0, 0, 0.1));
	    }
	    .login-subtitle {
	    	text-align: center;
	    	color: #718096;
	    	font-size: 14px;
	    	margin-bottom: 40px;
	    	font-weight: 500;
	    }
	    .login-inner {
    	    width: 100%;
	    }
		.login-btn {
			width: 100%;
		    margin: 30px 0 0;
		    border-radius: 30px;
		    background: linear-gradient(135deg, #63C9B6 0%, #A67C52 100%);
		    color: #fff;
		    border: none;
		    height: 52px;
		    line-height: 52px;
		   	font-size: 16px;
		   	font-weight: 700;
		   	cursor: pointer;
		   	transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
		   	box-shadow: 0 10px 30px rgba(99, 201, 182, 0.3);
		   	position: relative;
		   	overflow: hidden;
		}
		.login-btn::before {
			content: '';
			position: absolute;
			top: 0;
			left: -100%;
			width: 100%;
			height: 100%;
			background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
			transition: left 0.5s;
		}
		.login-btn:hover {
			transform: translateY(-2px);
			box-shadow: 0 15px 40px rgba(99, 201, 182, 0.4);
		}
		.login-btn:hover::before {
			left: 100%;
		}
		.login-btn:active {
			transform: translateY(0);
		}
		.desc-box {
			margin-top: 30px;
			color: #a0aec0;
			text-align: center;
			font-size: 13px;
		}
		.login-inner .title {
			color: #4a5568;
			font-weight: 600;
			font-size: 14px;
		}
		.login-item {
			margin-bottom: 24px;
			text-align: left;
		}
		.login-item .title {
			display: block;
			margin-bottom: 8px;
		}
		.login-item .input {
			border: 2px solid #e9ecef;
			height: 52px;
			line-height: 52px;
			width: 100%;
			padding: 0 20px;
			border-radius: 15px;
			font-size: 15px;
			transition: all 0.3s ease;
			background: #f8f9fa;
		}
		.login-item .input:focus {
			outline: none;
			border-color: #63C9B6;
			background: #fff;
			box-shadow: 0 4px 12px rgba(99, 201, 182, 0.15);
		}
		.login-item .input::placeholder {
			color: #adb5bd;
		}

		/* 반응형 */
		@media (max-width: 768px) {
			.login-wrap {
				max-width: 100%;
				padding: 20px;
			}
			.login-box {
				padding: 45px 35px;
				border-radius: 25px;
			}
			.login-title {
				margin-bottom: 20px;
			}
			.login-title img {
				max-width: 180px;
			}
			.login-subtitle {
				font-size: 14px;
				margin-bottom: 35px;
			}
			.login-item {
				margin-bottom: 28px;
			}
			.login-item .title {
				font-size: 15px;
				margin-bottom: 10px;
			}
			.login-btn {
				height: 54px;
				line-height: 54px;
				font-size: 16px;
				margin-top: 35px;
			}
			.login-item .input {
				height: 54px;
				line-height: 54px;
				font-size: 15px;
				padding: 0 22px;
				border-radius: 16px;
			}
		}
		@media (max-width: 480px) {
			.login-wrap {
				padding: 15px;
			}
			.login-box {
				padding: 40px 28px;
				border-radius: 22px;
			}
			.login-title {
				margin-bottom: 18px;
			}
			.login-title img {
				max-width: 160px;
			}
			.login-subtitle {
				font-size: 13px;
				margin-bottom: 30px;
			}
			.login-item {
				margin-bottom: 25px;
			}
			.login-item .title {
				font-size: 14px;
				margin-bottom: 9px;
			}
			.login-btn {
				height: 52px;
				line-height: 52px;
				font-size: 15px;
				margin-top: 32px;
			}
			.login-item .input {
				height: 52px;
				line-height: 52px;
				font-size: 14px;
				padding: 0 20px;
				border-radius: 15px;
			}
		}
		@media (max-width: 360px) {
			.login-box {
				padding: 35px 22px;
			}
			.login-title img {
				max-width: 140px;
			}
			.login-btn {
				height: 50px;
				line-height: 50px;
				font-size: 14px;
			}
			.login-item .input {
				height: 50px;
				line-height: 50px;
				font-size: 13px;
				padding: 0 18px;
			}
		}
	</style>

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