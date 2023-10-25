package com.green.greenstock.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;
import com.green.greenstock.dto.HttpHeadersToMap;
import com.green.greenstock.dto.StockCurrentPrice;
import com.green.greenstock.repository.interfaces.AccessTokenRepository;
import com.green.greenstock.repository.model.AccessTokenInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import reactor.core.publisher.Mono;

@Slf4j
@RequiredArgsConstructor
@Service
public class StockApiService {

	@Value("${app.key}")
	private String appKey;
	
	@Value("${app.secret}")
	private String appSecret;

//	private final String contentType = "application/json";
	
	private final AccessTokenRepository accessTokenRepository;
	
	// AccessToken 발급
	public AccessTokenInfo receiveAccessToken() {
		WebClient webClient = buildWebClient();
		Map<String, String> bodyMap = new HashMap<>();
		bodyMap.put("grant_type", "client_credentials");
		bodyMap.put("appkey", appKey);
		bodyMap.put("appsecret", appSecret);
		
		AccessTokenInfo accessTokenInfo = webClient
						.post()
						.uri("/oauth2/tokenP")
						.body(BodyInserters.fromValue(bodyMap))
						.retrieve()
						.bodyToMono(AccessTokenInfo.class)
						.block();
		
		if(accessTokenInfo != null) {
			accessTokenRepository.save(accessTokenInfo);
		}
		return accessTokenInfo;
	}
	
	// 토큰 유효성 검증(종합) / null, 시간
	public AccessTokenInfo validateAccessToken() {
		AccessTokenInfo recentAccessTokenInfo = accessTokenRepository.findTopByOrderByTokenIdDesc(); // 최근 토큰정보 가져오기
		if(recentAccessTokenInfo == null || isAccessTokenExpired(recentAccessTokenInfo)){ // 최근 토큰이 존재한다면
			return receiveAccessToken(); // 토큰을 발급받고 토큰을 리턴
		}else {
			return recentAccessTokenInfo;
		}
	}
	
	// 토큰 유효성 검증 / 시간
	private boolean isAccessTokenExpired(AccessTokenInfo accessTokenInfo) {
	    String expiredTime = accessTokenInfo.getAccessTokenTokenExpired(); // 토큰 만료시간
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); // 날짜형식 포맷
	    LocalDateTime dateTime = LocalDateTime.parse(expiredTime, formatter); // 만료시간(String)을 LocalDateTime으로 변환
	    LocalDateTime now = LocalDateTime.now(); // 현재시간
	    return now.isAfter(dateTime); // 현재시간이 만료시간보다 이후인지 확인
	}
	
	
	// 국내주식현재가격
	public Mono<StockCurrentPrice> getDomesticStokCurrentPrice() {
		// https://apiportal.koreainvestment.com/apiservice/apiservice-domestic-stock-quotations#L_07802512-4f49-4486-91b4-1050b6f5dc9d
		// DB 조회해서 접근토큰 유효한지 보고 다시 가져올지 확인하기
		AccessTokenInfo accessToken = validateAccessToken();
		String auth = accessToken.getTokenType().concat(" " + accessToken.getAccessToken());
		String trId = "FHKST01010100"; // 실전 모의 투자 구분 
		String fid1 = "fid_cond_mrkt_div_code"; // 시장 분류 코드 (J : 주식, ETF, ETN)
		String fid2 = "fid_input_iscd"; // 종목코드 (6자리) 005930
		String uri = "/uapi/domestic-stock/v1/quotations/inquire-price";
		
		WebClient webClient = buildWebClient(); // 순서를 uri 다음에 headers로 하자
		return webClient
				.get()
				.uri(uribuilder -> uribuilder
									.path(uri)
									.queryParam(fid1, "J")
									.queryParam(fid2, "005930") // 종목코드
									.build())
				.header("authorization", auth)
				.header("appkey", appKey)
				.header("appsecret", appSecret)
				.header("tr_id", trId)
				.retrieve()
				.bodyToMono(StockCurrentPrice.class);
	}
	
	// 웹클라이언트(http통신 생성)
	private WebClient buildWebClient() {
		return WebClient
						.builder()
						.baseUrl("https://openapivts.koreainvestment.com:29443")
						.defaultHeader("Content-Type", MediaType.APPLICATION_JSON_VALUE)
						.build();
	}
}
