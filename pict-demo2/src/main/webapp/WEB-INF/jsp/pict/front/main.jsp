<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="./include/head.jsp" %>
<%@ include file="./include/header.jsp" %>

<main class="wellness-main">
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-container">
            <div class="hero-content" data-aos="fade-up">
                <h1 class="hero-title">
                    몸의 균형과 움직임을 통해<br>
                    사람의 마음과 신경계의<br>
                    조화를 연구합니다<br>
                    <span>BODYBLOOM</span>
                </h1>
                <p class="hero-subtitle">BODYBLOOM의 철학과 함께<br>조화로운 건강을 찾아보세요</p>
            </div>
            <div class="hero-image" data-aos="fade-left" data-aos-delay="200">
                <div class="image-circle">
                    <img src="/front_img/thumb1.png" alt="Yoga Practice">
                </div>
            </div>
        </div>
    </section>

    <!-- Wellness Coach Section -->
    <section class="coach-section">
        <div class="coach-container">
            <div class="coach-image" data-aos="fade-right">
                <img src="/front_img/thumb2.png" alt="Wellness Coach">
            </div>
            <div class="coach-content" data-aos="fade-left">
                <h2 class="coach-name">강사진</h2>
                <p class="coach-description">
                    우리 선생님들은요!<br>
                    우리 선생님들은요!<br>
                    우리 선생님들은요!<br>
                    우리 선생님들은요!<br>
                    우리 선생님들은요!<br>
                    우리 선생님들은요!<br>
                    우리 선생님들은요!<br>
                    우리 선생님들은요!<br>
                </p>
                <p class="coach-description">
                    우리 선생님들은요!<br>
                    우리 선생님들은요!<br>
                </p>
                <a href="/trainer" class="btn-secondary">강사소개</a>
            </div>
        </div>
    </section>

    <!-- Get Started Section -->
    <section class="get-started-section">
        <div class="get-started-container">
            <h2 class="section-title" data-aos="fade-up">REVIEWS</h2>
            <div class="services-grid">
                <div class="service-card" data-aos="fade-up" data-aos-delay="100">
                    <h3>-5KG 감량 성공</h3>
                    <p>요가를 시작한 지 6개월이 되었는데, 몸도 마음도 정말 건강해진 것 같아요.</p>
                    <span>김민지</span>
                    <a href="/review" class="service-link">더보기 →</a>
                </div>
                <div class="service-card" data-aos="fade-up" data-aos-delay="200">
                    <h3>스트레스 완화</h3>
                    <p>명상 수업을 듣고 스트레스가 많이 줄어들었어요. 매주 수업이 기다려져요!</p>
                    <span>이서연</span>
                    <a href="/review" class="service-link">더보기 →</a>
                </div>
                <div class="service-card" data-aos="fade-up" data-aos-delay="300">
                    <h3>산모 요가 추천</h3>
                    <p>임신 중에 안전하게 운동할 수 있어서 너무 좋았어요. 편안한 분위기가 좋습니다.</p>
                    <span>박지혜</span>
                    <a href="/review" class="service-link">더보기 →</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Specialize Section -->
    <section class="specialize-section">
        <div class="specialize-container">
            <div class="specialize-image" data-aos="fade-right">
                <img src="/front_img/thumb1.png" alt="Yoga Specialization">
            </div>
            <div class="specialize-content" data-aos="fade-left">
                <h2 class="specialize-title">WHY <span>BODYBLOOM</span></h2>
                <p class="specialize-description">
                    운동으로 세상을 만드는 사람들이니까
                </p>
                <ul class="specialize-list">
                    <li>
                        <span class="icon">💪</span>
                        <div>
                            <h4>카페도 있다</h4>
                            <p>굉장하지</p>
                        </div>
                    </li>
                    <li>
                        <span class="icon">🏋</span>
                        <div>
                            <h4>좋으니까</h4>
                            <p>좋아요</p>
                        </div>
                    </li>
                    <li>
                        <span class="icon">✨</span>
                        <div>
                            <h4>변화가 뚜렷하니까</h4>
                            <p>뚜렷해요</p>
                        </div>
                    </li>
                </ul>
                <a href="/facilities" class="btn-primary">시설 보기</a>
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
