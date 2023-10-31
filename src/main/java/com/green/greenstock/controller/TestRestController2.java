package com.green.greenstock.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.green.greenstock.dto.BuySellDTO;
import com.green.greenstock.dto.MyPortfolio;
import com.green.greenstock.dto.MyStocks;
import com.green.greenstock.dto.Stock;
import com.green.greenstock.repository.interfaces.PortfolioRepository;
import com.green.greenstock.repository.interfaces.StockRepository;

@RestController
@RequestMapping("/portfolio")
public class TestRestController2 {

	@Autowired
	DataRestController dataRestController;
	
	@Autowired
	private PortfolioRepository portfolioRepository;
	
	@Autowired
	private StockRepository stockRepository;

	@GetMapping("/getMyPortfolioList")
	public List<MyPortfolio> test() {
		System.out.println(portfolioRepository.findByuserId(1));
		List<MyPortfolio> list = portfolioRepository.findByuserId(1);
		return list;
	}

	@PostMapping("/addPortfolio")
	public void postExample(@RequestBody MyPortfolio pf) {
		// pf null 처리 해야됨.
		portfolioRepository.savePortfolio(pf, 1);
	}

	@GetMapping("/getMyPortfolioInfo/{id}")
	public MyPortfolio abc(@PathVariable int id) {
		System.out.println("실행됨");
		System.out.println(portfolioRepository.findByPortfolioId(id));
		return portfolioRepository.findByPortfolioId(id);
	}

	@GetMapping("/getStock/{id}")
	public Stock getStock(@PathVariable Integer id) {
		Stock stock = new Stock();
		stock.setCompanyCode(id);
		stock.setCompanyName("testSTock");
		if (id < 5) {
			stock.setPrice(1500 + id);
		} else {
			stock.setPrice(800 + id);
		}
		return stock;
	}

	@PostMapping("/buySell/{type}")
	public void buySell(@PathVariable String type, @RequestBody BuySellDTO buySellDto) {
		// 포트폴리오 상태 업데이트
		MyPortfolio mp = portfolioRepository.findByPortfolioId(buySellDto.getPotfolioId());
		MyStocks ms = new MyStocks();
		ms.setAmount(buySellDto.getAmount());
		Stock stock = new Stock();
		stock.setCompanyCode(buySellDto.getStockId());
		stock.setCompanyName(buySellDto.getCompanyName());
		// service.getStockNowPrice(stockId) or controller.getStockNowPrice();
		mp.buySell(ms, type);
		
		// getStockNowPrice.getStockId();
		//ms.setStock(stockRepository.getStockByStockId(buySellDto.getStockId()));
		

		stock.setCompanyCode(buySellDto.getStockId());

		/*
		 * if (type == "buy") {
		 * 
		 * } else {
		 * 
		 * } return 1;
		 */
	}

	@GetMapping("/getMonthlyAsset")
	public List<Integer> getMonthlyAsset() {
		List<Integer> list = new ArrayList<>();
		for (int i = 0; i < 7; i++) {
			list.add(i * 100000);
		}
		return list;
	}

	@GetMapping("/getRanking")
	public List<MyPortfolio> getRanking() {
		List<MyPortfolio> list = new ArrayList<>();

		return list;
	}

	@GetMapping("/getAutoCompleteData")
	public List<String> autocomplete() {
		return stockRepository.getAutoCompleteData();
	}

	@GetMapping("/testCode123")
	public String testCode() {
		System.out.println("TextCode1 탐");
		MyPortfolio mp = new MyPortfolio();
		mp.setPId(1);
		MyStocks ms = new MyStocks();
		ms.setAmount(5);
		Stock stock = new Stock();
		stock.setCompanyCode(1);
		stock.setCompanyName("asdf");
		stock.setPrice(1000);
		ms.setStock(stock);
		List<MyStocks> list = new ArrayList<>();
		list.add(ms);
		mp.setStockList(list);

		Stock stock2 = new Stock();
		stock2.setCompanyCode(1);
		stock2.setCompanyName("asdf");
		stock2.setPrice(1300);
		MyStocks ms2 = new MyStocks();
		ms2.setStock(stock2);
		ms2.setAmount(5);
		mp.buySell(ms2, "sell");
		mp.setTotalAsset();
		System.out.println(mp);
		System.out.println("--------------------");
		System.out.println("TextCode1 탐");
		return "asdf";
	}
	
	@GetMapping("/getStockByStockName/{stockname}")
	public Stock getStockIdByStockName(@PathVariable String stockname) {
		System.out.println(stockname);
		Stock stock = new Stock();
		stock.setCompanyCode(1);
		stock.setPrice(1000);
		System.out.println(stock);
		return stock;
	}
	
	@GetMapping("/getTestData")
	public String bcd() {
		String data = dataRestController.abc();
		return data;
	}
	

}
