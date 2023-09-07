
// js방식
// const checkAllId = document.getElementById("checkAll");
// const checkAll = document.getElementsByName("checkAll");

// checkAllId.addEventListener("click", ()=>{
    

//     checkAll.forEach(check => {
//         check.checked = checkAllId.checked;

//         check.addEventListener("click", ()=>{
//             if(!check.checked){
//                 checkAllId.checked = check.checked;
//             }
            
//         })


//     })

// });

// jquery 방식이 더 쉽다
$(document).ready(function(){

    $("#checkAll").click(function(){

        if($("#checkAll").is(":checked")){
            $("[name='checkAll']").prop("checked", true);
        }else{
            $("[name='checkAll']").prop("checked", false);
        }

    });

    // 한개라도 체크박스 풀리면 풀리고 모두 체크가 되면 모두 동의까지 체크되게 만들어줌    
    $("[name='checkAll']").click(function(){

        var total = $("[name='checkAll']").length;
        var checked = $("[name='checkAll']:checked").length;
        // console.log(total);
        // console.log(checked);

        if(total == checked){
            $("#checkAll").prop("checked", true);
        }else{
            $("#checkAll").prop("checked", false);
        }
        
    });

})