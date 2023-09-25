const clientKey = 'test_ck_DnyRpQWGrNm2y5nZLYeVKwv1M9EN';
const customerKey = 'jWbG1yqmfIh2uiG59pPd7';
const paymentWidget = PaymentWidget(clientKey, customerKey);
// const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS)

const score = 4.7;

const colorThief = new ColorThief();

function getProferTextColor(color) {
    const brightness = 0.299 * color[0] + 0.587 * color[1] + 0.114 * color[2];
    if (brightness > 128) return [30, 30, 30];
    else return [255, 255, 255];
}

(() => {
    let palette = colorThief.getPalette($('#thumbnail')[0], 2);
    let color = [0, 0, 0];
    for (let i = 0; i < palette.length; i++) {
        for (let j = 0; j < palette[i].length; j++) {
            color[j] += palette[i][j];
        }
    }
    let color2 = getProferTextColor(color.map(item => Math.round(item / 3)))
    $('#banner h1,#banner p,#banner span,#banner a').css('color', 'rgb(' + color2 + ')');
    $('#lecture-tag > a').css('backgroundColor', 'rgba(' + color2 + ', 0.2)');
    $('#lecturer-name').css('color', 'rgb(' + color2 + ')')
    $('#banner-background').css('background', 'linear-gradient(120deg, rgb(' + palette[0] + '), rgb(' + palette[1] + '))');

    $('#lecture-rating-score').text('(' + score + ')');
    $('#star-filled').css('width', score * 20 + 'px');

    $(document).ready(() => {
        paymentWidget.renderPaymentMethods(
            '#payment-method',
            { value: lecture.lecturePrice, currency: 'KRW', country: 'KR' },
            { variantKey: 'DEFAULT' }
        );
        paymentWidget.renderAgreement('#agreement')
    });
})();

window.addEventListener("scroll", function(e) {
    const promotion = $('#promotion');
    const thumbnail = $('#thumbnail');
    const button = $('#pay > button');
    if (getScrollY() <= 0 && !preventScroll()) {
        promotion.css({'box-shadow' : '', 'border' : '', 'border-radius' : ''});
        thumbnail.css({'width' : '', 'height' : ''});
        button.css('font-size', '');
    }
    else {
        promotion.css({'box-shadow' : '0 0 20px 10px rgba(0, 0, 0, 0.05)', 'border' : '1px solid var(--divider)', 'border-radius' : '10px'});
        thumbnail.css({'width' : '240px', 'height' : '150px'});
        button.css('font-size', '16px');
    }
});

function addToCart() {
    snackbar('장바구니에 담겼습니다.', 'rgb(20, 220, 80)', '/resources/images/shopping-cart.png');
}

let isInPurchase = false;

function purchase() {
    if (isInPurchase) {
        isInPurchase = false;
        $('#payment').css('display', 'none');
        preventScroll(false);
        switchOverlay(false);
    } else {
        isInPurchase = true;
        $('#payment').css('display', 'block');
        preventScroll(true);
        switchOverlay(true);
    }
}

function requestPurchase() {
    if (loginMember === undefined) {

        return;
    }
    paymentWidget.requestPayment({
        orderId: 'AD8aZDpbzXs4EQa-UkIX6',
        orderName: lecture.lectureTitle,
        successUrl: location.href + "?lectureNo",
        failUrl: location.origin + "/fail",
        customerEmail: loginMember.memberEmail,
        customerName: loginMember.memberNick,
    });
}