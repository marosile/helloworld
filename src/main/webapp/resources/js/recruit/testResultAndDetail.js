var mySwiper = new Swiper('.swiper-container', {
  slidesPerView: 1,
  spaceBetween: 10,
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
});

var myTagListArray = myTagListString.split(", ");

$(document).ready(function() {
  // 각 요구 태그에 대해 처리
  $("#jobRequirements .notMySkill").each(function() {
      var tagText = $(this).text().trim().toLowerCase(); // 태그 텍스트를 소문자로 변환하여 가져옵니다.

      // 내 태그 목록도 모두 소문자로 변환하여 비교합니다.
      var myTagListLowerCase = myTagListArray.map(function(tag) {
          return tag.toLowerCase();
      });

      if (myTagListLowerCase.includes(tagText)) {
          // 내 태그 목록에 포함된 경우
          $(this).removeClass("notMySkill").addClass("mySkill");
      }
  });
});