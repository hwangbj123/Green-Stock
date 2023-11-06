let adminBoardInit = {
	version: 1,
	searchValid: function(){
		if(document.getElementById("search-word").value.length!=0){
			document.getElementById("search-frm").submit();
		}else{
			document.getElementById("search-word").focus();
		}
	},
	boardDelete: function(boardId) {
        if (confirm("정말 게시글을 삭제하시겠습니까?")) {
            document.getElementById(`admin-board-delete-frm-${boardId}`).submit();
        }
    },
};
