package com.green.greenstock.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.green.greenstock.dto.GoogleOAuthTokenDto;
import com.green.greenstock.dto.GoogleProfile;
import com.green.greenstock.dto.KakaoProfile;
import com.green.greenstock.dto.OAuthToken;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	HttpSession session;
	
	//구글인증 관련 값
	private final String GOOGLE_TOKEN_URL = "https://oauth2.googleapis.com/token";

	/*
	 * private String GOOGLE_CLIENT_ID =
	 * "274947516179-mp9dq1e2lmf62hj46urhg6e30mn29q0u.apps.googleusercontent.com";
	 * 
	 * private String GOOGLE_CLIENT_SECRET = "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";
	 */
	
    
	@GetMapping("/sign-in")
	public String SignIn() {
		return "user/signIn";
	}
	
	@PostMapping("/sign-in")
	public String SignInProc(User user) {
		User principal = userService.findUserByUserName(user);
		if(principal != null) {
			principal.setPassword(null);
			session.setAttribute("principal", principal);
			return "redirect:/main";
		} else {
			return "redirect:/user/sign-in";
		}
	}
	
	@GetMapping("/sign-up")
	public String SignUp() {
		return "user/signUp";
	}
	
	@PostMapping("/sign-up")
	public String SignUpProc(User user) {
		userService.insertUser(user);
		return "user/signIn";
	}
	
	@PostMapping("/duplicate-check")
	public ResponseEntity<Integer> duplicateCheck(@RequestParam("username") String username) {
		if(userService.findUserName(username)!=null) {
			log.info("중복채크 실패");
			return ResponseEntity.status(HttpStatus.OK).body(400);
		}else {
			log.info("중복채크 성공");
			return ResponseEntity.status(HttpStatus.OK).body(200);
		}
	}
	
	//구글 소셜 로그인
	//구글에서 GoogleProfile 객체로 받아오는것까지 완료, User객체로 데이터 옮겨서 회원정보DB에입력해야함
	@GetMapping("/google/callback")
	public String googleCallback(@RequestParam String code) {
		log.info("구글 로그인 컨트롤러 실행");
		log.info("구글 로그인 콜백메서드 동작");
		log.info("구글 인가 코드 확인 : " + code);
		
        RestTemplate rt=new RestTemplate();
        Map<String, String> params = new HashMap<>();
        
        params.put("code", code);
        params.put("client_id", "274947516179-mp9dq1e2lmf62hj46urhg6e30mn29q0u.apps.googleusercontent.com");
        params.put("client_secret", "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");
        params.put("redirect_uri", "http://localhost/user/google/callback");
        params.put("grant_type", "authorization_code");

        ResponseEntity<GoogleOAuthTokenDto> response=rt.postForEntity(GOOGLE_TOKEN_URL, params, GoogleOAuthTokenDto.class);

        if(response.getStatusCode() == HttpStatus.OK){
    		log.info("엑세스 토큰 확인" + response.getBody().toString());
    		log.info("----------------------------------------------------");
    		log.info("토큰 : " + response.getBody());
        }
        RestTemplate apiRt = new RestTemplate();
        String apiUrl = "https://www.googleapis.com/oauth2/v1/userinfo"; // 사용자 정보를 가져올 API URL

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + response.getBody().getAccessToken());
        
        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(headers);

        ResponseEntity<GoogleProfile> userInfoResponse = apiRt.exchange(apiUrl, HttpMethod.GET, entity, GoogleProfile.class);
        if (userInfoResponse.getStatusCode() == HttpStatus.OK) {
            // 사용자 정보가 userInfoResponse.getBody()에 포함됩니다.
        	GoogleProfile userInfo = userInfoResponse.getBody();
            log.info("Google 사용자 정보: " + userInfo);
        }
		
		return "/";
	}
	
	//카카오 소셜 로그인
	@GetMapping("/kakao/callback")
	public String kakaoCallback(@RequestParam String code) {
		
		log.info("카카오 로그인 컨트롤러 실행");
		log.info("카카오 로그인 콜백메서드 동작");
		log.info("카카오 인가 코드 확인 : " + code);
		
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "1e30a4b6f56a90aa1e581ead0614dcf6");
		params.add("redirect_uri", "http://localhost/user/kakao/callback");
		params.add("code", code);
		
		HttpEntity<MultiValueMap<String, String>> reqMes = new HttpEntity<>(params, headers);
		
		ResponseEntity<OAuthToken> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST, reqMes, OAuthToken.class);
		
		log.info("엑세스 토큰 확인" + response.getBody().toString());
		log.info("----------------------------------------------------");
				
		RestTemplate rt2 = new RestTemplate();
		
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + response.getBody().getAccessToken());
		headers2.add("Content-type", "Content-type: application/x-www-form-urlencoded;charset=utf-8");
		
		HttpEntity<MultiValueMap<String, String>> kakaoInfo = new HttpEntity<>(headers2);
		
		ResponseEntity<KakaoProfile> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST, kakaoInfo, KakaoProfile.class);
		
		KakaoProfile kakaoProfile = response2.getBody();
		
		log.info("kakaoProfile : " + kakaoProfile);
	
		String username = kakaoProfile.getId().toString();
		
		User oldUser = userService.findUserName(username);
		
		if(oldUser == null) {
			
			log.info("가입 이력이 없으므로 카카오 api 정보를 기반으로 회원 가입 진행 후 로그인");
			
			String email = kakaoProfile.getKakaoAccount().getEmail();
			StringBuilder tel = new StringBuilder("99999999999");
			Date date = Date.valueOf("3000-01-01");
			try {
				tel = new StringBuilder(kakaoProfile.getKakaoAccount().getPhoneNumber());
				tel.delete(0, 4);
				tel.insert(0, "0");			
			} catch (Exception e) {
				log.info("전화번호 기본값 삽입");
			}
			try {
				StringBuilder birth = new StringBuilder(kakaoProfile.getKakaoAccount().getBirthYear()+"-"+kakaoProfile.getKakaoAccount().getBirthDay());
				birth.insert(7, "-");
				date = Date.valueOf(birth.toString());
			} catch (Exception e) {
				log.info("생년월일 기본값 삽입");
			}
			
			User userDto = User
					.builder()
					.userName(username)
					.password("kakaoUser")
					.email(email)
					.tel(tel.toString())
					.birthDate(date)
					.regDate(Timestamp.valueOf(LocalDateTime.now()))
					.build();
			
			log.info("userDto : " + userDto);
			
			userService.insertUser(userDto);
			oldUser = userDto;
		} else {
			log.info("가입된 회원이므로 카카오 로그인 진행");
		}
		
		StringBuilder kakaoName = new StringBuilder(oldUser.getEmail());
		
		for (int i = 0; i < kakaoName.length(); i++) {
			if(kakaoName.charAt(i) == '@') kakaoName.delete(i, kakaoName.length());
		}
		
		oldUser.setUserName(kakaoName.toString());
		
		log.info("user : " + oldUser);
		
		session.setAttribute("user", oldUser);
		
		session.setAttribute("iskakao", true);
		
		String uri = (String) session.getAttribute("beforeLogin");
	    if (uri != null && !uri.equals("http://localhost/user/sign-up") && !uri.equals("http://localhost/user/sign-in")) {
	    	return "redirect:"+ uri;
	    } else {
	    	return "redirect:/";
	    }
	}
	
}
