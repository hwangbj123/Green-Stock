package com.green.greenstock.dto;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain = true)
public class MyPortfolio {
	private Integer pId;
	private Integer userId;
	private String title;
	private String discription;
	private Integer sellMoney;
	private Integer totalAsset;
	private String ror;
	private boolean isVisible;
	private boolean stockExist;
	private List<MyStocks> stockList;

	// 이 메써드를 수행하고나서는 꼭 myPortfolio 를 수정해주자.
	public void buySell(MyStocks mystock, String type) { // type == buy / sell
		this.setStockExist(false);
		int operation = type.equals("buy") ? 1 : -1;

		// 예외처리.
		if (stockList == null) {
			System.out.println("실행됨mp asdf");
			if (type.equals("buy")) {
				this.setStockExist(false);
				List<MyStocks> list = new ArrayList<>();
				list.add(mystock);
				this.stockList = list;
				this.setTotalAsset();
			} else {
				// null sell 은 불가능.
				System.out.println("????????");
			}
		}

		// sell일경우 모두 팔면 remove한다.
		if (type.equals("sell") && stockList != null) {
			// 1. 판매할 것중 match 하는게 있고, amount 또한 일치한다.
			boolean amountMatch = stockList.stream().anyMatch(
					e -> e.getCompanyCode().equals(mystock.getCompanyCode()) && e.getAmount() == mystock.getAmount());
			if (amountMatch) {
				// 목록에서 해당 myStock를 삭제한다.
				stockList.removeIf(e -> e.getCompanyCode().equals(mystock.getCompanyCode())
						&& e.getAmount() == mystock.getAmount());
				this.sellMoney = (int) mystock.getAmount() * mystock.getPrice();
				System.out.println("다 팔렸습니다.");
				this.setStockExist(false);
				setTotalAsset();
			} else {
				stockList.stream().filter(e -> e.getCompanyCode().equals(mystock.getCompanyCode())).forEach(stock -> {
					this.sellMoney += (int) stock.getAmount() * stock.getPrice()
							+ operation * (int) (mystock.getPrice() * mystock.getAmount());
					stock.setAmount( stock.getAmount() - mystock.getAmount());
				});
				
				this.setStockExist(true);
				setTotalAsset();
			}
		} else { // buy
			boolean isMatchingStockExists = stockList.stream()
					.anyMatch(e -> e.getCompanyCode().equals(mystock.getCompanyCode()));

			if (isMatchingStockExists) {
				this.setStockExist(true);
				stockList.stream().filter(e -> e.getCompanyCode().equals(mystock.getCompanyCode())).forEach(e -> {
					// 평균가를 내서 Mystock 배열을 수정.
					e.setPrice(((int) (e.getPrice() * e.getAmount())
							+ operation * (int) (mystock.getPrice() * mystock.getAmount()))
							/ (int) (e.getAmount() + operation * mystock.getAmount()));
					e.setAmount(e.getAmount() + operation * mystock.getAmount());
				});
				this.setTotalAsset();
			} else {
				System.out.println("여기타야됨");
				this.setStockExist(false);
				this.stockList.add(mystock);
				this.setTotalAsset();
			}
			// 수정한 뒤 total Asset 갱신. 샀을때는 상관없을꺼같은데, 팔았을 때는 자산 변동. - 든 + 든
		}

	}

	public void setTotalAsset() {
		Integer asset = 0;
		for (int i = 0; i < this.stockList.size(); i++) {
			asset += (int) this.stockList.get(i).getAmount() * this.stockList.get(i).getPrice();
		}
		if (this.sellMoney != 0) {
			asset += this.sellMoney;
		}
		this.totalAsset = asset;
	}

	public void addStockList(MyStocks stock) {
		this.stockList.add(stock);
	}
	
	public MyStocks getMyStocks(String companyCode) {
		MyStocks myStock = this.stockList.stream()
			    .filter(e -> e.getCompanyCode().equals(companyCode))
			    .findFirst() // 또는 .findAny()
			    .orElse(null);
		System.out.println(myStock);
		return myStock;
	}
	
	public void setror() {
		System.out.println(this.sellMoney);
		System.out.println(this.totalAsset);
		System.out.println((((double)this.sellMoney / (double)this.totalAsset) * 100));
		DecimalFormat df = new DecimalFormat("0.00");
		String formatedData = df.format(((this.sellMoney / this.totalAsset) * 100));
		this.ror =  formatedData + "%";
	}
	
}