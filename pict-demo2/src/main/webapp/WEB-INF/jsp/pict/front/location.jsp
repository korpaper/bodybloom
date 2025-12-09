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
            <h1 class="page-title" data-aos="fade-up">오시는길</h1>
            <p class="page-subtitle" data-aos="fade-up" data-aos-delay="100">BODY BLOOM을 찾아오시는 방법을 안내합니다</p>
        </div>
    </section>

    <section class="location-section">
        <div class="location-container">
            <div class="map-container" data-aos="fade-up">
                <div id="map" style="width:100%;height:500px;"></div>
            </div>

            <div class="location-info-grid">
                <div class="location-info-card" data-aos="fade-up" data-aos-delay="100">
                    <h3>주소</h3>
                    <p>
                        <strong>Body Bloom Wellness Center</strong><br>
                        강원특별자치도 춘천시 서부대성로47번길 10 비아문하우스 3층
                    </p>
                </div>

                <div class="location-info-card" data-aos="fade-up" data-aos-delay="200">
                    <h3>대중교통</h3>
                    <p>
                        <strong>지하철</strong><br>
                        2호선 강남역 3번 출구 도보 5분<br>
                        신분당선 강남역 하차<br><br>
                        <strong>버스</strong><br>
                        간선버스: 146, 360, 740<br>
                        지선버스: 3414, 4319
                    </p>
                </div>

                <div class="location-info-card" data-aos="fade-up" data-aos-delay="300">
                    <h3>주차 안내</h3>
                    <p>
                        <strong>주차 위치</strong><br>
                        건물 지하 1층~3층<br>
                        총 100대 주차 가능<br><br>
                        <strong>주차 요금</strong><br>
                        수업 회원: 3시간 무료<br>
                        추가 시간: 10분당 1,000원<br>
                        일반 방문: 30분당 2,000원
                    </p>
                </div>

                <div class="location-info-card" data-aos="fade-up" data-aos-delay="400">
                    <h3>운영 시간</h3>
                    <p>
                        <strong>평일</strong><br>
                        06:00 - 22:00<br><br>
                        <strong>주말 및 공휴일</strong><br>
                        08:00 - 20:00<br><br>
                        <strong>휴무</strong><br>
                        매주 일요일
                    </p>
                </div>
            </div>

            <!-- 바디블룸 카페 섹션 -->
            <div class="cafe-section" data-aos="fade-up">
                <div class="cafe-content">
                    <div class="cafe-image">
                        <img src="/front_img/thumb3.png" alt="Body Bloom Cafe">
                    </div>
                    <div class="cafe-info">
                        <h2>바디블룸 카페</h2>
                        <p class="cafe-description">
                            수업 전후 편안하게 휴식을 취할 수 있는 공간입니다.<br>
                            유기농 차와 건강한 스낵, 디톡스 주스를 제공합니다.
                        </p>
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

            <!-- 주차 안내 상세 -->
            <div class="parking-detail" data-aos="fade-up">
                <h2>주차 안내 상세</h2>
                <div class="parking-grid">
                    <div class="parking-card">
                        <h3>주차장 진입</h3>
                        <p>건물 왼쪽 진입로를 통해 지하주차장으로 진입하실 수 있습니다.</p>
                    </div>
                    <div class="parking-card">
                        <h3>주차 위치</h3>
                        <p>B1~B3층 전체가 주차 공간이며, Body Bloom 회원 전용 구역은 B2층에 마련되어 있습니다.</p>
                    </div>
                    <div class="parking-card">
                        <h3>할인 혜택</h3>
                        <p>정기 회원은 무제한 무료 주차가 가능하며, 1회 수업권 이용 시 3시간 무료입니다.</p>
                    </div>
                    <div class="parking-card">
                        <h3>주차 등록</h3>
                        <p>주차 할인을 받으시려면 수업 전 프론트에서 차량번호를 등록해주세요.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_KAKAO_MAP_API_KEY"></script>
<script>
$(document).ready(function() {
    AOS.init({
        duration: 800,
        easing: 'ease-in-out',
        once: true
    });

    // 카카오 지도 API 초기화
    // API 키를 발급받아 위의 YOUR_KAKAO_MAP_API_KEY를 교체하세요
    var mapContainer = document.getElementById('map');
    var mapOption = {
        center: new kakao.maps.LatLng(37.4979, 127.0276), // 강남역 좌표 (실제 주소로 변경 필요)
        level: 3 // 지도 확대 레벨
    };

    try {
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 마커 생성
        var markerPosition = new kakao.maps.LatLng(37.4979, 127.0276);
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });
        marker.setMap(map);

        // 인포윈도우 생성
        var iwContent = '<div style="padding:5px;">Body Bloom Wellness Center</div>';
        var infowindow = new kakao.maps.InfoWindow({
            content: iwContent
        });
        infowindow.open(map, marker);
    } catch(e) {
        // 카카오 맵 API 로드 실패 시 안내 메시지
        $('#map').html('<div style="display:flex;align-items:center;justify-content:center;height:100%;background:#f5f5f5;color:#999;flex-direction:column;"><p style="font-size:16px;margin-bottom:10px;">카카오 지도를 로드하는 중입니다.</p><p style="font-size:14px;">API 키 설정이 필요합니다.</p></div>');
    }
});
</script>

<%@ include file="./include/footer.jsp" %>
