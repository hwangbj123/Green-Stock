package com.green.greenstock.repository.model;

import java.util.Date;

import lombok.Data;

@Data
public class Pay {
	//요청 고유번호
	private String aid;
	//결제 고유번호
	private String tid;
	//가맹점 코드
	private String cid;
	//정기결제용 ID
	private String sid;
	//결제 총액
	private int amountTotal;
	private Date created_at;
	//결제 승인 시각
	private Date approved_at;
	private int userId;
}
