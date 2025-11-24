<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="./include/head.jsp" %>
<%@ include file="./include/header.jsp" %>

<main class="wellness-main modern-main">
    <!-- 마우스 커서 효과 -->
    <div class="custom-cursor"></div>
    <div class="cursor-follower"></div>

    <!-- Hero Section -->
    <section class="hero-section modern-hero">
        <div class="hero-container">
            <div class="hero-content" data-aos="fade-up" data-aos-duration="1200">
                <h1 class="modern-hero-title">
                    몸의 균형과<br>
                    움직임을 통해<br>
                    <span class="highlight-text">조화</span>를 연구합니다
                </h1>
                <p class="modern-hero-subtitle"><span>BODYBLOOM</span> 의 철학과 함께<br>조화로운 건강을 찾아보세요</p>
                <div class="hero-meta">
                    <span>WELLNESS CENTER</span>
                    <span>•</span>
                    <span>EST. 2024</span>
                </div>
            </div>
            <div class="hero-image-modern" data-aos="fade-left" data-aos-delay="400" data-aos-duration="1200">
                <div class="image-float">
                    <img src="/front_img/thumb1.png" alt="Yoga Practice">
                </div>
            </div>
        </div>
        <div class="scroll-indicator" data-aos="fade-up" data-aos-delay="800">
            <span>SCROLL</span>
            <div class="scroll-line"></div>
        </div>
    </section>

    <!-- Coach Section -->
    <section class="coach-section modern-section">
        <div class="coach-container modern-grid">
            <div class="coach-image modern-image" data-aos="zoom-in" data-aos-duration="1000">
                <img src="/front_img/thumb2.png" alt="Wellness Coach">
                <div class="image-overlay-gradient"></div>
            </div>
            <div class="coach-content modern-content" data-aos="fade-up" data-aos-delay="200">
                <span class="section-label">TRAINERS</span>
                <h2 class="modern-title">강사진</h2>
                <p class="modern-description">
                    전문성과 열정을 갖춘<br>
                    BODYBLOOM의 강사진이<br>
                    여러분의 건강한 변화를<br>
                    함께 만들어갑니다
                </p>
                <a href="/trainer" class="modern-btn btn-arrow">
                    <span>강사소개</span>
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                        <path d="M5 12H19M19 12L12 5M19 12L12 19" stroke="currentColor" stroke-width="2"/>
                    </svg>
                </a>
            </div>
        </div>
    </section>

    <!-- Reviews Section -->
    <section class="get-started-section modern-section">
        <div class="get-started-container modern-grid-container">
            <h2 class="modern-section-title" data-aos="fade-up">
                <span class="title-line">MEMBER</span>
                <span class="title-line">REVIEWS</span>
            </h2>
            <div class="modern-cards-grid">
                <div class="modern-card" data-aos="fade-up" data-aos-delay="100">
                    <div class="card-number">01</div>
                    <h3>-5KG 감량 성공</h3>
                    <p>몸도 마음도 정말 건강해진 것 같아요.</p>
                    <div class="card-meta">
                        <span class="author">김민지</span>
                        <a href="/review" class="card-link">
                            <span>더보기</span>
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                                <path d="M4 10H16M16 10L10 4M16 10L10 16" stroke="currentColor" stroke-width="2"/>
                            </svg>
                        </a>
                    </div>
                </div>
                <div class="modern-card" data-aos="fade-up" data-aos-delay="200">
                    <div class="card-number">02</div>
                    <h3>스트레스 완화</h3>
                    <p>매주 수업이 기다려져요!</p>
                    <div class="card-meta">
                        <span class="author">이서연</span>
                        <a href="/review" class="card-link">
                            <span>더보기</span>
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                                <path d="M4 10H16M16 10L10 4M16 10L10 16" stroke="currentColor" stroke-width="2"/>
                            </svg>
                        </a>
                    </div>
                </div>
                <div class="modern-card" data-aos="fade-up" data-aos-delay="300">
                    <div class="card-number">03</div>
                    <h3>산모 추천</h3>
                    <p>편안한 분위기가 좋습니다.</p>
                    <div class="card-meta">
                        <span class="author">박지혜</span>
                        <a href="/review" class="card-link">
                            <span>더보기</span>
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                                <path d="M4 10H16M16 10L10 4M16 10L10 16" stroke="currentColor" stroke-width="2"/>
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Why BODYBLOOM Section -->
    <section class="specialize-section modern-section">
        <div class="specialize-container modern-grid">
            <div class="specialize-image modern-image" data-aos="zoom-in" data-aos-duration="1000">
                <img src="/front_img/thumb1.png" alt="Yoga Specialization">
                <div class="image-overlay-gradient"></div>
            </div>
            <div class="specialize-content modern-content" data-aos="fade-up" data-aos-delay="200">
                <span class="section-label">WHY US</span>
                <h2 class="modern-title">
                    WHY<br>
                    <span class="highlight-text high">BODYBLOOM</span>
                </h2>
                <p class="modern-description italic-text">
                    운동으로 세상을 만드는 사람들
                </p>
                <ul class="modern-list">
                    <li data-aos="fade-right" data-aos-delay="300">
                        <span class="list-number">01</span>
                        <div>
                            <h4>카페도 있다</h4>
                            <p>운동 후 편안하게 휴식할 수 있는 카페 공간</p>
                        </div>
                    </li>
                    <li data-aos="fade-right" data-aos-delay="400">
                        <span class="list-number">02</span>
                        <div>
                            <h4>전문 강사진</h4>
                            <p>체계적인 관리와 맞춤 프로그램 제공</p>
                        </div>
                    </li>
                    <li data-aos="fade-right" data-aos-delay="500">
                        <span class="list-number">03</span>
                        <div>
                            <h4>변화가 뚜렷하니까</h4>
                            <p>눈에 보이는 성과와 건강한 라이프스타일</p>
                        </div>
                    </li>
                </ul>
                <a href="/facilities" class="modern-btn btn-arrow">
                    <span>시설 보기</span>
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                        <path d="M5 12H19M19 12L12 5M19 12L12 19" stroke="currentColor" stroke-width="2"/>
                    </svg>
                </a>
            </div>
        </div>
    </section>
