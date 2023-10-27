package com.green.greenstock.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ResponseApiInfo {

	private String rtCd; // 성공실패여부 0 성공 0 이외의 값 : 실패
	private String msgCd; // 응답코드
	private String msg1; // 응답메세지
	
}
