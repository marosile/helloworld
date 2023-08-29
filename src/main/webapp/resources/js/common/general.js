applyTheme();

document.getElementById("theme").addEventListener("click",() => {
    if (localStorage.getItem("theme") == "dark") localStorage.setItem("theme", "light");
    else localStorage.setItem("theme", "dark");
    applyTheme();
})

function applyTheme() {
    if (localStorage.getItem("theme") == "dark") {
        document.documentElement.classList.add("dark");
    } else if (localStorage.getItem("theme") == "light") {
        document.documentElement.classList.remove("dark");
    } else if (window.matchMedia("(prefers-color-scheme: dark)").matches) {
        localStorage.setItem("theme", "dark");
        document.documentElement.classList.add("dark");
    }
    document.body.style.display = "block";
    setTimeout(() => {
        document.body.style.transitionDuration = "0.8s";
    }, 1000);
}