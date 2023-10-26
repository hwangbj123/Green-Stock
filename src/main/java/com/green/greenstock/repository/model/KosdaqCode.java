package com.green.greenstock.repository.model;

import java.time.LocalDate;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/*
 * https://github.com/koreainvestment/open-trading-api/blob/main/stocks_info/%EC%A2%85%EB%AA%A9%EB%A7%88%EC%8A%A4%ED%84%B0%EC%A0%95%EB%B3%B4(%EC%BD%94%EC%8A%A4%EB%8B%A5).h
 */

@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class KosdaqCode {

	private String mkscShrnIscd;
	private String stndIscd;
	private String htsKorIsnm;
	private String scrtGrpClsCode;
	private int avlsScalClsCode;
	private int bstpLargDivCode;
	private int bstpMedmDivCode;
	private int bstpSmalDivCode;
	private String vntrIssuYn;
	private String lowCurrentYn;
	private String krxIssuYn;
	private String etpProdClsCode;
	private String krx100IssuYn;
	private String krxCarYn;
	private String krxSmcnYn;
	private String krxBioYn;
	private String krxBankYn;
	private String etprUndtObjtCoYn;
	private String krxEnrgChmsYn;
	private String krxStelYn;
	private int shortOverClsCode;
	private String krxMediCmncYn;
	private String krxCnstYn;
	private String invtAlrmYn;
	private String krxScrtYn;
	private String krxShipYn;
	private String krxInsuYn;
	private String krxTrnpYn;
	private String ksq150NmixYn;
	private int stckSdpr;
	private int frmlMrktDealQtyUnit;
	private int ovtmMrktDealQtyUnit;
	private String trhtYn;
	private String sltrYn;
	private String mangIssuYn;
	private int mrktAlrmClsCode;
	private String mrktAlrmRiskAdntYn;
	private String insnPbntYn;
	private String bypsLstnYn;
	private int flngClsCode;
	private int fcamModClsCode;
	private int icicClsCode;
	private int margRate;
	private String crdtAble;
	private int crdtDays;
	private int prdyVol;
	private int stckFcam;
	private LocalDate stckLstnDate;
	private int lstnStcn;
	private int cpfn;
	private int stacMonth;
	private String poPrc;
	private int prstClsCode;
	private String sstsHotYn;
	private String stangeRunupYn;
	private String krx300IssuYn;
	private int saleAccount;
	private int bsopPrfi;
	private int opPrfi;
	private int thtrNtin;
	private int roe;
	private LocalDate baseDate;
	private String prdyAvlsScal;
	private String grpCode;
	private String coCrdtLimtOverYn;
	private String secuLendAbleYn;
	private String stlnAbleYn;


}
