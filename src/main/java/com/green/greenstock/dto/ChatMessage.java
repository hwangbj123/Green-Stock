package com.green.greenstock.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ChatMessage {
    private int roomId;
	private String userId;
    private String content;
    private Date date;
    // 생성자, 게터, 세터 등을 추가하세요.
}