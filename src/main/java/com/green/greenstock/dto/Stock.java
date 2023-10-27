package com.green.greenstock.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Stock {
	private Integer id;
	private String name;
	private Integer price;
}