<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="./include/head.jsp" %>
<%@ include file="./include/header.jsp" %>

<div class="subMain">
    <div class="subTop">
        <div class="subTopInner">
            <div class="subTopTitles eng">
                <h2>
                    <span>Announcing</span>
                    <p>2024 Hangang Rising Star</p>
                </h2>
            </div>
        </div>
    </div>
    <div class="subContents">
        <div class="subContInner bdInner">
            <div class="tabNav" data-aos="fade-up" data-aos-delay="500">
                <a href="/en/board_list" class="active">Notice</a>
                <a href="/en/news_list">Community</a>
            </div>
            <div class="tabInner active" data-aos="fade-up" data-aos-delay="800">
                <ul class="bdLists boardL">
                	<c:forEach var="board_list" items="${board_list}" varStatus="status">
	                    <li>
	                        <a href="/ko/board_view?idx=${board_list.idx}">
	                            <div class="idxTit">
	                                <span>${status.count}</span>
	                                <p>${board_list.title}</p>
	                            </div>
	                            <p>${board_list.regdate}</p>
	                        </a>
	                    </li>
                    </c:forEach>
                </ul>
                <!-- 10개 단위로 노출 -->
                <div class="moreButton bd">
                    <button>+ 더보기</button>
                </div>
            </div>
        </div>
		<%@ include file="./include/footer.jsp" %>
    </div>
</div>