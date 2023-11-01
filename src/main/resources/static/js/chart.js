/**
 * 주식 상세정보 차트 js
 */
let chartLabels = [];
let chartData = [];
let labelName = '';
const ctx = document.getElementById('stockDetailchart');
fetch(`/stock/InquireDailyItemChartPrice/${companyCodeStr}`)
	.then(response => response.json())
	.then(data=>{
		//console.log(data);
		for(const i in data.output2){
			chartLabels.unshift(data.output2[i].stck_bsop_date);
			chartData.unshift(data.output2[i].stck_clpr);
		}
		labelName = data.output1.hts_kor_isnm;
		new Chart(ctx, {
			  type: 'line',
			    data: {
			      labels: chartLabels,
			      datasets: [{
			        label: labelName,
			        data: chartData,
			      }]
			    },
			    options: {
			      scales: {
			        y: {
			          beginAtZero: false
			        }
			      },
			      elements:{
					  point:{
						  radius:0
					  }
				  }
			    }
 		 });
		
	});

 
  

  