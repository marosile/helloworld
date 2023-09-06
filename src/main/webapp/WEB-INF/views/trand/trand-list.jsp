<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>트렌드 상세</title>

   <link rel="stylesheet" href="/resources/css/common/general.css">
   <link rel="stylesheet" href="/resources/css/trand/trand-list.css">

   <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

   <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

</head>
<body>
    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

   <main id="body-area">
        <div id="main-area">
            <div id="left-area">
            
                <p id="main-title">HELLO, WORLD! 트렌드 🤍</p>

                <p id="sub-title">한 달 동안 반응이 가장 좋았던 게시물을 만나보세요!</p>

                <div id="tag-area">
                    <div><i class="fa-solid fa-calendar"></i> 개발</div>
                    <div><i class="fa-solid fa-arrow-pointer"></i> 디자인</div>
                    <div><i class="fa-solid fa-tag"></i> 마케팅</div>
                    <div><i class="fa-solid fa-building"></i> 비즈니스</div>
                </div>

            </div>
            <div id="right-area">
                <div class="row-area">
                    <div class="row1-1">
                        <div class="number" style='color:#2188ff'>1</div>
                        <div class="profile"><img src="/resources/images/trand/userSample.jpg" id="userProfile"></div>
                        <div class="name-area">
                            <div class="name">조서희</div>
                            <div class="nickname">백엔드 개발자</div>
                        </div>
                    </div>
                    <div class="row1-2">
                        <div class="text-area">
                            <div class="title">🕊️ 시니어 개발자가 되기 위한 백엔드 프로젝트 아이디어 | </div>
                            <div class="content">백엔드 프로그래밍 기술을 향상시키고 시니어 수준의 개발자가 되는 데 도움이 되는 흥미로운 프로젝트 아이디어를 살펴봅시다.</div>
                        </div>
                        <div class="picture"><img src="/resources/images/trand/sample.jpg" id="pic"></div>
                    </div>
                    <div class="row1-3">
                        <div class="heart"><i class="fa-solid fa-heart"></i>  65</div>
                        <div class="bookmark"><i class="fa-regular fa-bookmark"></i>  30</div>
                    </div>
                </div>

                <div class="row-area">
                    <div class="row1-1">
                        <div class="number" style='color:#1261bb91'>2</div>
                        <div class="profile"><img src="/resources/images/trand/userSample.jpg" id="userProfile"></div>
                        <div class="name-area">
                            <div class="name">조서희</div>
                            <div class="nickname">백엔드 개발자</div>
                        </div>
                    </div>
                    <div class="row1-2">
                        <div class="text-area">
                            <div class="title">🕊️ 시니어 개발자가 되기 위한 백엔드 프로젝트 아이디어</div>
                            <div class="content">백엔드 프로그래밍 기술을 향상시키고 시니어 수준의 개발자가 되는 데 도움이 되는 흥미로운 프로젝트 아이디어를 살펴봅시다.</div>
                        </div>
                        <div class="picture"><img src="/resources/images/trand/sample.jpg" id="pic"></div>
                    </div>
                    <div class="row1-3">
                        <div class="heart"><i class="fa-solid fa-heart"></i>  65</div>
                        <div class="bookmark"><i class="fa-regular fa-bookmark"></i>  30</div>
                    </div>
                </div>


                <div class="row-area">
                    <div class="row1-1">
                        <div class="number" style='color:#08366bc5'>3</div>
                        <div class="profile"><img src="/resources/images/trand/userSample.jpg" id="userProfile"></div>
                        <div class="name-area">
                            <div class="name">조서희</div>
                            <div class="nickname">백엔드 개발자</div>
                        </div>
                    </div>
                    <div class="row1-2">
                        <div class="text-area">
                            <div class="title">🕊️ 시니어 개발자가 되기 위한 백엔드 프로젝트 아이디어</div>
                            <div class="content">백엔드 프로그래밍 기술을 향상시키고 시니어 수준의 개발자가 되는 데 도움이 되는 흥미로운 프로젝트 아이디어를 살펴봅시다.</div>
                        </div>
                        <div class="picture"><img src="/resources/images/trand/sample.jpg" id="pic"></div>
                    </div>
                    <div class="row1-3">
                        <div class="heart"><i class="fa-solid fa-heart"></i>  65</div>
                        <div class="bookmark"><i class="fa-regular fa-bookmark"></i>  30</div>
                    </div>
                </div>


                <div class="row-area">
                    <div class="row1-1">
                        <div class="number">4</div>
                        <div class="profile"><img src="/resources/images/trand/userSample.jpg" id="userProfile"></div>
                        <div class="name-area">
                            <div class="name">조서희</div>
                            <div class="nickname">백엔드 개발자</div>
                        </div>
                    </div>
                    <div class="row1-2">
                        <div class="text-area">
                            <div class="title">🕊️ 시니어 개발자가 되기 위한 백엔드 프로젝트 아이디어</div>
                            <div class="content">백엔드 프로그래밍 기술을 향상시키고 시니어 수준의 개발자가 되는 데 도움이 되는 흥미로운 프로젝트 아이디어를 살펴봅시다.</div>
                        </div>
                        <div class="picture"><img src="/resources/images/trand/sample.jpg" id="pic"></div>
                    </div>
                    <div class="row1-3">
                        <div class="heart"><i class="fa-solid fa-heart"></i>  65</div>
                        <div class="bookmark"><i class="fa-regular fa-bookmark"></i>  30</div>
                    </div>
                </div>


                <div class="row-area">
                    <div class="row1-1">
                        <div class="number">5</div>
                        <div class="profile"><img src="/resources/images/trand/userSample.jpg" id="userProfile"></div>
                        <div class="name-area">
                            <div class="name">조서희</div>
                            <div class="nickname">백엔드 개발자</div>
                        </div>
                    </div>
                    <div class="row1-2">
                        <div class="text-area">
                            <div class="title">🕊️ 시니어 개발자가 되기 위한 백엔드 프로젝트 아이디어</div>
                            <div class="content">백엔드 프로그래밍 기술을 향상시키고 시니어 수준의 개발자가 되는 데 도움이 되는 흥미로운 프로젝트 아이디어를 살펴봅시다.</div>
                        </div>
                        <div class="picture"><img src="/resources/images/trand/sample.jpg" id="pic"></div>
                    </div>
                    <div class="row1-3">
                        <div class="heart"><i class="fa-solid fa-heart"></i>  65</div>
                        <div class="bookmark"><i class="fa-regular fa-bookmark"></i>  30</div>
                    </div>
                </div>


                <div class="row-area">
                    <div class="row1-1">
                        <div class="number">6</div>
                        <div class="profile"><img src="/resources/images/trand/userSample.jpg" id="userProfile"></div>
                        <div class="name-area">
                            <div class="name">조서희</div>
                            <div class="nickname">백엔드 개발자</div>
                        </div>
                    </div>
                    <div class="row1-2">
                        <div class="text-area">
                            <div class="title">🕊️ 시니어 개발자가 되기 위한 백엔드 프로젝트 아이디어</div>
                            <div class="content">백엔드 프로그래밍 기술을 향상시키고 시니어 수준의 개발자가 되는 데 도움이 되는 흥미로운 프로젝트 아이디어를 살펴봅시다.</div>
                        </div>
                        <div class="picture"><img src="/resources/images/trand/sample.jpg" id="pic"></div>
                    </div>
                    <div class="row1-3">
                        <div class="heart"><i class="fa-solid fa-heart"></i>  65</div>
                        <div class="bookmark"><i class="fa-regular fa-bookmark"></i>  30</div>
                    </div>
                </div>

                <div class="row-area">
                    <div class="row1-1">
                        <div class="number">7</div>
                        <div class="profile"><img src="/resources/images/trand/userSample.jpg" id="userProfile"></div>
                        <div class="name-area">
                            <div class="name">조서희</div>
                            <div class="nickname">백엔드 개발자</div>
                        </div>
                    </div>
                    <div class="row1-2">
                        <div class="text-area">
                            <div class="title">🕊️ 시니어 개발자가 되기 위한 백엔드 프로젝트 아이디어</div>
                            <div class="content">백엔드 프로그래밍 기술을 향상시키고 시니어 수준의 개발자가 되는 데 도움이 되는 흥미로운 프로젝트 아이디어를 살펴봅시다.</div>
                        </div>
                        <div class="picture"><img src="/resources/images/trand/sample.jpg" id="pic"></div>
                    </div>
                    <div class="row1-3">
                        <div class="heart"><i class="fa-solid fa-heart"></i>  65</div>
                        <div class="bookmark"><i class="fa-regular fa-bookmark"></i>  30</div>
                    </div>
                </div>

                         <div class="row-area">
                    <div class="row1-1">
                        <div class="number">8</div>
                        <div class="profile"><img src="/resources/images/trand/userSample.jpg" id="userProfile"></div>
                        <div class="name-area">
                            <div class="name">조서희</div>
                            <div class="nickname">백엔드 개발자</div>
                        </div>
                    </div>
                    <div class="row1-2">
                        <div class="text-area">
                            <div class="title">🕊️ 시니어 개발자가 되기 위한 백엔드 프로젝트 아이디어</div>
                            <div class="content">백엔드 프로그래밍 기술을 향상시키고 시니어 수준의 개발자가 되는 데 도움이 되는 흥미로운 프로젝트 아이디어를 살펴봅시다.</div>
                        </div>
                        <div class="picture"><img src="/resources/images/trand/sample.jpg" id="pic"></div>
                    </div>
                    <div class="row1-3">
                        <div class="heart"><i class="fa-solid fa-heart"></i>  65</div>
                        <div class="bookmark"><i class="fa-regular fa-bookmark"></i>  30</div>
                    </div>
                </div>

                         <div class="row-area">
                    <div class="row1-1">
                        <div class="number">9</div>
                        <div class="profile"><img src="/resources/images/trand/userSample.jpg" id="userProfile"></div>
                        <div class="name-area">
                            <div class="name">조서희</div>
                            <div class="nickname">백엔드 개발자</div>
                        </div>
                    </div>
                    <div class="row1-2">
                        <div class="text-area">
                            <div class="title">🕊️ 시니어 개발자가 되기 위한 백엔드 프로젝트 아이디어</div>
                            <div class="content">백엔드 프로그래밍 기술을 향상시키고 시니어 수준의 개발자가 되는 데 도움이 되는 흥미로운 프로젝트 아이디어를 살펴봅시다.</div>
                        </div>
                        <div class="picture"><img src="/resources/images/trand/sample.jpg" id="pic"></div>
                    </div>
                    <div class="row1-3">
                        <div class="heart"><i class="fa-solid fa-heart"></i>  65</div>
                        <div class="bookmark"><i class="fa-regular fa-bookmark"></i>  30</div>
                    </div>
                </div>

                         <div class="row-area">
                    <div class="row1-1">
                        <div class="number">10</div>
                        <div class="profile"><img src="/resources/images/trand/userSample.jpg" id="userProfile"></div>
                        <div class="name-area">
                            <div class="name">조서희</div>
                            <div class="nickname">백엔드 개발자</div>
                        </div>
                    </div>
                    <div class="row1-2">
                        <div class="text-area">
                            <div class="title">🕊️ 시니어 개발자가 되기 위한 백엔드 프로젝트 아이디어</div>
                            <div class="content">백엔드 프로그래밍 기술을 향상시키고 시니어 수준의 개발자가 되는 데 도움이 되는 흥미로운 프로젝트 아이디어를 살펴봅시다.</div>
                        </div>
                        <div class="picture"><img src="/resources/images/trand/sample.jpg" id="pic"></div>
                    </div>
                    <div class="row1-3">
                        <div class="heart"><i class="fa-solid fa-heart"></i>  65</div>
                        <div class="bookmark"><i class="fa-regular fa-bookmark"></i>  30</div>
                    </div>
                </div>
            </div>
        </div>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/common/general.js"></script>

    <script src="/resources/js/trand/trand-list.js"></script>


</body>
</html>