</main>

<script>
$(document).ready(function() {
    // AOS 초기화 - 더 부드러운 애니메이션
    AOS.init({
        duration: 1200,
        easing: 'cubic-bezier(0.4, 0, 0.2, 1)',
        offset: 100
    });

    // 커스텀 커서 효과
    const cursor = $('.custom-cursor');
    const follower = $('.cursor-follower');

    let mouseX = 0, mouseY = 0;
    let followerX = 0, followerY = 0;

    $(document).on('mousemove', function(e) {
        mouseX = e.clientX;
        mouseY = e.clientY;

        cursor.css({
            'left': mouseX + 'px',
            'top': mouseY + 'px'
        });
    });

    // 부드러운 팔로워 애니메이션
    function animateFollower() {
        followerX += (mouseX - followerX) * 0.1;
        followerY += (mouseY - followerY) * 0.1;

        follower.css({
            'left': followerX + 'px',
            'top': followerY + 'px'
        });

        requestAnimationFrame(animateFollower);
    }
    animateFollower();

    // 호버 가능한 요소에 대한 커서 확대 효과
    $('a, button, .modern-card, .modern-image img').hover(
        function() {
            cursor.addClass('cursor-hover');
            follower.addClass('follower-hover');
        },
        function() {
            cursor.removeClass('cursor-hover');
            follower.removeClass('follower-hover');
        }
    );

    // 스크롤 인디케이터 애니메이션
    setInterval(function() {
        $('.scroll-line').toggleClass('scroll-animate');
    }, 2000);

    // 패럴랙스 스크롤 효과
    $(window).on('scroll', function() {
        const scrolled = $(window).scrollTop();

        // 히어로 이미지 패럴랙스
        $('.hero-image-modern .image-float').css({
            'transform': 'translateY(' + (scrolled * 0.3) + 'px)'
        });

    });

    $('.modern-card').on('mouseleave', function() {
        $(this).css({
            'transform': 'perspective(1000px) rotateX(0) rotateY(0) scale(1) translateZ(0)',
            'box-shadow': 'none',
            'transition': 'all 0.5s cubic-bezier(0.4, 0, 0.2, 1)'
        });
    });

    // 이미지 호버 확대 효과
    $('.modern-image img').on('mouseenter', function() {
        $(this).css('transform', 'scale(1.05)');
    }).on('mouseleave', function() {
        $(this).css('transform', 'scale(1)');
    });
});
</script>

<%@ include file="./include/footer.jsp" %>