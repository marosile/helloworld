<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인 페이지</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main>
		<div id="slide-frame">
            <div id="slide-container">
                <div class="slide" style="border: 5px solid rgba(0, 0, 0, 0.3); background: white;">
                    <div>
                        <span class="tag" style="background-color: rgba(0, 128, 255, 0.6);">국비지원</span>
                        <h2 style="color: rgb(60, 60, 60)">공공데이터 융합 자바개발자 양성과정 A30</h2>
                        <div style="color: rgb(60, 60, 60)" class="content">
                            수료 후 취업 성공률 90%, 지금 바로 지원하세요!
                        </div>
                    </div>
                    <img style="filter: drop-shadow(5px 5px 10px rgb(0, 0, 0, 0.3));" src="/resources/images/kh.png">
                </div>
                <div class="slide" style="background: linear-gradient(90deg, rgb(200, 100, 255), rgb(0, 128, 255));">
                    <div>
                        <span class="tag" style="background-color: rgba(0, 0, 0, 0.6);">신규 회원</span>
                        <h2>전 강의 30% 할인</h2>
                        <div class="content">
                            커리어 향상을 위한 지름길!<br>
                            고품질 강의들을 30% 할인된 가격에 만나보세요!<br>
                            2023. 10. 10 까지 진행됩니다.
                        </div>
                    </div>
                    <img style="filter: drop-shadow(5px 5px 10px rgb(0, 0, 0, 0.3));" src="/resources/images/parrot.png">
                </div>
                <div class="slide" style="background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.9)), url('/resources/images/keyboard.jpg'); background-size: cover">
                    <div>
                        <span class="tag" style="background: linear-gradient(135deg, rgba(0, 255, 160, 0.8), rgba(0, 128, 255, 0.8));">커뮤니티</span>
                        <h2>HELLO, WORLD!</h2>
                        <div class="content">
                            개발자의, 개발자에 의한, 개발자를 위한 공간.<br>
                            헬로월드에 오신 것을 환영합니다!<br>
                            새로운 가치를 함께 만들어 나가요.
                        </div>
                    </div>
                    <img style="filter: drop-shadow(5px 5px 10px rgb(0, 0, 0, 0.3));" src="/resources/images/community.png">
                </div>
                <div class="slide" style="border: 1px solid var(--divider); background: linear-gradient(45deg, rgb(149, 0, 194), rgb(231, 133, 1));">
                    <div>
                        <span class="tag" style="background: rgba(0, 0, 0, 0.6);">스터디</span>
                        <h2>같이 공부할 사람 구해요!</h2>
                        <div class="content">
                            특정 분야에 대해 공부하는데 갈피를 못 잡고 있나요?<br>
                            프로젝트를 진행하고 싶으신가요?<br>
                            스터디를 모집해 함께 공부해요!
                        </div>
                    </div>
                    <img style="filter: drop-shadow(5px 5px 10px rgb(0, 0, 0, 0.3));" src="/resources/images/laptop.png">
                </div>
                <div class="slide" style="background: linear-gradient(135deg, rgba(171, 209, 46, 0.9), rgba(0, 187, 221, 0.9)), url('/resources/images/company.jpg'); background-size: cover">
                    <div>
                        <span class="tag" style="background: rgba(0, 0, 0, 0.6);">채용</span>
                        <h2>나에게 맞는 기업은?</h2>
                        <div class="content">
                            채용 테스트를 진행하고<br>
                            나에게 맞는 기업을 찾아보세요!<br>
                            맞춤 공고를 추천해 드립니다.
                        </div>
                    </div>
                    <img style="filter: drop-shadow(5px 5px 10px rgb(0, 0, 0, 0.3));" src="/resources/images/resume.png">
                </div>
            </div>
        </div>
        <div id="slide-bullet-container">
            <div class="slide-bullet" style="background-color: rgb(0, 128, 255);"></div>
            <div class="slide-bullet"></div>
            <div class="slide-bullet"></div>
            <div class="slide-bullet"></div>
            <div class="slide-bullet"></div>
        </div>
        <div id="content">
            <div id="feeds">
            </div>
            <div id="side">
                <c:if test="${empty loginMember}">
                    <div id="recommend-signup" class="window">
                        <h3>로그인 후 다양한 서비스를<br>이용하실 수 있습니다.</h3>
                        <button onclick="modalArea.style.display = 'block'; preventScroll(true);">로그인</button>
                        <div>
                            <span>아직 회원이 아니신가요?</span>&nbsp;
                            <a href="/member/signUp">회원가입</a>
                        </div>
                    </div>
                </c:if>
                <div id="popular-boards" class="window">
                    <h2>실시간 인기 게시글</h2>
                </div>
            </div>
        </div>
	</main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/index.js"></script>
</body>
</html>
