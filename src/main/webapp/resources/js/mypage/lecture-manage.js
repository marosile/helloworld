$.ajax({
    url: '/lecture/getLecturesByMember',
    type: 'post',
    data: {'memberId': loginMember.memberId},
    dataType: 'json',
    success: (result) => {
        for (let i of result) {
            $('#lecture-container').append(`<div class="lecture">
                                              <div class="lecture-thumbnail">
                                                <img src="` + i.lectureThumbnail + `">
                                              </div>
                                              <div class="lecture-title">` + i.lectureTitle + `</div>
                                            </div>`)
        }
    }, error: (error) => {
        console.log(error);
    }
});