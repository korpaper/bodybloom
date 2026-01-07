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
                                                            ${fn:substringBefore(((status.index div 6) + 6), '.')}:00 ~ ${fn:substringBefore(((status.index div 6) + 7), '.')}:00
                                                        </td>
                                                </c:if>
                                                <td onclick="openScheduleModal('${item.idx}', '${item.etc}', '${item.impossible}', '${item.possible}', '${item.title}', '${item.etcidx}')">
                                                    <c:choose>
                                                        <c:when test="${item.impossible eq 'Y' and item.possible eq 'Y'}">
                                                            ${item.etc}
                                                        </c:when>

                                                        <c:when test="${item.impossible eq 'Y'}">
                                                            ${item.title}(X)
                                                        </c:when>

                                                        <c:otherwise>
                                                            ${item.title}
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

				            </div>
			            </div>
		            </div>
				</main>
			</div>
		</div>

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
		            <form id="scheduleForm" name="scheduleForm" method="post">
		                <input type="hidden" id="idx" name="idx" />
                        <input type="hidden" id="etcidx" name="etcidx" />

                        <div class="form-group">
                            <label for="title">제목</label>
                            <input type="text" id="title" name="title" class="form-control" placeholder="제목을 입력하세요">
                        </div>

		                <div class="form-group checkbox-group">
		                    <label class="checkbox-label">
		                        <input type="checkbox" id="impossible" name="impossible" value="Y">
		                        <span>결석</span>
		                    </label>
		                </div>

		                <div class="form-group checkbox-group">
		                    <label class="checkbox-label">
		                        <input type="checkbox" id="possible" name="possible" value="Y">
		                        <span>번개</span>
		                    </label>
		                </div>

		                <div class="form-group">
		                    <label for="modal_etc">비고</label>
		                    <input type="text" id="etc" name="etc" class="form-control" placeholder="비고를 입력하세요">
		                </div>

		                <div class="modal-btn-group">
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
            function openScheduleModal(idx, etc, impossible, possible, title, etcidx) {
                const modal = document.getElementById('scheduleModal');
                const deleteBtn = document.getElementById('deleteBtn');

                // 폼 초기화
                $('#idx').val(idx)
                $('#etc').val(etc)
                if(impossible == 'Y') $('#impossible').prop('checked', true);
				else $('#impossible').prop('checked', false);

				if(possible == 'Y') $('#possible').prop('checked', true);
				else $('#possible').prop('checked', false);

                $('#title').val(title)
                $('#etcidx').val(etcidx)


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

				var text ="등록하시겠습니까?";
                if(confirm (text)){
                    $("#scheduleForm").attr("action", "/schedule/schedule_save");
                    $("#scheduleForm").submit();
                }
            }
		</script>
    </body>
</html>

