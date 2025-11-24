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
                        넓고 쾌적한 150평 규모의 메인 센터는 최대 30명이 동시에 수업을 받을 수 있는 공간입니다.
                        천장고가 높아 개방감이 뛰어나며, 대형 창문을 통해 자연광이 풍부하게 들어옵니다.
                    </p>
                    <ul>
                        <li>• 150평 규모의 넓은 공간</li>
                        <li>• 공기청정시스템 설치</li>
                        <li>• 자연 채광 및 조명 시스템</li>
                    </ul>
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
                        소규모 그룹 수업과 개인 레슨을 위한 전용 공간입니다.
                        음향 시스템과 조명이 갖춰져 있어 다양한 테마의 수업이 가능합니다.
                    </p>
                    <ul>
                        <li>• 소규모 그룹 수업 전용</li>
                        <li>• 프리미엄 음향 시스템</li>
                        <li>• 무드 조명 설치</li>
                        <li>• 개인 레슨 가능</li>
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
                    <h2>웰니스 카페</h2>
                    <p>
                        수업 전후 휴식을 취할 수 있는 아늑한 카페 공간입니다.
                        유기농 차와 건강한 스낵을 제공하며, 편안한 분위기에서 회원님들과 교류할 수 있습니다.
                    </p>
                    <ul>
                        <li>• 유기농 허브티 및 디톡스 주스</li>
                        <li>• 건강한 스낵 및 간식</li>
                        <li>• 편안한 휴식 공간</li>
                        <li>• 무료 Wi-Fi 제공</li>
                    </ul>
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
        { src: '/front_img/thumb3.png', alt: '웰니스 카페 1' },
        { src: '/front_img/thumb4.png', alt: '웰니스 카페 2' },
        { src: '/front_img/thumb1.png', alt: '웰니스 카페 3' },
        { src: '/front_img/thumb2.png', alt: '웰니스 카페 4' }
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
