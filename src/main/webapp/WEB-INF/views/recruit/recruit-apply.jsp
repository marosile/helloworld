<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 지원서 작성</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/recruit/employment-apply.css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
       <main id="body-area">
        <div id="main-area">
            <p id="title3"><i class="fa-regular fa-file-lines"></i> 지원서 작성하기</p>
            <p id="subTitle">프론트엔드 엔지니어 모집 공고 (신입/경력)</p>
            <p id="infomation">지원자 정보</p>
            <p id="info2">* 기본 정보<span class="required">필수</span></p>

            <table id="info-area">
                <tr>
                    <td>이름</td>
                    <td class="line"><input type="text3" name="inputName"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td class="line"><input type="email" name="email"></td>
                    <td><button id="emailBtn">이메일 인증</button></td>
                </tr>
                <tr>
                    <td>전화번호('-'없이 입력해주세요)</td>
                    <td class="line"><input type="tel" name="tel"></td>
                </tr>
            </table>

            <p id="document">제출 서류</p>

            <p class="doc">이력서<span class="required">필수</span></p>
            <div class="upload"><i class="fa-solid fa-folder-open"></i> 이곳에 파일을 올려주세요.</div>
            <p class="pdf">* PDF 형식으로 올려주세요</p>

            <p class="doc">자기소개서</p>
            <div class="upload"><i class="fa-solid fa-folder-open"></i> 이곳에 파일을 올려주세요.</div>
            <p class="pdf">* PDF 형식으로 올려주세요</p>

            <p id="checkPoint">지원을 위해 다음 사항을 확인해 주세요.</p>
            <div id="check-area">
                <div class="checkbox-row">
                    <div class="checkbox"><input type="checkbox" name="on"></div>
                    <div class="agree">전체동의</div>
                </div>
                <div class="checkbox-row">
                    <div class="checkbox"><input type="checkbox" name="on"></div>
                    <div class="agree">개인정보 필수항목 수집 및 이용 동의<span class="required">필수</span></div>
                    <div class="drop"><i class="fa-solid fa-caret-down"></i></div>
                </div>
                <div class="checkbox-row">
                    <div class="checkbox"><input type="checkbox" name="on"></div>
                    <div class="agree">개인정보 필수항목 수집 및 이용 동의<span>선택</span></div>
                    <div class="drop"><i class="fa-solid fa-caret-down"></i></div>
                </div>
            </div>
            
            <button id="Btn">제출하기</button>
        </div>
        
    </main> 

	<script src="/resources/js/common/general.js"></script>

    <script src="/resources/js/recruit/recruit-apply.js"></script>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
