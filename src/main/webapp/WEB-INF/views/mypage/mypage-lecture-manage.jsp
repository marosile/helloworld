<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>헬로월드 - 마이페이지 - 강의 관리</title>
  <link rel="stylesheet" href="/resources/css/common/general.css">
  <link rel="stylesheet" href="/resources/css/mypage/general.css">
  <link rel="stylesheet" href="/resources/css/mypage/mypage-lecture-manage.css">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"
          integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
          crossorigin="anonymous"></script>
</head>
<body>
  <jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <main>
    <jsp:include page="/WEB-INF/views/mypage/mypage-side.jsp"/>
    <div id="main" class="window">
      <h2>내 강의</h2>
      <div id="lecture-container">
      </div>
    </div>
  </main>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <script src="/resources/js/common/general.js"></script>
  <script src="/resources/js/mypage/lecture-manage.js"></script>
</body>