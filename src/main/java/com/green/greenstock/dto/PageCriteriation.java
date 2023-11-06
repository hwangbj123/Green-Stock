package com.green.greenstock.dto;

import lombok.Data;

@Data
public class PageCriteriation {
	private int startPage; //시작페이지   
	private int endPage; //끝페이지

    /* 이전 페이지, 다음 페이지 */
	private boolean prev; 
	private boolean next;
	private int total;//전체 게시물의 수

    /* 현재 페이지, 페이지당 게시물 표시수 정보 */
    private PageCriteriaDto pageCriteriaDto;

    public	PageCriteriation(int total, PageCriteriaDto pageCriteriaDto  ) {
    	System.out.println(total);
        this.total =total;
        this.pageCriteriaDto = pageCriteriaDto;
        this.endPage = (int)Math.ceil((total-1)/10)+1;
        this.prev = pageCriteriaDto.getPage()>10?true:false;	//현재 페이지가 10 이상이면 true
        this.next = pageCriteriaDto.getPage()<endPage-10?true:false;  //end페이지가 10 이상 작으면 true
    }
}

