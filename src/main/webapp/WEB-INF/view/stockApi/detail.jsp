<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file ="/WEB-INF/view/layout/header.jsp" %>
 <!-- CONTENT WRAPPER -->
    <div class="ec-content-wrapper container">
      <div class="content">
        <div class="breadcrumb-wrapper breadcrumb-wrapper-2 typography">
          <h1 class="ec-fw-bold mb-2">${companyName}</h1>
          <p class="breadcrumbs">
            <span><i class="mdi mdi-chevron-right"></i></span>${companyCode}
          </p>
        </div>
        <div class="row mb-4">
          <div class="col-lg-3 col-md-6">
            <h2>${stockCurrentPrice.stckPrpr}</h2>
          </div>
          <div class="col-lg-3 col-md-6">
            <div>
              <h6>전일</h6>
              <p>${stockCurrentPrice.stckSdpr}</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div>
              <h6>고가</h6>
              <p>${stockCurrentPrice.stckHgpr} (상한가 ${stockCurrentPrice.stckMxpr})</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div>
              <h6>거래량(주)</h6>
              <p>${stockCurrentPrice.acmlVol}</p>
            </div>
          </div>
        </div>
        <div class="row mb-4">
          <div class="col-lg-3 col-md-6">
          	<div>
              <h6>전일대비</h6>
              <p>${stockCurrentPrice.prdyVrss} ${stockCurrentPrice.prdyCtrt}</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div>
              <h6>시가</h6>
              <p>${stockCurrentPrice.stckOprc}</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div>
              <h6>저가</h6>
              <p>${stockCurrentPrice.stckLwpr} (하한가 ${stockCurrentPrice.stckLlam})</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div>
              <h6>거래대금</h6>
              <p>${stockCurrentPrice.acmlTrPbmn}</p>
            </div>
          </div>
        </div>
      </div>
      <section class="section ec-category-section section-space-p pb-4 pt-4" id="categories">
        <div class="container">
          <div class="row">
            <!--Category Nav Start -->
            <div class="col-lg-3">
              <ul class="ec-cat-tab-nav nav" role="tablist">
                <li class="cat-item">
                  <a class="cat-link active" data-bs-toggle="tab" href="#tab-cat-1" aria-selected="false" role="tab" tabindex="-1">
                    <div class="cat-desc text-center"><span>투자정보</span></div>
                  </a>
                </li>
                <li class="cat-item">
                  <a class="cat-link" data-bs-toggle="tab" href="#tab-cat-2" aria-selected="false" role="tab" tabindex="-1">
                    <div class="cat-desc"><span>호가10단계</span></div>
                  </a>
                </li>
                <li class="cat-item">
                  <a class="cat-link" data-bs-toggle="tab" href="#tab-cat-3" aria-selected="false" role="tab" tabindex="-1">
                    <div class="cat-desc"><span>Bags</span></div>
                  </a>
                </li>
                <li class="cat-item">
                  <a class="cat-link" data-bs-toggle="tab" href="#tab-cat-4" aria-selected="true" role="tab">
                    <div class="cat-desc"><span>Shoes</span></div>
                  </a>
                </li>
              </ul>
            </div>
            <!-- Category Nav End -->
            <!--Category Tab Start -->
            <div class="col-lg-9">
              <div class="tab-content">
                <!-- 1st Category tab end -->
                <div class="tab-pane fade d-flex active show" id="tab-cat-1" role="tabpanel">
                  <div class="table-responsive">
                    <table class="table table-borederd text-end">
                      <tbody>
                        <tr>
                          <th class="text-start">시가총액</th>
                          <td>${stockCurrentPrice.htsAvls}</td>
                        </tr>
                        <tr>
                          <th class="text-start">시가총액순위</th>
                          <td>hts_avls</td>
                        </tr>
                        <tr>
                          <th class="text-start">상장주식수</th>
                          <td>${stockCurrentPrice.lstnStcn}</td>
                        </tr>
                        <tr>
                          <th class="text-start">외국인보유주식수</th>
                          <td>${stockCurrentPrice.frgnHldnQty}</td>
                        </tr>
                        <tr>
                          <th class="text-start">외국인소진율</th>
                          <td>${stockCurrentPrice.htsFrgnEhrt}</td>
                        </tr>
                        <tr>
                          <th class="text-start">52주 최고 | 최저</th>
                          <td>${stockCurrentPrice.w52Hgpr} | ${stockCurrentPrice.w52Lwpr}</td>
                        </tr>
                        <tr>
                          <th class="text-start">PER | EPS</th>
                          <td>${stockCurrentPrice.per} | ${stockCurrentPrice.eps}</td>
                        </tr>
                        <tr>
                          <th class="text-start">PBR | BPS</th>
                          <td>${stockCurrentPrice.pbr} | ${stockCurrentPrice.bps}</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
                <!-- 1st Category tab end -->
                <div class="tab-pane fade" id="tab-cat-2" role="tabpanel">bbb</div>
                <!-- 2nd Category tab end -->
                <!-- 3rd Category tab start -->
                <div class="tab-pane fade" id="tab-cat-3" role="tabpanel">ccc</div>
                <!-- 3rd Category tab end -->
                <!-- 4th Category tab start -->
                <div class="tab-pane fade" id="tab-cat-4" role="tabpanel">ddd</div>
                <!-- 4th Category tab end -->
              </div>
              <!-- Category Tab End -->
            </div>
          </div>
        </div>
      </section>
      <!-- End Content -->
    </div>
    <!-- End Content Wrapper -->
<%@ include file ="/WEB-INF/view/layout/footer.jsp" %>
