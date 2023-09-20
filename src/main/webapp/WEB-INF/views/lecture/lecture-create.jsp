<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일주일만에 끝내는 리액트 완벽 가이드</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/lecture/lecture-create.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.js"
            integrity="sha512-lVkQNgKabKsM1DA/qbhJRFQU8TuwkLF2vSN3iU/c7+iayKs08Y8GXqfFxxTZr1IcpMovXnf2N/ZZoMgmZep1YQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.css"
          integrity="sha512-ZbehZMIlGA8CTIOtdE+M81uj3mrcgyrh6ZFeG33A4FHECakGrOsTPlPQ8ijjLkxgImrdmSVUHn1j+ApjodYZow=="
          crossorigin="anonymous"
          referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/lang/summernote-ko-KR.min.js"
            integrity="sha512-Zg4LEmUTxIodfMffiwHk5HUeapoVo2VTSGZS5q6ttOMseXr/ZbkiBgV2lyds3UQFPAX05AlF8RIpszT3l7BXKA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        <div id="banner-background"></div>
        <div id="main">
            <div id="content" class="window">
                <form action="/lecture/create" method="post">
                    <div>
                        <img>
                        <input type="image" name="lectureThumbnail" hidden>
                        <div>
                            제목 <input id="title" name="lectureTitle" placeholder="제목을 입력해 주세요">
                            태그 <div></div>
                            난이도 <input id="price" name="lectureDifficulty" placeholder="">
                            수강 기간 <input id="price" name="lectureTimeLimit" placeholder="">
                            가격 <input id="price" name="lecturePrice" placeholder="">
                        </div>
                    </div>
                    <textarea id="summernote" name="lectureIntro"></textarea>
                </form>
            </div>
            <div id="nav">
                <button>작성</button>
                <button>취소</button>
            </div>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/lecture/lecture-create.js"></script>
</body>