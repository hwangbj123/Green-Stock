/**
 * 주식 상세정보 웹소켓 js
 */
let stockWebSocketInit = {
  version: 1,
  receivedData : {},
  init: function () {
    document.getElementById("test").addEventListener("click",  () => {
	  const date = new Date();
	  const hour = date.getHours();
	  const minute = date.getMinutes();
      if(hour >= 15 && minute > 20){
	      return;
	  } 
      this.setupWebSocket();
      setInterval(() => {
		  if(this.receivedData != null){
			this.updateElements(this.receivedData)	  
		  } 
	  },3000); // 3초마다 설정 업데이트
    }); // 버튼 테스트 추후 변경
    // 주기적으로 웹소켓 설정을 업데이트
    
    
  },
  // 웹소켓 설정
  setupWebSocket: async function () {
  
    const companyCode = document.getElementById("companyCode").textContent.trim(); // 종목코드
    const originElements = document.getElementsByClassName("changeElementArray"); // 실시간으로 변화시킬 element
   
    // 웹 소켓키 받기
    await fetch("/stock/approvalKey")
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
	  console.log(data);
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
	    
	    this.receivedData.originElements = originElements;
	    this.receivedData.changeElementArray = changeElementArray;
	    this.receivedData.vrssNum = Number(prdy_vrss_sign);
	    
	    // 3초 마다 갱신
		//this.updateElements(originElements, changeElementArray, Number(prdy_vrss_sign));
	    
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
  updateElements : function ({originElements, changeElementArray, vrssNum}) {
	  const colorClasses = ["primaryColorRed", "primaryColorBlue", "primaryColorNone"];
	   	  for (let i = 0; i < originElements.length; i++){
		  const element = originElements[i];
		  element.classList.remove(...colorClasses);
		  //console.log('ele',i, originElements[i])
		  if (i === 0 || i === 3 || i === 4){
			 
			let colorClass = '';
			if(vrssNum < 3){
			  colorClass = colorClasses[0];
			}else if(vrssNum === 3){
			  colorClass = colorClasses[2];
			}else{
			  colorClass = colorClasses[1];
			}
			
			if(i === 3 && vrssNum < 3){
				const beforeElement = document.createElement('before');
				beforeElement.style.content = '▲'; // 가상 요소 내용 설정
				element.appendChild(beforeElement);
			}
			
			  element.classList.add(colorClass);
      	  }
      	  
      	  if(i == 7) {
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
  },
  
};
stockWebSocketInit.init();
