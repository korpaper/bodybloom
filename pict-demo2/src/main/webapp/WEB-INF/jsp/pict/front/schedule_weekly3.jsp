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
                <a href="/schedule_weekly1" class="trainer-tab-link">윤수환 강사</a>
                <a href="/schedule_weekly2" class="trainer-tab-link">최재희 강사</a>
                <a href="/schedule_weekly3" class="trainer-tab-link active">윤동욱 강사</a>
            </div>

            <!-- 일간/주간 탭 -->
<%--            <div class="schedule-tabs" data-aos="fade-up">--%>
<%--                <a href="/schedule_daily3" class="tab-btn">일간</a>--%>
<%--                <a href="/schedule_weekly3" class="tab-btn active">주간</a>--%>
<%--            </div>--%>

            <%--<div class="schedule-controls" data-aos="fade-up">
                <div class="date-selector-wrapper">
                    <label for="scheduleDate">수업 일자 선택:</label>
                    <input type="date" id="scheduleDate" class="date-selector" />
                    <button type="button" class="btn-search" onclick="searchSchedule()">조회</button>
                </div>
            </div>--%>

            <!-- 주간 스케줄 테이블 -->
            <div class="schedule-table-wrapper weekly-view" data-aos="fade-up">
                <table class="schedule-table">
                    <colgroup>
                        <col style="width: 80px;">
                        <col style="width: 80px;">
                        <col style="width: 80px;">
                        <col style="width: 80px;">
                        <col style="width: 80px;">
                        <col style="width: 80px;">
                        <col style="width: 80px;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>시간/요일</th>
                            <th>월</th>
                            <th>화</th>
                            <th>수</th>
                            <th>목</th>
                            <th>금</th>
                            <th>토</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${resultList}" varStatus="status">
                            <c:if test="${status.index % 6 == 0}">
                                <tr>
                                    <td class="time">
                                        ${fn:substringBefore(((status.index div 6) + 6), '.')}:00 ~ ${fn:substringBefore(((status.index div 6) + 7), '.')}:00
                                    </td>
                            </c:if>
                            <td>
                                <c:choose>
                                    <c:when test="${empty item.title}"></c:when>
                                    <c:when test="${item.impossible eq 'Y' and item.possible ne 'Y'}"></c:when>
                                    <c:otherwise>
                                        <c:forEach var="name" items="${fn:split(item.title, ' ')}" varStatus="st">
                                            <c:choose>
                                                <c:when test="${fn:length(name) eq 2}">
                                                    ${fn:substring(name, 0, 1)}*
                                                </c:when>

                                                <c:otherwise>
                                                    ${fn:substring(name, 0, 1)}*
                                                    ${fn:substring(name, fn:length(name)-1, fn:length(name))}
                                                </c:otherwise>
                                            </c:choose>

                                            <c:if test="${!st.last}"> </c:if>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <c:if test="${status.index % 6 == 5}">
                                </tr>
                            </c:if>

                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="schedule-note" data-aos="fade-up" data-aos-delay="200">
                <h3>수업 안내</h3>
                <ul>
                    <li>• 수업은 45분 단위로 진행됩니다.</li>
                    <li>• 예약은 문자 또는 전화로 가능합니다.</li>
                    <li>
                        • 문의:<br>
                        - 윤수환 : 010-4845-2210<br>
                        - 최재희 : 010-3912-4018<br>
                        - 윤동욱 : 010-2084-9736
                    </li>
                    <li>• 부재중일 경우, 확인 후 연락드리겠습니다.</li>
                </ul>
            </div>
        </div>
    </section>
</main>

<script>

    // 오늘 날짜로 설정
    function setToday() {
        const today = new Date();
        const dateString = today.toISOString().split('T')[0];
        $('#scheduleDate').val(dateString);
    }

    // 주간 화면 업데이트
    function updateWeekDisplay(date) {
        const options = { year: 'numeric', month: 'long', day: 'numeric' };
        const dateStr = date.toLocaleDateString('ko-KR', options);

        // 선택한 날짜를 시작일로, +6일을 종료일로 설정
        const startDate = new Date(date);
        const endDate = new Date(date);
        endDate.setDate(startDate.getDate() + 6);

        const weekStr = startDate.toLocaleDateString('ko-KR', { month: 'long', day: 'numeric' }) +
            ' - ' +
            endDate.toLocaleDateString('ko-KR', { month: 'long', day: 'numeric' });

        $('#selectedWeek').text(weekStr + ' 주간 스케줄');

        // 테이블 헤더에 날짜 업데이트
        const days = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];

        for (let i = 0; i < 7; i++) {
            const currentDate = new Date(startDate);
            currentDate.setDate(startDate.getDate() + i);

            const month = currentDate.getMonth() + 1;
            const day = currentDate.getDate();
            const weekday = currentDate.getDay();
            const dayName = ['일', '월', '화', '수', '목', '금', '토'][weekday];
            const dateStr = month + '/' + day + '(' + dayName + ')';

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

        // 페이지 리로드하면서 targetdate 파라미터 전달
        window.location.href = '/schedule_weekly3?targetdate=' + selectedDate;
    }

    $(document).ready(function() {
        AOS.init({
            duration: 800,
            easing: 'ease-in-out',
            once: true
        });

        // 페이지 로드 시 오늘 날짜 설정
        setToday();

        // URL 파라미터에서 targetdate 가져오기
        const urlParams = new URLSearchParams(window.location.search);
        const targetdate = urlParams.get('targetdate');
        if (targetdate) {
            $('#scheduleDate').val(targetdate);
            const date = new Date(targetdate);
            updateWeekDisplay(date);
        } else {
            // 기본값으로 주간 화면 업데이트
            const today = new Date();
            updateWeekDisplay(today);
        }

        // Enter 키로 검색
        $('#scheduleDate').on('keypress', function(e) {
            if (e.which === 13) {
                searchSchedule();
            }
        });
    });
</script>

<%@ include file="./include/footer.jsp" %>