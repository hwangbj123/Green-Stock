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
const test = document.getElementById('test');
test.addEventListener('click', function(){
	// WebSocket 연결 생성
	const socket = new WebSocket("ws://ops.koreainvestment.com:21000/tryitout/H0STCNT0");
	const data = `{
	         "header":
	         {
	                  "approval_key": "267dacce-5260-48d4-a39e-f9a9f73c6acf",
	                  "custtype":"P",
	                  "tr_type":"1",
	                  "content-type":"utf-8"
	         },
	         "body":
	         {
	                  "input":
	                  {
	                           "tr_id":"H0STCNT0",
	                           "tr_key":"005930"
	                  }
	         }
	}`;
	// 연결이 열리면
	socket.addEventListener("open", function (event) {
	  socket.send(data);
	});
	
	// 메시지 수신
	socket.addEventListener("message", function (event) {
	  console.log("Message from server ", event.data);
	  console.log(event.data);
	  console.log("output ", event.data.output);
	});
	
});
  

  