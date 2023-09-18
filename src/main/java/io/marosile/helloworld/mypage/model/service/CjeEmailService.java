
package io.marosile.helloworld.mypage.model.service;

import java.util.Map;

public interface CjeEmailService {
	
	int account(String email, String title);

	String createAuthKey();

	int checkAuthKey(Map<String, Object> paramMap);


}
