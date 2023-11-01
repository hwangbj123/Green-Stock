/**
 * 주식 상세정보 웹소켓 js
 */

// 버튼 테스트
const test = document.getElementById('test');
// 실시간으로 변화시킬 element
const changeElementArray = document.getElementsByClassName('changeElementArray');

// 글자색깔 변화
//const stckPrpr = document.getElementById('stckPrpr'); // 현재가
//const prdyVrss = document.getElementById('prdyVrss'); // 전일 대비
//const prdyCtrt = document.getElementById('prdyCtrt');// 전일 대비율
//const elementArray = [prdyVrss, prdyVrss, prdyCtrt];
/*elementArray.push(stckPrpr);
elementArray.push(prdyVrss);
elementArray.push(prdyCtrt);*/




// comapnyCode

//console.log(companyCodeStr);
// 웹 소켓키 받아오기
let webSocketKey;

fetch("/stock/approvalKey")
.then(response => response.json())
.then((data)=>{
		webSocketKey = data.webSocketKey;
		//console.log(webSocketKey);
});


// 이벤트 발생

test.addEventListener('click', function(){
	
	// WebSocket 연결 생성
	const socket = new WebSocket("ws://ops.koreainvestment.com:21000/");
	
	const data = `{
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
	socket.addEventListener("open", function (e) {
	  socket.send(data);
	});
	
	// 메시지 수신
	socket.addEventListener("message", function (e) {
	  //console.log("Message from server ", e.data);
	    console.log('PING'); // 통신 중이면 표시
	    console.log(e.data);
	    if(e.data[0] === 0 || e.data[0] === 1){
			const strArray = e.data.split('|'); // | 로 나누기
			const trid = strArray[1]; // 2번째 값 trid
			let bodydata = strArray[3]; // 4번째 부터 body
	    	const strResult = bodydata.split('^'); // ^ 로 나누기
	    	let prdy_vrss_sign = strResult[3]; // 전일 대비 부호
	    	
	    	// 현재가 고가 거래량 전일대비 등락률 시가 저가 거래대금(백만)
	    	const changeElementArray = [
				strResult[2], strResult[8],strResult[13], strResult[4],	
				strResult[5], strResult[7], strResult[9], strResult[14]
			];
	    	//convertClassByIdArray(elementArray, prdy_vrss_sign); // 현재가격 전일대비 글자 색상 변경
	    	// 현재가
	    	//let stck_prpr = strResult[2]; 
	    	//let stck_prpr_num = Number(stck_prpr);
	    	//stckPrpr.textContent = stck_prpr_num.toLocaleString();
	    	// 전일대비
	    	
	    	// 글자 색깔 바꿀 리스트 생성
	    	let elementColorArray = [];
	    	
	    	for(const i in changeDataArray){
				if(i === 2 || i === 4 || i === 5){
					elementColorArray.push(changeElementArray[i]);
				}
				if(i === 7){
					const acmlTrPbmn = Number(changeElementArray[i])
					if(acmlTrPbmn > 1000000){
						changeElementArray[i].textContent = Math.ceil(Number(changeElementArray[i]) / 1000000);
						continue;	
					}
				}
				changeElementArray[i].textContent = Number(changeElementArray[i]).toLocaleString();
			}
			convertClassByIdArray(elementColorArray, prdy_vrss_sign);
		}else{
			// 통신이 실패하거나 정상적인 데이터가 오지 않는다면
			console.log(e.data);
			console.log('CONNECT CLOSE');
			socket.close();
		}
	});
});

function convertClassByIdArray(elementArray, vrssNum){
	for(const ele of elementArray){
		ele.classList.remove('primaryColorRed','primaryColorBlue','primaryColorNone');
		if(vrssNum < 3){
			ele.classList.add('primaryColorRed');
		}else if(vrssNum === 3){
			ele.classList.add('primaryColorNone');			
		}else if(vrssNum > 3){
			ele.classList.add('primaryColorBlue');
		}	
	}
}