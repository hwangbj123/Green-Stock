package com.green.greenstock.dto;

import lombok.Data;

@Data
public class ChattingRoom {
    private int companyCode;
	private String companyName;
    private String type;
    private int userId;
    private int countUser;
}
