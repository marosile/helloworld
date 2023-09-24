// 현재 표시 중인 채용공고 인덱스를 추적
let currentJobIndex = 1;

// 다음 버튼 클릭 이벤트 핸들러
for (let i = 1; i <= 6; i++) {
    document.getElementById(`button${i}`).addEventListener("click", (function(index) {
      return function() {
       
        if (index == 1) { // 1번째 버튼 누를 때 부터 divContainer 클래스 제거
            
            if(loginMember == ''){
                //snackbar('로그인 후 이용해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
                alert("로그인해줘");
                return;
            }
      
            document.getElementById("divContainer").classList.remove("job-postings-container");
        }

        // 현재 표시 중인 DIV에 active 클래스 제거
        document.getElementById(`job-posting-${currentJobIndex}`).classList.remove("active");
  
        // 다음 채용공고로 이동
        currentJobIndex++;
  
        // 다음 채용공고에 active 클래스 추가
        document.getElementById(`job-posting-${currentJobIndex}`).classList.add("active");
  
      }
    })(i));
  }

////////////////////////////////////////////////////////////////////////////////////////////

// 테스트들의 모든 값 가져오기


// test1
const jobChoice1 = document.getElementById("jobChoice1");
const jobChoice2 = document.getElementById("jobChoice2");

var question1 = "";

// 선택지 클릭 이벤트 핸들러
document.getElementById("jobChoice1").addEventListener("click", function() {
  question1 = "프론트엔드 개발자";
  // 선택한 값으로 무언가를 하려면 이 부분에 로직을 추가합니다.
});

document.getElementById("jobChoice2").addEventListener("click", function() {
  question1 = "백엔드 개발자";
  // 선택한 값으로 무언가를 하려면 이 부분에 로직을 추가합니다.
});


// test2

var question2 = ""; // 전역 변수로 선언

// test2
var slider = document.getElementById("slider");

// 가장 가까운 5의 배수로 조정
slider.addEventListener("input", function() {

    // 선택한 원래 값 10진수 정수로 변환
    question2 = parseInt(this.value, 10);
    
    this.value = question2;
    console.log(question2);
});

console.log(question2);

//test3

var question3= "";

// 선택지 클릭 이벤트 핸들러
document.getElementById("salaryChoice1").addEventListener("click", function() {
    question3= "2700";
});

document.getElementById("salaryChoice2").addEventListener("click", function() {
    question3= "3000";
});

document.getElementById("salaryChoice3").addEventListener("click", function() {
    question3= "3500";
});

document.getElementById("salaryChoice4").addEventListener("click", function() {
    question3= "4000";
});

document.getElementById("salaryChoice5").addEventListener("click", function() {
    question3= "5000";
});

document.getElementById("salaryChoice6").addEventListener("click", function() {
    question3= "7000";
});

// test4

var question4 = "";

document.getElementById("workConditionsChoice1").addEventListener("click", function() {
    question4 = "풀 재택";
});

document.getElementById("workConditionsChoice2").addEventListener("click", function() {
    question4 = "사무실 출근";
});

document.getElementById("workConditionsChoice3").addEventListener("click", function() {
    question4 = "하이브리드";
});




var question5 = "";

document.getElementById("regionChoice1").addEventListener("click", function() {
    question5 = "서울 전체";
});

document.getElementById("regionChoice2").addEventListener("click", function() {
    question5 = "서울 종로";
});

document.getElementById("regionChoice3").addEventListener("click", function() {
    question5 = "서울 구로";
});

document.getElementById("regionChoice4").addEventListener("click", function() {
    question5 = "서울 성동";
});

document.getElementById("regionChoice5").addEventListener("click", function() {
    question5 = "판교";
});




// test6

var question6 = "";

document.getElementById("regionChoice1").addEventListener("click", function() {
    question6 = "서울 전체";
});

var selectedTechStack = []; // 선택한 기술 스택을 저장할 배열

// 각 기술 스택 항목을 클릭할 때 실행할 함수
function handleTechStackClick(tech) {
    var index = selectedTechStack.indexOf(tech);

    if (index === -1) {
        // 선택되지 않았던 경우, 배열에 추가
        selectedTechStack.push(tech);
    } else {
        // 이미 선택된 경우, 배열에서 제거
        selectedTechStack.splice(index, 1);
    }
}

// 기술 스택 항목을 클릭할 때 이벤트 리스너 추가
document.getElementById("stackChoice1").addEventListener("click", function() {
    handleTechStackClick("JAVA");
});

document.getElementById("stackChoice2").addEventListener("click", function() {
    handleTechStackClick("JavaScript");
});

document.getElementById("stackChoice1").addEventListener("click", function() {
    handleTechStackClick("Spring");
});

document.getElementById("stackChoice2").addEventListener("click", function() {
    handleTechStackClick("Oracle");
});

document.getElementById("stackChoice1").addEventListener("click", function() {
    handleTechStackClick("Visual studio Code");
});

document.getElementById("stackChoice2").addEventListener("click", function() {
    handleTechStackClick("JQuery");
});


document.getElementById("button7").addEventListener("click", () => {
    // 폼 요소 생성
    var form = document.createElement("form");
    form.action = "/recruit2/testResult"; // 다음 페이지 URL 설정
    form.method = "POST"; // POST 또는 GET 방식 설정 (원하는 방식으로 설정)

    // 선택된 값을 폼 요소에 추가

    // 질문 변수와 값들을 배열로 관리
    var questionVariables = ["question1", "question2", "question3", "question4", "question5"];
    var questionValues = [question1, question2, question3, question4, question5];

    // 반복문을 사용하여 코드 동적 생성
    for (var i = 0; i < questionVariables.length; i++) {
        var input = document.createElement("input");
        input.type = "hidden"; // 숨겨진 입력 필드
        input.name = questionVariables[i]; // 서버에서 사용할 이름 설정
        input.value = questionValues[i]; // 선택된 값 설정
        form.appendChild(input);
    }

    // 기술 스택 배열을 쉼표로 구분하여 합침
    var techStackValue = selectedTechStack.join(",");

    // 기술 스택 값을 폼 요소에 추가
    var inputTechStack = document.createElement("input");
    inputTechStack.type = "hidden"; // 숨겨진 입력 필드
    inputTechStack.name = "question6"; // 서버에서 사용할 이름 설정
    inputTechStack.value = techStackValue; // 기술 스택 값 설정
    form.appendChild(inputTechStack);

    // 폼을 문서에 추가하고 제출
    document.body.appendChild(form);
    form.submit();
});