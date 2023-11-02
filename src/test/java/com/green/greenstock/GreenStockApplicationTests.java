package com.green.greenstock;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.green.greenstock.service.PortfolioService;

@SpringBootTest
class GreenStockApplicationTests {

	@Autowired
	PortfolioService portfolioService;
	
	@Test
	void contextLoads() {
	}
}
