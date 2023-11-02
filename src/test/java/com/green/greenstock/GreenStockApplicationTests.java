package com.green.greenstock;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

<<<<<<< HEAD
import com.green.greenstock.service.PortfolioService;
=======
import com.green.greenstock.dto.Pagination;
import com.green.greenstock.dto.PagingDto;
>>>>>>> 41fe3097fe1e19d395bcf4af1c04083e6210fac1

@SpringBootTest
class GreenStockApplicationTests {
	

<<<<<<< HEAD
	@Autowired
	PortfolioService portfolioService;
=======

	private int endPage;
	private int countData;

>>>>>>> 41fe3097fe1e19d395bcf4af1c04083e6210fac1
	
	@Test
	void contextLoads() {		
		PagingDto pagingDto = new PagingDto( );
		pagingDto.getPage();
		int result = pagingDto.getRecordSize();
		System.out.println(result);
		Pagination pagination =  new Pagination(1,  pagingDto);
		pagination.getEndPage();
		PagingDto result2 = pagination.getPaging();
		this.endPage = (int) Math.ceil(countData/10 )+1;
	}
}
