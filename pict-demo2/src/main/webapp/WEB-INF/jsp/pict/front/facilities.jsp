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
                    <img src="/front_img/facil/center1.webp" alt="메인센터">
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
                    <img src="/front_img/facil/gx1.webp" alt="GX룸">
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
                    <img src="/front_img/facil/cafe1.webp" alt="Cafe">
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

        <!-- PT 요금안내 섹션 -->
        <div class="pricing-section" data-aos="fade-up">
            <div class="pricing-container">
                <h2 class="pricing-title">요금안내</h2>
                <p class="pricing-subtitle">목표에 맞는 최적의 PT 프로그램을 선택하세요</p>

                <div class="pricing-tables">
                    <!-- 1:1 PT -->
                    <div class="pricing-table" data-aos="fade-up" data-aos-delay="100">
                        <div class="pricing-header">
                            <h3>1:1 PT</h3>
                            <p>개인 맞춤형 집중 트레이닝</p>
                        </div>
                        <div class="pricing-body">
                            <div class="price-item">
                                <span class="sessions">1회</span>
                                <span class="price">6만원</span>
                            </div>
                            <div class="price-item">
                                <span class="sessions">10회</span>
                                <span class="price">50만원</span>
                            </div>
                            <div class="price-item">
                                <span class="sessions">20회</span>
                                <span class="price">98만원</span>
                            </div>
                            <div class="price-item">
                                <span class="sessions">30회</span>
                                <span class="price">144만원</span>
                            </div>
                            <div class="price-item">
                                <span class="sessions">40회</span>
                                <span class="price">188만원</span>
                            </div>
                            <div class="price-item recommended">
                                <span class="sessions">50회</span>
                                <span class="price">230만원</span>
                            </div>
                        </div>
                    </div>

                    <!-- 2:1 PT -->
                    <div class="pricing-table" data-aos="fade-up" data-aos-delay="200">
                        <div class="pricing-header">
                            <h3>2:1 PT</h3>
                            <p>친구와 함께하는 트레이닝</p>
                        </div>
                        <div class="pricing-body">
                            <div class="price-item">
                                <span class="sessions">1회</span>
                                <span class="price-detail">3.5만원 × 2</span>
                                <span class="price">7만원</span>
                            </div>
                            <div class="price-item">
                                <span class="sessions">10회</span>
                                <span class="price-detail">30만원 × 2</span>
                                <span class="price">60만원</span>
                            </div>
                            <div class="price-item">
                                <span class="sessions">20회</span>
                                <span class="price-detail">59만원 × 2</span>
                                <span class="price">118만원</span>
                            </div>
                            <div class="price-item">
                                <span class="sessions">30회</span>
                                <span class="price-detail">87만원 × 2</span>
                                <span class="price">174만원</span>
                            </div>
                            <div class="price-item">
                                <span class="sessions">40회</span>
                                <span class="price-detail">114만원 × 2</span>
                                <span class="price">228만원</span>
                            </div>
                            <div class="price-item recommended">
                                <span class="sessions">50회</span>
                                <span class="price-detail">140만원 × 2</span>
                                <span class="price">280만원</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="pricing-benefits" data-aos="fade-up" data-aos-delay="300">
                    <div class="benefit-badge">
                        <span class="badge-icon">🎁</span>
                        <span class="badge-text">무료 1회 OT 제공</span>
                    </div>
                    <div class="payment-info">
                        <h4>계좌이체</h4>
                        <p>(신한) 110-361-248340 윤수환</p>
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
                    <!-- 이미지가 동적으로 추가됩니다 -->
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
        { src: '/front_img/facil/center1.webp', alt: '메인 센터 1' },
        { src: '/front_img/facil/center2.webp', alt: '메인 센터 2' },
        { src: '/front_img/facil/center3.webp', alt: '메인 센터 3' },
        { src: '/front_img/facil/center4.webp', alt: '메인 센터 4' },
        { src: '/front_img/facil/center5.webp', alt: '메인 센터 5' },
        { src: '/front_img/facil/center6.webp', alt: '메인 센터 6' },
        { src: '/front_img/facil/center7.webp', alt: '메인 센터 7' },
        { src: '/front_img/facil/center8.webp', alt: '메인 센터 8' },
        { src: '/front_img/facil/center9.webp', alt: '메인 센터 9' },
        { src: '/front_img/facil/center10.webp', alt: '메인 센터 10' },
        { src: '/front_img/facil/center11.webp', alt: '메인 센터 11' }
    ],
    'gx-room': [
        { src: '/front_img/facil/gx1.webp', alt: 'GX룸 1' },
        { src: '/front_img/facil/gx2.webp', alt: 'GX룸 2' },
    ],
    'cafe': [
        { src: '/front_img/facil/cafe1.webp', alt: '카페 1' },
        { src: '/front_img/facil/cafe2.webp', alt: '카페 2' },
        { src: '/front_img/facil/cafe3.webp', alt: '카페 3' },
        { src: '/front_img/facil/cafe4.webp', alt: '카페 4' },
        { src: '/front_img/facil/cafe5.webp', alt: '카페 5' },
        { src: '/front_img/facil/cafe6.webp', alt: '카페 6' },
        { src: '/front_img/facil/cafe7.webp', alt: '카페 7' },
    ]
};

let facilitySwiper = null;

function openFacilityModal(facilityType) {

    const modal = document.getElementById('facilityModal');
    const imagesContainer = document.getElementById('facilityImages');
    const images = facilityData[facilityType];

    // 기존 Swiper 제거
    if (facilitySwiper) {
        facilitySwiper.destroy(true, true);
        facilitySwiper = null;
    }

    // 이미지 컨테이너 초기화
    imagesContainer.innerHTML = '';

    // 이미지 슬라이드 추가
    if (images && images.length > 0) {
        images.forEach((image, index) => {
            console.log('Adding image ' + index + ':', image.src);
            const slide = document.createElement('div');
            slide.className = 'swiper-slide';
            const img = document.createElement('img');
            img.src = image.src;
            img.alt = image.alt;
            slide.appendChild(img);
            imagesContainer.appendChild(slide);
        });

    }

    // 모달 표시
    modal.style.display = 'flex';
    document.body.style.overflow = 'hidden';

    // DOM 업데이트 후 Swiper 초기화
    setTimeout(() => {
        console.log('Initializing Swiper...');
        facilitySwiper = new Swiper('.facility-swiper', {
            slidesPerView: 1,
            spaceBetween: 30,
            loop: images.length > 1,
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
            on: {
                init: function() {
                    console.log('Swiper initialized');
                }
            }
        });
    }, 100);
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
