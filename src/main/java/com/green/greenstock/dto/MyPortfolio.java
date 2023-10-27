package com.green.greenstock.dto;

import java.util.List;

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
public class MyPortfolio {
	private Integer id;
	private String title;
	private String discription;
	private List<MyStocks> stockList;
}