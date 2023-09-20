$('.card').click(function() {
    const lectureNo = $(this).attr('lecture-no');
    if (lectureNo !== undefined) location.href = location.pathname + '/' + lectureNo;
    else snackbar('해당 강의가 존재하지 않습니다.', 'rgb(255, 200, 50)', '/resources/images/warning.png')
});

(() => {
    $.ajax({
        url: '/lecture/populars',
        type: 'POST',
        dataType: 'json',
        success: (result) => {
            for(let i = 0; i < result.length; i++) {
                $('#popular-lecture-container [key=' + i + ']').attr('lecture-no', result[i].lectureNo);
                $('#popular-lecture-container [key=' + i + '] .card-thumbnail').css({'background' : 'url(' + result[i].lectureThumbnail + ')', 'background-size' : 'cover'});
                $('#popular-lecture-container [key=' + i + '] .card-title').text(result[i].lectureTitle);
                for (let j of result[i].lectureTags) {
                    $('#popular-lecture-container [key=' + i + '] .card-tags').append('<a>' + j + '</a>');
                }
            }
        },
        error: (error) => {
            console.log('에러 발생');
            console.log(error);
        }
    });
})();