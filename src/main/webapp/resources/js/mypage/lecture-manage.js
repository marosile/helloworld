$.ajax({
    url: '/lecture/getLecturesByMember',
    type: 'post',
    data: {'memberId': loginMember.memberId},
    dataType: 'json',
    success: (result) => {
        for (let i of result) {

        }
    }, error: (error) => {
        console.log(error);
    }
});