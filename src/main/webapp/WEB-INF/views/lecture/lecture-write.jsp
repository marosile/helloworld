<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="isNew" value="${empty lecture.lectureNo}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헬로월드 - 강의 ${isNew ? "개설" : "수정"}하기</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/lecture/lecture-write.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"
            integrity="sha256-lSjKY0/srUM9BE3dPm+c4fBo1dky2v27Gdjm2uoZaL0="
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
    <script src="https://unpkg.com/hangul-js" type="text/javascript"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        <div id="main">
            <c:choose>
                <c:when test="${isNew}">
                    <form action="/lecture/write" method="post" enctype="multipart/form-data">
                        <div id="form" class="window">
                            <h2>강의 개설하기</h2>
                            <div>
                                <div>
                                    <div id="title">
                                        <h4>제목</h4>
                                        <input type="text" name="lectureTitle" placeholder="제목을 입력해 주세요.">
                                    </div>
                                    <div id="price">
                                        <h4>가격</h4>
                                        <input type="text" name="lecturePrice" placeholder="가격을 입력해 주세요.">
                                    </div>
                                    <div id="tag">
                                        <h4>태그</h4>
                                        <div>
                                            <input type="text" id="lecture-tag" placeholder="최대 5개까지 추가할 수 있습니다.">
                                        </div>
                                    </div>
                                    <div id="difficulty">
                                        <h4>난이도</h4>
                                        <div>
                                            <input type="radio" name="lectureDifficulty" value="2">상
                                            <input type="radio" name="lectureDifficulty" value="1">중
                                            <input type="radio" name="lectureDifficulty" value="0">하
                                        </div>
                                    </div>
                                </div>
                                <div id="thumbnail">
                                    <h4>썸네일</h4>
                                    <label for="lecture-thumbnail">
                                        <img src="/resources/images/lecture/thumbnail/default.png">
                                        <small style="color:rgb(150, 150, 150);">1 : 1.6 비율 사이즈의 이미지가 권장됩니다.</small>
                                    </label>
                                    <input type="file" id="lecture-thumbnail" name="thumbnail" accept="image/*" onchange="loadImage(this)" hidden>
                                </div>
                            </div>
                            <div id="intro">
                                <h4>소개</h4>
                                <textarea id="summernote" name="lectureIntro"></textarea>
                            </div>
                        </div>
                        <div id="nav" class="window">
                            <button id="submit">작성하기</button>
                            <button type="button" id="cancel" onclick="location.href = '/lecture'">취소</button>
                        </div>
                    </form>
                </c:when>
                <c:otherwise>
                    <form action="/lecture/write" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="originalFilename" value="${lecture.lectureThumbnail}">
                        <input type="hidden" name="lectureNo" value="${lecture.lectureNo}">
                        <div id="form" class="window">
                            <h2>강의 수정하기</h2>
                            <div>
                                <div>
                                    <div id="title">
                                        <h4>제목</h4>
                                        <input type="text" name="lectureTitle" placeholder="제목을 입력해 주세요." value="${lecture.lectureTitle}">
                                    </div>
                                    <div id="price">
                                        <h4>가격</h4>
                                        <input type="text" name="lecturePrice" placeholder="가격을 입력해 주세요." value="${lecture.lecturePrice}">
                                    </div>
                                    <div id="tag">
                                        <h4>태그</h4>
                                        <div>
                                            <c:forEach var="tag" items="${lecture.lectureTags}">
                                                <span onClick="$(this).remove()">
                                                    #${tag}&nbsp;×
                                                    <input type="hidden" name="lectureTags" value="${tag}">
                                                </span>
                                            </c:forEach>
                                            <input type="text" id="lecture-tag" placeholder="최대 5개까지 추가할 수 있습니다.">
                                        </div>
                                    </div>
                                    <div id="difficulty">
                                        <h4>난이도</h4>
                                        <div>
                                            <c:set var="difficulty" value="${fn:split('쉬움,보통,어려움',',')}" />
                                            <c:forEach var="i" begin="0" end="2">
                                                <input type="radio" name="lectureDifficulty" value="${i}" <c:if test="${lecture.lectureDifficulty == i}">checked</c:if>>${difficulty[i]}
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div id="thumbnail">
                                    <h4>썸네일</h4>
                                    <label for="lecture-thumbnail">
                                        <img src=${lecture.lectureThumbnail}>
                                        <small style="color:rgb(150, 150, 150);">1 : 1.6 비율 사이즈의 이미지가 권장됩니다.</small>
                                    </label>
                                    <input type="file" id="lecture-thumbnail" name="thumbnail" accept="image/*" onchange="loadImage(this)" hidden>
                                </div>
                            </div>
                            <div id="intro">
                                <h4>소개</h4>
                                <textarea id="summernote" name="lectureIntro">${lecture.lectureIntro}</textarea>
                            </div>
                        </div>
                        <div id="nav" class="window">
                            <button id="submit">수정하기</button>
                            <button type="button" id="cancel" onclick="location.href = '/lecture/${lecture.lectureNo}'">취소</button>
                        </div>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/lecture/lecture-write.js"></script>
</body>