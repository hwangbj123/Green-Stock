package com.green.greenstock.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.repository.model.KosdaqCode;

@Mapper
public interface KosdaqCodeRepository {

	 KosdaqCode findMkscShrnIscdByHtsKorIsName(String companyName); // 코스닥에서 종목코드 찾기
}
