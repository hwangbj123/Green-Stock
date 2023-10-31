/**
 * 주식 상세정보 차트 js
 */
 const ctx = document.getElementById('stockDetailchart');
  new Chart(ctx, {
	  type: 'line',
	    data: {
	      labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
	      datasets: [{
	        label: '# of Votes',
	        data: [12, 19, 3, 5, 2, 3],
	      }]
	    },
	    options: {
	      scales: {
	        y: {
	          beginAtZero: true
	        }
	      }
	    }
  });