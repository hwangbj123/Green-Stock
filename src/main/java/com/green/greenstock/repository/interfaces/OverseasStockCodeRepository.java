package com.green.greenstock.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.repository.model.OverseasStockCode;

@Mapper
public interface OverseasStockCodeRepository {

	 OverseasStockCode findSymbByKnam(String companyName); // 코스피에서 종목코드 찾기
}
