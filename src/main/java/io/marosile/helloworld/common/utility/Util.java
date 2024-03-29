package io.marosile.helloworld.common.utility;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class Util {
	
	
    @SuppressWarnings("unchecked")
	public void sendMessage(String tel, String rand) throws IOException {
		
    	// 호스트 URL
        String hostNameUrl = "https://sens.apigw.ntruss.com";
        // 요청 URL
        String requestUrl= "/sms/v2/services/";
        // 요청 URL Type
        String requestUrlType = "/messages";
        // 개인 인증키
        String accessKey = "qHHJMYLRapHPwSYp4ryZ";
        // 2차 인증을 위해 서비스마다 할당되는 service secret
        String secretKey = "tfrGkq7UtCAu7SnlAhE8UR4jhCi4LIl0TZgYBpNt";
        // 프로젝트에 할당된 SMS 서비스 ID
        String serviceId = "ncp:sms:kr:314918716980:final-project";
        // 요청 method
        String method = "POST";
        // current timestamp (epoch)
        String timestamp = Long.toString(System.currentTimeMillis());
        requestUrl += serviceId + requestUrlType;
        String apiUrl = hostNameUrl + requestUrl;

        // JSON 을 활용한 body data 생성
        JSONObject bodyJson = new JSONObject();
        JSONObject toJson = new JSONObject();
        JSONArray  toArr = new JSONArray();
        
        // 난수와 함께 전송
        toJson.put("content","HelloWorld 본인인증 ["+rand+"]");		
        toJson.put("to",tel);
        toArr.add(toJson);
	    
        // 메시지 Type (sms | lms)
        bodyJson.put("type","sms");
        bodyJson.put("contentType","COMM");
        bodyJson.put("countryCode","82");
        
        // 발신번호 * 사전에 인증/등록된 번호만 사용할 수 있습니다.
        bodyJson.put("from","01091498845");		
        bodyJson.put("content", "HelloWorld");
        bodyJson.put("messages", toArr);		
	    
        String body = bodyJson.toJSONString();
	    
        System.out.println(body);
	    
        try {
            URL url = new URL(apiUrl);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
            con.setRequestMethod(method);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            
            wr.write(body.getBytes());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("responseCode" +" " + responseCode);
            if(responseCode==202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            System.out.println(response.toString());

        } catch (Exception e) {
            System.out.println(e);
        }
    }
	
    public static String makeSignature(
        String url, 
        String timestamp, 
        String method, 
        String accessKey, 
        String secretKey
    ) throws NoSuchAlgorithmException, InvalidKeyException {
        
	    String space = " "; 
	    String newLine = "\n"; 
	    
	    String message = new StringBuilder()
	        .append(method)
	        .append(space)
	        .append(url)
	        .append(newLine)
	        .append(timestamp)
	        .append(newLine)
	        .append(accessKey)
	        .toString();

	    SecretKeySpec signingKey;
	    String encodeBase64String;
		try {
			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		} catch (UnsupportedEncodingException e) {
			encodeBase64String = e.toString();
		}
	    

	  return encodeBase64String;
	}
    
    public static String sendRandomMessage(String tel) throws IOException {
    	Util message = new Util();
        Random rand = new Random();
        String numStr = "";
        for (int i = 0; i < 6; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr += ran;
        }
        System.out.println("회원가입 문자 인증 => " + numStr);

        message.sendMessage(tel, numStr);

        return numStr;
    }
	
    
    // 파일명 변경 메소드
    // 파일명 변경 메소드
    public static String fileRename(String originFileName) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

        int ranNum = (int) (Math.random() * 100000); // 5자리 랜덤 숫자 생성

        String str = "_" + String.format("%05d", ranNum);

        String ext = originFileName.substring(originFileName.lastIndexOf("."));

        return date + str + ext;


    }
    
    	// Cross Site Scripting(XSS) 방지 
	   public static String XSSHandling(String content) {
	      
	      // 스크립트나 마크업 언어에서 기호나 기능을 나타내는 문자를 변경 처리
	      
	      //   &  - &amp;
	      //   <  - &lt;
	      //   >  - &gt;
	      //   "  - &quot;
	      
	      content = content.replaceAll("&", "&amp;");
	      content = content.replaceAll("<", "&lt;");
	      content = content.replaceAll(">", "&gt;");
	      content = content.replaceAll("\"", "&quot;");
	      
	      return content;
	      
	   }


    public void adminSendMessage(String tel, String rand) throws IOException {

        // 호스트 URL
        String hostNameUrl = "https://sens.apigw.ntruss.com";
        // 요청 URL
        String requestUrl= "/sms/v2/services/";
        // 요청 URL Type
        String requestUrlType = "/messages";
        // 개인 인증키
        String accessKey = "qHHJMYLRapHPwSYp4ryZ";
        // 2차 인증을 위해 서비스마다 할당되는 service secret
        String secretKey = "tfrGkq7UtCAu7SnlAhE8UR4jhCi4LIl0TZgYBpNt";
        // 프로젝트에 할당된 SMS 서비스 ID
        String serviceId = "ncp:sms:kr:314918716980:final-project";
        // 요청 method
        String method = "POST";
        // current timestamp (epoch)
        String timestamp = Long.toString(System.currentTimeMillis());
        requestUrl += serviceId + requestUrlType;
        String apiUrl = hostNameUrl + requestUrl;

        // JSON 을 활용한 body data 생성
        JSONObject bodyJson = new JSONObject();
        JSONObject toJson = new JSONObject();
        JSONArray  toArr = new JSONArray();

        // 난수와 함께 전송
        toJson.put("content","[HelloWorld 안내 문자]\n\n"+ rand);
        toJson.put("to",tel);
        toArr.add(toJson);

        // 메시지 Type (sms | lms)
        bodyJson.put("type","sms");
        bodyJson.put("contentType","COMM");
        bodyJson.put("countryCode","82");

        // 발신번호 * 사전에 인증/등록된 번호만 사용할 수 있습니다.
        bodyJson.put("from","01091498845");
        bodyJson.put("content", "HelloWorld");
        bodyJson.put("messages", toArr);

        String body = bodyJson.toJSONString();

        System.out.println(body);

        try {
            URL url = new URL(apiUrl);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
            con.setRequestMethod(method);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());

            wr.write(body.getBytes());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("responseCode" +" " + responseCode);
            if(responseCode==202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();

            System.out.println(response.toString());

        } catch (Exception e) {
            System.out.println(e);
        }
    }


}