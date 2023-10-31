package com.green.greenstock.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.green.greenstock.dto.GoogleOAuthTokenDto;
import com.green.greenstock.dto.GoogleProfile;
import com.green.greenstock.dto.KakaoProfile;
import com.green.greenstock.dto.NaverOAuthTokenDto;
import com.green.greenstock.dto.NaverProfile;
import com.green.greenstock.dto.NaverResponse;
import com.green.greenstock.dto.OAuthToken;
import com.green.greenstock.handler.exception.CustomRestfulException;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.MailService;
import com.green.greenstock.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private MailService mailService;

	@Autowired
	HttpSession session;

	// 구글인증 관련 값
	private final String GOOGLE_TOKEN_URL = "https://oauth2.googleapis.com/token";

	@GetMapping("/sign-in")
	public String SignIn() {
		return "user/signIn";
	}

	@PostMapping("/sign-in")
	public ResponseEntity<Integer> SignInProc(User user) {
		User principal = userService.findUserByUserName(user);
		if (principal != null) {
			principal.setPassword(null);
			session.setAttribute("principal", principal);
			return ResponseEntity.status(HttpStatus.OK).body(200);
		} else {
			return ResponseEntity.status(HttpStatus.OK).body(400);
		}
	}

	@GetMapping("/sign-up")
	public String SignUp() {
		return "user/signUp";
	}

	@PostMapping("/sign-up")
	public String SignUpProc(User user) {
		if(user.getUserName() == null || user.getUserName().isEmpty()) {
			throw new CustomRestfulException("username을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(user.getPassword() == null || user.getPassword().isEmpty()) {
			throw new CustomRestfulException("password을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(user.getEmail() == null || user.getEmail().isEmpty()) {
			throw new CustomRestfulException("email을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(user.getTel() == null || user.getTel().isEmpty()) {
			throw new CustomRestfulException("전화번호를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(user.getBirthDate() == null) {
			throw new CustomRestfulException("생년월일을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		userService.insertUser(user);
		return "user/signIn";
	}
	
	@GetMapping("/sign-out")
	public String SignOut() {
		session.invalidate();
		return "redirect:/user/sign-in";
	}
	
	@GetMapping("/findIdPw")
	public String FindIdPw() {
		return "user/findIdPw";
	}
	
	@PostMapping("/find-id")
	@ResponseBody
	String FindId(@RequestParam("email") String email) throws Exception {
		
		if(email == null || email.isEmpty()) {
			throw new CustomRestfulException("E-mail 입력하세요", HttpStatus.BAD_REQUEST);
		}
		
		log.info("아이디찾기 이메일 전송 컨트롤러 실행");
		
		//이메일정보로 유저찾기
		User user = userService.findUserFromEmail(email);
		
		log.info("이메일 유저정보 조회");
		if(user != null) {
			String code = mailService.sendUserId(email, user);
			log.info("인증코드 : " + code);
		    return code;
		} else {
			//오류처리
			log.info("이메일로 유저찾기 실패"); 
			return null;
		}
		
	}
	
	@PostMapping("/find-pw")
	@ResponseBody
	String FindPw(@RequestParam("email") String email, @RequestParam("username") String username) throws Exception {
		
		if(email == null || email.isEmpty()) {
			throw new CustomRestfulException("E-mail 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(username == null || username.isEmpty()) {
			throw new CustomRestfulException("ID를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		
		
		log.info("비번찾기 이메일 전송 컨트롤러 실행");
		
		//이메일정보로 유저찾기
		User user = userService.findUserFromEmail(email);
		
		if(user.getUserName().equals(username)) {
			log.info("이메일 유저정보 조회");
			String code = mailService.sendSimpleMessage(email);
			log.info("인증코드 : " + code);
			return code;
		} else {
			//오류처리
			log.error("일치하는 유저가 없습니다.");
			return null;
		}
	}
	
	@PostMapping("/modify-pw")
	public String ModifyPw(User principal) {
		User user = userService.findUserName(principal.getUserName());
		user.setPassword(principal.getPassword());
		userService.modifyPw(user);
		return "user/signIn";
	}

	@PostMapping("/duplicate-check")
	public ResponseEntity<Integer> DuplicateCheck(@RequestParam("username") String username) {
		if (userService.findUserName(username) != null) {
			log.info("중복채크 실패");
			return ResponseEntity.status(HttpStatus.OK).body(400);
		} else {
			log.info("중복채크 성공");
			return ResponseEntity.status(HttpStatus.OK).body(200);
		}
	}

	// 구글 소셜 로그인
	@GetMapping("/google/callback")
	public String GoogleCallback(@RequestParam String code) {
		log.info("구글 로그인 컨트롤러 실행");
		log.info("구글 로그인 콜백메서드 동작");
		log.info("구글 인가 코드 확인 : " + code);

		RestTemplate rt = new RestTemplate();
		Map<String, String> params = new HashMap<>();

		params.put("code", code);
		params.put("client_id", "274947516179-mp9dq1e2lmf62hj46urhg6e30mn29q0u.apps.googleusercontent.com");
		params.put("client_secret", "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");
		params.put("redirect_uri", "http://localhost/user/google/callback");
		params.put("grant_type", "authorization_code");

		ResponseEntity<GoogleOAuthTokenDto> response = rt.postForEntity(GOOGLE_TOKEN_URL, params,
				GoogleOAuthTokenDto.class);

		if (response.getStatusCode() == HttpStatus.OK) {
			log.info("엑세스 토큰 확인" + response.getBody().toString());
			log.info("----------------------------------------------------");
			log.info("토큰 : " + response.getBody());
		}
		RestTemplate apiRt = new RestTemplate();
		String apiUrl = "https://www.googleapis.com/oauth2/v1/userinfo"; // API URL

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + response.getBody().getAccessToken());

		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(headers);

		ResponseEntity<GoogleProfile> userInfoResponse = apiRt.exchange(apiUrl, HttpMethod.GET, entity,
				GoogleProfile.class);
		if (userInfoResponse.getStatusCode() == HttpStatus.OK) {

			GoogleProfile userInfo = userInfoResponse.getBody();
			log.info("Google 사용자 정보: " + userInfo);

			User oldUser = userService.findUserName(userInfo.getFamilyName() + userInfo.getGivenName());

			// 첫번째 구글로그인
			if (oldUser == null) {
				Date date = Date.valueOf("3000-01-01");

				User user = User.builder().userName(userInfo.getFamilyName() + userInfo.getGivenName())
						.password("google").tel("010-000-0000").birthDate((date))
						.regDate(Timestamp.valueOf(LocalDateTime.now())).build();

				userService.insertUser(user);
				oldUser = user;
			}

			// 기존 이용자
			session.setAttribute("principal", oldUser);
			session.setAttribute("isGoogle", true);

			log.info("Google : session 등록확인");
		}

		return "/";
	}

	// 네이버 소셜 로그인
	@GetMapping("/naver/callback")
	public String NaverCallback(@RequestParam String code) throws UnsupportedEncodingException {
		log.info("네이버 로그인 컨트롤러 실행");
		log.info("네이버 로그인 콜백메서드 동작");
		log.info("네이버 인가 코드 확인 : " + code);

		String clientId = "4QL7qRNsZX0v8r2aJUDp";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "pJI4Gx3AEY";
		String redirectURI = URLEncoder.encode("http://localhost/user/naver/callback", "UTF-8");
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();

		RestTemplate rt = new RestTemplate();
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("client_id", clientId);
		params.add("client_secret", clientSecret);
		params.add("redirect_uri", redirectURI);
		params.add("code", code);
		params.add("state", state);

		ResponseEntity<NaverOAuthTokenDto> response = rt.postForEntity(
				"https://nid.naver.com/oauth2.0/token?grant_type=authorization_code", params, NaverOAuthTokenDto.class);
		log.info("엑세스 토큰 확인" + response.getBody().toString());
		log.info("----------------------------------------------------");
		log.info("토큰 : " + response.getBody());

		RestTemplate apiRt = new RestTemplate();
		String apiUrl = "https://openapi.naver.com/v1/nid/me"; // API URL

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + response.getBody().getAccessToken());

		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(headers);

		ResponseEntity<NaverProfile> userInfoResponse = apiRt.exchange(apiUrl, HttpMethod.GET, entity,
				NaverProfile.class);



		log.info(userInfoResponse.getBody().toString());

		if (userInfoResponse.getStatusCode() == HttpStatus.OK) {

			NaverResponse naverUser = userInfoResponse.getBody().getResponse();

		    log.info("naverProfile : " + naverUser);

		    User oldUser = userService.findUserName(naverUser.getName());

		    //첫번째 네이버로그인 
		    if(oldUser == null) { 
		    	Date date =	Date.valueOf(naverUser.getBirthyear()+ "-" + naverUser.getBirthday());

			    User user = User.builder()
			            .userName(naverUser.getName())
			            .password("naver")
			            .tel(naverUser.getMobile())
			            .birthDate(date)
			            .regDate(Timestamp.valueOf(LocalDateTime.now()))
			            .build();
	
			    userService.insertUser(user);
			    oldUser = user;
			    }
		    //기존 이용자 
		    session.setAttribute("principal", oldUser);
		    session.setAttribute("isNaver", true);

		    log.info("Naver : session 등록확인");
		    
			}
		return "/";
	}

	// 카카오 소셜 로그인
	@GetMapping("/kakao/callback")
	public String KakaoCallback(@RequestParam String code) {

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

		ResponseEntity<OAuthToken> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				reqMes, OAuthToken.class);

		log.info("엑세스 토큰 확인" + response.getBody().toString());
		log.info("----------------------------------------------------");

		RestTemplate rt2 = new RestTemplate();

		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + response.getBody().getAccessToken());
		headers2.add("Content-type", "Content-type: application/x-www-form-urlencoded;charset=utf-8");

		HttpEntity<MultiValueMap<String, String>> kakaoInfo = new HttpEntity<>(headers2);

		ResponseEntity<KakaoProfile> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kakaoInfo, KakaoProfile.class);

		KakaoProfile kakaoProfile = response2.getBody();

		log.info("kakaoProfile : " + kakaoProfile);

		String username = kakaoProfile.getId().toString();

		User oldUser = userService.findUserName(username);

		if (oldUser == null) {

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
				StringBuilder birth = new StringBuilder(kakaoProfile.getKakaoAccount().getBirthYear() + "-"
						+ kakaoProfile.getKakaoAccount().getBirthDay());
				birth.insert(7, "-");
				date = Date.valueOf(birth.toString());
			} catch (Exception e) {
				log.info("생년월일 기본값 삽입");
			}

			User userDto = User.builder().userName(username).password("kakaoUser").email(email).tel(tel.toString())
					.birthDate(date).regDate(Timestamp.valueOf(LocalDateTime.now())).build();

			log.info("userDto : " + userDto);

			userService.insertUser(userDto);
			oldUser = userDto;
		} else {
			log.info("가입된 회원이므로 카카오 로그인 진행");
		}

		StringBuilder kakaoName = new StringBuilder(oldUser.getEmail());

		for (int i = 0; i < kakaoName.length(); i++) {
			if (kakaoName.charAt(i) == '@')
				kakaoName.delete(i, kakaoName.length());
		}

		oldUser.setUserName(kakaoName.toString());

		log.info("user : " + oldUser);

		session.setAttribute("principal", oldUser);

		session.setAttribute("iskakao", true);

		String uri = (String) session.getAttribute("beforeLogin");
		if (uri != null && !uri.equals("http://localhost/user/sign-up")
				&& !uri.equals("http://localhost/user/sign-in")) {
			return "redirect:" + uri;
		} else {
			return "redirect:/";
		}
	}
	
	
	@PostMapping("/email-duplicate-check")
	public ResponseEntity<Integer> EmailDuplicateCheck(@RequestParam("email") String email) {
		
		if(email == null || email.isEmpty()) {
			throw new CustomRestfulException("E-mail 입력하세요", HttpStatus.BAD_REQUEST);
		}
		
		log.info("이메일 중복체크 컨트롤러 실행");
		
		if(userService.findUserFromEmail(email)!=null) {
			log.info("UserController ====> 이메일 사용불가");
			return ResponseEntity.status(HttpStatus.OK).body(400);
		}else {
			log.info("UserController ====> 이메일 사용가능");
			return ResponseEntity.status(HttpStatus.OK).body(200);
		}
	}
	
	// 이메일 인증
	@PostMapping("/mail-confirm")
	@ResponseBody
	public String MailConfirm(@RequestParam("email") String email) throws Exception {
		
		if(email == null || email.isEmpty()) {
			throw new CustomRestfulException("E-mail 입력하세요", HttpStatus.BAD_REQUEST);
		}
		
		log.info("가입코드 이메일 전송 컨트롤러 실행");
		
	    String code = mailService.sendSimpleMessage(email);
	    log.info("인증코드 : " + code);
	    return code;
	}

	@GetMapping("/user-info")
	public String UserInfo() {
		return "user/modifyUser";
	}
	
	@PostMapping("/modify-userInfo")
	public String ModifyUserInfo(User user) {
		
		if(user.getUserName() == null || user.getUserName().isEmpty()) {
			throw new CustomRestfulException("username을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(user.getPassword() == null || user.getPassword().isEmpty()) {
			throw new CustomRestfulException("password을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(user.getEmail() == null || user.getEmail().isEmpty()) {
			throw new CustomRestfulException("email을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(user.getTel() == null || user.getTel().isEmpty()) {
			throw new CustomRestfulException("전화번호를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(user.getBirthDate() == null) {
			throw new CustomRestfulException("생년월일을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		
		userService.modifyUserInfo(user);
		
		return "/main";
	}
	
	@GetMapping("/delete")
	public String deleteUser(Integer id) {
		session.invalidate();
		userService.deleteUser(id);
		return "redirect:/user/signIn";
	}
}
