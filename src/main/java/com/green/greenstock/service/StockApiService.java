package com.green.greenstock.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;

import com.green.greenstock.dto.DomesticStockCode;
import com.green.greenstock.dto.DomesticStockCurrentPrice;
import com.green.greenstock.dto.DomesticStockCurrentPriceOutput;
import com.green.greenstock.dto.DomesticStockVolumeRank;
import com.green.greenstock.dto.ResponseDomesticStockSearchDto;
import com.green.greenstock.handler.exception.CustomRestfulException;
import com.green.greenstock.repository.interfaces.AccessTokenRepository;
import com.green.greenstock.repository.interfaces.DomesticStockCodeRepository;
import com.green.greenstock.repository.interfaces.KosdaqCodeRepository;
import com.green.greenstock.repository.interfaces.KospiCodeRepository;
import com.green.greenstock.repository.interfaces.OverseasStockCodeRepository;
import com.green.greenstock.repository.model.AccessTokenInfo;
import com.green.greenstock.utils.Pagination;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

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
	
	
	
	// 종목코드 값으로 회사이름 찾기
	public String getCompanyName(String companyCode) {
		// 종목코드
		DomesticStockCode domesticStockCode= domesticStockCodeRepository.findByCompanyCode(companyCode);
		
		log.debug("companyName : {}", domesticStockCode.getCompanyName());
		log.debug("companyCode : {}", companyCode);
		return domesticStockCode.getCompanyName();
	}
	
	// https://apiportal.koreainvestment.com/apiservice/apiservice-domestic-stock-quotations#L_07802512-4f49-4486-91b4-1050b6f5dc9d
	// 국내주식현재가격
	public DomesticStockCurrentPrice getApiDomesticStockCurrentPrice(String companyCode) {
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
				.bodyToMono(DomesticStockCurrentPrice.class)
				.block();
	}

	// https://apiportal.koreainvestment.com/apiservice/apiservice-domestic-stock-quotations#L_6df56964-f22b-43d4-9457-f06264018e5b
	// 거래량 조회
	public DomesticStockVolumeRank getApiVolumeRank() {
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
				.bodyToMono(DomesticStockVolumeRank.class)
				.block();
	}
	
	// 검색 주식 목록
	public ResponseDomesticStockSearchDto getApiDomesticStockCurrentPriceList(String searchData, int page) {
		
		ResponseDomesticStockSearchDto domesticStockSearchDto = new ResponseDomesticStockSearchDto(); // dto 생성
		List<DomesticStockCurrentPriceOutput> dtoList = new ArrayList<>(); // dto에 넣을 List 생성
		List<DomesticStockCode> codeList = domesticStockCodeRepository.findAllLikeCompanyName(searchData); // 검색어와 유사한 종목코드 리스트
		
		// API 요청 한계로 인해 10개 요청하기
		int total = codeList.size(); // 총 개수
		if((total/10) + 1 < page ) {
			throw new CustomRestfulException("입력이 올바르지 않습니다.", HttpStatus.BAD_REQUEST);
		}
		
		int start = (page - 1) * 10; // 시작 번호
		int end = (page * 10 >= total) ? total : (page * 10); // 끝번호
		int j = 0; // dtoList 주소값
		for(int i = start; i < end; i++) {
			if(codeList.get(i) != null) {
				DomesticStockCode domesticStockCode = codeList.get(i);
				dtoList.add(getApiDomesticStockCurrentPrice(domesticStockCode.getCompanyCode()).getOutput()); // 리스트에 추가 (output)
				dtoList.get(j).setCompanyName(domesticStockCode.getCompanyName()); // 리스트에 추가 (회사 한글명)
				dtoList.get(j).setType(domesticStockCode.getType()); // 리스트에 추가 (type: kospi, kosdaq)
				dtoList.get(j).setCompanyCode(domesticStockCode.getCompanyCode());
			}else {
				throw new CustomRestfulException("목록을 가져오지 못했습니다", HttpStatus.INTERNAL_SERVER_ERROR);
			}
			j++;			
		}
		
		domesticStockSearchDto.setDomesticStockCurrentPriceList(dtoList); // API에서 불러온 데이터 넣기
		
		//domesticStockSearchDto.setListSize(total); // 검색된 전체 개수
		domesticStockSearchDto.setSearchData(searchData); // 검색어
		//domesticStockSearchDto.setPage(page); // 현재 페이지
		//domesticStockSearchDto.setTotalpage((total/10) + 1); // 총 페이지수
		
		domesticStockSearchDto.setPagination(new Pagination(total, page));
		
		log.debug("total {}", total);
		log.debug("start {}", start);
		log.debug("end {}", end);
		log.debug("listSize {}", domesticStockSearchDto.getDomesticStockCurrentPriceList().size());
		return domesticStockSearchDto;
	}
	
	// fastAPI 통신 테스트
	
	
	
	
	
	
	
	
	
	
	
	
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
		log.debug("tokenId {}", recentAccessTokenInfo.getTokenId());
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
