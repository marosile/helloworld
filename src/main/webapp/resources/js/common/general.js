applyTheme(true);

document.getElementById("theme-switch").addEventListener("click",() => {
    if (localStorage.getItem("theme") == "dark") localStorage.setItem("theme", "light");
    else localStorage.setItem("theme", "dark");
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