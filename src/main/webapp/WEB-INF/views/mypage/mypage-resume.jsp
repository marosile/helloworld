<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <title>마이페이지-이력서</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-resume.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-nav.css">

    <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>
</head>
<body id="body">
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <section class="ttt">

        <jsp:include page="/WEB-INF/views/mypage/mypage-side.jsp"/>




        <%-- ================================사이드 바 끝 메인 시작 ================================ --%>
        <main id="main">
            <h1 class="Title">이력서</h1>
            <section>
                <form action="resume" method="POST" name="mypageFrm" id="resumeFrm" enctype="multipart/form-data">

                    <!-- ===== 이력서 영역 ===== -->
                    <div class="resume-area">
                        <div class="fa-solid fa-arrow-up-from-bracket fa-4x" id="icon"></div>
                        <label for="resumeInput">업로드 파일</label>
                        <input type="file" name="resumeFile" id="resumeInput" accept="application/pdf, application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document">
                        <div>PDF, DOC, DOCX 최대 1MB</div>
                    </div>

                    <hr>

                    <!-- ========  약관동의 영역 ========= -->
                    <div class="agree-area">
                        <div>정책 동의</div>
                        <div>이력서 활용에 대한 약관 및 정책에 동의해주세요.</div>

                        <div class="row1">           <!-- 전체동의 -->
                            <input type="checkbox" id="allcheck" class="cbox">
                            <label for="check1">전체동의</label>
                        </div>

                        <hr>
                        
                        <div class="row23">
                            <div class="row2">           <!-- 2번째 박스 -->
                                <input type="checkbox" id="box2" class="cbox" name="boxList" required>
                                <label for="box2">개인정보 보호에 대한 방침</label>

                                <!-- 팝업 영역 -->
                                <button type="button" id="popupBtn1">보기</button>

                                <div class="popup" id="popup1">
                                    <span id="closeBtn1">&times</span>

                                    <!-- **************** 약관 내용  ******************-->
                                    <div class="agreeText">
                                        <h1 class="agreeTitle">개인정보 보호에 대한 방침</h1>
                                        <h3>1.개인정보의 처리 목적</h3>
                                        가. 홈페이지 회원가입 및 관리
                                        회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 
                                        서비스 부정이용 방지, 고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.
                                        <br>
                                        나. 민원사무 처리
                                        민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.
                                        <br>
                                        다. 재화 또는 서비스 제공
                                        서비스 제공, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증 등을 목적으로 개인정보를 처리합니다.
                                        <br>
                                        라. 마케팅 및 광고에의 활용
                                        신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공 , 
                                        인구통계학적 특성에 따른 서비스 제공 및 광고 게재 , 
                                        접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.
                                        <br><br><br>
                                        <h3>2.개인정보 파일 현황</h3>
                                        가. 홈페이지 회원가입 및 관리
                                        회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 
                                        서비스 부정이용 방지, 고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.
                                        <br>
                                        나. 민원사무 처리
                                        민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.
                                        <br>
                                        다. 재화 또는 서비스 제공
                                        서비스 제공, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증 등을 목적으로 개인정보를 처리합니다.
                                        <br>
                                        라. 마케팅 및 광고에의 활용
                                        신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공 , 
                                        인구통계학적 특성에 따른 서비스 제공 및 광고 게재 , 
                                        접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.
                                        마. 오버 플로우 테스트
                                        신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공 , 
                                        인구통계학적 특성에 따른 서비스 제공 및 광고 게재 , 
                                        접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.
                                    </div> <!-- **************** 약관 내용 끝 ********* -->

                                </div>
                            </div>
        
                            <div class="row3">           <!-- 3번째 박스 -->
                                <input type="checkbox" id="box3" class="cbox" name="boxList" required>
                                <label for="box3">개인회원 이용약관</label>

                                <!-- 팝업 영역 -->
                                <button type="button" id="popupBtn2">보기</button>

                                <div class="popup" id="popup2">
                                    <span id="closeBtn2">&times</span>

                                    <div class="agreeText">
                                        <!-- *************** 약관내용  ****************-->
                                        <h1 class="agreeTitle">개인회원 이용약관</h1>
                                        <h3>1.개인정보의 처리 목적</h3>
                                        가. 홈페이지 회원가입 및 관리
                                        회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 
                                        서비스 부정이용 방지, 고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.
                                        <br>
                                        나. 민원사무 처리
                                        민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.
                                        <br>
                                        다. 재화 또는 서비스 제공
                                        서비스 제공, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증 등을 목적으로 개인정보를 처리합니다.
                                        <br>
                                        라. 마케팅 및 광고에의 활용
                                        신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공 , 
                                        인구통계학적 특성에 따른 서비스 제공 및 광고 게재 , 
                                        접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.
                                        <br><br><br>
                                        <h3>2.개인정보 파일 현황</h3>
                                        가. 홈페이지 회원가입 및 관리
                                        회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 
                                        서비스 부정이용 방지, 고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.
                                        <br>
                                        나. 민원사무 처리
                                        민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.
                                        <br>
                                        다. 재화 또는 서비스 제공
                                        서비스 제공, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증 등을 목적으로 개인정보를 처리합니다.
                                        <br>
                                        라. 마케팅 및 광고에의 활용
                                        신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공 , 
                                        인구통계학적 특성에 따른 서비스 제공 및 광고 게재 , 
                                        접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.
                                        마. 오버 플로우 테스트
                                        신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공 , 
                                        인구통계학적 특성에 따른 서비스 제공 및 광고 게재 , 
                                        접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.
                                    </div><!-- 약관내용 끝 -->

                                </div>

                            </div>
                        </div>

                        <hr>

                        <div class="row4">           <!-- 4번째 박스 -->
                            <input type="checkbox" id="box4" class="cbox" name="boxList" required>
                            <label for="box4">"바로 지원하기"에서 이메일 전달 동의</label>
                        </div>
                    </div>

                    <button id="saveBtn">저장</button>

                </form>
            
            </section>
            


        </main>
    </section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/mypage/mypage-resume.js"></script>
    
</body>
</html>
