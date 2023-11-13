const advisorBoard = {
    version: 1,
    advisorNickname: null,
    init: function () {
        this.advisorNickname = document.querySelector('input[name=advisorNickname]').value;
        this.addPageButtonClickListeners();
        const btnReply = document.getElementById('btnReply');
        btnReply.addEventListener('click', this.saveReply.bind(this));
        this.addDeleteButtonClickListners();
    },

    addPageButtonClickListeners: function () {
        const btnReply = document.querySelectorAll('.btnPageNum');
        btnReply.forEach((ele) => {
            ele.addEventListener('click', this.handlePageButtonClick.bind(this));
        });
    },

    addDeleteButtonClickListners: function () {
        const btnDeleteAdvisorBoard = document.querySelectorAll('.btnDeleteAdvisorBoard');
        Array.from(btnDeleteAdvisorBoard).forEach(ele => {
            ele.addEventListener('click', this.deleteReply.bind(this));
        });
    },

    handlePageButtonClick: function (event) {
        event.preventDefault();
        const pageUrl = event.currentTarget.getAttribute('href');
        this.fetchRepliesAndRender(pageUrl);
    },

    // 댓글 불러오기
    fetchRepliesAndRender: function (pageUrl) {
        const divReply = document.querySelector('.ec-blog-cmt-preview');
        const userId = document.querySelector('input[name=userId]').value;

        fetch(pageUrl)
            .then(response => response.json())
            .then(data => {


                const newReplies = Array.from(data.content).map((ele) => {
                    let btn = '';
                    if (userId == ele.userId) {
                        btn = `<button class="btn btn-warning btnDeleteAdvisorBoard" id="${ele.advisorBoardId}">삭제</button>`
                    }
                    return `
                        <div class="ec-blog-comment-wrapper">
                            <div class="ec-single-comment-wrapper mt-35">
                                <div class="ec-blog-comment-content w-100">
                                    <div class="d-flex align-items-baseline justify-content-between">
                                        <h5>${ele.userName}</h5>`
                        + btn +

                        `</div>
                                        <span>${ele.createdAt.replace('T', ' ').replace(/:\d{2}$/, "")}</span>
                                    <p>${ele.content}</p>
                                </div>
                            </div>
                        </div>`
                }).join('');

                let replyArea =
                    `
                    <div class="ec-blog-comment-wrapper mt-55">
                        <h4 class="ec-blog-dec-title">댓글 수 : ${data.totalElements}</h4>
                    ${newReplies}
                    <!-- 페이징 영역 -->
                        <div class="ec-pro-pagination justify-content-center">
                            <ul class="ec-pro-pagination-inner">
                               ${this.renderPageButtons(data.totalPages, pageUrl)}
                            </ul>
                        </div>
                        </div>
                    `;
                divReply.innerHTML = replyArea;

                this.addPageButtonClickListeners(); // 이벤트 다시적용
                this.addDeleteButtonClickListners();
                this.scrollToCommentArea(); // 댓글을 불러온 후에 스크롤 위치 조정 함수 호출
            })
            .catch(error => console.log(error));
    },

    // 페이지 버튼을 다시 그리는 함수
    renderPageButtons: function (totalPages, currentPageUrl) {
        const pageButtons = [];
        for (let i = 1; i <= totalPages; i++) {
            const isActive = currentPageUrl.endsWith(`/${i}`);
            const activeClass = isActive ? 'active' : '';
            const newUrl = currentPageUrl.replace(/\/\d+$/, '');
            pageButtons.push(
                `<li>
                    <a class="btnPageNum ${activeClass}" href="${newUrl}/${i}">${i}</a>
                </li>`
            );
        }
        return pageButtons.join('');
    },

    // 댓글을 새로 불러온 후, 스크롤을 특정 영역으로 이동시키기 위한 함수
    scrollToCommentArea: function () {
        const commentArea = document.querySelector('.ec-blog-arrows'); // 스크롤할 대상 요소 선택

        if (commentArea) {
            commentArea.scrollIntoView({ behavior: 'smooth' });
        }
    },

    // 댓글 작성하기
    saveReply: function () {
        const content = document.querySelector('textarea[name=content]');
        if (!content.value.trim()) {
            alert('댓글을 작성해주세요');
            content.style.border = '1px solid red';
            content.focus();
            return;
        }
        const form = document.getElementById('saveReplyForm');
        const formData = new FormData(form);
        const formDataJson = {};
        formData.forEach((value, key) => {
            formDataJson[key] = value;
        });

        fetch(form.action, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(formDataJson)
        })
            .then(response => response.json())
            .then(data => {
                if (data.advisorBoardId > 0) {
                    alert('댓글이 등록되었습니다.');
                    content.value = '';
                    const nickname = form.dataset.nickname;
                    const totalPages = data.totalPages;
                    const pageUrl = `/advisor/sub/board/${nickname}/reply/${formDataJson.parent}/${totalPages}`;
                    this.fetchRepliesAndRender(pageUrl);
                }
            })
            .catch(error => console.log(error));
    },


    // 댓글 삭제하기
    deleteReply: function (event) {

        const result = confirm('댓글을 삭제하시겠습니까?');
        const advisorBoardId = event.currentTarget.id;
        if (result) {
            fetch(`/advisor/sub/board/${this.advisorNickname}/${advisorBoardId}`, {
                method: 'DELETE',
            })
                .then(response => response.json())
                .then(data => {
                    if (data.result > 0) {
                        alert('삭제 되었습니다.');
                        // TODO 삭제 후 처리 댓글 다시 불러오기
                        // const pageUrl = `/advisor/sub/board/${this.advisorNickname}/reply/${advisorBoardId}/${totalPages}`;
                        // this.fetchRepliesAndRender(pageUrl);
                    }
                })
                .catch(error => console.log(error));
        }
    },


};
advisorBoard.init();
