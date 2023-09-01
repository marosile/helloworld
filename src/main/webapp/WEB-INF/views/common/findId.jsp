<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>

<title>아이디 찾기</title>
<link rel="stylesheet" href="/resources/css/common/general.css">
<link rel="stylesheet" href="/resources/css/common/findId.css">
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

        
    <div class="findIdMain">
        <h2>아이디(이메일) 찾기</h2>
    
        <h4>휴대폰 인증</h4>
        <form action="#" class="phoneFrm">
            
            <div class="phoneAuth1">
                <input type="text" id="inputTel1" class="phoneInput">
    
                <button id="btn1" class="inputBtn">인증번호 발송</button>
            </div>
                
            <div class="phoneAuth1">
                <input type="text" id="inputTel2" class="phoneInput">
    
                <button id="btn2" class="inputBtn">인증하기</button>
            </div>


            <button id="phoneBtn">아이디 찾기</button>
        </form>
        
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/common/findId.js"></script>
</body>
</html>