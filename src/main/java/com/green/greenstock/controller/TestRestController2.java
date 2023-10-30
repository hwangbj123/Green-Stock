package com.green.greenstock.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.green.greenstock.dto.MyPortfolio;
import com.green.greenstock.dto.MyStocks;
import com.green.greenstock.dto.Stock;

@RestController
@RequestMapping("/portfolio")
public class TestRestController2 {
	
	@GetMapping("/getMyPortfolioList")
	public List<MyPortfolio> test() {
		List<MyPortfolio> list = new ArrayList<>();
		for(int i = 0; i < 3; i ++) {
			MyPortfolio mp = new MyPortfolio();
			mp.setId(i + 1);
			mp.setTitle("asdf");
			mp.setDiscription("abcde");
			list.add(mp);
		}
		return list;
	}
	
	@PostMapping("/postExample")
	public void postExample(@RequestBody MyPortfolio pf) {
		// pf null 처리 해야됨.
		System.out.println(pf.toString());
	}
	
	@GetMapping("/getMyPortfolioInfo/{id}")
	public MyPortfolio abc(@PathVariable int id) {
		List<Stock> list = new ArrayList<>();
		for (int i = 1; i < 11; i++) {
			Stock stock = new Stock();
			stock.setId(i);
			stock.setName("name" + i);
			stock.setPrice(1000);
			list.add(stock);
		}
		List<MyStocks> myStockList = new ArrayList<>();
		double tempAmmount = 1.1;
		for(Stock stock : list) {
			MyStocks mystock = new MyStocks();
			mystock.setAmount(tempAmmount);
			mystock.setStock(stock);
			myStockList.add(mystock);
			tempAmmount = tempAmmount + 1.1;
		}
		
		System.out.println(myStockList.toString());
		MyPortfolio pf = new MyPortfolio()
				.builder()
				.id(id)
				.discription("discription")
				.title("abcde")
				.stockList(myStockList)
				.build();
		return pf;
	}
}
