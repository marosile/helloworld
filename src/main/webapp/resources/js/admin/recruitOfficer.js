const box = document.getElementsByClassName("box")

for (let i = 0; i < box.length; i++) {
    box[i].addEventListener("click", () => {
     
      location.href = "/admin/recruitOfficer/detail";

    });
  }