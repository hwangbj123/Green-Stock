package com.green.greenstock.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class GoogleProfile {

	@JsonProperty("id")
	private String id;
	@JsonProperty("connected_at")
	private String name;
	@JsonProperty("given_name")
	private String givenName;
	@JsonProperty("family_name")
	private String familyName;
	@JsonProperty("picture")
	private String picture;
	@JsonProperty("locale")
	private String locale;
	
	/*
	 * @JsonInclude(JsonInclude.Include.NON_NULL)
	 * 
	 * @JsonPropertyOrder({ "profile_nickname_needs_agreement", "profile",
	 * "has_email", "email_needs_agreement", "is_email_valid", "is_email_verified",
	 * "email", "birthyear", "birthday", "phone_number" })
	 * 
	 * @Data public class KakaoAccount {
	 * 
	 * @JsonProperty("profile_nickname_needs_agreement") private Boolean
	 * profileNicknameNeedsAgreement;
	 * 
	 * @JsonProperty("profile") private Profile profile;
	 * 
	 * @JsonProperty("has_email") private Boolean hasEmail;
	 * 
	 * @JsonProperty("email_needs_agreement") private Boolean emailNeedsAgreement;
	 * 
	 * @JsonProperty("is_email_valid") private Boolean isEmailValid;
	 * 
	 * @JsonProperty("is_email_verified") private Boolean isEmailVerified;
	 * 
	 * @JsonProperty("email") private String email;
	 * 
	 * @JsonProperty("birthyear") private String birthYear;
	 * 
	 * @JsonProperty("birthday") private String birthDay;
	 * 
	 * @JsonProperty("phone_number") private String phoneNumber;
	 * 
	 * @JsonInclude(JsonInclude.Include.NON_NULL)
	 * 
	 * @JsonPropertyOrder({ "nickname" })
	 * 
	 * @Data public class Profile {
	 * 
	 * @JsonProperty("nickname") private String nickname; }
	 * 
	 * }
	 */

}