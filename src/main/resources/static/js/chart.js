/**
 * 주식 상세정보 차트 js
 */
const chartInit = {
  version: 1,
  stockDetailChart: null,
  stockDetailChart2: null,
  
  init: function() {
	  
	  
	  
    this.stockDetailChart = this.createChart(document.getElementById('stockDetailchart'), 'line', {
      data: {
        labels: [],
        datasets: [{ label: '', data: [] }]
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

    this.stockDetailChart2 = this.createChart(document.getElementById('stockDetailchart2'), 'bar', {
      data: {
        labels: [],
        datasets: [{ label: '', data: [] }]
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

    const chartDateButtons = document.getElementsByClassName('btnChartDate');
    Array.from(chartDateButtons).forEach(button =>
      button.addEventListener('click', this.handleChartButtonClick.bind(this))
    );
    this.handleChartButtonClick();
  },
  
  createChart: function(context, type, options) {
    return new Chart(context, { type, ...options });
  },
  
  handleChartButtonClick: async function(event) {
    const dateType = event.target.dataset.date || 'week';
    const companyCode = document.getElementById('companyCode').textContent.trim();
    await this.fetchAndUpdateChartData(companyCode, dateType);
  },
  
  fetchAndUpdateChartData: async function(companyCode, dateType) {
    try {
      const response = await fetch(`/stock/InquireDailyItemChartPrice/${companyCode}/${dateType}`);
      const { output2 } = await response.json();
      const chartLabels = output2.map(item => item.stck_bsop_date);
      const chartData = output2.map(item => item.stck_clpr);
      const chartData2 = output2.map(item => item.acml_vol);
      this.updateChart(this.stockDetailChart, chartLabels, chartData, '종가');
      this.updateChart(this.stockDetailChart2, chartLabels, chartData2, '거래량');
    } catch (error) {
      console.error('Error fetching chart data:', error);
    }
  },
  
  updateChart: function(chart, labels, data, label) {
    chart.data.labels = labels;
    chart.data.datasets[0].label = label;
    chart.data.datasets[0].data = data;
    chart.update();
  }
};

chartInit.init();
