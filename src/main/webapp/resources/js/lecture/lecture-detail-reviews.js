$('#write-review-star img').click(function(event) {
    let score = Math.round(Math.abs($(this).offset().left - event.pageX)/10)/2;
    $('#write-review-star-filled').css('width', score * 20 + 'px')
})