package io.marosile.helloworld.member.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class GoogleOAuthRequest {
	
	private String redirectUri;
	private String clientId;
	private String clientSecret;
	private String code;
	private String responseType;
	private String scope;
	private String accessType;
	private String grantType;
	private String state;
	private String includeGrantedScopes;
	private String loginHint;
	private String prompt;

}
