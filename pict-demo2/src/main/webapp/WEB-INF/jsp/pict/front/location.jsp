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
                        <strong>Body Bloom</strong><br>
                        강원특별자치도 춘천시 서부대성로47번길 10 비아문하우스 3층
                    </p>
                </div>

                <div class="location-info-card" data-aos="fade-up" data-aos-delay="200">
                    <h3>대중교통</h3>
                    <p>
                        <strong>버스</strong><br>
                        강원일보/한국은행 하차 후<br>도보 4분
                    </p>
                </div>

                <div class="location-info-card" data-aos="fade-up" data-aos-delay="300">
                    <h3>주차 안내</h3>
                    <p>
                        <strong>주차 위치</strong><br>
                        - 비아문하우스 1층 주차장 이용 가능(단, 주차 공간이 협소)<br>
                        - 평일 18시 이후, 공휴일, 주말에는 소담송하 앞 주차 가능<br>
                        - 봉의C 주차장 주차 후 도보 약 3분<br><br>
                    </p>
                </div>

                <div class="location-info-card" data-aos="fade-up" data-aos-delay="400">
                    <h3>운영 시간</h3>
                    <p>
                        <strong>월~금</strong>
                        06:00 - 22:00<br>
                        <strong>토</strong>
                        06:00~18:00<br>
                        <strong>휴무</strong>
                        매주 일요일 정기휴무
                    </p>
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
