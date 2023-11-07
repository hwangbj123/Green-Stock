let boardListInit = {
	version: 1,
	init: function(){
		this.keepCategory();
		this.nowCategory();
		document.getElementById('search-word').addEventListener('keypress', (event) => {
		    if (event.key === "Enter") {
		        event.preventDefault();
		        this.searchValid();
		    }
		});
	},
	toSignIn: function(){
		if(confirm("로그인이 필요한 서비스입니다\n로그인 화면으로 이동하시겠습니까?")){
			location.href="/user/sign-in";
		}
	},
	
	searchValid: function(){
		let word = document.getElementById("search-word");
		if(word.value.trim().length==0){
			word.value = "";
			word.focus();
		}else if(/<|>/.test(word.value)){
			alert("일부 특수문자는 사용할 수 없습니다");
    		word.value="";
    		word.focus();
		}else{
		console.log('word - if3');
			document.getElementById("search-frm").submit();
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
			this.appendCategory(cate);
		}
	},
	
	nowCategory: function(){
		let cate = this.searchParam('categoryId');
	    let categoryButton = document.getElementById('category-btn-' + cate);
		console.log('categoryButton : '+categoryButton)
	    if (categoryButton) {
	        categoryButton.style.backgroundColor = "#f7f7f7";
	    } else {
	        console.log("해당 ID를 가진 카테고리 버튼을 찾을 수 없습니다.");
	    }
	},
};

boardListInit.init();