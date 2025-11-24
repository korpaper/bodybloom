<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="./include/head.jsp" %>
<%@ include file="./include/header.jsp" %>

<main class="wellness-main">
    <section class="page-header">
        <div class="page-header-container">
            <h1 class="page-title" data-aos="fade-up">오늘의 운동법</h1>
            <p class="page-subtitle" data-aos="fade-up" data-aos-delay="100">Body Bloom 에서 제공하는 운동 영상입니다</p>
        </div>
    </section>

    <section class="videos-section">
        <div class="videos-container">
            <div class="video-grid">
                <!-- 비디오 1 -->
                <div class="video-card" data-aos="fade-up" data-aos-delay="100">
                    <div class="video-iframe-container">
                        <iframe
                            src="https://www.youtube.com/embed/v7AYKMP6rOE"
                            title="아침 활력 운동"
                            frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen>
                        </iframe>
                    </div>
                    <div class="video-info">
                        <h3>아침 활력 운동</h3>
                        <p>하루를 시작하는 가벼운 스트레칭과 호흡법</p>
                        <span class="video-instructor">윤수환 강사</span>
                    </div>
                </div>

            </div>

            <div class="video-notice" data-aos="fade-up">
                <h3>영상 이용 안내</h3>
                <ul>
                    <li>• 모든 영상은 무료로 시청 가능합니다.</li>
                    <li>• 영상을 참고하여 집에서도 안전하게 요가를 즐기세요.</li>
                    <li>• 처음 시작하시는 분들은 전문가의 지도를 받으시길 권장합니다.</li>
                    <li>• 새로운 영상은 매주 업데이트됩니다.</li>
                </ul>
            </div>
        </div>
    </section>
</main>

<script>
$(document).ready(function() {
    AOS.init({
        duration: 800,
        easing: 'ease-in-out',
        once: true
    });
});
</script>

<%@ include file="./include/footer.jsp" %>
