package com.green.greenstock.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;

import com.green.greenstock.dto.DomesticStockCode;
import com.green.greenstock.dto.DomesticStockCurrentPrice;
import com.green.greenstock.dto.DomesticStockVolumeRank;
import com.green.greenstock.repository.interfaces.AccessTokenRepository;
import com.green.greenstock.repository.interfaces.DomesticStockCodeRepository;
import com.green.greenstock.repository.interfaces.KosdaqCodeRepository;
import com.green.greenstock.repository.interfaces.KospiCodeRepository;
import com.green.greenstock.repository.interfaces.OverseasStockCodeRepository;
import com.green.greenstock.repository.model.AccessTokenInfo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import reactor.core.publisher.Mono;

@Slf4j
@RequiredArgsConstructor
@Service
public class StockApiService {

	@Value("${app.key:defaultAppkey}") // : 디폴트값 설정
	private String appKey;
	
	@Value("${app.secret:defaultAppSecret}")
	private String appSecret;

	private final AccessTokenRepository accessTokenRepository;
	private final KospiCodeRepository kospiCodeRepository;
	private final KosdaqCodeRepository kosdaqCodeRepository;
	private final OverseasStockCodeRepository overseasStockCodeRepository;
	private final DomesticStockCodeRepository domesticStockCodeRepository; 

	private static final String APP_KEY = "appkey";
	private static final String APP_SECRET= "appsecret";
	private static final String CONTENT_TYPE= "content-type";
	private static final String AUTHORIZATION= "authorization";
	private static final String TR_ID= "tr_id";
	
	
	
	// filter 값과 회사이름으로 종목코드 찾기
	public String getCompanyCode(int filter, String companyName) {
		String companyCode = null;  
		
		switch (filter) {
			case 1: // 국내
				DomesticStockCode code = domesticStockCodeRepository.findByCompanyName(companyName);
				companyCode = code != null ? code.getCompanyCode() : "005930";
				break;
			case 2:	// 해외
				companyCode = overseasStockCodeRepository.findSymbByKnam(companyName).getSymb();
				break;
			default:
				companyCode = filter == 1 ? "005930" : "AAPL"; // 기본값 삼성전자 OR APPLE 
				break;
		}
		log.debug("filter : {}", filter);
		log.debug("companyName : {}", companyName);
		log.debug("companyCode : {}", companyCode);
		return companyCode;
	}
	
	// https://apiportal.koreainvestment.com/apiservice/apiservice-domestic-stock-quotations#L_07802512-4f49-4486-91b4-1050b6f5dc9d
	// 국내주식현재가격
	public Mono<DomesticStockCurrentPrice> getApiDomesticStockCurrentPrice(String companyCode) {
		// DB 조회해서 접근토큰 유효한지 보고 다시 가져올지 확인하기
		AccessTokenInfo accessToken = validateAccessToken();
		// URI
		String uri = "/uapi/domestic-stock/v1/quotations/inquire-price";
		// parameter
		String fid1 = "fid_cond_mrkt_div_code"; // 시장 분류 코드 (J : 주식, ETF, ETN)
		String fid2 = "fid_input_iscd"; // 종목코드 (6자리) 005930
		// header
		String auth = accessToken.getTokenType().concat(" " + accessToken.getAccessToken());
		String trId = "FHKST01010100"; // 거래ID
		
		WebClient webClient = buildWebClient(); // 순서를 uri 다음에 headers로 하자
		return webClient
				.get()
				.uri(uribuilder -> uribuilder
									.path(uri)
									.queryParam(fid1, "J")
									.queryParam(fid2, companyCode) // 종목코드
									.build())
				.header(AUTHORIZATION, auth)
				.header(APP_KEY, appKey)
				.header(APP_SECRET, appSecret)
				.header(TR_ID, trId)
				.retrieve()
				.bodyToMono(DomesticStockCurrentPrice.class);
	}

	// https://apiportal.koreainvestment.com/apiservice/apiservice-domestic-stock-quotations#L_6df56964-f22b-43d4-9457-f06264018e5b
	// 거래량 조회
	public Mono<DomesticStockVolumeRank> getApiVolumeRank() {
		// DB 조회해서 접근토큰 유효한지 보고 다시 가져올지 확인하기
		AccessTokenInfo accessToken = validateAccessToken();
		// URI
		String uri = "/uapi/domestic-stock/v1/quotations/volume-rank";
		// parameter
		// header
		String contentType = "application/json";
		String auth = accessToken.getTokenType().concat(" " + accessToken.getAccessToken());
		String trId = "FHPST01710000"; // 거래ID
			
		WebClient webClient = buildWebClient(); // 순서를 uri 다음에 headers로 하자
		return webClient
				.get()
				.uri(uribuilder -> uribuilder
									.path(uri)
									.queryParam("FID_COND_MRKT_DIV_CODE", "J") // 조건 시장 분류 코드
									.queryParam("FID_COND_SCR_DIV_CODE", "20171") // 조건 화면 분류 코드	
									.queryParam("FID_INPUT_ISCD", "0000") // 입력 종목코드
									.queryParam("FID_DIV_CLS_CODE", "0") // 분류 구분 코드
									.queryParam("FID_BLNG_CLS_CODE", "0") // 소속 구분 코드
									.queryParam("FID_TRGT_CLS_CODE", "111111111") // 대상 구분 코드. 1 or 0 9자리 (차례대로 증거금 30% 40% 50% 60% 100% 신용보증금 30% 40% 50% 60%)
									.queryParam("FID_TRGT_EXLS_CLS_CODE", "000000") // 대상 제외 구분 코드. 1 or 0 6자리 (차례대로 투자위험/경고/주의 관리종목 정리매매 불성실공시 우선주 거래정지)
									.queryParam("FID_INPUT_PRICE_1", "") // 입력 가격1. 전체 가격 대상 조회 시 FID_INPUT_PRICE_1, FID_INPUT_PRICE_2 모두 ""(공란) 입력
									.queryParam("FID_INPUT_PRICE_2", "") // 입력 가격2. 전체 가격 대상 조회 시 FID_INPUT_PRICE_1, FID_INPUT_PRICE_2 모두 ""(공란) 입력
									.queryParam("FID_VOL_CNT", "") // 거래량 수. 전체 거래량 대상 조회 시 FID_VOL_CNT ""(공란) 입력
									.queryParam("FID_INPUT_DATE_1", "") // 입력 날짜1. ""(공란) 입력
									.build())
				.header(CONTENT_TYPE, contentType)
				.header(AUTHORIZATION, auth)
				.header(APP_KEY, appKey)
				.header(APP_SECRET, appSecret)
				.header(TR_ID, trId)
				.header("custtype", "P") // P 개인 B 법인
				.retrieve()
				.bodyToMono(DomesticStockVolumeRank.class);
	}
	
	/* 토큰 시작 */
	// AccessToken 발급
	public AccessTokenInfo getApiAccessToken() {
		WebClient webClient = buildWebClient();
		Map<String, String> bodyMap = new HashMap<>();
		bodyMap.put("grant_type", "client_credentials");
		bodyMap.put(APP_KEY, appKey);
		bodyMap.put(APP_SECRET, appSecret);
		
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
			return getApiAccessToken(); // 토큰을 발급받고 토큰을 리턴
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
	/* 토큰 끝 */
	
	/* 통신 시작 */
	// 웹클라이언트(http통신 생성)
	private WebClient buildWebClient() {
		return WebClient
						.builder()
						.baseUrl("https://openapivts.koreainvestment.com:29443")
						.defaultHeader(CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
						.build();
	}
	/* 통신 끝 */
}
