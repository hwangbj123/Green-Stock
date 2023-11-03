let boardListInit = {
	version: 1,
	init: function(){
		this.keepCategory();
	},
	toSignIn: function(){
		if(confirm("로그인이 필요한 서비스입니다\n로그인 화면으로 이동하시겠습니까?")){
			location.href="/user/sign-in";
		}
	},
	
	searchValid: function(){
		if(document.getElementById("search-word").value.length!=0){
			document.getElementById("search-frm").submit();
		}else{
			document.getElementById("search-word").focus();
		}
	},
	
	searchParam: function(key){
		return new URLSearchParams(location.search).get(key);
	},
	
	appendCategory: function(cate){
		let searchDiv = document.getElementById("search-div");
		let input = document.createElement("input");
		input.setAttribute("type", "hidden");
		input.setAttribute("name", "categoryId");
		input.setAttribute("value", cate);
		searchDiv.appendChild(input);
	},
	
	keepCategory: function(){
		let cate = this.searchParam('categoryId');
		if(cate){
			this.appendParam(cate);
		}
	}
};

boardListInit.init();