 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<link rel="stylesheet" href="/resources/css/recruit/recruit-footer.css">

    <footer id="recruitFooter">
        <div id="footerDiv">

            <div>
                <div class="swiper-button-prev"></div>
                <div>이전</div>
            </div>

            <div id="bookMark">
                <div><i class="fa-regular fa-bookmark fa-2xl"></i></div>
                <div id="bookMarkSpan">북마크</div>
            </div>

            <div id="apply">
                <a href="/recruit/moreDetail?boardNo=${recruit.boardNo}"><button id="btn">지원하기</button></a>
            </div>
         
            <div>
                <div>다음</div>
                <div class="swiper-button-next"></div>
            </div>
            
        </div>


    </footer>

    <script src="/resources/js/recruit/recruit-footer.js"></script>