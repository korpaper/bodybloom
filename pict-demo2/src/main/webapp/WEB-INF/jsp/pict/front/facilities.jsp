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
            <h1 class="page-title" data-aos="fade-up">부대시설</h1>
            <p class="page-subtitle" data-aos="fade-up" data-aos-delay="100">완벽히 구비된 시설 구성</p>
        </div>
    </section>

    <section class="facilities-section">
        <div class="facilities-container">
            <div class="facility-item" data-aos="fade-up">
                <div class="facility-image" onclick="openFacilityModal('main-center')">
                    <img src="/front_img/thumb1.png" alt="Main Center">
                    <div class="image-overlay">
                        <span>+ 더 많은 사진 보기</span>
                    </div>
                </div>
                <div class="facility-content">
                    <h2>메인 센터</h2>
                    <p>
                        다양한 움직임을 경험할 수 있도록<br>
                        트레이닝 목적에 맞게 구성된 메인 공간입니다.
                    </p>
                </div>
            </div>

            <div class="facility-item reverse" data-aos="fade-up">
                <div class="facility-image" onclick="openFacilityModal('gx-room')">
                    <img src="/front_img/thumb2.png" alt="GX Room">
                    <div class="image-overlay">
                        <span>+ 더 많은 사진 보기</span>
                    </div>
                </div>
                <div class="facility-content">
                    <h2>GX룸</h2>
                    <p>
                        몸의 리듬을 느끼며<br>
                        움직임에 빠져드는 트레이닝 공간
                    </p>
                    <ul>
                        <li>• 소규모 그룹 수업</li>
                        <li>• 개인 맞춤 레슨 가능</li>
                        <li>• 테마별 프로그램 운영</li>
                    </ul>
                </div>
            </div>

            <div class="facility-item" data-aos="fade-up">
                <div class="facility-image" onclick="openFacilityModal('cafe')">
                    <img src="/front_img/thumb3.png" alt="Cafe">
                    <div class="image-overlay">
                        <span>+ 더 많은 사진 보기</span>
                    </div>
                </div>
                <div class="facility-content">
                    <h2>피트니스 카페</h2>
                    <p>
                        운동을 마무리하는 공간<br>
                        회복까지 설계된 피트니스 카페<br>
                        몸을 쓰고, 몸을 정리하는 곳<br>
                        운동 전•후 휴식공간
                    </p>
                    <ul>
                        <li>• 단백질 음료 · 허브티 · 한방차</li>
                        <li>• 파나소닉 안마의자 이용 가능</li>
                        <li>• 체성분 분석 기구로 몸 상태 체크</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- 바디블룸 카페 섹션 -->
            <div class="cafe-section" data-aos="fade-up">
            <div class="cafe-content">
                <div class="cafe-info">
                    <h2>요금안내</h2>
                    <ul class="cafe-features">
                        <li>
                            <span class="icon">☕</span>
                            <div>
                                <h4>유기농 음료</h4>
                                <p>엄선된 유기농 원두와 허브로 만든 건강한 음료</p>
                            </div>
                        </li>
                        <li>
                            <span class="icon">🥗</span>
                            <div>
                                <h4>건강 스낵</h4>
                                <p>저칼로리 고단백 스낵과 신선한 과일</p>
                            </div>
                        </li>
                        <li>
                            <span class="icon">🌿</span>
                            <div>
                                <h4>디톡스 주스</h4>
                                <p>신선한 야채와 과일로 만든 콜드프레스 주스</p>
                            </div>
                        </li>
                    </ul>
                    <div class="cafe-hours">
                        <h4>카페 운영시간</h4>
                        <p>평일 07:00 - 21:00 | 주말 08:00 - 19:00</p>
                    </div>
                </div>
            </div>
        </div>

    </section>

    <!-- Image Modal -->
    <div id="facilityModal" class="facility-modal">
        <div class="modal-content">
            <button class="modal-close" onclick="closeFacilityModal()">&times;</button>
            <div class="swiper facility-swiper">
                <div class="swiper-wrapper" id="facilityImages">
                    <img src="/front_img/thumb1.png" alt="Main Center">
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>
</main>

<script>
// 시설별 이미지
const facilityData = {
    'main-center': [
        { src: '/front_img/thumb1.png', alt: '메인 센터 1' },
        { src: '/front_img/thumb2.png', alt: '메인 센터 2' },
        { src: '/front_img/thumb3.png', alt: '메인 센터 3' },
        { src: '/front_img/thumb4.png', alt: '메인 센터 4' }
    ],
    'gx-room': [
        { src: '/front_img/thumb2.png', alt: 'GX룸 1' },
        { src: '/front_img/thumb1.png', alt: 'GX룸 2' },
        { src: '/front_img/thumb4.png', alt: 'GX룸 3' },
        { src: '/front_img/thumb3.png', alt: 'GX룸 4' }
    ],
    'cafe': [
        { src: '/front_img/thumb3.png', alt: '피트니스 카페 1' },
        { src: '/front_img/thumb4.png', alt: '피트니스 카페 2' },
        { src: '/front_img/thumb1.png', alt: '피트니스 카페 3' },
        { src: '/front_img/thumb2.png', alt: '피트니스 카페 4' }
    ]
};

let facilitySwiper = null;

function openFacilityModal(facilityType) {
    const modal = document.getElementById('facilityModal');
    const imagesContainer = document.getElementById('facilityImages');
    const images = facilityData[facilityType];

    imagesContainer.innerHTML = '';

    images.forEach(image => {
        const slide = document.createElement('div');
        slide.className = 'swiper-slide';
        slide.innerHTML = `<img src="${image.src}" alt="${image.alt}">`;
        imagesContainer.appendChild(slide);
    });

    modal.style.display = 'flex';
    document.body.style.overflow = 'hidden';

    if (facilitySwiper) {
        facilitySwiper.destroy();
    }

    facilitySwiper = new Swiper('.facility-swiper', {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        keyboard: {
            enabled: true,
        },
    });
}

function closeFacilityModal() {
    const modal = document.getElementById('facilityModal');
    modal.style.display = 'none';
    document.body.style.overflow = 'auto';

    if (facilitySwiper) {
        facilitySwiper.destroy();
        facilitySwiper = null;
    }
}

document.getElementById('facilityModal')?.addEventListener('click', function(e) {
    if (e.target === this) {
        closeFacilityModal();
    }
});

document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
        closeFacilityModal();
    }
});

$(document).ready(function() {
    AOS.init({
        duration: 800,
        easing: 'ease-in-out',
        once: true
    });
});
</script>

<%@ include file="./include/footer.jsp" %>
