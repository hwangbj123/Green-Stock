package com.green.greenstock.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.repository.model.KospiCode;

@Mapper
public interface KospiCodeRepository {

	 KospiCode findMkscShrnIscdByHtsKorIsName(String companyName); // 코스피에서 종목코드 찾기
}
