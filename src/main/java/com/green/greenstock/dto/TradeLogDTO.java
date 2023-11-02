package com.green.greenstock.dto;

import lombok.Data;

@Data
public class TradeLogDTO {
	private int pId;
    private String stockName;
    private String stockCode;
    private String tradeType;
    private int amount;
    private int price;
    private int quantity;
}
