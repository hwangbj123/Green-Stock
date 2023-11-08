/**
 * 전문가 상세페이지 js
 */

const advisorDetailInit = {
  version: 1,
  init: function () {
    const btnSubscribe = document.getElementById("btnAdvisorSub");
    btnSubscribe.addEventListener("click", this.subscribe.bind(this));

    const btnAdvisorBoard = document.getElementById("btnAdvisorBoard");
    btnAdvisorBoard.addEventListener("click", this.enterBoard.bind(this));

    const btnAdvisorChat = document.getElementById("btnAdvisorChat");
    btnAdvisorChat.addEventListener("click", this.enterChat.bind(this));
  },

  subscribe: function () {
	let subBtn = document.getElementById("btnAdvisorSub");
	let advisorId = subBtn.getAttribute("data-id");
    location.href = '/pay/kakao?advisorId=' + advisorId;
  },

  enterBoard: function () {
    // 권한 확인 
    // 게시판 이동
    location.href = '/advisor/board';
  },

  enterChat: function () {
    alert('채팅방입장!');
  },
};
advisorDetailInit.init();
