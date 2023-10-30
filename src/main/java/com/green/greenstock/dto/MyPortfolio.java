package com.green.greenstock.dto;

import java.util.List;
import java.util.stream.Collectors;

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
	private Integer totalAsset;
	private boolean isVisible;
	private List<MyStocks> stockList;
	
	public void buySell(MyStocks mystock) {
		MyStocks selectedStock = stockList.stream()
			    .filter(e -> e.getStock().getId() == mystock.getStock().getId())
			    .findAny()
			    .orElse(null);
		//list 에는 stockList 중 내가 사거나 판 stock 이 들어있다.
		if (selectedStock != null) {
			
		} else {
		    // 필터링된 MyStock 객체가 없을 때의 처리
			System.out.println("???????????????????");
		}
		
	}
}