/**
 * 주식 상세정보 차트 js
 */
const ctx = document.getElementById('stockDetailchart'); // 주식 종가 라인 차트
const ctx2 = document.getElementById('stockDetailchart2'); // 주식 거래량 바 차트
const chartLine = new Chart(ctx, 
						{
						  type: 'line', // 차트 타입
						    data: {
						      labels: [], // x축 데이터
						      datasets: [{
						        label: '', // 라벨(데이터)의 이름
						        data: [], // 데이터
						      }]
						    },
						    options: {
						      scales: {
							  	x: {
								  	ticks:{
								  		display: false // x축 labels 보이지 않게 하기
						            } 
				           	  	},
						        y: {
						          beginAtZero: false // y축 0부터 시작하지 않기 (default true)
						        }
						      },
						      elements:{
						          point:{
						          radius: 2 // 자동으로 찍히는 포인트의 원의 크기
						          }
						      },
						      plugins:{
						        legend: {
						            display: false // label 이름 보이지 않게 하기
						          },
						      }
						    }
						});
const chartBar = new Chart(ctx2, 
				{
				    type: 'bar',
				    data:{
				        labels: [],
				        datasets: [{
				            label: '',
				            data: []
				        }]
				    },
				    options: {
				        scales: {
				            y: {
				                ticks: {  
				                    callback : function(value) { // 만, 억 단위 표시하여 y축 길이 줄이기
				                        if(value.toString().length > 9 && value != 0) return (Math.floor(value / 100000000)).toLocaleString("ko-KR") + "억";
				                        else if(value.toString().length == 9 && value != 0) return (value / 100000000).toFixed(1) + "억";
				                        else if(value.toString().length > 6 && value != 0) return (Math.floor(value / 10000)).toLocaleString("ko-KR") + "만";
				                        else if(value.toString().length == 6 && value != 0) return (value / 10000).toFixed(1) + "만";
				                        else return value.toLocaleString("ko-KR");
				                    }
				                   }
				            } 
				        },
				        plugins:{
				            legend: {
				                display: false
				              },
				        }
				    }
				});

let chartInit = {
	
    version : 1,
    init: function(){
        const chartDateArray = document.getElementsByClassName('btnChartDate'); // 차트 버튼 3개 배열[주,월,연]
        // 배열로 가져온 버튼에 이벤트 달기
        for(const ele of chartDateArray){
            ele.addEventListener('click', (e) => {
                this.getChartData(e);
            });
        }// event end;
    }, // init end
    getChartData: function(e){
        const dateType = e.target.dataset.date; // data-date 로 지정한 데이터 가져오기('week', 'month', 'year')
        const companyCode = document.getElementById('companyCode'); // 종목코드
		const companyCodeStr = companyCode.textContent.trim();
        // 데이터를 담을 배열들 생성
        let chartLabels = [];
        let chartData = [];
        let chartData2 = [];
        
        // fetchAPI companyCodeStr : 종목코드명, dateType : 날짜타입
        fetch(`/stock/InquireDailyItemChartPrice/${companyCodeStr}/${dateType}`)
        .then(response => response.json())
        .then(data=>{
            //console.log(data);
            for(let i in data.output2){ // output2에 날짜별 데이터가 배열로 담겨있음.
                // unshift 데이터가 최신날짜부터 오므로 배열의 현재데이터의 맨 앞에 넣도록 해주는 함수
                chartLabels.unshift(data.output2[i].stck_bsop_date);  // 기준 날짜
                chartData.unshift(data.output2[i].stck_clpr); // 주식 종가
                chartData2.unshift(data.output2[i].acml_vol); // 거래량
            }
            this.update(chartLine, 0, chartLabels, chartData, '종가');
            this.update(chartBar, 0, chartLabels, chartData2, '거래량');
        });
    },

    // 차트를 업데이트 해주는 함수 
    // chart는 위에서 canvas의 id를 가져온 element, 
    // index는 하나의 영역에 여러개의 차트를 그릴수 있으므로 그 주소값(0부터 시작),
    // labes는 x축 데이터(배열, ex 날짜)
    // data는 x축 기준의 데이터(배열)
    // label은 데이터의 이름(String 으로 지정가능)
    update : function(chart, index, labels, data, label){
        chart.data.datasets[index].label = label;
        chart.data.datasets[index].data = data;
        chart.data.labels = labels;
        chart.update(); // 내장된 update() 로 차트가 업데이트 됨
    }
}
chartInit.init();