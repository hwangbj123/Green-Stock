package com.green.greenstock.repository.model;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/*
 * https://github.com/koreainvestment/open-trading-api/blob/main/stocks_info/%ED%95%B4%EC%99%B8%EC%A2%85%EB%AA%A9%EC%BD%94%EB%93%9C%EC%A0%95%EB%B3%B4(%EB%AF%B8%EA%B5%AD%2C%EC%A4%91%EA%B5%AD%2C%EC%9D%BC%EB%B3%B8%2C%ED%99%8D%EC%BD%A9%2C%EB%B2%A0%ED%8A%B8%EB%82%A8).h
 */
@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class OverseasStockCode {

	private String ncod;
	private int exid;
	private String excd;
	private String exnm;
	private String symb;
	private String rsym;
	private String knam;
	private String enam;
	private int stis;
	private String curr;
	private int zdiv;
	private String ztyp;
	private double base;
	private int bnit;
	private int anit;
	private String mstm;
	private String metm;
	private String isdr;
	private String drcd;
	private double icod;
	private int sjong;
	private int ttyp;
	private String etyp;
	private String ttypSb;

}
