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
								<%--<div class="schedule-controls-admin" style="margin-bottom: 20px;">
                                    <label for="targetdate">수업 일자 선택:</label>
                                    <input type="date" id="targetdate" style="cursor: pointer; padding: 5px; border: 1px solid #ddd; border-radius: 4px;" value="${pictVO.targetdate}"/>
                                    <button type="button" class="btn-basic btn-fill btn-sm" onclick="searchSchedule()">조회</button>
                                    <span id="selectedWeek" style="margin-left: 20px; font-weight: bold;"></span>
								</div>--%>
						    	
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
							            </colgroup>
							            <thead>
							                <tr>
							                    <th>시간/요일</th>
							                    <th>월요일</th>
							                    <th>화요일</th>
							                    <th>수요일</th>
							                    <th>목요일</th>
							                    <th>금요일</th>
							                    <th>토요일</th>
							                </tr>
							            </thead>
							            <tbody>
                                            <c:forEach var="item" items="${resultList}" varStatus="status">
                                                <c:if test="${status.index % 6 == 0}">
                                                    <tr>
                                                        <td>
                                                            <c:set var="startHour" value="${item.targettime + 5}" />
                                                            ${startHour}:00 ~ ${startHour + 1}:00
                                                        </td>
                                                </c:if>
                                                <td onclick="openScheduleModal('${item.idx}', '${item.title}', '${item.etc}', '${item.targetdate}', '${item.targettime}')">
                                                    <%--한지 여기--%>
                                                    <c:if test="${item.etcidx eq null}">${item.title}</c:if>
                                                    <c:if test="${item.etcidx ne null}">${item.etc}</c:if>
                                                </td>
                                                <c:if test="${status.index % 6 == 5}">
                                                    </tr>
                                                </c:if>

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
		<form action="" id="register" name="register" method="post">
		    <input type="hidden" id="idx" name="idx"/>
		</form>

		<!-- 스케줄 모달 -->
		<div class="schedule-modal" id="scheduleModal" onclick="closeScheduleModal(event)">
		    <div class="schedule-modal-content">
		        <button class="schedule-modal-close" onclick="closeScheduleModal(event)">
		            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
		                <line x1="18" y1="6" x2="6" y2="18"></line>
		                <line x1="6" y1="6" x2="18" y2="18"></line>
		            </svg>
		        </button>
		        <div class="schedule-form-wrapper">
		            <h3 class="modal-title">스케줄 상세</h3>
		            <form id="scheduleForm">
		                <input type="hidden" id="modal_idx" name="idx" />
		                <input type="hidden" id="modal_targetdate" name="targetdate" />
		                <input type="hidden" id="modal_targettime" name="targettime" />

		                <div class="form-group">
		                    <label for="modal_title">제목</label>
		                    <input type="text" id="modal_title" name="title" class="form-control" placeholder="제목을 입력하세요">
		                </div>

		                <div class="form-group checkbox-group">
		                    <label class="checkbox-label">
		                        <input type="checkbox" id="modal_absent" name="absent" value="1">
		                        <span>결석</span>
		                    </label>
		                </div>

		                <div class="form-group checkbox-group">
		                    <label class="checkbox-label">
		                        <input type="checkbox" id="modal_lightning" name="lightning" value="1">
		                        <span>번개</span>
		                    </label>
		                </div>

		                <div class="form-group">
		                    <label for="modal_etc">비고</label>
		                    <input type="text" id="modal_etc" name="etc" class="form-control" placeholder="비고를 입력하세요">
		                </div>

		                <div class="modal-btn-group">
		                    <button type="button" id="deleteBtn" onclick="deleteSchedule()" class="btn-basic btn-fill btn-sm" style="margin-right: auto; display: none;">삭제</button>
		                    <button type="button" onclick="closeModal()" class="btn-basic btn-common btn-sm">닫기</button>
		                    <button type="button" onclick="saveSchedule()" class="btn-basic btn-primary btn-sm">저장</button>
		                </div>
		            </form>
		        </div>
		    </div>
		</div>

		<script>

            $(document).ready(function() {

                // Enter 키로 검색
                $('#targetdate').on('keypress', function(e) {
                    if (e.which === 13) {
                        searchSchedule();
                    }
                });
            });

            // 스케줄 모달 열기
            function openScheduleModal(idx, title, etc, targetdate, targettime) {
                const modal = document.getElementById('scheduleModal');
                const deleteBtn = document.getElementById('deleteBtn');

                // 폼 초기화
                document.getElementById('modal_idx').value = idx || '';
                document.getElementById('modal_title').value = title || '';
                document.getElementById('modal_etc').value = etc || '';
                document.getElementById('modal_targetdate').value = targetdate || '';
                document.getElementById('modal_targettime').value = targettime || '';
                document.getElementById('modal_absent').checked = false;
                document.getElementById('modal_lightning').checked = false;

                // idx가 있으면 삭제 버튼 표시
                if (idx && idx !== '' && idx !== 'null') {
                    deleteBtn.style.display = 'block';
                } else {
                    deleteBtn.style.display = 'none';
                }

                // 모달 표시
                modal.style.display = 'flex';
                document.body.style.overflow = 'hidden';
            }

            // 닫기 버튼용 함수
            function closeModal() {
                const modal = document.getElementById('scheduleModal');
                modal.style.display = 'none';
                document.body.style.overflow = '';
                document.getElementById('scheduleForm').reset();
            }

            // 스케줄 모달 닫기 (배경 클릭용)
            function closeScheduleModal(event) {
                if (event && event.target.id !== 'scheduleModal' && !event.target.closest('.schedule-modal-close')) {
                    return;
                }
                closeModal();
            }

            // 스케줄 저장
            function saveSchedule() {
                const idx = document.getElementById('modal_idx').value;
                const title = document.getElementById('modal_title').value;
                const etc = document.getElementById('modal_etc').value;
                const targetdate = document.getElementById('modal_targetdate').value;
                const targettime = document.getElementById('modal_targettime').value;
                const absent = document.getElementById('modal_absent').checked ? '1' : '0';
                const lightning = document.getElementById('modal_lightning').checked ? '1' : '0';

                // idx가 있으면 update, 없으면 insert
                const saveType = (idx && idx !== '' && idx !== 'null') ? 'update' : 'insert';

                // FormData 생성
                const formData = new FormData();

                // idx가 있을 때만 추가 (update인 경우)
                if (idx && idx !== '' && idx !== 'null') {
                    formData.append('idx', idx);
                }

                // 클릭한 셀에서 받은 값 그대로 전달
                formData.append('targetdate', targetdate);
                formData.append('targettime', targettime);
                formData.append('saveType', saveType);

                // 선택값
                if (title) formData.append('title', title);
                if (etc) formData.append('etc', etc);
                formData.append('absent', absent);
                formData.append('lightning', lightning);

                $.ajax({
                    url: '/schedule/schedule_save',
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        alert('저장되었습니다.');
                        closeModal();
                        location.reload();
                    },
                    error: function(error) {
                        alert('저장에 실패했습니다.');
                        console.error(error);
                    }
                });
            }

            // 스케줄 삭제
            function deleteSchedule() {
                const idx = document.getElementById('modal_idx').value;

                if (!idx || idx === '' || idx === 'null') {
                    alert('삭제할 스케줄이 없습니다.');
                    return;
                }

                if (!confirm('삭제하시겠습니까?')) {
                    return;
                }

                $.ajax({
                    url: '/schedule/schedule_delete',
                    type: 'POST',
                    data: {
                        idx: idx
                    },
                    success: function(response) {
                        alert('삭제되었습니다.');
                        closeModal();
                        location.reload();
                    },
                    error: function(error) {
                        alert('삭제에 실패했습니다.');
                        console.error(error);
                    }
                });
            }

		</script>
            
		
    </body>
</html>

