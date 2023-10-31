package com.green.greenstock.dto;

import lombok.Data;

@Data
public class BuySellDTO {
	private Integer potfolioId;
	private Integer stockId;
	private String companyName;
	private Integer price;
	private double amount;
}
