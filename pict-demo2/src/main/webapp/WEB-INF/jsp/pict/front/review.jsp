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
            <h1 class="page-title" data-aos="fade-up">회원 후기</h1>
            <p class="page-subtitle" data-aos="fade-up" data-aos-delay="100">회원님들의 생생한 후기를 만나보세요</p>
        </div>
    </section>

    <section class="get-started-section">
        <div class="get-started-container">
            <div class="services-grid">
                <c:forEach var="resultList" items="${review_list}" varStatus="status">
                    <div class="service-card" data-aos="fade-up" data-aos-delay="100">
                        <h3>${resultList.title}</h3>
                        <p>${resultList.text}</p>
                        <span>
                            <c:choose>
                                <c:when test="${fn:contains(resultList.name, '/')}">
                                    <c:set var="nameArr" value="${fn:split(resultList.name, '/')}" />
                                    <c:forEach var="n" items="${nameArr}" varStatus="st">
                                        <c:choose>
                                            <c:when test="${fn:length(n) == 2}">
                                                ${fn:substring(n, 0, 1)}*
                                            </c:when>
                                            <c:when test="${fn:length(n) >= 3}">
                                                ${fn:substring(n, 0, 1)}*${fn:substring(n, fn:length(n)-1, fn:length(n))}
                                            </c:when>
                                            <c:otherwise>
                                                *
                                            </c:otherwise>
                                        </c:choose>
                                        <c:if test="${!st.last}">/</c:if>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${fn:length(resultList.name) == 2}">
                                            ${fn:substring(resultList.name, 0, 1)}*
                                        </c:when>
                                        <c:when test="${fn:length(resultList.name) >= 3}">
                                            ${fn:substring(resultList.name, 0, 1)}*
                                            ${fn:substring(resultList.name, fn:length(resultList.name)-1, fn:length(resultList.name))}
                                        </c:when>
                                        <c:otherwise>
                                            *
                                        </c:otherwise>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
</main>

<script>
$(document).ready(function() {
    AOS.init({
        duration: 800,
        easing: 'ease-in-out',
        once: true
    });
});
</script>

<%@ include file="./include/footer.jsp" %>
