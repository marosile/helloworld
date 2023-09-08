const box = document.getElementsByClassName("box")

for (let i = 0; i < box.length; i++) {
    box[i].addEventListener("click", () => {
     
      location.href = "/admin/Instructor/detail";

    });
  }

  const recruit = document.getElementById("recruit")

  recruit.addEventListener("click", () => {

    location.href = "/admin/recruitOfficer";

  })