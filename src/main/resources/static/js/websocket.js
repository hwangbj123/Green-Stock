/**
 * 주식 상세정보 웹소켓 js
 */

// 버튼 테스트
const test = document.getElementById('test');

// 웹 소켓키 받아오기
let webSocketKey;

fetch("/stock/approvalKey")
.then(response => response.json())
.then((data)=>{
		webSocketKey = data.webSocketKey;
});

let ping = 0;
let pingpong = 0; // pingpongCount

/** AES256 DECODE IV, KEY 선언*****/
let encryptkey='';
let iv='';

/*** Start	unicode replace step ********************************************************/
const escapable = /[\x00-\x1f\ud800-\udfff\u200c\u2028-\u202f\u2060-\u206f\ufff0-\uffff]/g;
function filterUnicode(quoted)	{
	escapable.lastIndex = 0;
	if (!escapable.test(quoted))	return quoted;

	return quoted.replace (escapable, function(a){
		return '';
	});
}
/** End of unicode replace step ********************************************************/
/** start of aes256Decode function **********************/
function aes256Decode (secretKey, Iv, data)	{
	console.log("");
	console.log("[aes256Decode] : [start]");
	console.log("[Key]  : " + secretKey);
	console.log("[Iv]   : " + Iv);
	console.log("[Data] : " + data);
	
	const cipher = CryptoJS.AES.decrypt (data, CryptoJS.enc.Utf8.parse(secretKey), {
									iv: CryptoJS.enc.Utf8.parse(Iv),
									padding: CryptoJS.pad.Pkcs7,
									mode: CryptoJS.mode.CBC
								});

	aes256DecodeData = cipher.toString(CryptoJS.enc.Utf8);
	console.log("[aes256Decode] : [decode]");
	console.log("[data] : "+aes256DecodeData);
	console.log("");
	return aes256DecodeData;
};
/** end of aes256Decode function **********************/



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
	                           "tr_key":"005930"
	                  }
	         }
	}`;
	// 연결이 열리면
	socket.addEventListener("open", function (event) {
	  //socket.send(data);
	});
	
	// 메시지 수신
	socket.addEventListener("message", function (e) {
	  //console.log("Message from server ", event.data);
	  var recvdata = filterUnicode(e.data);
		console.log ("<<---"+recvdata);
	});
	
	
	
});
  

  