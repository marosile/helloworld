$('.card').click(function() {
    const lectureNo = $(this).attr('lecture-no');
    if (lectureNo !== undefined) location.href = location.pathname + '/' + lectureNo;
    else snackbar('해당 강의가 존재하지 않습니다.', 'rgb(255, 200, 50)', '/resources/images/warning.png')
});

(() => {
    $.ajax({
        url: '/lecture/populars',
        type: 'post',
        dataType: 'json',
        success: (result) => {
            for(let i = 0; i < result.length; i++) {
                $('#popular-lecture-container [key=' + i + ']').attr('lecture-no', result[i].lectureNo);
                $('#popular-lecture-container [key=' + i + '] .card-thumbnail').css({'background' : 'url(' + result[i].lectureThumbnail + ')', 'background-size' : 'cover'});
                $('#popular-lecture-container [key=' + i + '] .card-title').text(result[i].lectureTitle);
                $('#popular-lecture-container [key=' + i + '] .card-lecturer-icon').attr('src', result[i].lecturer.profileImg);
                $('#popular-lecture-container [key=' + i + '] .card-lecturer').text(result[i].lecturer.memberNick);
                const price = result[i].lecturePrice;
                $('#popular-lecture-container [key=' + i + '] .card-price').text(price > 0 ? '₩ ' + price.toLocaleString('ko-KR') : '무료');
                let count = 0;
                for (let j of result[i].lectureTags) {
                    if (count++ == 3) break;
                    $('#popular-lecture-container [key=' + i + '] .card-tags').append('<a>#' + j + '</a>');
                }
            }
        },
        error: (error) => {
            console.log('에러 발생');
            console.log(error);
        }
    });
})();