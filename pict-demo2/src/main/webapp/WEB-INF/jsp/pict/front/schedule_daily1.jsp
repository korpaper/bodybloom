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
            <h1 class="page-title" data-aos="fade-up">스케줄</h1>
            <p class="page-subtitle" data-aos="fade-up" data-aos-delay="100">수업 스케줄을 확인하세요</p>
        </div>
    </section>

    <section class="schedule-section">
        <div class="schedule-container">
            <!-- 강사 선택 탭 -->
            <div class="trainer-tabs" data-aos="fade-up">
                <a href="/schedule_daily1" class="trainer-tab-link active">윤수환 강사</a>
                <a href="/schedule_daily2" class="trainer-tab-link">최재희 강사</a>
                <a href="/schedule_daily3" class="trainer-tab-link">윤동욱 강사</a>
            </div>

            <!-- 일간/주간 탭 -->
            <div class="schedule-tabs" data-aos="fade-up">
                <a href="/schedule_daily1" class="tab-btn active">일간</a>
                <a href="/schedule_weekly1" class="tab-btn">주간</a>
            </div>

            <div class="schedule-controls" data-aos="fade-up">
                <div class="date-selector-wrapper">
                    <label for="scheduleDate">수업 일자 선택:</label>
                    <input type="date" id="scheduleDate" class="date-selector" />
                    <button type="button" class="btn-search" onclick="searchSchedule()">조회</button>
                </div>
            </div>

            <!-- 일간 스케줄 테이블 -->
            <div class="schedule-table-wrapper daily-view" data-aos="fade-up">
                <table class="schedule-table daily-table">
                    <thead>
                        <tr>
                            <th>시간</th>
                            <th>수업 정보</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="time">06:00</td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">07:00</td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">08:00</td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">09:00</td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">10:00</td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">11:00</td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">12:00</td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">13:00</td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">14:00</td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">15:00</td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">16:00</td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">17:00</td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">18:00</td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">19:00</td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">20:00</td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">21:00</td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">22:00</td>
                            <td class="editable-cell"></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="schedule-note" data-aos="fade-up" data-aos-delay="200">
                <h3>수업 안내</h3>
                <ul>
                    <li>• 수업은 50분 단위로 진행됩니다.</li>
                    <li>• 예약은 문자 또는 전화로 가능합니다.</li>
                    <li>• 문의: 010-</li>
                </ul>
            </div>
        </div>
    </section>
</main>


<script>
    // 일간 화면 업데이트
    function updateDailyDisplay() {
        const selectedDate = $('#scheduleDate').val();
        if (selectedDate) {
            const date = new Date(selectedDate);
            const dateStr = date.toLocaleDateString('ko-KR', {
                year: 'numeric',
                month: 'long',
                day: 'numeric',
                weekday: 'long'
            });
            $('#selectedWeek').text(dateStr + ' 일간 스케줄');
        }
    }

    // 오늘 날짜로 설정
    function setToday() {
        const today = new Date();
        const dateString = today.toISOString().split('T')[0];
        $('#scheduleDate').val(dateString);

        if (currentView === 'weekly') {
            updateWeekDisplay(today);
        } else {
            updateDailyDisplay();
        }
    }
    // 선택한 날짜로 스케줄 조회
    function searchSchedule() {
        const selectedDate = $('#scheduleDate').val();
        if (!selectedDate) {
            alert('날짜를 선택해주세요.');
            return;
        }

        const date = new Date(selectedDate);

        if (currentView === 'weekly') {
            updateWeekDisplay(date);
        } else {
            updateDailyDisplay();
        }

        // API 호출 시
    }

    $(document).ready(function() {
        AOS.init({
            duration: 800,
            easing: 'ease-in-out',
            once: true
        });

        // 페이지 로드 시 오늘 날짜 설정
        setToday();
        // Enter 키로 검색
        $('#scheduleDate').on('keypress', function(e) {
            if (e.which === 13) {
                searchSchedule();
            }
        });
    });
</script>


<%@ include file="./include/footer.jsp" %>
