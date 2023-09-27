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

function switchOverlay(b) {
    $('#modal-overlay').css('display', b ? 'block' : 'none')
}

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf("/", hostIndex + 1) );
}

function snackbar(content, color, icon) {
    const temp = document.createElement("div");
    temp.className = 'snackbar';
    temp.innerHTML = `<div><img src="` + icon + `">` + content + `</div>
                          <div style="background-color:` + color + `;"></div>`
    document.getElementById('snackbar-container').append(temp);
    setTimeout(() => { document.querySelector('#snackbar-container > .snackbar:first-of-type').remove(); }, 5000);
}

function generateOrderId(callback) {
    let result;
    $.ajax({
        url: '/purchase/generateOrderId',
        type: 'post',
        async: false,
        success: (response) => {
            result = response
        },
        error: (error) => {
            console.log(error);
        }
    });
    return result;
}

function confirmAlert() {
    $('#alert').css('display', 'none');
    preventScroll(false);
    switchOverlay(false);
}

const wait = (callback, delay) => {
    setTimeout(callback, delay)
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function communityToggle() {
    if ($('#community').attr('toggle') === 'on') {
        if ($('#community').css('right') === '10px') {
            $('.community-selected').click();
            await sleep(500);
        }
        $('#community-nav-1 > img').attr('src', '/resources/images/up-arrow.png');
        $('#community').attr('toggle', 'off')
        $('#community').css('bottom', '');
        return;
    }
    $('#community-nav-1 > img').attr('src', '/resources/images/down-arrow.png');
    $('#community').attr('toggle', 'on')
    $('#community').css('bottom', '10px');
}

(() => {
    $('#community-nav-1 > div').on('click', function() {
        if ($(this).hasClass('community-selected')) {
            $(this).removeClass('community-selected');
            $('#community').css('right', '');
            $('#community-content > div').css('display', 'none');
            return;
        }
        $('#community-nav-1 > div').removeClass('community-selected');
        $(this).addClass('community-selected');
        $('#community').css('right', '10px');
        let menu = $(this).attr('id').replace('community-', '');
        $('#' + menu).css('display', 'block');
        $('#community-content > div:not(#' + menu + ')').css('display', 'none');
        switch (menu) {
            case 'social':
                if ($('#social-followers').html() === '') {
                    $.ajax({
                        url: '/member/getFollower',
                        data: {'memberId': loginMember.memberId},
                        type: 'post',
                        dataType: 'json',
                        success: (result) => {
                            for (member of result) {
                                $('#social-followers').append(`<div class="social-member">
                                                                    <img class="social-member-thumbnail" src="` + member.profileImg + `">
                                                                    <p class="social-member-nick">` + member.memberNick + `</p>
                                                               </div>`);
                            }
                        },
                        error: (error) => {
                            console.log(error);
                        }
                    });
                }
                break;
            case 'chat':
        }
    })
})()