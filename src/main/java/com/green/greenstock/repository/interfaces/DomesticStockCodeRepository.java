package com.green.greenstock.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.dto.DomesticStockCode;

@Mapper
public interface  DomesticStockCodeRepository {

	DomesticStockCode findByCompanyName(String companyName);
}
