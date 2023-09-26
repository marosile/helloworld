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
  <link rel="stylesheet" href="/resources/css/mypage/lecture-management.css">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"
          integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
          crossorigin="anonymous"></script>
</head>
<body>
  <jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <main>
    <div id="side" class="window">
      <h6>일반</h6>
      <div>
        <a href="/mypage/profile">
          <img src="/resources/images/mypage/category/profile.png">
          프로필
        </a>
      </div>
      <div>
        <a href="/mypage/account">
          <img src="/resources/images/mypage/category/account.png">
          계정 관리
        </a>
      </div>
      <div>
        <a href="/mypage/resume">
          <img src="/resources/images/mypage/category/applications.png">
          이력서 관리
        </a>
      </div>
      <div>
        <a href="/mypage/applications">
          <img src="/resources/images/mypage/category/resume.png">
          지원 이력
        </a>
      </div>
      <div>
        <a href="/mypage/post">
          <img src="/resources/images/mypage/category/post.png">
          나의 게시글
        </a>
      </div>
      <div>
        <a href="/mypage/bookmark">
          <img src="/resources/images/mypage/category/bookmark.png">
          북마크 목록
        </a>
      </div>
      <div>
        <a href="/mypage/like">
          <img src="/resources/images/mypage/category/like.png">
          좋아요 목록
        </a>
      </div>
      <h6>강사</h6>
      <div>
        <a href="/mypage/lecture/dashboard">
          <img src="/resources/images/mypage/category/lecture-dashboard.png">
          대시보드
        </a>
      </div>
      <div class="category-selected">
        <a href="/mypage/lecture/management">
          <img src="/resources/images/mypage/category/lecture-management.png">
          관리
        </a>
      </div>
    </div>
    <div id="main" class="window">
      <div>

      </div>
    </div>
  </main>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <script src="/resources/js/common/general.js"></script>
  <script src="/resources/js/mypage/lecture-management.js"></script>
</body>