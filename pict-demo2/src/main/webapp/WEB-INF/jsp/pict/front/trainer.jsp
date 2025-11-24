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
            <h1 class="page-title" data-aos="fade-up">트레이너 소개</h1>
            <p class="page-subtitle" data-aos="fade-up" data-aos-delay="100">전문 트레이너와 함께하는 맞춤 트레이닝</p>
        </div>
    </section>

    <section class="trainers-section">
        <div class="trainers-container">
            <div class="trainer-card" data-aos="fade-up" data-aos-delay="100">
                <div class="trainer-image">
                    <img src="/front_img/thumb1.png" alt="윤수환 강사">
                </div>
                <div class="trainer-info">
                    <h3>윤수환 강사</h3>
                    <p class="trainer-specialty">퍼스널 트레이닝 / 체형교정</p>
                    <p class="trainer-description">
                        10년 경력의 퍼스널 트레이닝 전문가로, 개인별 맞춤 운동 프로그램을 통해
                        건강한 신체 변화를 이끌어냅니다. 체형교정과 근력 강화에 특화된 트레이닝을 제공합니다.
                    </p>
                    <ul class="trainer-certs">
                        <li>• 생활스포츠지도사 2급 (보디빌딩)</li>
                        <li>• NSCA-CPT 국제 퍼스널 트레이너 자격증</li>
                        <li>• 재활운동 전문가 과정 이수</li>
                        <li>• 체형교정 전문 트레이너 자격증</li>
                    </ul>
                </div>
            </div>

            <div class="trainer-card reverse" data-aos="fade-up" data-aos-delay="200">
                <div class="trainer-image">
                    <img src="/front_img/thumb2.png" alt="최대희 강사">
                </div>
                <div class="trainer-info">
                    <h3>최재희 강사</h3>
                    <p class="trainer-specialty">크로스핏 / 기능성 트레이닝</p>
                    <p class="trainer-description">
                        역동적인 크로스핏과 기능성 트레이닝 전문가입니다.
                        고강도 인터벌 트레이닝(HIIT)을 통해 단기간에 최대 효과를 이끌어내며,
                        개인의 체력 수준에 맞는 프로그램을 제공합니다.
                    </p>
                    <ul class="trainer-certs">
                        <li>• CrossFit Level 2 Trainer 자격증</li>
                        <li>• 생활스포츠지도사 2급 (보디빌딩)</li>
                        <li>• 기능성 트레이닝 전문가 자격증</li>
                        <li>• 스포츠 영양사 자격증</li>
                    </ul>
                </div>
            </div>

            <div class="trainer-card" data-aos="fade-up" data-aos-delay="300">
                <div class="trainer-image">
                    <img src="/front_img/thumb3.png" alt="윤동욱 강사">
                </div>
                <div class="trainer-info">
                    <h3>윤동욱 강사</h3>
                    <p class="trainer-specialty">웨이트 트레이닝 / 다이어트</p>
                    <p class="trainer-description">
                        웨이트 트레이닝과 다이어트 전문 트레이너로, 체계적인 식단 관리와
                        효과적인 근력 운동을 통해 건강한 체중 감량과 근육 증가를 동시에 달성하도록 돕습니다.
                    </p>
                    <ul class="trainer-certs">
                        <li>• 생활스포츠지도사 2급 (보디빌딩)</li>
                        <li>• ACSM-CPT 국제 퍼스널 트레이너 자격증</li>
                        <li>• 운동처방사 자격증</li>
                        <li>• 스포츠 영양 전문가 과정 이수</li>
                    </ul>
                </div>
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
