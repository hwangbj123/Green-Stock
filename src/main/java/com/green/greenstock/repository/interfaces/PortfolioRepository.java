package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.greenstock.dto.MyPortfolio;

@Mapper
public interface PortfolioRepository {

	MyPortfolio findByPortfolioId(int pid);
	void savePortfolio(@Param("pf") MyPortfolio pf,@Param("id") int id);
	List<MyPortfolio> findByuserId(int id);
	
}
