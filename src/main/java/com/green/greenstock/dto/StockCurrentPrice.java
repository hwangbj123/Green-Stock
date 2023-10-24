package com.green.greenstock.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/* 국내주식시세 - 주식현재가 시세
 * https://apiportal.koreainvestment.com/apiservice/apiservice-domestic-stock-quotations#L_07802512-4f49-4486-91b4-1050b6f5dc9d
 */

@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class StockCurrentPrice {

	private String rtCd; // 성공실패여부 0 성공 0 이외의 값 : 실패
	private String msgCd; // 응답코드
	private String msg1; // 응답메세지
	private Output output; // 응답상세 Object
	
}
