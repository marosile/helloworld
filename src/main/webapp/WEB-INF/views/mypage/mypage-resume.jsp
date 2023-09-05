<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지-이력서</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-resume.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-nav.css">

    <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<main>
        <!-- 마이페이지 nav -->
        <jsp:include page="/WEB-INF/views/mypage/mypage-nav.jsp"/>

        <h1 class="Title">이력서</h1>
        <section>
            <form action="resume" method="POST" name="mypageFrm" id="resumeFrm" enctype="multipart/form-data">

                <!-- ===== 이력서 영역 ===== -->
                <div class="resume-area">
                    <div class="fa-solid fa-arrow-up-from-bracket fa-4x" id="icon"></div>
                    <label for="resumeInput">업로드 파일</label>
                    <input type="file" name="resumeFile" id="resumeInput"><!-- accept 지정 해줘야함 -->
                    <div>PDF, DOC, DOCX 최대 1MB</div>
                </div>

                <hr>

                <!-- ========  약관동의 영역 ========= -->
                <div class="agree-area">
                    <div>정책 동의</div>
                    <div>이력서 활용에 대한 약관 및 정책에 동의해주세요.</div>

                    <div class="row1">           <!-- 전체동의 -->
                        <input type="checkbox" id="allcheck" class="cbox" name="check1" onclick="">
                        <label for="check1">전체동의</label>
                    </div>

                    <hr>
                    
                    <div class="row23">
                        <div class="row2">           <!-- 2번째 박스 -->
                            <input type="checkbox" id="box2" class="cbox" name="box2" onclick="">
                            <label for="box2">개인정보 보호에 대한 방침</label>
                            <a href="#">보기</a>
                        </div>
    
                        <div class="row3">           <!-- 3번째 박스 -->
                            <input type="checkbox" id="box3" class="cbox" name="box3" onclick="">
                            <label for="box3">개인회원 이용약관</label>
                            <a href="#">보기</a>
                        </div>
                    </div>

                    <hr>

                    <div class="row4">           <!-- 4번째 박스 -->
                        <input type="checkbox" id="box3" class="cbox" name="box3" onclick="">
                        <label for="box3">"바로 지원하기"에서 이메일 전달 동의</label>
                    </div>
                </div>

                <button id="saveBtn">정책 동의하고 저장</button>

            </form>
            

        
        </section>
        
        


	</main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
</body>
</html>
