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
                <c:forEach var="resultList" items="${resultList}" varStatus="status">
                    <div class="video-card" data-aos="fade-up" data-aos-delay="100" onclick="openVideoModal('${resultList.videourl}')">
                        <div class="video-thumbnail">
                            <img src="${resultList.imgurl}" alt="${resultList.title}">
                            <div class="play-button">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
                                    <path d="M8 5v14l11-7z"/>
                                </svg>
                            </div>
                        </div>
                        <div class="video-info">
                            <h3>${resultList.title}</h3>
                            <p>${resultList.text}</p>
                            <span class="video-instructor">바디블룸</span>
                        </div>
                    </div>
                </c:forEach>

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

// YouTube URL을 임베드 URL로 변환
function convertToEmbedUrl(url) {
    // 이미 embed URL인 경우 그대로 반환
    if (url.includes('/embed/')) {
        return url;
    }

    let videoId = '';

    // https://www.youtube.com/watch?v=VIDEO_ID 형식
    if (url.includes('youtube.com/watch')) {
        const urlParams = new URLSearchParams(url.split('?')[1]);
        videoId = urlParams.get('v');
    }
    // https://youtu.be/VIDEO_ID 형식
    else if (url.includes('youtu.be/')) {
        videoId = url.split('youtu.be/')[1].split('?')[0];
    }
    // https://www.youtube.com/VIDEO_ID 형식
    else if (url.includes('youtube.com/')) {
        videoId = url.split('youtube.com/')[1].split('?')[0];
    }

    // 비디오 ID가 있으면 embed URL 반환
    if (videoId) {
        return 'https://www.youtube.com/embed/' + videoId;
    }

    // 변환 실패 시 원본 반환
    return url;
}

// 비디오 모달 열기
function openVideoModal(videoUrl) {
    const modal = document.getElementById('videoModal');
    const iframe = document.getElementById('videoIframe');

    // YouTube URL을 embed URL로 변환
    const embedUrl = convertToEmbedUrl(videoUrl);

    // iframe src 설정 (autoplay 추가)
    iframe.src = embedUrl + '?autoplay=1';

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
