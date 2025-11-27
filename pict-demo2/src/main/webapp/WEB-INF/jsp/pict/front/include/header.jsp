<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String url = request.getRequestURL().toString();
	pageContext.setAttribute("url", url);
%>

<c:set var="main" value="${fn:indexOf(url, 'main')}"/>
<c:set var="trainer" value="${fn:indexOf(url, 'trainer')}"/>
<c:set var="schedule" value="${fn:indexOf(url, 'schedule')}"/>
<c:set var="facilities" value="${fn:indexOf(url, 'facilities')}"/>
<c:set var="location" value="${fn:indexOf(url, 'location')}"/>
<c:set var="today" value="${fn:indexOf(url, 'today')}"/>
<c:set var="review" value="${fn:indexOf(url, 'review')}"/>

<!-- 커스텀 커서 효과 -->
<div class="custom-cursor"></div>
<div class="cursor-follower"></div>

<header>
    <div class="headerInner">
        <h1>
            <a href="/"><img src="/front_img/logo-mt.png" alt="Body Bloom 로고"></a>
        </h1>
        <button class="mobile-menu-toggle" aria-label="메뉴 열기">
            <span></span>
            <span></span>
            <span></span>
        </button>
        <nav class="nav-wrapper">
            <ul class="nav">
            <li <c:if test="${main ne -1}">class="active"</c:if>>
                <a href="/">홈</a>
            </li>
            <li class="has-dropdown <c:if test="${trainer ne -1 || schedule ne -1}">active</c:if>">
                <a href="/trainer" class="dropdown-toggle <c:if test="${trainer ne -1 || schedule ne -1}">active</c:if>">
                    <span>강사소개</span>
                </a>
                <ul class="dropdown">
                    <li <c:if test="${trainer ne -1}">class="active"</c:if>>
                        <a href="/trainer">강사소개</a>
                    </li>
                    <li <c:if test="${schedule ne -1}">class="active"</c:if>>
                        <a href="/schedule_daily1">스케줄</a>
                    </li>
                </ul>
            </li>
            <li class="has-dropdown <c:if test="${facilities ne -1 || location ne -1}">active</c:if>">
                <a href="/facilities" class="dropdown-toggle <c:if test="${facilities ne -1 || location ne -1}">active</c:if>">
                    <span>부대시설</span>
                </a>
                <ul class="dropdown">
                    <li <c:if test="${facilities ne -1}">class="active"</c:if>>
                        <a href="/facilities">부대시설</a>
                    </li>
                    <li <c:if test="${location ne -1}">class="active"</c:if>>
                        <a href="/location">오시는길</a>
                    </li>
                </ul>
            </li>
            <li class="has-dropdown <c:if test="${today ne -1 || review ne -1}">active</c:if>">
                <a href="/today" class="dropdown-toggle <c:if test="${today ne -1 || review ne -1}">active</c:if>">
                    <span>커뮤니티</span>
                </a>
                <ul class="dropdown">
                    <li <c:if test="${today ne -1}">class="active"</c:if>>
                        <a href="/today">오늘의 운동법</a>
                    </li>
                    <li <c:if test="${review ne -1}">class="active"</c:if>>
                        <a href="/review">후기</a>
                    </li>
                </ul>
            </li>
        </ul>
        </nav>
    </div>
</header>

<script>
$(document).ready(function() {
    // Mobile menu toggle
    $('.mobile-menu-toggle').click(function(e) {
        e.stopPropagation();
        $(this).toggleClass('active');
        $('.nav-wrapper').toggleClass('active');
        $('body').toggleClass('menu-open');
    });

    // 모바일에서 1뎁스 링크 클릭시 드롭다운 토글
    $('.nav li.has-dropdown > a.dropdown-toggle').click(function(e) {
        if ($(window).width() <= 1024) {
            e.preventDefault();
            e.stopPropagation();

            var $parent = $(this).parent();
            var wasOpen = $parent.hasClass('open');

            // 다른 열린 메뉴 닫기
            $('.nav li.has-dropdown').removeClass('open');

            // 현재 메뉴 토글
            if (!wasOpen) {
                $parent.addClass('open');
            }
        }
        // 데스크톱에서는 링크로 이동
    });

    // Close mobile menu when clicking on dropdown links only (2뎁스)
    $('.nav .dropdown a').click(function(e) {
        if ($(window).width() <= 1024) {
            $('.mobile-menu-toggle').removeClass('active');
            $('.nav-wrapper').removeClass('active');
            $('body').removeClass('menu-open');
            $('.nav li.has-dropdown').removeClass('open');
        }
    });

    // Close mobile menu when clicking on direct link (홈 같은 1뎁스 직접 링크)
    $('.nav > li:not(.has-dropdown) > a').click(function() {
        if ($(window).width() <= 1024) {
            $('.mobile-menu-toggle').removeClass('active');
            $('.nav-wrapper').removeClass('active');
            $('body').removeClass('menu-open');
        }
    });

    // Close mobile menu when clicking outside
    $(document).click(function(event) {
        if (!$(event.target).closest('.headerInner').length) {
            $('.mobile-menu-toggle').removeClass('active');
            $('.nav-wrapper').removeClass('active');
            $('body').removeClass('menu-open');
            $('.nav li.has-dropdown').removeClass('open');
        }
    });
});
</script>