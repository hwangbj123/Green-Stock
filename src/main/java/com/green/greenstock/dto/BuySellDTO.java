package com.green.greenstock.dto;

import lombok.Data;

@Data
public class BuySellDTO {
	private Integer potfolioId;
	private String stockId;
	private double amount;
}
