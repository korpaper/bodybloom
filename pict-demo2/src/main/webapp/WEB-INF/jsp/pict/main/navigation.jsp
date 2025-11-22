<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	<!-- 모바일 햄버거 메뉴 버튼 -->
	<button class="mobile-menu-toggle" id="sidebarToggle" aria-label="Toggle navigation">
		<i class="fa-solid fa-bars"></i>
	</button>

    <h1 class="header-logo">
    	<a class="navbar-brand" href="/pict_main">
    		<img src="/front_img/logo.png" alt="바디블룸">
   		</a>
	</h1>

    <div class="header-info">
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown">
				<a href="#lnk" onclick="javascript:fn_logout();" class="header-logout">
					<i class="fa-solid fa-right-from-bracket"></i><span>Logout</span>
				</a>
			</li>
		</ul>
	</div>
</nav>

<!-- 모바일 오버레이 -->
<div class="mobile-overlay" id="mobileOverlay"></div>

<script>
	function fn_logout() {
		if(confirm("로그아웃 하시겠습니까?")){
			location.href="/logout"
		}
	}
	function fn_user() {
		location.href="/user_register"
	}

	// 모바일 메뉴 토글
	document.addEventListener('DOMContentLoaded', function() {
		const sidebarToggle = document.getElementById('sidebarToggle');
		const mobileOverlay = document.getElementById('mobileOverlay');
		const sidebar = document.getElementById('layoutSidenav_nav');

		if (sidebarToggle && mobileOverlay && sidebar) {
			// 햄버거 버튼 클릭
			sidebarToggle.addEventListener('click', function(e) {
				e.preventDefault();
				sidebar.classList.toggle('active');
				mobileOverlay.classList.toggle('active');
				document.body.style.overflow = sidebar.classList.contains('active') ? 'hidden' : '';
			});

			// 오버레이 클릭
			mobileOverlay.addEventListener('click', function() {
				sidebar.classList.remove('active');
				mobileOverlay.classList.remove('active');
				document.body.style.overflow = '';
			});

			// ESC 키로 닫기
			document.addEventListener('keydown', function(e) {
				if (e.key === 'Escape' && sidebar.classList.contains('active')) {
					sidebar.classList.remove('active');
					mobileOverlay.classList.remove('active');
					document.body.style.overflow = '';
				}
			});
		}
	});
</script>
<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../../../../../js/scripts.js"></script>
<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>