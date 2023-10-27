package com.green.greenstock.dto;


import java.text.DecimalFormat;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;
/** 국내주식 현재가 response body 
 * https://apiportal.koreainvestment.com/apiservice/apiservice-domestic-stock-quotations#L_07802512-4f49-4486-91b4-1050b6f5dc9d
 */
@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class DomesticStockCurrentPriceOutput {
	
	private String iscdStatClsCode; // 종목 상태 구분 코드. 00: 그외 51:관리종목	52:투자의견 53:투자경고 54:투자주의	55:신용가능 57:증거금100% 58:거래정지 59:단기과열 
	private String rprsMrktKorName; // 대표 시장 한글 명 
	private String newHgprLwprClsCode; // 신 고가 저가 구분 코드
	private String bstpKorIsnm; // 업종 한글 종목명
	private String stckPrpr; // 주식 현재가
	private String prdyVrss; // 전일 대비
	private String prdyVrssSign; // 전일 대비 부호. 1:상한 2:상승 3:보합 4:하한 5:하락
	private String prdyVrssVolRate; // 전일 대비 거래량 비율. 주식현재가 일자별 API 응답값 사용
	private String stckOprc; // 주식 시가
	private String stckHgpr; // 주식 최고가	
	private String stckLwpr; // 주식 최저가
	private String stckMxpr; // 주식 상한가
	private String stckLlam; // 주식 하한가
	private String stckSdpr; // 주식 기준가
	private String per; // PER
	private String pbr; // PBR
    private String margRate;
    private String tempStopYn;
    private String oprcRangContYn;
    private String clprRangContYn;
    private String crdtAbleYn;
    private String grmnRateClsCode;
    private String elwPblcYn;
    private String prdyCtrt;
    private String acmlTrPbmn;
    private String acmlVol;
    private String wghnAvrgStckPrc;
    private String htsFrgnEhrt;
    private String frgnNtbyQty;
    private String pgtrNtbyQty;
    private String pvtScndDmrsPrc;
    private String pvtFrstDmrsPrc;
    private String pvtPontVal;
    private String pvtFrstDmspPrc;
    private String pvtScndDmspPrc;
    private String dmrsVal;
    private String dmspVal;
    private String cpfn;
    private String rstcWdthPrc;
    private String stckFcam;
    private String stckSspr;
    private String asprUnit;
    private String htsDealQtyUnitVal;
    private String lstnStcn;
    private String htsAvls;
    private String stacMonth;
    private String volTnrt;
    private String eps;
    private String bps;
    private String d250Hgpr;
    private String d250HgprDate;
    private String d250HgprVrssPrprRate;
    private String d250Lwpr;
    private String d250LwprDate;
    private String d250LwprVrssPrprRate;
    private String stckDryyHgpr;
    private String dryyHgprVrssPrprRate;
    private String dryyHgprDate;
    private String stckDryyLwpr;
    private String dryyLwprVrssPrprRate;
    private String dryyLwprDate;
    private String w52Hgpr;
    private String w52HgprVrssPrprCtrt;
    private String w52HgprDate;
    private String w52Lwpr;
    private String w52LwprVrssPrprCtrt;
    private String w52LwprDate;
    private String wholLoanRmndRate;
    private String sstsYn;
    private String stckShrnIscd;
    private String fcamCnnm;
    private String cpfnCnnm;
    private String frgnHldnQty;
    private String viClsCode;
    private String ovtmViClsCode;
    private String lastSstsCntgQty;
    private String invtCafulYn;
    private String mrktWarnClsCode;
    private String shortOverYn;
    private String sltrYn;
    
    public void ss() {
    	String num = "1000000";
    	DecimalFormat dFormat = new DecimalFormat("###,###");
    	dFormat.format(num);
    }
    
}
