package com.green.greenstock.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class Output {
	
	private String iscdStatClsCode; // 종목 상태 구분 코드. 00: 그외 51:관리종목	52:투자의견 53:투자경고 54:투자주의	55:신용가능 57:증거금100% 58:거래정지 59:단기과열 
	private String rprsMrkt_kor_name; // 대표 시장 한글 명 
	private String newHgprLwprClsCode; // 신 고가 저가 구분 코드
	private String bstpKorIsnm; // 업종 한글 종목명
	private String stck_prpr; // 주식 현재가
	private String prdy_vrss; // 전일 대비
	private String prdy_vrss_sign; // 전일 대비 부호. 1:상한 2:상승 3:보합 4:하한 5:하락
	private String prdy_vrss_vol_rate; // 전일 대비 거래량 비율. 주식현재가 일자별 API 응답값 사용
	private String stck_oprc; // 주식 시가
	private String stck_hgpr; // 주식 최고가	
	private String stck_lwpr; // 주식 최저가
	private String stck_mxpr; // 주식 상한가
	private String stck_llam; // 주식 하한가
	private String stck_sdpr; // 주식 기준가
	private String per; // PER
	private String pbr; // PBR
	
	// TODO 추가가능
}
