<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 담당자 지원서 작성</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/recruit/application.css">

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <jsp:include page="/WEB-INF/views/recruit/recruit-nav.jsp"/>

       <main id="body-area">

            <form action="application" method="POST" 
              class="board-write" id="boardWriteFrm" enctype="multipart/form-data">

                <div id="main-area">
                    
                    <div id="title3"> 
                        기업 담당자 신청
                    </div>

                    <div id="companyNameImg">

                        <div class="img-box">
                            <div class="boardImg thumbnail">
                                <label for="img0">
                                    <img class="preview" src="">
                                </label>
                                <input type="file" name="image" class="inputImage" id="img0" accept="image/*">
                                <span class="delete-image">&times;</span>
                            </div>
                        </div>

                        <input type="text" placeholder="기업 로고와 기업명을 작성해주세요." 
                         maxlength="60" name="companyName" class="companyName">

                    </div>
                    
                    <div class="info">
                        <span>담당자ID : ${loginMember.memberId}</span><span id="tel">담당자 전화번호 : ${loginMember.memberTel}</span>
                    </div>

                    <div class="info2">

                        <div>
                            <i class="fa-solid fa-location-dot"></i>
                            <input type="text" placeholder="회사 주소를 작성해주세요." name="companyAddress" id="cmpnAddress">
                        </div>

                        <div><i class="fa-solid fa-users"></i>
                            <input type="text" placeholder="사원수를 작성해주세요." name="companyMcount" id="cmpnMcount">
                        </div>

                    </div>

                    <div id="explain">
                       <textarea placeholder="🔥회사 소개를 작성해주세요." name="companyIntroduce" id="cmpnIntro"></textarea>
                    </div>
                    
                    <div id="companyHome">
                        <div id ="companyhome2">
                            <input type="text" name= "companyHomePageAddress" placeholder="회사 홈페이지 주소를 작성해주세요.">
                        </div>
                    </div>

                    <button id="sub">신청</button>
                    <button id="go-to-list">목록으로</button>
        
                </div>

            </form>
            
        </main> 

	<script src="/resources/js/common/general.js"></script>
    
    <script src="/resources/js/recruit/application.js"></script>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
