package com.green.greenstock.dto;


import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonValue;
import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;
import lombok.EqualsAndHashCode;
/** 국내주식 거래량 순위 response body 
 * https://apiportal.koreainvestment.com/apiservice/apiservice-domestic-stock-quotations#L_6df56964-f22b-43d4-9457-f06264018e5b
 */
@Data
@EqualsAndHashCode(callSuper = false)
//@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class DomesticStockVolumeRank extends ResponseApiInfo{
	
	@JsonProperty("output")
	List<DomesticStockVolumeRankOutPut> output;
}
