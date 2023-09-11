<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #snackbar-container {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        position: fixed;
        z-index: 1;
        bottom: 30px;
        left: 50%;
        width: 100%;
        transform: translateX(-50%);
    }

    .snackbar {
        display: flex;
        flex-direction: column;
        border-radius: 10px;
        margin-top: -50px;
        margin-bottom: 70px;
        background-color: var(--bg-color-2);
        box-shadow: 0 0 20px 5px rgba(0, 0, 0, 0.3);
        text-align: center;
        overflow: hidden;
        transition-duration: 0.5s;
        animation: fadein 1s, fadeout 1s 4s;
    }

    .snackbar:last-of-type {
        scale: 1.08;
        box-shadow: 0 0 20px 5px rgba(0, 0, 0, 0.2);
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

    @keyframes fadein {
        from {margin-bottom: 0; opacity: 0;}
        to {margin-bottom: 70px; opacity: 1;}
    }

    @keyframes fadeout {
        from {margin-bottom: 70px; opacity: 1;}
        to {margin-bottom: 0; opacity: 0;}
    }
</style>

<div id="snackbar-container"></div>

<script>
    function snackbar(content, color, icon) {
        const temp = document.createElement("div");
        temp.className = 'snackbar';
        temp.innerHTML = `<div><img src="` + icon + `">` + content + `</div>
                          <div style="background-color:` + color + `;"></div>`
        document.getElementById('snackbar-container').append(temp);
        setTimeout(() => { document.querySelector('#snackbar-container > .snackbar:first-of-type').remove(); }, 5000);
    };
</script>