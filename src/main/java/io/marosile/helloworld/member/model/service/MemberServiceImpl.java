package io.marosile.helloworld.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.marosile.helloworld.member.model.dao.MemberDAO;
import io.marosile.helloworld.member.model.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;


@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO dao;

    // 암호화를 위한 bean 등록
    @Autowired
    private BCryptPasswordEncoder bcrypt;

    @Override
    public String getAccessToken(String code) throws Throwable {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            // POST 요청을 위해 기본값이 false인 setDoOutput을 true로

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");

            sb.append("&client_id=aac73a50e342183e31a5478826ffeffd"); // REST_API키 본인이 발급받은 key 넣어주기
            sb.append("&redirect_uri=http://localhost/member/login/kakao"); // REDIRECT_URI 본인이 설정한 주소 넣어주기

            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            // 결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            // jackson objectmapper 객체 생성
            ObjectMapper objectMapper = new ObjectMapper();
            // JSON String -> Map
            Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
            });

            access_Token = jsonMap.get("access_token").toString();
            refresh_Token = jsonMap.get("refresh_token").toString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return access_Token;
    }


    @SuppressWarnings("unchecked")
    @Override
    public HashMap<String, Object> getUserInfo(String access_Token) {
        // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // 요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            System.out.println("result type" + result.getClass().getName()); // java.lang.String

            try {
                // jackson objectmapper 객체 생성
                ObjectMapper objectMapper = new ObjectMapper();
                // JSON String -> Map
                Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
                });

                System.out.println(jsonMap.get("properties"));

                Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
                Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");

                // System.out.println(properties.get("nickname"));
                // System.out.println(kakao_account.get("email"));

                String nickname = properties.get("nickname").toString();
                String profileImage = properties.get("profile_image").toString();
                String thumbnailImage = properties.get("thumbnail_image").toString();
                String email = kakao_account.get("email").toString();


                userInfo.put("nickname", nickname);
                //userInfo.put("picture", picture);
                userInfo.put("email", email);
                userInfo.put("profileImage", profileImage);
                userInfo.put("thumbnailImage", thumbnailImage);

                // 카카오에서 받아온 정보를 DB에 저장된 이메일 정보와 비교하여 있다면 가입 완료하게 하고,
                // 없다면 바로 자동 회원가입 진행 ㄱㄱ

            } catch (Exception e) {
                e.printStackTrace();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return userInfo;
    }


    // 로그인 서비스
    @Override
    public Member login(Member inputMember) {


        Member loginMember = dao.login(inputMember);

        if(loginMember != null && inputMember.getMemberPw() != null){

            // 비밀번호가 그대로 db에 들어가면 해킹의 위험이 있다
            // -> 암호화 진행해야 함
            // --> 암호화 완료했으나 편의를 위해 변경
//            if(loginMember.getMemberId().equals(inputMember.getMemberId())
//             && loginMember.getMemberPw().equals(inputMember.getMemberPw())){
//
//                loginMember.setMemberId(inputMember.getMemberId());

            if(bcrypt.matches(inputMember.getMemberPw(), loginMember.getMemberPw())){

                // 비밀번호를 유지하지 않기 위해서 로그인 정보에서 제거
                loginMember.setMemberPw(null);

            }else{
                loginMember = null;
            }

        }


        return loginMember;
    }


    // 회원 가입 service
    @Transactional(rollbackFor = {Exception.class})
    @Override
    public int signUp(Member inputMember) {

        // 비밀번호 암호화
        String encPw = bcrypt.encode(inputMember.getMemberPw());
        inputMember.setMemberPw(encPw);

        int result = dao.signUp(inputMember);


        return result;
    }


    // 아이디 중복 체크
    @Override
    public int dupId(String memberId) {

        return dao.dupId(memberId);
    }

    // 이메일 중복 체크
    @Override
    public int dupEmail(String memberEmail) {
        return dao.dupEmail(memberEmail);
    }

    // 전화번호 중복 체크
    @Override
    public int dupTel(String memberTel) {
        return dao.dupTel(memberTel);
    }

    @Override
    public Member kakaoLogin(HashMap<String, Object> userInfo) {

        String memberEmail = String.valueOf(userInfo.get("email"));

        Member loginMember = dao.snsLogin(memberEmail);

        if(loginMember != null){

            //아이디 비교하여 맞으면 로그인 진행
            if(memberEmail.equals(loginMember.getMemberEmail())){

                loginMember.setMemberEmail(memberEmail);

                // 비밀번호를 유지하지 않기 위해서 로그인 정보에서 제거
                loginMember.setMemberPw(null);

            }else{
                loginMember = null;
            }

        }

        return loginMember;
    }


    // 카카오톡 프로필 사진 넣어주기
    @Override
    public Member imgChange(Member imgChange1, Member loginMember) {

        String profileImage = imgChange1.getProfileImg(); // 카카오톡 프로필 이미지를 가져온다
        String kakaoBasicImg = "http://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_640x640.jpg";
        String hwBasicImg = "/resources/images/user.png";
        // 기존 이미지를 저장할 변수 선언
        // -> loginMember의 프로필 이미지가 기본 이미지 일때
        // --> 카카오톡 프로필 사진으로 변경해주고
        // --> 아닌 경우에는 변경하지 않는다

        Member member = new Member();
        member.setMemberEmail(imgChange1.getMemberEmail());
        member.setProfileImg(imgChange1.getProfileImg()); // 카카오톡 프로필 이미지를 가져온다

        int result = 0;

        if(hwBasicImg.equals(loginMember.getProfileImg())){

            System.out.println("프로필이미지가 기본 이미지 일 때 !");

            result = dao.imgChange(member);
            if(result > 0 ){
                member.setProfileImg(imgChange1.getProfileImg());
                System.out.println("이미지변경 서비스 성공시 프로필이미지로 들어가는지 확인");
            }else{
                member.setProfileImg(hwBasicImg);
                System.out.println("이미지변경 실패");
            }

        }else{
            member.setProfileImg(loginMember.getProfileImg());
            System.out.println("프로필 이미지가 기본 이미지가 아닐 때 유지가 되는지 확인");

        }



        return member;
    }

    // 구글 로그인
    @Override
    public Member googleLogin(Map<String, String> userInfo) {

        String memberEmail = String.valueOf(userInfo.get("email"));

        Member loginMember = dao.snsLogin(memberEmail);

        if(loginMember != null){

            //아이디 비교하여 맞으면 로그인 진행
            if(memberEmail.equals(loginMember.getMemberEmail())){

                loginMember.setMemberEmail(memberEmail);

                // 비밀번호를 유지하지 않기 위해서 로그인 정보에서 제거
                loginMember.setMemberPw(null);

            }else{
                loginMember = null;
            }

        }

        return loginMember;
    }

    
    // 아이디 찾기
    @Override
    public String findIdTel(String inputTel) {

        return dao.findIdTel(inputTel);
    }

    @Override
    public String findIdEmail(String inputEmail) {
        return dao.findIdEmail(inputEmail);
    }

    @Override
    public int findPwTel(Map<String, Object> findPwTel) {
        return dao.findPwTel(findPwTel);
    }

    @Override
    public int findPwEmail(Map<String, Object> findPwEmail) {
        return dao.findPwEmail(findPwEmail);
    }


    @Transactional(rollbackFor = {Exception.class})
    @Override
    public int newPwChange(Member member) {

        // 비밀번호 암호화
        String encPw = bcrypt.encode(member.getMemberPw());
        member.setMemberPw(encPw);

        int result = dao.newPwChange(member);

        return result;
    }

    @Override
    public Member getMemberById(String memberId) {
        return dao.getMemberById(memberId);
    }

    @Override
    public List<Member> selectFollowerList(Map<String, Object> param) { return dao.selectFollowerList(param); }

    @Override
    public List<Member> selectFollowingList(Map<String, Object> param) { return dao.selectFollowingList(param); }

    @Override
    public List<Member> selectF4fList(String memberId) { return dao.selectF4fList(memberId); }


}
