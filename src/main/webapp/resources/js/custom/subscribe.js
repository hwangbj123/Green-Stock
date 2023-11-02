async function subscribe(roomId, userId){
	var response = await fetch("/subCheck?roomId="+roomId+"&userId="+userId);
	var subRes = await response.json();
	if(subRes==0){
		if(confirm("해당 채널에 구독 되어있지 않습니다. 구독하시겠습니까?")){
			location.href="/subscribe?roomId="+roomId+"&userId="+userId;
		}
	}
}
async function unsubscribe(roomId, userId){
	var response = await fetch("/subCheck?roomId="+roomId+"&userId="+userId);
	var subRes = await response.json();
	console.log("subRes : "+subRes);
	if(subRes!=0){
		if(confirm("해당 채널의 구독을 해제하시겠습니까?")){
			location.href="/un-subscribe?roomId="+roomId+"&userId="+userId;
		}
	}
}