<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions"%>



<%
	String url = request.getRequestURL().toString();
	pageContext.setAttribute("url", url);
	
%>



<c:set var="schedule_list" value="${fn:indexOf(url, 'schedule_list')}"/>
<c:set var="schedule_register" value="${fn:indexOf(url, 'schedule_register')}"/>

<c:set var="news_list" value="${fn:indexOf(url, 'news_list')}"/>
<c:set var="news_register" value="${fn:indexOf(url, 'news_register')}"/>

<c:set var="video_list" value="${fn:indexOf(url, 'video_list')}"/>
<c:set var="video_register" value="${fn:indexOf(url, 'video_register')}"/>

<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
        <div class="nav">
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts1" aria-expanded="true" aria-controls="collapseLayouts1">
				스케쥴 관리
            </a>
            <div class="collapse <c:if test="${schedule_register ne -1}">show</c:if>" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${schedule_register ne -1}">active</c:if>" href="/schedule/schedule_register">스케쥴 등록</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${schedule_list ne -1}">show</c:if>" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${schedule_list ne -1}">active</c:if>" href="/schedule/schedule_list">스케쥴 리스트</a>
                </nav>
            </div>
            
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts2" aria-expanded="true" aria-controls="collapseLayouts2">
				오늘의 운동법 관리
            </a>
            <div class="collapse <c:if test="${news_register ne -1}">show</c:if>" id="collapseLayouts2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${news_register ne -1}">active</c:if>" href="/news/news_register">오늘의 운동법 등록</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${news_list ne -1}">show</c:if>" id="collapseLayouts2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${news_list ne -1}">active</c:if>" href="/news/news_list">오늘의 운동법 리스트</a>
                </nav>
            </div>

            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts3" aria-expanded="true" aria-controls="collapseLayouts3">
				후기 관리
            </a>
            <div class="collapse <c:if test="${video_register ne -1}">show</c:if>" id="collapseLayouts3" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${video_register ne -1}">active</c:if>" href="/video/video_register">후기 등록</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${video_list ne -1}">show</c:if>" id="collapseLayouts3" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${video_list ne -1}">active</c:if>" href="/video/video_list">후기 리스트</a>
                </nav>
            </div>
           
		</div>
	</div>
</nav>
<script>
	function tttt() {
		alert("준비중입니다.")
	}
</script>

<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../../../../../js/scripts.js"></script>
<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>