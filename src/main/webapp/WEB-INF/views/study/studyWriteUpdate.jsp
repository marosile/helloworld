<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스터디수정</title>


    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/study/studyWrite.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=955d027ad541e959373216700e779cf3&libraries=services"></script>
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
<jsp:include page="/WEB-INF/views/study/study-nav.jsp"/>


<main id="P-body-area">

    <div id="P-main-area">
        <p id="P-main-title">
            <i class="fa-regular fa-file-lines"></i> 스터디 모집 내용 수정하기
        </p>

        <form action="/study/detail/update/${boardNo}" method="POST" class="P-body-category-top" enctype = "multipart/form-data">


            <h5><span class="required">*</span> 카테고리</h5>
            <div class="P-body-category-area">

                <div class="P-body-category-role">

                    <button type="button" class="P-body-category-btn">${study.tagNm}
                        <i class="fa-solid fa-caret-down"></i>
                    </button>

                    <ul class="P-selectBox-role menuHidden" id="P-selectBox-role">
                        <li><button type="button" class="P-option-btn" id="front" name="tagNm">프론트엔드</button>
                        </li>
                        <li><button type="button" class="P-option-btn" id="back" name="tagNm">백엔드</button></li>
                        <li><button type="button" class="P-option-btn" id="design" name="tagNm">디자인</button></li>
                        <li><button type="button" class="P-option-btn" id="Planning" name="tagNm">기획</button>
                        </li>
                        <li><button type="button" class="P-option-btn" id="etc" name="tagNm">기타</button></li>
                   </ul>

                    <input type="hidden" id="selectedRole" name="tagNm" value="${study.tagNm}">
                    <input type="hidden" name="select1" value="${study.tagNm}">

                </div>

<%--
                <div class="P-body-category-purpose">
                    <button type="button" class="P-body-purpose-btn">목적
                        <i class="fa-solid fa-caret-down"></i>
                    </button>

                    <ul class="P-selectBox-purpose menuHidden">
                        <li>
                            <button type="button" class="P-option-btn">포트폴리오/직무역량 강화</button>
                        </li>
                        <li>
                            <button type="button" class="P-option-btn">창업/수익 창출</button>
                        </li>
                        <li>
                            <button type="button" class="P-option-btn">네트워킹</button>
                        </li>
                    </ul>

                </div>
--%>

                <div class="P-body-category-count">
                    <button type="button" class="P-body-count-btn">${study.headCount}
                        <i class="fa-solid fa-caret-down"></i>
                    </button>

                    <ul class="P-selectBox-count menuHidden">

                        <div class="P-CountPerson ">
                            <div class="P-person">
                                <span class="P-person-span">전체인원</span>
                                <button type="button" id="P-minusBtn">-</button>
                                <span id="count" name="headCount" >1</span>
                                <button type="button" id="P-plusBtn">+</button>
                            </div>
                            <button type="button" id="P-personBtn">완료</button>
                        </div>
                    </ul>
                    <input type="hidden" id="countInput" name="headCount" value="1">
                </div>

            </div>

            <div id="P-body-container">

                <h5><span class="required">*</span> 제목</h5>

                <div id="P-body-title">
                    <input id="P-body-title-textarea" placeholder="제목을 입력해주세요." name="boardTitle" value="${study.boardTitle}"></input>
                    <br>
                </div>

                <h5><span class="required">*</span> 내용</h5>
                <div id="P-body-content">
                        <textarea name="boardContent" id="summernote" rows="1"
                                  placeholder="프로젝트 요약을 입력하세요.

예시 - 온/오프라인으로 달리기 모임을 만들고 찾을 수 있는 앱을 기획 중입니다. 현재 기획자 1명, 백엔드 개발자 1명이 있고, 함께 하실 디자이너와 프론트 개발자를 찾고 있어요!">${study.boardContent}</textarea>
                </div>

            </div>

            <div id="P-body-container-location">
                <div class="h5"><span>*</span> 위치 (선택하지 않으면 서울전체로 등록됩니다.)</div>
                <div id="map"></div>
                <input type="hidden" id="mapVal" name="location">

            </div>



            <div class="P-body-controller">
                <div class="P-body-controller-Btn">
                    <button  id="BtnModify" type="submit">수정완료</button>
                    <button  type="button" id="BtnDelete">수정취소</button>
                </div>

            </div>


        </form>
    </div>

    <script>
    $(document).ready(function() {

    var toolbar = [
    // 글꼴 설정
    ['fontname', ['fontname']],
    // 글자 크기 설정
    ['fontsize', ['fontsize']],
    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    // 글자색
    ['color', ['forecolor','color']],
    // 표만들기
    ['table', ['table']],
    // 글머리 기호, 번호매기기, 문단정렬
    ['para', ['ul', 'ol', 'paragraph']],
    // 줄간격
    ['height', ['height']],
    // 그림첨부, 링크만들기, 동영상첨부
    ['insert',['picture','link','video']],
    // 코드보기, 확대해서보기, 도움말
    ['view', ['codeview','fullscreen', 'help']]
    ];

    var setting = {
    height : 300,
    minHeight : null,
    maxHeight : null,
    focus : true,
    lang : 'ko-KR',
    toolbar : toolbar,
    //콜백 함수
    callbacks : {
    onImageUpload : function(files, editor, welEditable) {
    // 파일 업로드(다중업로드를 위해 반복문 사용)
    for (var i = files.length - 1; i >= 0; i--) {
    uploadSummernoteImageFile(files[i],
    this);
    }
    }
    }
    };
    $('#summernote').summernote(setting);
    });

    function uploadSummernoteImageFile(file, el) {
    data = new FormData();
    data.append("file", file);
    $.ajax({
    data : data,
    type : "POST",
    url : "uploadSummernoteImageFile",
    contentType : false,
    enctype : 'multipart/form-data',
    processData : false,
    success : function(data) {
    $(el).summernote('editor.insertImage', data.url);
    }
    });
    }

    </script>

</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="/resources/js/common/general.js"></script>
<script src="/resources/js/study/studyUpdate.js"></script>


</body>
</html>
