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

(() => {
    if (loginMember === undefined) return;
    $.ajax({
        url: '/board/getFeeds',
        type: 'post',
        dataType: 'json',
        data: {'memberId': loginMember.memberId},
        success: (result) => {
            console.log(result);
        },
        error: (error) => {
            console.log(error);
        }
    });
})()