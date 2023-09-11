<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #snackbar-container {
        position: fixed;
        z-index: 1;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
    }

    .snackbar {
        display: flex;
        flex-direction: column;
        position: relative;
        bottom: 30px;
        border-radius: 10px;
        margin: 20px 0;
        background-color: var(--bg-color-2);
        box-shadow: 0 0 20px 5px rgba(0, 0, 0, 0.3);
        color: #fff;
        text-align: center;
        overflow: hidden;
        transition-duration: 0.5s;
    }

    .snackbar > div:first-of-type {
        display: flex;
        align-items: center;
        height: 70px;
        margin-left: 15px;
        margin-right: 20px;
    }

    .snackbar > div:first-of-type > img {
        height: 40px;
        margin-right: 15px;
    }

    .snackbar > div:last-of-type {
        height: 5px;
    }

    .snackbar.show {
        animation: fadein 1s, fadeout 1s 4s forwards;
    }

    @keyframes fadein {
        from {bottom: 0; opacity: 0;}
        to {bottom: 30px; opacity: 1;}
    }

    @keyframes fadeout {
        from {bottom: 30px; opacity: 1;}
        to {bottom: 0; opacity: 0;}
    }
</style>

<div id="snackbar-container"></div>

<script>
    function snackbar(content, color, icon) {
        const temp = document.createElement("div");
        temp.className = 'snackbar show';
        temp.innerHTML = `<div><img src="` + icon + `">` + content + `</div>
                          <div style="background-color:` + color + `;"></div>`
        document.getElementById('snackbar-container').append(temp);
        setTimeout(() => { document.querySelector('#snackbar-container > .snackbar:first-of-type').remove(); }, 5000);
    };
</script>