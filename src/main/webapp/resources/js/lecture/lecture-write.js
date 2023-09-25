(() => {
    $(document).ready(function () {
        $('#summernote').summernote({
            width: 836,
            height: 400,
            focus: true,
            lang: "ko-KR",
            disableResizeEditor: true,
            placeholder: '내용을 입력해 주세요.',
            theme: 'darkly'
        });
    });

    const input = $('#lecture-tag');
    $.ajax({
        type: 'post',
        url: '/tag/list',
        dataType: 'json',
        success: function (data) {
            let tagList = $.map(data, function (item) {
                chosung = "";
                Hangul.d(item, true).forEach(function (strItem, index) {
                    if (strItem[0] != " ") chosung += strItem[0];
                });
                return {
                    label: chosung + "|" + item,
                    value: item,
                    chosung: chosung
                }
            });
            input.autocomplete({
                source: tagList,
                select: function (event, ui) { console.log(ui.item.label + " 선택 완료"); },
                focus: function (event, ui) { return false;}
            }).autocomplete("instance")._renderItem = function (ul, item) { return $("<li>").append("<div>" + item.value + "</div>").appendTo(ul); }
        }
    });
    input.on("keyup", function () {	//검색창에 뭔가가 입력될 때마다
        value = input.val();	//입력된 값 저장
        input.autocomplete("search", Hangul.disassemble(value).join("").replace(" ", ""));	//자모 분리후 띄어쓰기 삭제
    });
})()

function loadImage(input) {
    const file = input.files[0];
    console.log(file);
    const reader = new FileReader();
    reader.onload = e => {
        document.querySelector('#thumbnail > label > img').src = e.target.result;
    };
    reader.readAsDataURL(file);
    console.log();
}

$('#lecture-tag').keydown(function() {
    console.log(event.keyCode);
    if (event.keyCode === 13) {
        event.preventDefault();
        const val = $(this).val().replace(' ', '&nbsp;');
        if (!val.length) return;
        $('#tag > div').prepend(`<span onClick="$(this).remove()">#` + val + `&nbsp;×<input type="hidden" name="lectureTags" value="` + val + `"></span>`)
        $(this).val(null);
    } else if (event.keyCode == 8 && !$(this).val().length) $('#tag > div > span:last-of-type').remove();
});