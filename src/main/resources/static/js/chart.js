/**
 * 주식 상세정보 차트 js
 */


const ctx = document.getElementById('stockDetailchart');
const ctx2 = document.getElementById('stockDetailchart2');
const chartDateArray = document.getElementsByClassName('btnChartDate');

for(const ele of chartDateArray){
	
	
	ele.addEventListener('click', function(e){
		
		
		const dateType = e.target.dataset.date;
		console.log(dateType);
		let chartLabels = [];
		let chartData = [];
		let chartData2 = [];
		
		fetch(`/stock/InquireDailyItemChartPrice/${companyCodeStr}/${dateType}`)
		.then(response => response.json())
		.then(data=>{
			//console.log(data);
			for(let i in data.output2){
				chartLabels.unshift(data.output2[i].stck_bsop_date);
				chartData.unshift(data.output2[i].stck_clpr);
				chartData2.unshift(data.output2[i].acml_vol);	
			}
			
			
			
			
			new Chart(ctx, {
				  type: 'line',
				    data: {
				      labels: chartLabels,
				      datasets: [{
				        label: '종가',
				        data: chartData,
				      }]
				    },
				    options: {
						
				      scales: {
						x: {
							ticks:{
								display: false
							} 
				 	  	},
				        y: {
				          beginAtZero: false
				        }
				      },
				      elements:{
						  point:{
							  radius: 2
						  }
					  },
					  plugins:{
	                	legend: {
	                    	display: false
	                  	},
	            	  }
				    }
	 		 });
			new Chart(ctx2, {
				type: 'bar',
				data:{
					labels: chartLabels,
					datasets: [{
						label: '거래량',
						type: 'bar',
						data: chartData2
					}]
				},
				options: {
					 scales: {
						  y: {
							   ticks: { // max: 5,
							    callback : function(value,index,array) {
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
		});
	});
}

function addData(chart, newData) {
    chart.data.datasets.forEach((dataset) => {
        dataset.data.push(newData);
    });
    chart.update();
}
function removeData(chart) {
    chart.data.labels.pop();
    chart.data.datasets.forEach((dataset) => {
        dataset.data.pop();
    });
    chart.update();
}

  