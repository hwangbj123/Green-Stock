package com.green.greenstock.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.dto.MyStocks;

@Mapper
public interface MyStocksRepository {

	int updateMyStocks(MyStocks ms);

	int insertMyStocks(MyStocks ms);

	int deleteMyStocks(String companyCode);
	
}
