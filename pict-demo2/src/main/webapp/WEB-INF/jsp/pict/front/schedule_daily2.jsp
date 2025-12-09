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
                <a href="/schedule_daily1" class="trainer-tab-link">윤수환 강사</a>
                <a href="/schedule_daily2" class="trainer-tab-link active">최재희 강사</a>
                <a href="/schedule_daily3" class="trainer-tab-link">윤동욱 강사</a>
            </div>

            <!-- 일간/주간 탭 -->
            <div class="schedule-tabs" data-aos="fade-up">
                <a href="/schedule_daily2" class="tab-btn active">일간</a>
                <a href="/schedule_weekly2" class="tab-btn">주간</a>
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
                        <c:forEach var="resultList" items="${day_list}" varStatus="status">
                            <tr>
                                <td class="time">
                                    <c:if test="${resultList.targettime eq '1'}">06:00</c:if>
                                    <c:if test="${resultList.targettime eq '2'}">07:00</c:if>
                                    <c:if test="${resultList.targettime eq '3'}">08:00</c:if>
                                    <c:if test="${resultList.targettime eq '4'}">09:00</c:if>
                                    <c:if test="${resultList.targettime eq '5'}">10:00</c:if>
                                    <c:if test="${resultList.targettime eq '6'}">11:00</c:if>
                                    <c:if test="${resultList.targettime eq '7'}">12:00</c:if>
                                    <c:if test="${resultList.targettime eq '8'}">13:00</c:if>
                                    <c:if test="${resultList.targettime eq '9'}">14:00</c:if>
                                    <c:if test="${resultList.targettime eq '10'}">15:00</c:if>
                                    <c:if test="${resultList.targettime eq '11'}">16:00</c:if>
                                    <c:if test="${resultList.targettime eq '12'}">17:00</c:if>
                                    <c:if test="${resultList.targettime eq '13'}">18:00</c:if>
                                    <c:if test="${resultList.targettime eq '14'}">19:00</c:if>
                                    <c:if test="${resultList.targettime eq '15'}">20:00</c:if>
                                    <c:if test="${resultList.targettime eq '16'}">21:00</c:if>
                                    <c:if test="${resultList.targettime eq '17'}">22:00</c:if>
                                </td>
                                <td class="editable-cell">${resultList.day1}</td>
                            </tr>
                        </c:forEach>
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
	    let targetdate = '${pictVO.targetdate}';
	    let today = new Date();
	    let dateString = today.toISOString().split('T')[0];
	    if(targetdate == '' || targetdate == null){
		    $('#scheduleDate').val(dateString);
	    }
	    else{
		    $('#scheduleDate').val(targetdate);
	    }
    }

    // 선택한 날짜로 스케줄 조회
    function searchSchedule() {
        const selectedDate = $('#scheduleDate').val();
        if (!selectedDate) {
            alert('날짜를 선택해주세요.');
            return;
        }

	    updateDailyDisplay();
	    location.href= "/schedule_daily2?targetdate="+ selectedDate;
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