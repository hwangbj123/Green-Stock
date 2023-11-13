<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/adminHeader.jsp"%>
<!-- CONTENT WRAPPER -->
<div class="ec-content-wrapper">
	<div class="content">
		<div class="row">
			<div class="col-xl-8 col-md-12 p-b-15">
				<!-- 유저정보 -->
				<div id="user-acquisition" class="card card-default">
					<div class="card-header">
						<h2>회원 정보</h2>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="responsive-data-table" class="table centered-table">
								<thead>
									<tr>
										<th>이름</th>
										<th>이메일</th>
										<th>휴대전화</th>
										<th>생년월일</th>
										<th>가입일</th>
										<th>정지기간</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="user" items="${userList}">
										<tr>
											<td>${user.userName}</td>
											<td>${user.email}</td>
											<td>${user.tel}</td>
											<td><fmt:formatDate value="${user.birthDate}"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${user.regDate}"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${user.suspensionEndDate}"
													pattern="yyyy-MM-dd" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- End of 유저정보  -->

			<div class="col-xl-4 col-md-12 p-b-15">
				<!-- Doughnut Chart -->
				<div class="card card-default">
					<div class="card-header justify-content-center">
						<h2 style="font-weight: bold">일일 방문자수</h2>
					</div>
					<div class="card-body">
						<canvas id="dailyView"></canvas>
					</div>
					<div class="card-footer d-flex flex-wrap bg-white p-0"></div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xl-8 col-md-12 p-b-15">
				<!-- User activity statistics -->
				<div class="card card-default" id="user-activity">
					<div class="no-gutters">
						<div>
							<div class="card-header justify-content-between">
								<h2>Board List</h2>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="responsive-data-table" class="table centered-table">
										<thead>
											<tr>
												<th style="max-width: 50px;">id</th>
												<th style="max-width: 50px;">cate</th>
												<th style="min-width: 150px;">title</th>
												<th>user</th>
												<th>date</th>
												<th style="max-width: 50px;">views</th>
												<th style="max-width: 50px;">rec</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach var="board" items="${boardList}">
												<tr>
													<td>${board.id}</td>
													<td>${board.categoryId}</td>
													<td><a href="/board/detail?boardId=${board.id}">
															${board.title}</a></td>
													<td>${board.userName}</td>
													<td><fmt:formatDate value="${board.date}"
															pattern="MM-dd HH:mm:ss" /></td>
													<td>${board.views}</td>
													<td>${board.recommand}</td>
												</tr>
											</c:forEach>
											<tr>
												<td colspan="7" style="text-align: center;"><a
													href="/board/list">게시판 더 보기</a></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 							<div class="card-body"> -->
							<!-- 								<div class="tab-content" id="userActivityContent"> -->
							<!-- 									<div class="tab-pane fade show active" id="user" -->
							<!-- 										role="tabpanel"> -->
							<!-- 										<canvas id="activity" class="chartjs"></canvas> -->
							<!-- 									</div> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
							<!-- 							<div class="card-footer d-flex flex-wrap bg-white border-top"> -->
							<!-- 								<a href="#" class="text-uppercase py-3">In-Detail Overview</a> -->
							<!-- 							</div> -->
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-4 col-md-12 p-b-15">
				<div class="card card-default">
					<div class="card-header flex-column align-items-start">
						<h2>월별 구독자 수</h2>
						<input type="hidden" id="months" value="${months}">
						<input type="hidden" id="countSubUserList" value="${countSubUserList}">
					</div>
					<div class="card-body">
						<canvas id="cSubscribe" class="chartjs"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Content -->
</div>
<!-- End Content Wrapper -->
<%@include file="/WEB-INF/view/layout/adminFooter.jsp"%>
<script>

var cUser = document.getElementById("cSubscribe");
var monthsList = document.getElementById("months").value;
var countSubUserListString = document.getElementById("countSubUserList").value;
var modifyMonthList = JSON.parse(monthsList);
var months = modifyMonthList.map(function(item) {
	if (typeof item === 'string') {
        return item.replace(/\[|\]/g, '');
    } else {
        return item + "월";
    }
});
var countSubUserList = JSON.parse(countSubUserListString);
var modifiedCountSubUserList = countSubUserList.map(function(item) {
	if (typeof item === 'string') {
        return item.replace(/\[|\]/g, '');
    } else {
        return item;
    }
});

