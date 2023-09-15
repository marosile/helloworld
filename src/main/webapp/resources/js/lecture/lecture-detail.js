const score = 4.7;

const colorThief = new ColorThief();
let palette = colorThief.getPalette($('#thumbnail')[0],3);
$('#banner-background').css('background', 'linear-gradient(120deg, rgb(' + palette[2] + '), rgb(' + palette[1] + '), rgb(' + palette[0] + '))');

window.addEventListener("scroll", function(e) {
    const promotion = $('#promotion');
    const thumbnail = $('#thumbnail');
    const button = $('#pay > button');
    if (getScrollY() <= 0 && !preventScroll()) {
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

$('#store-button').click(() => {
    snackbar('장바구니에 담겼습니다.', 'rgb(20, 220, 80)', '/resources/images/shopping-cart.png')
})