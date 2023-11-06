let subscribeInit = {
	version: 1,
	init: function(){},
	subscribe: async function(companyCode, userId){
		try {
		    const response = await fetch(`/subCheck?companyCode=${companyCode}&userId=${userId}`);
		    if (!response.ok) {
		        throw new Error(`HTTP error! Status: ${response.status}`);
		    }
		    const res = await response.json();
            if(res==0){
				if(confirm("해당 채널에 구독 되어있지 않습니다. 구독하시겠습니까?")){
					location.href=`/subscribe?companyCode=${companyCode}&userId=${userId}`;
				}
			}else{
				if(confirm("해당 채널의 구독을 해제하시겠습니까?")){
				location.href=`/un-subscribe?companyCode=${companyCode}&userId=${userId}`;
			}
			}
		} catch (error) {
		    console.error("Fetch error:", error);
		}
		
	},
}
subscribeInit.init();