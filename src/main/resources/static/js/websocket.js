/**
 * 주식 상세정보 웹소켓 js
 */
let stockWebSocketInit = {
  version: 1,
  init: function () {
    document.getElementById("test").addEventListener("click", () => {
      this.setupWebSocket();
   
    }); // 버튼 테스트 추후 변경
    
  },
  
  // 웹소켓 설정
  setupWebSocket: function () {
    const companyCode = document.getElementById("companyCode").textContent.trim(); // 종목코드
    const originElements = document.getElementsByClassName("changeElementArray"); // 실시간으로 변화시킬 element
   
    // 웹 소켓키 받기
    fetch("/stock/approvalKey")
      .then((response) => response.json())
      .then(({webSocketKey}) => {
        const socket = new WebSocket("ws://ops.koreainvestment.com:21000/"); // WebSocket 연결 생성
 		// 연결 성공
        socket.addEventListener("open", () => {
          socket.send(this.createInitialData(companyCode, webSocketKey));
        });
        // 메시지 수신
        socket.addEventListener("message", (event) => {
		  this.handleWebSocketMessage(event, originElements);
        });
        socket.addEventListener("close", () => {
		  console.log("WebSocket connection closed");
        });
        
      });
  },
  
  // 초기 데이터 생성
  createInitialData: function(companyCode, webSocketKey){
	  return JSON.stringify({
		  header : {
			  approval_key : webSocketKey,
			  custtype : "P",
			  tr_type : "1",
			  "content-type" : "utf-8",
		  },
		  body :{
			  input:{
				  tr_id : "H0STCNT0",
				  tr_key : companyCode
			  }
		  }
	  });
  },
  
  // 웹소켓 메시지 파싱
  handleWebSocketMessage : function (event, originElements) {
	  const data = event.data;
  	if (data[0] === "0" || data[0] === "1") {
		const strArray = data.split("|"); // | 로 나누기
	    const trid = strArray[1]; // 2번째 값 trid
	    let bodydata = strArray[3]; // 4번째 부터 body
	    const strResult = bodydata.split("^"); // ^ 로 나누기
	    let prdy_vrss_sign = strResult[3]; // 전일 대비 부호
	
	    // 현재가 고가 거래량 전일대비 등락률 시가 저가 거래대금(백만)
	    const changeElementArray = [
	      strResult[2],
	      strResult[8],
	      strResult[13],
	      strResult[4],
	      strResult[5],
	      strResult[7],
	      strResult[9],
	      strResult[14],
	    ];
	    
	    this.updateElements(originElements, changeElementArray, prdy_vrss_sign);
	    
	  }
	 /* else 
		{
			if (JSON.parse(data).header.tr_id == 'PINGPONG'){
			
			}
			// 통신이 실패하거나 장마감시간이거나 정상적인 데이터가 오지 않을때 
			console.log('CONNECT CLOSE');
			console.log(e.data);
			socket.close();
		}*/
	  
  },

  // 엘리먼트 변경
  updateElements : function (originElements, changeElementArray, vrssNum) {
	  const colorClasses = ["primaryColorRed", "primaryColorBlue", "primaryColorNone"];
	  
	  for (let i = 0; i< originElements.length; i++){
		  const element = originElements[i];
		  element.classList.remove(...colorClasses);
		  
		  if (i === 2 || i === 4 || i === 5){
			let colorClass = '';
			if(vrssNum < 3){
			  colorClass = colorClasses[0];
			}
			  colorClass = vrssNum === 3 ? colorClasses[2] : colorClasses[1];
			element.classList.add(colorClass);			  
      	  }
      	  
      	  if(i === 7) {
			const acmlTrPbmn = Number(changeElementArray[i]);
			if (acmlTrPbmn > 1000000){
			  element.textContent = Math.ceil(acmlTrPbmn / 1000000).toLocaleString();
			} else {
			  element.textContent = Number(acmlTrPbmn).toLocaleString();
			}	
		  } else {
			element.textContent = Number(changeElementArray[i]).toLocaleString();
		  }
	    }
  }
};
stockWebSocketInit.init();
