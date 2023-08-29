<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/resources/css/common/header.css">

<header>
    <div id="left">
        <img id="logo" src="/resources/images/logo.svg">
        <p id="title">Hello, World!</p>
    </div>
    <div id="right">
        <input id="theme-checkbox" type="checkbox" hidden>
        <label for="theme-checkbox">
            <div id="theme-switch">
                <div id="theme-button">
                    <img id="theme-image">
                </div>
            </div>
        </label>
        <div id="login" class="button">로그인</div>
        <div id="signup" class="button">회원가입</div>
    </div>
</header>

<nav>
</nav>

<script src="/resources/js/common/header.js"></script>
