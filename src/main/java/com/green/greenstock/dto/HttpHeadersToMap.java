package com.green.greenstock.dto;

import org.springframework.util.LinkedMultiValueMap;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class HttpHeadersToMap {

	private String authorization;
	private String appkey;
	private String appsecret;
	
	public LinkedMultiValueMap<String, String> toMultiValueMap(){
		LinkedMultiValueMap<String, String> map = new LinkedMultiValueMap<>();
		map.add("authorization", this.authorization);
		map.add("appkey", this.appkey);
		map.add("appsecret", this.appsecret);
		return map;
	}


}
