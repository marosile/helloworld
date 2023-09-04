
const checkAllId = document.getElementById("checkAll");

checkAllId.addEventListener("click", ()=>{
    
    const checkAll = document.getElementsByName("checkAll");

    checkAll.forEach(check => {
        check.checked = checkAllId.checked;
    })

})