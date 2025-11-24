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
            <h1 class="page-title" data-aos="fade-up">회원 후기</h1>
            <p class="page-subtitle" data-aos="fade-up" data-aos-delay="100">회원님들의 생생한 후기를 만나보세요</p>
        </div>
    </section>

    <section class="get-started-section">
        <div class="get-started-container">
            <div class="services-grid">
                <div class="service-card" data-aos="fade-up" data-aos-delay="100">
                    <h3>-5KG 감량 성공</h3>
                    <p>몸도 마음도 정말 건강해진 것 같아요.</p>
                    <span>김*지</span>
                </div>

                <div class="service-card" data-aos="fade-up" data-aos-delay="200">
                    <h3>스트레스 완화</h3>
                    <p>선생님의 차분한 목소리와 가이드가 정말 마음을 편안하게 해줍니다. 매주 수업이 기다려져요!</p>
                    <span>이*연</span>
                </div>

                <div class="service-card" data-aos="fade-up" data-aos-delay="400">
                    <h3>체력 향상</h3>
                    <p>에너지 넘치는 수업이 정말 좋습니다. 운동 후에는 항상 상쾌한 기분이에요.</p>
                    <span>정*진</span>
                </div>

                <div class="service-card" data-aos="fade-up" data-aos-delay="500">
                    <h3>최고의 시설</h3>
                    <p>센터 시설도 깨끗하고 분위기도 좋아요. 수업도 다양해서 지루할 틈이 없고, 무엇보다 선생님들이 정말 친절하고 전문적이세요. 강력 추천합니다!</p>
                    <span>최*영</span>
                </div>

                <div class="service-card" data-aos="fade-up" data-aos-delay="600">
                    <h3>수면의 질 개선</h3>
                    <p>건강한 라이프스타일을 찾게 해주셔서 감사합니다.</p>
                    <span>한*우</span>
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
