package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.dto.Stock;

@Mapper
public interface StockRepository {

	List<String> getAutoCompleteData();

	Stock getStockByStockId(Integer id);

	Stock getStockByStockName(String stockname);
	
}