if (cUser !== null) {
  var myUChart = new Chart(cUser, {
    type: "bar",
    data: {
      labels: [
		months[0],
		months[1],
		months[2],
		months[3],
		months[4],
		months[5],
	  ],
      datasets: [
        {
          label: "구독자",
          data: [modifiedCountSubUserList[0], modifiedCountSubUserList[1], modifiedCountSubUserList[2], modifiedCountSubUserList[3], modifiedCountSubUserList[4], modifiedCountSubUserList[5]],
          backgroundColor: "#88aaf3"
        }
      ]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      legend: {
        display: false
      },
      scales: {
        xAxes: [
          {
            gridLines: {
              drawBorder: true,
              display: false,
            },
            ticks: {
              fontColor: "#8a909d",
              fontFamily: "Roboto, sans-serif",
              display: false, // hide main x-axis line
              beginAtZero: true,
              callback: function(tick, index, array) {
                return index % 2 ? "" : tick;
              }
            },
            barPercentage: 1.8,
            categoryPercentage: 0.2
          }
        ],
        yAxes: [
          {
            gridLines: {
              drawBorder: true,
              display: true,
              color: "#eee",
              zeroLineColor: "#eee"
            },
            ticks: {
              fontColor: "#8a909d",
              fontFamily: "Roboto, sans-serif",
              display: true,
              beginAtZero: true
            }
          }
        ]
      },

      tooltips: {
        mode: "index",
        titleFontColor: "#888",
        bodyFontColor: "#555",
        titleFontSize: 12,
        bodyFontSize: 15,
        backgroundColor: "rgba(256,256,256,0.95)",
        displayColors: true,
        xPadding: 10,
        yPadding: 7,
        borderColor: "rgba(220, 220, 220, 0.9)",
        borderWidth: 2,
        caretSize: 6,
        caretPadding: 5
      }
    }
  });
}

console.log("여기1111111111111111111");
var dailyView = document.getElementById("dailyView");
if (dailyView !== null) {
  var dailyViewData = [
    {
      first: [0, 65, 52, 115, 98, 165, 125],
      second: [45, 38, 100, 87, 152, 187, 85]
    },
    {
      first: [0, 65, 77, 33, 49, 100, 100],
      second: [88, 33, 20, 44, 111, 140, 77]
    },
    {
      first: [0, 40, 77, 55, 33, 116, 50],
      second: [55, 32, 20, 55, 111, 134, 66]
    },
    {
      first: [0, 44, 22, 77, 33, 151, 99],
      second: [60, 32, 120, 55, 19, 134, 88]
    }
  ];

  var config = {
    // The type of chart we want to create
    type: "line",
    // The data for our dataset
    data: {
      labels: [
        "4 Jan",
        "5 Jan",
        "6 Jan",
        "7 Jan",
        "8 Jan",
        "9 Jan",
        "10 Jan"
      ],
      datasets: [
        {
          label: "dailyView",
          backgroundColor: "transparent",
          borderColor: "rgba(82, 136, 255, .8)",
          data: dailyViewData[0].first,
          lineTension: 0,
          pointRadius: 5,
          pointBackgroundColor: "rgba(255,255,255,1)",
          pointHoverBackgroundColor: "rgba(255,255,255,1)",
          pointBorderWidth: 2,
          pointHoverRadius: 7,
          pointHoverBorderWidth: 1
        },
    // Configuration options go here
    options: {
      responsive: true,
      maintainAspectRatio: false,
      legend: {
        display: false
      },
      scales: {
        xAxes: [
          {
            gridLines: {
              display: false,
            },
            ticks: {
              fontColor: "#8a909d", // this here
            },
          }
        ],
        yAxes: [
          {
            gridLines: {
              fontColor: "#8a909d",
              fontFamily: "Roboto, sans-serif",
              display: true,
              color: "#eee",
              zeroLineColor: "#eee"
            },
            ticks: {
              // callback: function(tick, index, array) {
              //   return (index % 2) ? "" : tick;
              // }
              stepSize: 50,
              fontColor: "#8a909d",
              fontFamily: "Roboto, sans-serif"
            }
          }
        ]
      },
      tooltips: {
        mode: "index",
        intersect: false,
        titleFontColor: "#888",
        bodyFontColor: "#555",
        titleFontSize: 12,
        bodyFontSize: 15,
        backgroundColor: "rgba(256,256,256,0.95)",
        displayColors: true,
        xPadding: 10,
        yPadding: 7,
        borderColor: "rgba(220, 220, 220, 0.9)",
        borderWidth: 2,
        caretSize: 6,
        caretPadding: 5
      }
    }
  };

  var ctx = document.getElementById("dailyView").getContext("2d");
  var myLine = new Chart(ctx, config);
  var items = document.querySelectorAll("#user-activity .nav-tabs .nav-item");
  items.forEach(function(item, index){
    item.addEventListener("click", function() {
      config.data.datasets[0].data = activityData[index].first;
      config.data.datasets[1].data = activityData[index].second;
      myLine.update();
    });
  });
}
</script>