applyTheme(true);

document.getElementById("theme-switch").addEventListener("click", () => {
    if (localStorage.getItem("theme") == "dark") {
        localStorage.setItem("theme", "light");
        snackbar('라이트 테마로 설정되었습니다.', 'rgb(0, 128, 255)', '/resources/images/sun.png')
    } else {
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
        body.css({
            "position": "fixed", "width": "100%", "top": "-" + scrollY + "px"
        });
        return;
    }
    body.css({
        "position": "", "width": "", "top": ""
    });
    window.scrollTo(0, scrollY);
    scrollY = null;
}

function switchOverlay(b) {
    $('#modal-overlay').css('display', b ? 'block' : 'none')
}

function getContextPath() {
    var hostIndex = location.href.indexOf(location.host) + location.host.length;
    return location.href.substring(hostIndex, location.href.indexOf("/", hostIndex + 1));
}

function snackbar(content, color, icon) {
    const temp = document.createElement("div");
    temp.className = 'snackbar';
    temp.innerHTML = `<div><img src="` + icon + `">` + content + `</div>
                          <div style="background-color:` + color + `;"></div>`
    document.getElementById('snackbar-container').append(temp);
    setTimeout(() => {
        document.querySelector('#snackbar-container > .snackbar:first-of-type').remove();
    }, 5000);
}

function generateOrderId(callback) {
    let result;
    $.ajax({
        url: '/purchase/generateOrderId', type: 'post', async: false, success: (response) => {
            result = response
        }, error: (error) => {
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
    $('#community-nav-1 > div').on('click', function () {
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
                                $('#social-followers').append(`<div onclick="openChatRoom(member.memberId)" class="social-member">
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
                if ($('#chat-rooms').html() === '<h2>채팅</h2>') {
                    $.ajax({
                        url: '/chat/getChatRooms',
                        type: 'post',
                        dataType: 'json',
                        data: {'memberId': loginMember.memberId},
                        success: (result) => {
                            console.log(result);
                            for (let i of result) {
                                $('#chat-rooms').append(`<div onclick="enterChatRoom(` + i.chatRoomNo + `)" class="chat-room">
                                    <div class="chat-room-thumbnail">
                                        <img src="` + i.participants[0].profileImg + `">
                                    </div>
                                    <div class="chat-room-content">
                                        <h3 class="chat-room-title">` + i.participants
                                    .filter(function (participant) {
                                        return participant['memberNick'] !== loginMember.memberNick;
                                    })
                                    .map(function (participant) {
                                        return participant['memberNick'];
                                    }).join(', ') + `</h3>
                                        <p class="chat-room-message"></p>
                                    </div>
                                </div>`)
                            }
                        },
                        error: (error) => {
                            console.log(error);
                        }
                    });
                }
        }
    })
})()

$('#chat-message-info > img').on('click', () => {
    $('#chat-rooms').css('display', 'block');
    $('#chat-message').css('display', 'none');
});

function enterChatRoom(no) {
    $('#chat-rooms').css('display', 'none');
    $('#chat-message').css('display', 'block');
    $('#chat-message-input').attr('chatRoomNo', no);
    $.ajax({
        url: '/chat/getChatRoom',
        type: 'post',
        dataType: 'json',
        data: { 'chatRoomNo': no, 'memberId': loginMember.memberId },
        success: (result) => {
            $('#chat-message-info > h2').text(result.participants
                .filter(function (participant) {
                    return participant['memberNick'] !== loginMember.memberNick;
                })
                .map(function (participant) {
                    return participant['memberNick'];
                }).join(', '));
            for (let i of result.messages) {
                if (i.memberId === loginMember.memberId) {
                    $('#chat-message-container').append(`<div class="message me">
                                                            <div class="message-profile">
                                                                <img src="` + i.profileImg + `">
                                                            </div>
                                                            <div class="message-content">
                                                                <h5>나</h5>
                                                                <span>` + i.messageContent + `</span>
                                                            </div>
                                                            <p>` + formatTime(unixToDate(i.sendDate)) + `</p>
                                                        </div>`);
                } else {
                    $('#chat-message-container').append(`<div class="message other">
                                                            <div class="message-profile">
                                                                <img src="` + i.profileImg + `">
                                                            </div>
                                                            <div class="message-content">
                                                                <h5>` + i.memberNick + `</h5>
                                                                <span>` + i.messageContent + `</span>
                                                            </div>
                                                            <p>` + formatTime(unixToDate(i.sendDate)) + `</p>
                                                        </div>`);
                }
            }
            $('#chat-message-container').scrollTop($('#chat-message-container').prop('scrollHeight'));
        },
        error: (error) => {
            console.log(error);
        }
    });
}

function openChatRoom(id) {
    $.ajax({
        url: '/chat/getChatRooms',
        type: 'post',
        dataType: 'json',
        data: {'memberId': loginMember.memberId},
        success: (result) => {
            for (let i of result) {
                for (let j of i.participants) {
                    if (j.memberId = id) return;
                }
            }
            addRoom(id);
            return result;
        },
        error: (error) => {
            console.log(error);
        }
    });
}

function addRoom(id) {
    $.ajax({
        url: '/chat/addChatRoom',
        type: 'post',
        dataType: 'json',
        data: JSON.stringify([loginMember.memberId, id]),
        contentType: 'application/json',
        success: (result) => {
            console.log(result);
        },
        error: (error) => {
            console.log(error);
        }
    });
}

$('#chat-message-input').keydown(function () {
    if (event.keyCode === 13) {
        event.preventDefault();
        if (!$(this).val().length) return;
        socket.emit('message', {'chatRoomNo': $(this).attr('chatRoomNo'), 'memberId': loginMember.memberId, 'memberNick': loginMember.memberNick, 'profileImg': loginMember.profileImg, 'messageContent': $(this).val()});
        $('#chat-message-container').append(`<div class="message me">
                                                <div class="message-profile">
                                                    <img src="` + loginMember.profileImg + `">
                                                </div>
                                                <div class="message-content">
                                                    <h5>나</h5>
                                                    <span>` + $(this).val() + `</span>
                                                </div>
                                                <p>` + formatTime(new Date()) + `</p>
                                            </div>`)
        $(this).val(null)
        $('#chat-message-container').scrollTop($('#chat-message-container').prop('scrollHeight'));
    } else if (event.keyCode == 8 && !$(this).val().length) $('#tag > div > span:last-of-type').remove();
});

function formatTime(time) {
    let hours = time.getHours();
    let minutes = time.getMinutes();
    let period = '오전';

    if (hours >= 12) {
        period = '오후';
        if (hours > 12) {
            hours -= 12;
        }
    }

    hours = hours < 10 ? '0' + hours : hours;
    minutes = minutes < 10 ? '0' + minutes : minutes;

    const currentTime = period + ' ' + hours + ':' + minutes;
    return currentTime;
}

function unixToDate(time) {
    return new Date(time);
}