let chatInit = {
  version: 1,
  stompClient: null, // stompClient 변수를 chatInit 객체 밖에서 정의하여 전역 변수로 사용합니다.

  init: function() {
    this.scrollToBottom();
    this.connect();
    $('#chat-form').on('submit', (e) => {
      e.preventDefault(); // e.preventDefault()를 여기서 호출해야 합니다.
      this.send();
    });
  },

  scrollToBottom: function() {
    $('#chat-messages').scrollTop($('#chat-messages')[0].scrollHeight);
  },

  connect: function() {
    let roomId = $("#hd-roomId").val();
    let userName = $("#hd-userName").val();
    this.stompClient = Stomp.over(new SockJS('/chat')); // stompClient를 chatInit 객체에 저장합니다.

    this.stompClient.connect({}, () => {
      this.stompClient.subscribe('/topic/' + roomId, function(message) {
        var messageBody = JSON.parse(message.body);
        var messageDate = new Date(messageBody.date);

        if (messageBody.userName == userName) {
          $('#chat-messages').append(
            '<div class="my-message-user">' +
            messageBody.userName +
            '</div>' +
            '<div class="my-message-div">' +
            '<div class="message-content">' +
            messageBody.content +
            '</div>' +
            messageDate.getHours() + ":" + messageDate.getMinutes() +
            '</div>'
          );
        } else {
          $('#chat-messages').append(
            '<div class="message-user">' +
            messageBody.userName +
            '</div>' +
            '<div class="message-div">' +
            '<div class="message-content">' +
            messageBody.content +
            '</div><p>' +
            messageDate.getHours() + ":" + messageDate.getMinutes() +
            '</p></div>'
          );
        }
        chatInit.scrollToBottom(); // scrollToBottom 함수를 chatInit 객체를 통해 호출합니다.
      });
    });
  },

  send: function() {
    let roomId = $("#hd-roomId").val();
    let userId = $("#hd-userId").val();
    let userName = $("#hd-userName").val();

    if ($('#message').val().replace(/\s/gi, '').length == 0) {
      $('#message').val('');
      return false;
    }
    if (/[<>]/.test($('#message').val())) { // 정규 표현식 패턴 수정
      $('#message').val('');
      return false;
    }

    var message = $('#message').val();

    this.stompClient.send("/app/chat/" + roomId, {}, JSON.stringify({
      userId: userId,
      userName: userName,
      roomId: roomId,
      content: message,
      date: new Date()
    }));
    $('#message').val(''); // 채팅 입력 창을 초기화
  }
};

chatInit.init();