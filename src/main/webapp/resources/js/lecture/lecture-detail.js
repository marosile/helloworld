const score = 4.7;

window.addEventListener("scroll", function(e) {
    const promotion = $('#promotion');
    const thumbnail = $('#thumbnail');
    const button = $('#pay > button');
    if (getScrollY() <= 20 && !preventScroll()) {
        promotion.css({'height' : '440px', 'box-shadow' : '', 'border' : '', 'border-radius' : ''});
        thumbnail.css({'width' : '', 'height' : ''});
        button.css('font-size', '');
    }
    else {
        promotion.css({'height' : '370px', 'box-shadow' : '0 0 20px 10px rgba(0, 0, 0, 0.05)', 'border' : '1px solid var(--divider)', 'border-radius' : '10px'});
        thumbnail.css({'width' : '240px', 'height' : '150px'});
        button.css('font-size', '16px');
    }
});

$('#lecture-rating-score').text('(' + score + ')');
$('#star-filled').css('width', score * 20 + 'px');