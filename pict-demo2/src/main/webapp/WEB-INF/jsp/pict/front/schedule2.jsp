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
                <a href="/schedule" class="trainer-tab-link">윤수환 강사</a>
                <a href="/schedule2" class="trainer-tab-link active">최재희 강사</a>
                <a href="/schedule3" class="trainer-tab-link">윤동욱 강사</a>
            </div>

            <!-- 일간/주간 탭 -->
            <div class="schedule-tabs" data-aos="fade-up">
                <button type="button" class="tab-btn" data-view="daily" onclick="changeView('daily')">일간</button>
                <button type="button" class="tab-btn active" data-view="weekly" onclick="changeView('weekly')">주간</button>
            </div>

            <div class="schedule-controls" data-aos="fade-up">
                <div class="date-selector-wrapper">
                    <label for="scheduleDate">수업 일자 선택:</label>
                    <input type="date" id="scheduleDate" class="date-selector" />
                    <button type="button" class="btn-search" onclick="searchSchedule()">조회</button>
                    <button type="button" class="btn-today" onclick="setToday()">오늘</button>
                </div>
                <div class="selected-date-info">
                    <span id="selectedWeek"></span>
                </div>
            </div>

            <!-- 주간 스케줄 테이블 -->
            <div class="schedule-table-wrapper weekly-view" data-aos="fade-up">
                <table class="schedule-table">
                    <thead>
                        <tr>
                            <th>시간</th>
                            <th id="day-mon">월요일</th>
                            <th id="day-tue">화요일</th>
                            <th id="day-wed">수요일</th>
                            <th id="day-thu">목요일</th>
                            <th id="day-fri">금요일</th>
                            <th id="day-sat">토요일</th>
                            <th id="day-sun">일요일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="time">06:00</td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">07:00</td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">08:00</td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">09:00</td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">10:00</td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">11:00</td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">12:00</td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">13:00</td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">14:00</td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">15:00</td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">16:00</td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">17:00</td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">18:00</td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">19:00</td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">20:00</td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">21:00</td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                        </tr>
                        <tr>
                            <td class="time">22:00</td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                            <td class="editable-cell"></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 일간 스케줄 테이블 -->
            <div class="schedule-table-wrapper daily-view" data-aos="fade-up" style="display: none;">
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
    var currentView = 'weekly'; // 현재 보기 모드

    // 일간/주간 탭 전환
    function changeView(viewType) {
        currentView = viewType;

        // 탭 버튼 활성화 상태 변경
        $('.tab-btn').removeClass('active');
        $('.tab-btn[data-view="' + viewType + '"]').addClass('active');

        // 테이블 표시 전환
        if (viewType === 'daily') {
            $('.weekly-view').hide();
            $('.daily-view').show();
            updateDailyDisplay();
        } else {
            $('.daily-view').hide();
            $('.weekly-view').show();
            updateWeekDisplay(new Date($('#scheduleDate').val()));
        }
    }

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

    // 주간 화면 업데이트
    function updateWeekDisplay(date) {
        const options = { year: 'numeric', month: 'long', day: 'numeric' };
        const dateStr = date.toLocaleDateString('ko-KR', options);

        // 주의 시작일과 종료일 계산
        const dayOfWeek = date.getDay();
        const monday = new Date(date);
        monday.setDate(date.getDate() - (dayOfWeek === 0 ? 6 : dayOfWeek - 1));
        const sunday = new Date(monday);
        sunday.setDate(monday.getDate() + 6);

        const weekStr = monday.toLocaleDateString('ko-KR', { month: 'long', day: 'numeric' }) +
            ' - ' +
            sunday.toLocaleDateString('ko-KR', { month: 'long', day: 'numeric' });

        $('#selectedWeek').text(weekStr + ' 주간 스케줄');

        // 테이블 헤더에 날짜 업데이트
        const days = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];
        const dayNames = ['월', '화', '수', '목', '금', '토', '일'];

        for (let i = 0; i < 7; i++) {
            const currentDate = new Date(monday);
            currentDate.setDate(monday.getDate() + i);

            const month = currentDate.getMonth() + 1;
            const day = currentDate.getDate();
            const dateStr = month + '/' + day + '(' + dayNames[i] + ')';

            $('#day-' + days[i]).text(dateStr);
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