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
import com.green.greenstock.dto.DomesticStockCurrentPriceOutput;
import com.green.greenstock.dto.MyPortfolio;
import com.green.greenstock.dto.MyStocks;
import com.green.greenstock.dto.PortfolioInfoDTO;
import com.green.greenstock.dto.Stock;
import com.green.greenstock.repository.interfaces.MyStocksRepository;
import com.green.greenstock.repository.interfaces.PortfolioRepository;
import com.green.greenstock.repository.interfaces.StockRepository;

@RestController
@RequestMapping("/portfolio")
public class TestRestController2 {

	@Autowired
	private DataRestController dataRestController;

	@Autowired
	private PortfolioRepository portfolioRepository;

	@Autowired
	private StockRepository stockRepository;
	
	@Autowired
	private MyStocksRepository mystocksRepository;

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
	
	@GetMapping("/getAllDataInfo/{id}")
	public PortfolioInfoDTO getAllDataInfo(@PathVariable int id) {
		System.out.println("실행됨");
		System.out.println(portfolioRepository.findByPortfolioId(id));
		return portfolioRepository.findAllDataByPortfolioId(id);
	}

	@GetMapping("/getStock/{id}")
	public Stock getStock(@PathVariable String id) {
		Stock stock = new Stock();
		stock.setCompanyCode(id);
		stock.setCompanyName("testSTock");
		return stock;
	}
	

	@GetMapping("/test")
	public void abc() {
		//000640
		System.out.println(dataRestController.getStockDetailJson("000640").getStckPrpr());
	}
	
	@PostMapping("/buySell/{type}")
	public void buySell(@PathVariable String type, @RequestBody BuySellDTO buySellDto) {
		// 포트폴리오 상태 업데이트
		System.out.println(buySellDto);
		MyPortfolio mp = portfolioRepository.findByPortfolioId(buySellDto.getPortfolioId());
		System.out.println("--------------------");
		
		int price = Integer.parseInt(dataRestController.getStockDetailJson(buySellDto.getStockId().toString()).getStckPrpr());
		System.out.println("--------------------");
		MyStocks ms = new MyStocks();
		ms.setAmount(buySellDto.getAmount());
		Stock stock = new Stock();
		stock.setCompanyCode(buySellDto.getStockId());
		stock.setCompanyName(buySellDto.getCompanyName());
		ms.setPrice(price);
		ms.setStock(stock);
		ms.setPId(buySellDto.getPortfolioId());
		mp.buySell(ms, type);
		portfolioRepository.buySellStock(mp);
		if(type.equals("buy")) {
			if(mp.isStockExist()) {
				System.out.println(mp.isStockExist());
				System.out.println("buy mystockExist");
				mystocksRepository.updateMyStocks(ms);
			}else {
				System.out.println(mp.isStockExist());
				System.out.println("buy myStockDoesntExist");
				mystocksRepository.insertMyStocks(ms);
			}
		}else {
			if(mp.isStockExist()) {
				mystocksRepository.updateMyStocks(ms);
			}else {
				mystocksRepository.deleteMyStocks(ms.getStock().getCompanyCode());
			}
		}
		
		
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

	@PostMapping("/testCode123/{type}")
	public String testCode(@PathVariable String type, @RequestBody MyPortfolio mp) {
		System.out.println("------------------");
		System.out.println(mp);
		System.out.println("------------------");
		if (type.equals("title")) {
			System.out.println("title");
			portfolioRepository.updateTitle(mp);
		} else {
			System.out.println("diss");
			portfolioRepository.updateDiscription(mp);
		}
		return "asdf";
	}

	@GetMapping("/getStockByStockName/{stockname}")
	public Stock getStockIdByStockName(@PathVariable String stockname) {
		Stock stock = stockRepository.getStockByStockName(stockname);
		return stock;
	}

	@GetMapping("/deletePortfolio/{pfId}")
	public int deletePortfolio(@PathVariable int pfId) {
		System.out.println(pfId);
		return portfolioRepository.deleteByPortfolioId(pfId);
	}

	@GetMapping("/getTestData")
	public DomesticStockCurrentPriceOutput bcd() {
		DomesticStockCurrentPriceOutput a = dataRestController.getStockDetailJson("000040");
		System.out.println(a.getStckPrpr());
		return a;
	}

}
