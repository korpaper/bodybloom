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
                                                <td>
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
		<script>

            $(document).ready(function() {

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

