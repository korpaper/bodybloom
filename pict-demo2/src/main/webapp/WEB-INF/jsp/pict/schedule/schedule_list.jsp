<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%
    String id = (String) session.getAttribute("id");
    String name = (String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/header.jsp">
		<c:param name="pageTitle" value="스케쥴 리스트"/>
	</c:import>
    <body class="sb-nav-fixed">
    <%@include file="../main/navigation.jsp" %>
        <div id="layoutSidenav">
			<div id="layoutSidenav_nav">
				<%@include file="../main/gnb.jsp"%>
			</div>
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">스케쥴 관리</h2>
					<div class="contents-box">
						<div class="card">
						    <div class="card-body">
                                <p class="name-content"><span><%= name %></span> 강사 스케쥴</p>
						    	
								<!-- 날짜 선택 -->
								<div class="schedule-controls-admin" style="margin-bottom: 20px;">
                                    <label for="targetdate">수업 일자 선택:</label>
                                    <input type="date" id="targetdate" style="cursor: pointer; padding: 5px; border: 1px solid #ddd; border-radius: 4px;" value="${pictVO.targetdate}"/>
                                    <button type="button" class="btn-basic btn-fill btn-sm" onclick="searchSchedule()">조회</button>
                                    <span id="selectedWeek" style="margin-left: 20px; font-weight: bold;"></span>
								</div>
						    	
						    	<!-- 주간 스케줄 테이블 -->
						    	<div class="schedule-table-wrapper weekly-view">
							        <table class="schedule-table" style="text-align: center; width: 100%;">
							            <colgroup>
							                <col style="width: 80px;">
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
							                    <th style="width: 80px;">시간</th>
							                    <th id="day-mon">월요일11</th>
							                    <th id="day-tue">화요일</th>
							                    <th id="day-wed">수요일</th>
							                    <th id="day-thu">목요일</th>
							                    <th id="day-fri">금요일</th>
							                    <th id="day-sat">토요일</th>
							                    <th id="day-sun">일요일</th>
							                </tr>
							            </thead>
							            <tbody>
                                            <c:forEach var="resultList" items="${resultList}" varStatus="status">
                                                <tr>
                                                    <td class="time">
                                                        <c:if test="${resultList.targettime eq '1'}">06:00 ~ 07:00</c:if>
                                                        <c:if test="${resultList.targettime eq '2'}">07:00 ~ 08:00</c:if>
                                                        <c:if test="${resultList.targettime eq '3'}">08:00 ~ 09:00</c:if>
                                                        <c:if test="${resultList.targettime eq '4'}">09:00 ~ 10:00</c:if>
                                                        <c:if test="${resultList.targettime eq '5'}">10:00 ~ 11:00</c:if>
                                                        <c:if test="${resultList.targettime eq '6'}">11:00 ~ 12:00</c:if>
                                                        <c:if test="${resultList.targettime eq '7'}">12:00 ~ 13:00</c:if>
                                                        <c:if test="${resultList.targettime eq '8'}">13:00 ~ 14:00</c:if>
                                                        <c:if test="${resultList.targettime eq '9'}">14:00 ~ 15:00</c:if>
                                                        <c:if test="${resultList.targettime eq '10'}">15:00 ~ 16:00</c:if>
                                                        <c:if test="${resultList.targettime eq '11'}">16:00 ~ 17:00</c:if>
                                                        <c:if test="${resultList.targettime eq '12'}">17:00 ~ 18:00</c:if>
                                                        <c:if test="${resultList.targettime eq '13'}">18:00 ~ 19:00</c:if>
                                                        <c:if test="${resultList.targettime eq '14'}">19:00 ~ 20:00</c:if>
                                                        <c:if test="${resultList.targettime eq '15'}">20:00 ~ 21:00</c:if>
                                                        <c:if test="${resultList.targettime eq '16'}">21:00 ~ 22:00</c:if>
                                                        <c:if test="${resultList.targettime eq '17'}">22:00 ~ 23:00</c:if>
                                                    </td>
                                                    <td class="editable-cell">${resultList.day1}</td>
                                                    <td class="editable-cell">${resultList.day2}</td>
                                                    <td class="editable-cell">${resultList.day3}</td>
                                                    <td class="editable-cell">${resultList.day4}</td>
                                                    <td class="editable-cell">${resultList.day5}</td>
                                                    <td class="editable-cell">${resultList.day6}</td>
                                                    <td class="editable-cell">${resultList.day7}</td>
                                                </tr>
                                            </c:forEach>

							            </tbody>
						            </table>
				            	</div>

				            </div>
			            </div>
		            </div>
				</main>
			</div>
		</div>
		<script>
			var currentView = 'weekly'; // 현재 보기 모드
			var currentTrainer = '1'; // 현재 선택된 강사

            function search_(idx){
                location.href= "/popup/popup_register?idx="+ idx;
            }
			// 트레이너 탭 전환
			$('.trainer-tab-btn').on('click', function() {
				$('.trainer-tab-btn').removeClass('active');
				$(this).addClass('active');
				currentTrainer = $(this).data('trainer');
				
				// 여기서 선택된 강사의 스케줄을 불러오는 API 호출 가능
				// loadSchedule(currentTrainer);
			});

			// 오늘 날짜로 설정
			function setToday() {
				let targetdate = '${pictVO.targetdate}';
				let today = new Date();
				let dateString = today.toISOString().split('T')[0];
				if(targetdate == '' || targetdate == null){
				    $('#targetdate').val(dateString);
                }
				else{
					$('#targetdate').val(targetdate);
					today = new Date(targetdate);
                }
                updateWeekDisplay(today);
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


                // 테이블 헤더에 날짜 업데이트
                const days = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];
                const dayNames = ['월', '화', '수', '목', '금', '토', '일'];

                for (let i = 0; i < 7; i++) {
                    const currentDate = new Date(startDate);
                    currentDate.setDate(startDate.getDate() + i);

                    const month = currentDate.getMonth() + 1;
                    const day = currentDate.getDate();
                    const weekday = currentDate.getDay();
                    const dayName = ['일', '월', '화', '수', '목', '금', '토'][weekday];
                    const dateStr = month + '/' + day;

                    $('#day-' + days[i]).text(dateStr);
                }
            }

            // 선택한 날짜로 스케줄 조회
            function searchSchedule() {
                const selectedDate = $('#targetdate').val();
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

                location.href= "/schedule/schedule_list?targetdate="+ selectedDate;
                // API 호출 시
                // loadSchedule(currentTrainer, selectedDate, currentView);
            }

            $(document).ready(function() {
                // 페이지 로드 시 오늘 날짜 설정
                setToday();

                // Enter 키로 검색
                $('#targetdate').on('keypress', function(e) {
                    if (e.which === 13) {
                        searchSchedule();
                    }
                });
            });
		</script>
            
		
    </body>
</html>