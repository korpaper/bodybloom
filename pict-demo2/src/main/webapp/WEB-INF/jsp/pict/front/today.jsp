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
                <div class="video-card" data-aos="fade-up" data-aos-delay="100" onclick="openVideoModal('https://www.youtube.com/embed/v7AYKMP6rOE')">
                    <div class="video-thumbnail">
                        <img src="https://img.youtube.com/vi/v7AYKMP6rOE/maxresdefault.jpg" alt="아침 활력 운동">
                        <div class="play-button">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
                                <path d="M8 5v14l11-7z"/>
                            </svg>
                        </div>
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

<!-- 비디오 모달 팝업 -->
<div class="video-modal" id="videoModal" onclick="closeVideoModal(event)">
    <div class="video-modal-content">
        <button class="video-modal-close" onclick="closeVideoModal(event)">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <line x1="18" y1="6" x2="6" y2="18"></line>
                <line x1="6" y1="6" x2="18" y2="18"></line>
            </svg>
        </button>
        <div class="video-iframe-wrapper">
            <iframe id="videoIframe"
                src=""
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen>
            </iframe>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    AOS.init({
        duration: 800,
        easing: 'ease-in-out',
        once: true
    });
});

// 비디오 모달 열기
function openVideoModal(videoUrl) {
    const modal = document.getElementById('videoModal');
    const iframe = document.getElementById('videoIframe');

    // iframe src 설정 (autoplay 추가)
    iframe.src = videoUrl + '?autoplay=1';

    // 모달 표시
    modal.style.display = 'flex';
    document.body.style.overflow = 'hidden'; // 스크롤 방지
}

// 비디오 모달 닫기
function closeVideoModal(event) {
    // 모달 배경이나 닫기 버튼을 클릭했을 때만 닫기
    if (event.target.id === 'videoModal' || event.target.closest('.video-modal-close')) {
        const modal = document.getElementById('videoModal');
        const iframe = document.getElementById('videoIframe');

        // iframe 정지
        iframe.src = '';

        // 모달 숨기기
        modal.style.display = 'none';
        document.body.style.overflow = ''; // 스크롤 복원
    }
}

// ESC 키로 모달 닫기
document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        const modal = document.getElementById('videoModal');
        if (modal.style.display === 'flex') {
            const iframe = document.getElementById('videoIframe');
            iframe.src = '';
            modal.style.display = 'none';
            document.body.style.overflow = '';
        }
    }
});
</script>

<%@ include file="./include/footer.jsp" %>
