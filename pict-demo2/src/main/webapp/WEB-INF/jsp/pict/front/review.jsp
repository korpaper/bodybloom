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
                        <span>${resultList.name}</span>
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
