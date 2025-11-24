<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
						    	<!-- 강사 선택 탭 -->
						    	<div class="trainer-tabs-admin" style="margin-bottom: 20px;">
						    		<button type="button" class="trainer-tab-btn active" data-trainer="1">윤수환 강사</button>
						    		<button type="button" class="trainer-tab-btn" data-trainer="2">최재희 강사</button>
						    		<button type="button" class="trainer-tab-btn" data-trainer="3">윤동욱 강사</button>
						    	</div>
						    	
						    	<!-- 일간/주간 탭 -->
						    	<div class="schedule-tabs-admin" style="margin-bottom: 20px;">
						    		<button type="button" class="view-tab-btn" data-view="daily">일간</button>
						    		<button type="button" class="view-tab-btn active" data-view="weekly">주간</button>
						    	</div>
						    	
								<!-- 날짜 선택 -->
								<div class="schedule-controls-admin" style="margin-bottom: 20px;">
									<label for="scheduleDate">수업 일자 선택:</label>
									<input type="date" id="scheduleDate" style="cursor: pointer; padding: 5px; border: 1px solid #ddd; border-radius: 4px;" />
									<button type="button" class="btn-basic btn-fill btn-sm" onclick="searchSchedule()">조회</button>
									<button type="button" class="btn-basic btn-sm" onclick="setToday()">오늘</button>
									<span id="selectedWeek" style="margin-left: 20px; font-weight: bold;"></span>
								</div>
						    	
						    	<!-- 주간 스케줄 테이블 -->
						    	<div class="schedule-table-wrapper weekly-view">
							        <table class="schedule-table" style="text-align: center; width: 100%;">
							            <thead>
							                <tr>
							                    <th style="width: 80px;">시간</th>
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
				            	<div class="schedule-table-wrapper daily-view" style="display: none;">
							        <table class="schedule-table daily-table" style="text-align: center; width: 100%;">
							            <thead>
							                <tr>
							                    <th style="width: 150px;">시간</th>
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
				            </div>
			            </div>
		            </div>
				</main>
			</div>
		</div>
		<script>
			var currentView = 'weekly'; // 현재 보기 모드
			var currentTrainer = '1'; // 현재 선택된 강사

			// 트레이너 탭 전환
			$('.trainer-tab-btn').on('click', function() {
				$('.trainer-tab-btn').removeClass('active');
				$(this).addClass('active');
				currentTrainer = $(this).data('trainer');
				
				// 여기서 선택된 강사의 스케줄을 불러오는 API 호출 가능
				// loadSchedule(currentTrainer);
			});

			// 일간/주간 탭 전환
			$('.view-tab-btn').on('click', function() {
				var viewType = $(this).data('view');
				changeView(viewType);
			});

			function changeView(viewType) {
				currentView = viewType;

				// 탭 버튼 활성화 상태 변경
				$('.view-tab-btn').removeClass('active');
				$('.view-tab-btn[data-view="' + viewType + '"]').addClass('active');

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
			const dayNames = ['월', '화', '수', '목', '금', '토', '일'];

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

				const date = new Date(selectedDate);

				if (currentView === 'weekly') {
					updateWeekDisplay(date);
				} else {
					updateDailyDisplay();
				}

				// API 호출 시
				// loadSchedule(currentTrainer, selectedDate, currentView);
			}

			$(document).ready(function() {
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
            
		
    </body>
</html>