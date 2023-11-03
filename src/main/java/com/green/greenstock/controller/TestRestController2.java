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
import com.green.greenstock.dto.TradeLogDTO;
import com.green.greenstock.repository.interfaces.MyStocksRepository;
import com.green.greenstock.repository.interfaces.PortfolioRepository;
import com.green.greenstock.repository.interfaces.StockRepository;
import com.green.greenstock.repository.interfaces.TradeRepository;
import com.green.greenstock.service.PortfolioService;

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
	
	@Autowired
	private PortfolioService portfolioService;
	
	@Autowired
	private TradeRepository tradeRepository;

	@GetMapping("/getMyPortfolioList/{id}")
	public List<MyPortfolio> test(@PathVariable int id) {
		List<MyPortfolio> list = portfolioRepository.findByuserId(id);
		return list;
	}
	
	@GetMapping("/getUserid")
	public int getUserId() {
		return 1;
	}

	@PostMapping("/addPortfolio")
	public int postExample(@RequestBody MyPortfolio pf) {
		// pf null 처리 해야됨.
		portfolioRepository.savePortfolio(pf, 1);
		return 1;
	}

	@GetMapping("/getMyPortfolioInfo/{id}")
	public MyPortfolio abc(@PathVariable int id) {
		System.out.println("실행됨");
		System.out.println(portfolioRepository.findByPortfolioId(id));
		return portfolioRepository.findByPortfolioId(id);
	}

	@GetMapping("/getStock/{id}")
	public Stock getStock(@PathVariable String id) {
		Stock stock = new Stock();
		stock.setCompanyCode(id);
		stock.setCompanyName("testSTock");
		return stock;
	}
	
	// companyCode 로 현재가를 구한다.
	@GetMapping("/getNowPrice/{companyCode}")
	public int getNowPrice(@PathVariable String companyCode) {
		return Integer.parseInt(dataRestController.getStockDetailJson(companyCode).getStckPrpr());
	}
	
	
	// MyStock 정보 세팅용
	@GetMapping("/getAllDataInfo/{id}")
	public MyPortfolio getAllDataInfo(@PathVariable int id) {
		MyPortfolio mp = portfolioService.findAllDatasByPortfolioId(id);
		mp.setStockList(mystocksRepository.findMyStocksByPortfolioId(mp.getPId()));
		return mp;
	}
	
	@PostMapping("/buySell/{type}")
	public int buySell(@PathVariable String type, @RequestBody BuySellDTO buySellDto) {
		// 포트폴리오 상태 업데이트
		System.out.println(buySellDto);
		MyPortfolio mp = portfolioRepository.findByPortfolioId(buySellDto.getPortfolioId());
		System.out.println(mp);
		// List<MyStocks> 을 set하는 과정이 없다 지금.
		mp.setStockList(mystocksRepository.findMyStocksByPortfolioId(mp.getPId()));
		System.out.println(mp);
		System.out.println("--------------------");
		
		int price = Integer.parseInt(dataRestController.getStockDetailJson(buySellDto.getStockId()).getStckPrpr());
		System.out.println("--------------------");
		MyStocks ms = new MyStocks();
		ms.setAmount(buySellDto.getAmount());
		Stock stock = new Stock();
		stock.setCompanyCode(buySellDto.getStockId());
		stock.setCompanyName(buySellDto.getCompanyName());
		ms.setPrice(price);
		ms.setCompanyCode(stock.getCompanyCode());
		ms.setCompanyName(stock.getCompanyName());
		ms.setPId(buySellDto.getPortfolioId());
		mp.buySell(ms, type);
		mp.setror();
		System.out.println(mp);
		System.out.println("--------------");
		portfolioRepository.buySellStock(mp);
		TradeLogDTO td = new TradeLogDTO();
		td.setPId(ms.getPId());
		td.setAmount(ms.getAmount());
		td.setPrice(ms.getPrice());
		td.setQuantity(ms.getAmount() * ms.getPrice());
		td.setStockCode(ms.getCompanyCode());
		td.setStockName(ms.getCompanyName());
		td.setTradeType(type);
		tradeRepository.insertTradeLog(td);
		
		if(type.equals("buy")) {
			if(mp.isStockExist()) {
				System.out.println(mp.isStockExist());
				System.out.println("buy mystockExist");
				mystocksRepository.updateMyStocks(mp.getMyStocks(ms.getCompanyCode()));
			}else {
				System.out.println(mp.isStockExist());
				System.out.println("buy myStockDoesntExist");
				mystocksRepository.insertMyStocks(ms);
			}
		}else {
			if(mp.isStockExist()) {
				System.out.println(mp.isStockExist());
				System.out.println("stockExist");
				System.out.println(mp.getMyStocks(ms.getCompanyCode()));
				mystocksRepository.updateMyStocks(mp.getMyStocks(ms.getCompanyCode()));
			}else {
				System.out.println(mp.isStockExist());
				System.out.println("stockDoesn'tExist");
				mystocksRepository.deleteMyStocks(ms.getCompanyCode());
			}
		}
		return 1;
	}

	@GetMapping("/getMonthlyAsset")
	public List<Integer> getMonthlyAsset() {
		List<Integer> list = new ArrayList<>();
		for (int i = 0; i < 7; i++) {
			list.add(i * 100000);
		}
		return list;
	}


	// 자동완성 -------------------------------------------------------
	@GetMapping("/getAutoCompleteData")
	public List<String> autocomplete() {
		return stockRepository.getAutoCompleteData();
	}

	@GetMapping("/updateVisible/{pid}")
	public int updateVisible(@PathVariable int pid) {
		MyPortfolio mp = portfolioRepository.findByPortfolioId(pid);
		if(mp.isVisible()) {
			System.out.println("asdf");
			System.out.println(mp.isVisible());
			mp.setVisible(false);
		}else {
			System.out.println(mp.isVisible());
			mp.setVisible(true);
		}
		return portfolioRepository.updateVisibility(mp);
	}
	
	
	// test용----------------------------------------------------------
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
	
	@GetMapping("/getTradeLog/{pid}")
	public List<TradeLogDTO> getTradeLog(@PathVariable int pid){
		List<TradeLogDTO> list = tradeRepository.findAllTradeLogByPortfolioId(pid);
		list.forEach(e -> {
			e.setDateTime();
		});
		return list;
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
	public void bcd() {
		MyPortfolio mp = portfolioService.findAllDatasByPortfolioId(3);
		mp.setStockList(mystocksRepository.findMyStocksByPortfolioId(mp.getPId()));
		
		System.out.println(mp);
	}
	
	@GetMapping("/getRanking")
	public List<MyPortfolio> getRanking() {
		return portfolioRepository.findAllPortfolioDescRor();
	}

}
