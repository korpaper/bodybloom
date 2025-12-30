<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!DOCTYPE html>
<html lang="ko">
<c:import url="../main/header.jsp">
	<c:param name="pageTitle" value="스케쥴 등록" />
</c:import>
<%
    String userId = (String) session.getAttribute("id");
%>
<body class="sb-nav-fixed">
	<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
		<%@include file="../main/navigation.jsp"%>
		<div id="layoutSidenav">
			<div id="layoutSidenav_nav">
				<%@include file="../main/gnb.jsp"%>
			</div>
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">스케쥴 등록</h2>
					<div class="contents-box">
						<div class="card">
							<div class="card-body">
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">강사</label>
										<div class="input-box">
											<input type="text" id="userid" name="userid" value="<%=userId%>" class="input opt-max-width-500" disabled>
										</div>
									</div>
								</div>

                                <div class="write-box">
                                    <div class="write-item">
                                        <label for="title" class="title">수업 일자</label>
                                        <div class="input-box">
                                            <input type="date" id="targetdate" name="targetdate" style="cursor: pointer; padding: 5px; border: 1px solid #ddd; width: 200px; height: 45px;" value="${pictVO.targetdate}" />
                                        </div>
                                    </div>
                                </div>

                                <div class="write-box">
									<div class="write-item">
										<label for="title" class="title">시간대</label>
										<div class="input-box">
											<select name="targettime" id="targettime" title="시간대 선택">
										        <option value="">시간선택</option>
										        <option value="1">06:00 ~ 07:00</option>
										        <option value="2">07:00 ~ 08:00</option>
										        <option value="3">08:00 ~ 09:00</option>
										        <option value="4">09:00 ~ 10:00</option>
										        <option value="5">10:00 ~ 11:00</option>
										        <option value="6">11:00 ~ 12:00</option>
										        <option value="7">12:00 ~ 13:00</option>
										        <option value="8">13:00 ~ 14:00</option>
										        <option value="9">14:00 ~ 15:00</option>
										        <option value="10">15:00 ~ 16:00</option>
										        <option value="11">16:00 ~ 17:00</option>
										        <option value="12">17:00 ~ 18:00</option>
										        <option value="13">18:00 ~ 19:00</option>
										        <option value="14">19:00 ~ 20:00</option>
										        <option value="15">20:00 ~ 21:00</option>
										        <option value="16">21:00 ~ 22:00</option>
										        <option value="17">22:00 ~ 23:00</option>
											</select>
										</div>
									</div>
								</div>

                                <div class="write-box">
                                    <div class="write-item">
                                        <label for="title" class="title">매주 반복 여부</label>
                                        <div class="input-box">
                                            <label class="toggle-switch">
                                                <input type="checkbox" id="roop" name="roop" value="1" />
                                                <span class="toggle-slider"></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>

								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">비고(30분수업 등)</label>
										<div class="input-box">
											<input type="text" id="title" name="title" value="${pictVO.title}" class="input opt-max-width-500">
										</div>
									</div>
								</div>
									
								<div class="btn-box">
									<c:if test="${pictVO.saveType eq 'update'}">
										<button type="button" onclick="javascript:schedule_delete()" class="btn-basic btn-fill btn-sm">삭제</button>
									</c:if>
									<c:if test="${pictVO.saveType eq 'insert'}">
										<button type="button" onclick="button1_click();" class="btn-basic btn-primary btn-sm">등록</button>
									</c:if>
									<c:if test="${pictVO.saveType ne 'insert'}">
										<button type="button" onclick="button1_click();" class="btn-basic btn-primary btn-sm">수정</button>
									</c:if>
						        	<button type="button" onclick="javascript:schedule_list();" class="btn-basic btn-common btn-sm">목록보기</button>
					            </div>
							</div>
						</div>
		            </div>
				</main>
			</div>
		</div>
		<input type='hidden' name="saveType" id="saveType" value='${pictVO.saveType}' /> 
		<input type='hidden' name="idx" id="idx" value='${pictVO.idx}' /> 
		<input type='hidden' name="use_at" id="use_at" value='${pictVO.use_at}' />
		<input type='hidden' name="type" id="type" value='' />
		<input type='hidden' name="del_img_url" id="del_img_url" value='' />
		
	</form>
	
	<script>
		function schedule_delete() {
			if (confirm("삭제 하시겠습니까?")) {
				$("#register").attr("action", "/schedule/schedule_delete");
				$("#register").submit();
			}
			
		}
		function schedule_list() {
			location.href = "/schedule/schedule_list";
		}
		function button1_click() {

			var text = "등록하시겠습니까?";
			if (saveType == 'update') {
				text = "수정하시겠습니까?"
			}

			if (confirm(text)) {
				$("#register").attr("action", "/schedule/schedule_save");
				$("#register").submit();
			}
		}

	</script>

</body>
</html>