let subscribeInit = {
	version: 1,
	init: function(){},
	subscribe: async function(roomId, userId){
		try {
		    const response = await fetch(`/subCheck?roomId=${roomId}&userId=${userId}`);
		    if (!response.ok) {
		        throw new Error(`HTTP error! Status: ${response.status}`);
		    }
		    const res = await response.json();
            if(res==0){
				if(confirm("해당 채널에 구독 되어있지 않습니다. 구독하시겠습니까?")){
					location.href=`/subscribe?roomId=${roomId}&userId=${userId}`;
				}
			}else{
				if(confirm("해당 채널의 구독을 해제하시겠습니까?")){
				location.href=`/un-subscribe?roomId=${roomId}&userId=${userId}`;
			}
			}
		} catch (error) {
		    console.error("Fetch error:", error);
		}
		
	},
}
subscribeInit.init();