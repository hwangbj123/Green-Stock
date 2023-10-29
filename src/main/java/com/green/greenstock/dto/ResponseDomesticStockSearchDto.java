package com.green.greenstock.dto;

import java.util.List;

import lombok.Data;

@Data
public class ResponseDomesticStockSearchDto {

	private List<DomesticStockCurrentPriceOutput> domesticStockCurrentPriceList;
	private String searchData;
	private int listSize;
	private int page;
	private int totalpage;
}
