package com.green.greenstock.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.dto.TradeLogDTO;

@Mapper
public interface TradeRepository {
	
	int insertTradeLog(TradeLogDTO tradelogDto);
	
}
