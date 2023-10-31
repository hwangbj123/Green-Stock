package com.green.greenstock.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Stock {
	private Integer companyCode;
	private String companyName;
	private Integer price; // 구매시 price이다.
}