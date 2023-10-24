package com.green.greenstock;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class GreenStockApplication {
	public static void main(String[] args) {
		SpringApplication.run(GreenStockApplication.class, args);
	}

}
