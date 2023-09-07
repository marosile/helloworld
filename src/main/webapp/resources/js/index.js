let slideCount = 0;

// setInterval(() => {
//     slide(8000);
// }, 8000);

$('.slide').click(function() {
    const no = $('.slide').index($(this))
    if(no == 3) slide(false, 3000);
    else if(no == 1) slide(true, 3000);
})

function slide(d, t) {
    if (d) $('#slide-container').prepend($('#slide-container > .slide:last-of-type'));
    else $('#slide-container').append($('#slide-container > .slide:first-of-type'));
    $('.slide').css('transition-duration', t + 'ms');
    document.querySelector('#slide-container').animate(
        {transform: ['translateX(' + (d ? '-' : '') + '620px)', 'translateX(0)']},
        {duration: t, easing: 'ease'}
    );
}