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
    let palette = colorThief.getPalette($('#thumbnail')[0],3);
    let color = [0, 0, 0];
    for(let i = 0; i < palette.length; i++) {
        for(let j = 0; j < palette[i].length; j++) {
            color[j] += palette[i][j];
        }
    }
    $('#banner h1,#banner p,#banner span,#banner a').css('color', 'rgb(' + getProferTextColor(color.map(item => Math.round(item/3))) + ')');
    $('#banner-background').css('background', 'linear-gradient(120deg, rgb(' + palette[2] + '), rgb(' + palette[1] + '), rgb(' + palette[0] + '))');
})();

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

$('#store-button').click(() => { snackbar('장바구니에 담겼습니다.', 'rgb(20, 220, 80)', '/resources/images/shopping-cart.png') });
$('#pay-button').click(() => {
    $('#payment-method').css('display', 'block');
    const paymentMethodWidget = paymentWidget.renderPaymentMethods(
        '#payment-method',
        { value: 10000, currency: 'KRW', country: 'KR' },
        { variantKey: 'widgetA' }
    );
    //const selectedPaymentMethod = paymentMethodWidget.getSelectedPaymentMethod();
    // paymentWidget.requestPayment({
    //     orderId: 'AD8aZDpbzXs4EQa-UkIX6',
    //     orderName: '토스 티셔츠 외 2건',
    //     successUrl: 'http://localhost:8080/success',
    //     failUrl: 'http://localhost:8080/fail',
    //     customerEmail: 'customer123@gmail.com',
    //     customerName: '김토스',
    // })
});