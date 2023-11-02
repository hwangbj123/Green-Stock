$(function(){
   	function scrollToBottom(){
   		$('#chat-messages').scrollTop($('#chat-messages')[0].scrollHeight);
   	}
	//     	----------------------------------- STOMP
	scrollToBottom();
	var roomId = $("#hd-roomId").val();
	var userId = $("#hd-userId").val();
	var userName = $("#hd-userName").val();
	var stompClient = Stomp.over(new SockJS('/chat'));
    stompClient.connect({}, function (frame) {
        stompClient.subscribe('/topic/'+roomId, function (message) {
            var messageBody = JSON.parse(message.body);
			var messageDate = new Date(messageBody.date);
            if (messageBody.userName==userName){
				$('#chat-messages').append(
						'<div class="my-message-user">'
		    				+messageBody.userName
		    			+'</div>'
						+'<div class="my-message-div">'
		    			+'<div class="message-content">'
		    				+messageBody.content
		    			+'</div>'
		    				+messageDate.getHours()+":"+messageDate.getMinutes()
		    			+'</div>'
						);
            } else{
				$('#chat-messages').append(
						'<div class="message-user">'
		    				+messageBody.userName
		    			+'</div>'
						+'<div class="message-div">'
		    			+'<div class="message-content">'
		    				+messageBody.content
		    			+'</div><p>'
		    				+messageDate.getHours()+":"+messageDate.getMinutes()
		    			+'</p></div>'
						);
            }
			scrollToBottom();
        });
    });

    $('#chat-form').on('submit', function (e) {
    	
    	if($('#message').val().replace(/\s/gi, '').length==0){
    		$('#message').val('');
    		return false;
    	}
    	if(/<|>/.test($('#message').val())){
    		$('#message').val('');
    		return false;
    	}
    	
        e.preventDefault();
        var message = $('#message').val();

        stompClient.send("/app/chat/" + roomId, {}, JSON.stringify({
        	userId: userId,
        	userName: userName,
            roomId: roomId,
            content: message,
            date: new Date()
        }));
        $('#message').val(''); // 채팅 입력 창을 초기화
    });
});