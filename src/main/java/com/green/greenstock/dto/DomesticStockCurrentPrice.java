package com.green.greenstock.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;
import lombok.EqualsAndHashCode;

/* 국내주식시세 - 주식현재가 시세
 * https://apiportal.koreainvestment.com/apiservice/apiservice-domestic-stock-quotations#L_07802512-4f49-4486-91b4-1050b6f5dc9d
 */

@Data
@EqualsAndHashCode(callSuper = false)
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class DomesticStockCurrentPrice extends ResponseApiInfo{

	@JsonProperty("output")
	private DomesticStockCurrentPriceOutput output; // 응답상세 Object
	
}
