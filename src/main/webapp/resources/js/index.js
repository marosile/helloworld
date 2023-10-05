let boards;

$('.slide').click(function() {
    const no = $('.slide').index($(this))
    if(no == 3) slide(false, 1000);
    else if(no == 1) slide(true, 1000);
});

setInterval(() => {
    slide(false, 3000);
}, 8000);

let timer = 0;

function slide(d, t) {
    if (timer) return;
    if (d) {
        $('#slide-container').prepend($('#slide-container > .slide:last-of-type'));
        $('#slide-bullet-container').append($('#slide-bullet-container > .slide-bullet:first-of-type'));

    } else {
        $('#slide-container').append($('#slide-container > .slide:first-of-type'));
        $('#slide-bullet-container').prepend($('#slide-bullet-container > .slide-bullet:last-of-type'));
    }
    $('.slide').css('transition-duration', t + 'ms');
    document.querySelector('#slide-container').animate(
        {transform: ['translateX(' + (d ? '-' : '') + '620px)', 'translateX(0)']},
        {duration: t, easing: 'ease'}
    );
    timer = setTimeout(() => {
        timer = 0;
    }, t - 200)
}

let timerId;

$(window).scroll(function() {
    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) throttling(loadBoards(3));
});

function throttling(func, timeout = 1000) {
    if (timerId) return;
    timerId = setTimeout(() => {
        func;
        timerId = undefined;
    }, timeout);
}

function loadBoards(count) {
    if (boards.length === 0) {
        snackbar('더 이상 불러올 게시글이 없습니다.', 'rgb(0, 128, 255)', '/resources/images/moon.png')
        return;
    }
    for (let i = 0; i < count; i++) {
        $('#feeds').append(`<div class="feed">
                                <div class="member">
                                    <div class="profile">
                                        <img src="` + boards[0].profileImage + `">
                                    </div>
                                    <div class="info">
                                        <div class="nickname">` + boards[0].memberNickname + `</div>
                                        <div class="relation">일반 회원</div>
                                    </div>
                                    <div class="info-2">
                                        <div class="create-date">` + boards[0].createDate + `</div>
                                        <div class="views">` + boards[0].readCount + ` 읽음</div>
                                    </div>
                                </div>
                                <h3 class="head">` + boards[0].boardTitle + `</h3>
                                <div class="content">` + boards[0].boardContent + `</div>
                                <div class="tags"></div>
                                <div class="interaction">
                                    <div class="like">
                                        <img src="/resources/images/heart-outline.png">
                                        <div>좋아요</div>
                                    </div>
                                    <div class="comment">
                                        <img src="/resources/images/comment.png">
                                        <div>댓글</div>
                                    </div>
                                    <div class="bookmark">
                                        <img src="/resources/images/bookmark-outline.png">
                                        <div>북마크</div>
                                    </div>
                                </div>
                            </div>`);
        if ($('.feed:last-of-type .content').height() >= 300) {
            $('.feed:last-of-type .content').before(`<div class="content-wrapper" onclick="location.href='/trand/detail?boardNo=` + boards[0].boardNo + `'"><div>더보기</div></div>`);
        }
        if (boards[0].tagList !== null) for (let j of boards[0].tagList) {
            $('.feed:last-of-type .tags').append(`<div class="tag">#` + j.tagName + `</div>`);
        }
        boards.splice(0, 1);
    }
}

(() => {
    $.ajax({
        url: '/board/getPopulars',
        type: 'post',
        dataType: 'json',
        success: (result) => {
            let j = 1;
            for (let i of result) {
                $('#popular-boards').append(`<div onclick="location.href='/trand/detail?boardNo=` + i.boardNo +`'">
                                                <div class="number">` + j++ + `</div>
                                                <div class="info">
                                                    <div class="title">` + i.boardTitle + `</div>
                                                    <div class="writer">` + i.memberNickname + `</div>
                                                </div>
                                            </div>`);
            }
        },
        error: (error) => {
            console.log(error);
        }
    });
    if (loginMember === undefined) {
        $.ajax({
            url: '/board/getRecents',
            type: 'post',
            dataType: 'json',
            success: (result) => {
                boards = result;
                loadBoards(3, 1000)
            },
            error: (error) => {
                console.log(error);
            }
        });
        return;
    }
    $.ajax({
        url: '/board/getFeeds',
        type: 'post',
        dataType: 'json',
        data: {'memberId': loginMember.memberId},
        success: (result) => {
            boards = result;
            loadBoards(3, 1000)
        },
        error: (error) => {
            console.log(error);
        }
    });
    if (boards === undefined) {
        $.ajax({
            url: '/board/getRecents',
            type: 'post',
            dataType: 'json',
            success: (result) => {
                boards = result;
                loadBoards(3, 1000)
            },
            error: (error) => {
                console.log(error);
            }
        });
        return;
    }
})()