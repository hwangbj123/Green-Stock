package com.green.greenstock.dto;

import lombok.Data;

@Data
public class PageCriteriaDto {
    private int page;  // 현재 페이지 번호 
    private int perPage;  // 페이지 사이즈

	public int getOffset() {
        return (page - 1) * perPage; // 데이터베이스에서 조회할 때 사용할 오프셋을 계산
    }

   public PageCriteriaDto() {
        this.page = 1;	//페이지 번호 
        this.perPage = 10; // 페이지 사이즈       
    }
   
   
}
