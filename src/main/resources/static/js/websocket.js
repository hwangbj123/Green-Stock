/**
 * 주식 상세정보 웹소켓 js
 */
let stockWebSocketInit = {
  version: 1,
  init: function () {
    document.getElementById("test").addEventListener("click", () => {
		   console.log(1);
      this.getWebSocketData();
   
    }); // 버튼 테스트 추후 변경
    
  },
  getWebSocketData: function () {
    const companyCode = document.getElementById("companyCode"); // 종목코드
    const companyCodeStr = companyCode.textContent.trim();
    const originElementArray = document.getElementsByClassName("changeElementArray"); // 실시간으로 변화시킬 element
    // 웹 소켓키 받아오기
    fetch("/stock/approvalKey")
      .then((response) => response.json())
      .then((data) => {
        let webSocketKey = data.webSocketKey;
		
        // WebSocket 연결 생성
        const socket = new WebSocket("ws://ops.koreainvestment.com:21000/");

        const initSendData = `{
	         "header":
	         {
	                  "approval_key": "${webSocketKey}",
	                  "custtype":"P",
	                  "tr_type":"1",
	                  "content-type":"utf-8"
	         },
	         "body":
	         {
	                  "input":
	                  {
	                           "tr_id":"H0STCNT0",
	                           "tr_key":"${companyCodeStr}"
	                  }
	         }
	    }`;

        // 연결이 열리면
        socket.addEventListener("open", function () {
          socket.send(initSendData);
        });

        // 메시지 수신
        socket.addEventListener("message", function (e) {
          console.log(e.data);

          if (e.data[0] == 0 || e.data[0] == 1) {
            const strArray = e.data.split("|"); // | 로 나누기
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
            // 글자 색깔 바꿀 리스트 생성
            let elementColorArray = [];

            for (const i in changeElementArray) {
              if (i == 2 || i == 4 || i == 5) {
                // 색깔도 바꿔야할 인덱스
                elementColorArray.push(originElementArray[i]);
              }
              if (i == 7) {
                // 백만단위 표시하기
                const acmlTrPbmn = Number(changeElementArray[i]);
                if (acmlTrPbmn > 1000000) {
                  originElementArray[i].textContent = Math.ceil(
                    Number(changeElementArray[i]) / 1000000
                  ).toLocaleString();
                  continue;
                }
              }
              originElementArray[i].textContent = Number(changeElementArray[i]).toLocaleString(); // 천단위 콤마 찍기
            }
            convertClassByIdArray(elementColorArray, prdy_vrss_sign);
          }
          else 
		{
			if(JSON.parse(data).header.tr_id == 'PINGPONG'){
				
			}
			// 통신이 실패하거나 장마감시간이거나 정상적인 데이터가 오지 않을때 
			console.log('CONNECT CLOSE');
			console.log(e.data);
			socket.close();
		}
        });
      });
  },

  convertClassByIdArray: function (elementArray, vrssNum) {
    for (const ele of elementArray) {
      ele.classList.remove("primaryColorRed", "primaryColorBlue", "primaryColorNone");
      if (vrssNum < 3) {
        ele.classList.add("primaryColorRed");
      } else if (vrssNum === 3) {
        ele.classList.add("primaryColorNone");
      } else if (vrssNum > 3) {
        ele.classList.add("primaryColorBlue");
      }
    }
  },
};
stockWebSocketInit.init();
