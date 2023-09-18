applyTheme(true);

document.getElementById("theme-switch").addEventListener("click",() => {
    if (localStorage.getItem("theme") == "dark") {
        localStorage.setItem("theme", "light");
        snackbar('라이트 테마로 설정되었습니다.', 'rgb(0, 128, 255)', '/resources/images/sun.png')
    }
    else {
        localStorage.setItem("theme", "dark");
        snackbar('다크 테마로 설정되었습니다.', 'rgb(0, 128, 255)', '/resources/images/moon.png')
    }
    applyTheme();
})

function applyTheme(b) {
    if (localStorage.getItem("theme") == "dark") {
        document.documentElement.classList.add("dark");
        if (b) document.getElementById("theme-checkbox").checked = true;
    } else if (localStorage.getItem("theme") == "light") {
        document.documentElement.classList.remove("dark");
    } else if (window.matchMedia("(prefers-color-scheme: dark)").matches) {
        localStorage.setItem("theme", "dark");
        document.documentElement.classList.add("dark");
        if (b) document.getElementById("theme-checkbox").checked = true;
    }
    document.body.style.display = "block";
    setTimeout(() => {
        document.body.style.transitionDuration = "0.5s";
    }, 1000);
}

let scrollY;

function getScrollY() {
    return window.scrollY || document.documentElement.scrollTop;
}

function preventScroll(b) {
    if (typeof b == "undefined") return scrollY ? true : false;
    const body = $("body");
    if (b) {
        scrollY = getScrollY()
        body.css({"position": "fixed",
            "width": "100%",
            "top": "-" + scrollY + "px"});
        return;
    }
    body.css({"position": "",
        "width": "",
        "top": ""});
    window.scrollTo(0, scrollY);
    scrollY = null;
}

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf("/", hostIndex + 1) );
}