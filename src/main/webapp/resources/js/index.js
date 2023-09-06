let slideCount = 0;

setInterval(() => {
    slide(5000);
}, 5000);

function slide(t, d) {
    if (slideCount++ == 0) {
        $('.slide:nth-of-type(3)').removeAttr('style');
        $('.slide:nth-of-type(4)').css({'scale' : '1.5', 'margin' : '0 160px'});
    } else {
        $('.slide:nth-of-type(4)').removeAttr('style');
        $('.slide:nth-of-type(5)').css({'scale' : '1.5', 'margin' : '0 160px'});
    }
    document.querySelector('#slide-container').animate(
        {transform: ['translateX(0)', 'translateX(' + (d ? '' : '-') + '620px)']},
        {duration: 3000, fill: 'forwards', easing: 'ease'}
    );
    setTimeout(() => {
        $('#slide-container').append($('#slide-container > .slide:first-of-type'));
    }, t);
    
}