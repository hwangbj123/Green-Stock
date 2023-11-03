let chatInit = {
  version: 1,
  stompClient: null, // stompClient 변수를 chatInit 객체 밖에서 정의하여 전역 변수로 사용합니다.
  init: function() {
    this.scrollToBottom();
    this.connect();
    document.getElementById('send-btn').addEventListener('click', () => {
	  this.sendMessage();
	});
  },

  scrollToBottom: function() {
	message = document.getElementById('chat-messages');
    message.scrollTop = message.scrollHeight;
  },

  connect: function() {
    let roomId = document.getElementById("hd-roomId").value;
    let userName = document.getElementById("hd-userName").value;
    this.stompClient = Stomp.over(new SockJS('/chat'));

    this.stompClient.connect({}, () => {
      this.stompClient.subscribe(`/topic/${roomId}`, function(message) {
        var messageBody = JSON.parse(message.body);
        var messageDate = new Date(messageBody.date);

        let chatMessages = document.getElementById('chat-messages');
		
		if (messageBody.userName == userName) {
		  chatMessages.innerHTML +=
		    '<div class="my-message-user">' +
		    messageBody.userName +
		    '</div>' +
		    '<div class="my-message-div">' +
		    '<div class="message-content">' +
		    messageBody.content +
		    '</div>' +
		    messageDate.getHours() + ":" + messageDate.getMinutes() +
		    '</div>';
		} else {
		  chatMessages.innerHTML +=
		    '<div class="message-user">' +
		    messageBody.userName +
		    '</div>' +
		    '<div class="message-div">' +
		    '<div class="message-content">' +
		    messageBody.content +
		    '</div><p>' +
		    messageDate.getHours() + ":" + messageDate.getMinutes() +
		    '</p></div>';
		}
        chatInit.scrollToBottom();
      });
    });
  },

  sendMessage: async function() {
    let roomId = document.getElementById("hd-roomId").value;
    let userId = document.getElementById("hd-userId").value;
    let userName = document.getElementById("hd-userName").value;
    let message = document.getElementById("message");

    if (message.value.replace(/\s/gi, '').length == 0) {
      message.value = '';
      return false;
    }
    if (/[<>]/.test(message.value)) { // 정규 표현식 패턴 수정
      alert("일부 특수문자는 사용할 수 없습니다.");
      message.value = '';
      return false;
    }

    await this.stompClient.send(`/app/chat/${roomId}`, {}, JSON.stringify({
      userId: userId,
      userName: userName,
      roomId: roomId,
      content: message.value,
      date: new Date()
    }));
    message.value = '';
    message.focus();
  }
};

chatInit.init();