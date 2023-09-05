$('[href=\'/' + location.pathname.split('/')[1] + '\']').css({'border-top' : '3px solid transparent',
                                                              'border-bottom' : '3px solid rgb(0, 128, 255)',
                                                              'color' : 'var(--text-color-1)'});

$('#header-category > a').hover(function() {
    switch ($(this).text()) {
        case '커뮤니티':
            break;
        case '채용':
            break;
        case '강의':
            break;
        case '스터디':
            break;
    }
});