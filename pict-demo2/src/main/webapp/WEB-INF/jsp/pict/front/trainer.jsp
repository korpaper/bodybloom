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
            <h1 class="page-title" data-aos="fade-up">강사소개</h1>
            <p class="page-subtitle" data-aos="fade-up" data-aos-delay="100">전문 강사와 함께하는 맞춤 트레이닝</p>
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

                    <div class="trainer-details">
                        <div class="trainer-section">
                            <h4>학력</h4>
                            <ul>
                                <li>• 한국체육대학교 체육학과 졸업</li>
                                <li>• 운동생리학 석사</li>
                            </ul>
                        </div>

                        <div class="trainer-section">
                            <h4>경력</h4>
                            <ul>
                                <li>• 현) 웰니스 PT센터 수석 트레이너 (2015~현재)</li>
                                <li>• 전) 국가대표 체육관 퍼스널 트레이너 (2012~2015)</li>
                                <li>• 전) 스포츠 재활센터 운동처방사 (2010~2012)</li>
                            </ul>
                        </div>

                        <div class="trainer-section">
                            <h4>수상이력</h4>
                            <ul>
                                <li>• 2023 대한민국 우수 퍼스널 트레이너 대상</li>
                                <li>• 2021 전국 체형교정 트레이너 경진대회 금상</li>
                                <li>• 2019 고객만족도 최우수 트레이너 선정</li>
                            </ul>
                        </div>

                        <div class="trainer-section">
                            <h4>자격사항</h4>
                            <ul>
                                <li>• 생활스포츠지도사 2급 (보디빌딩)</li>
                                <li>• NSCA-CPT 국제 퍼스널 트레이너 자격증</li>
                                <li>• 재활운동 전문가 과정 이수</li>
                                <li>• 체형교정 전문 트레이너 자격증</li>
                            </ul>
                        </div>
                    </div>
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

                    <div class="trainer-details">
                        <div class="trainer-section">
                            <h4>학력</h4>
                            <ul>
                                <li>• 용인대학교 체육교육과 졸업</li>
                                <li>• 미국 CrossFit HQ 트레이닝 과정 이수</li>
                            </ul>
                        </div>

                        <div class="trainer-section">
                            <h4>경력</h4>
                            <ul>
                                <li>• 현) 웰니스 PT센터 크로스핏 헤드코치 (2017~현재)</li>
                                <li>• 전) 스포츠 센터 그룹 트레이닝 강사 (2014~2017)</li>
                                <li>• 전) 대학 운동선수 체력 코치 (2012~2014)</li>
                            </ul>
                        </div>

                        <div class="trainer-section">
                            <h4>수상이력</h4>
                            <ul>
                                <li>• 2022 전국 크로스핏 챔피언십 3위</li>
                                <li>• 2020 기능성 트레이닝 우수 지도자상</li>
                                <li>• 2018 고강도 트레이닝 경진대회 우수상</li>
                            </ul>
                        </div>

                        <div class="trainer-section">
                            <h4>자격사항</h4>
                            <ul>
                                <li>• CrossFit Level 2 Trainer 자격증</li>
                                <li>• 생활스포츠지도사 2급 (보디빌딩)</li>
                                <li>• 기능성 트레이닝 전문가 자격증</li>
                                <li>• 스포츠 영양사 자격증</li>
                            </ul>
                        </div>
                    </div>
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

                    <div class="trainer-details">
                        <div class="trainer-section">
                            <h4>학력</h4>
                            <ul>
                                <li>• 서울대학교 체육교육과 졸업</li>
                                <li>• 스포츠영양학 전문과정 이수</li>
                            </ul>
                        </div>

                        <div class="trainer-section">
                            <h4>경력</h4>
                            <ul>
                                <li>• 현) 웰니스 PT센터 다이어트 전문 트레이너 (2016~현재)</li>
                                <li>• 전) 프리미엄 피트니스 클럽 수석 트레이너 (2013~2016)</li>
                                <li>• 전) 체중관리센터 운동처방사 (2011~2013)</li>
                            </ul>
                        </div>

                        <div class="trainer-section">
                            <h4>수상이력</h4>
                            <ul>
                                <li>• 2023 대한민국 다이어트 전문가 대상</li>
                                <li>• 2021 체중관리 우수 트레이너 선정</li>
                                <li>• 2019 고객 체형개선 최우수상</li>
                            </ul>
                        </div>

                        <div class="trainer-section">
                            <h4>자격사항</h4>
                            <ul>
                                <li>• 생활스포츠지도사 2급 (보디빌딩)</li>
                                <li>• ACSM-CPT 국제 퍼스널 트레이너 자격증</li>
                                <li>• 운동처방사 자격증</li>
                                <li>• 스포츠 영양 전문가 과정 이수</li>
                            </ul>
                        </div>
                    </div>
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
