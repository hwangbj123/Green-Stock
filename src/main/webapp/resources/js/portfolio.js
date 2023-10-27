$(document).ready(function() {
	console.log('aaa');
	setSmallCard();
});


function setSmallCard() {
	$.get('/getMyPortfolioList', function(data) {
		console.log(data);
		makeSmallCard(data);
	})

}

function makeSmallCard(data) {
	console.log(data);
	//smallCard 의 순서는 ajax get 으로 받아온 포트폴리오의 순번일것이다.
	if (data.length == 0) {
		makeAddPortfolioDiv();
	} else {
		let count = 0;
		data.forEach((e, idx) => {
			count++;
			console.log('실행됨');
			let smallCardInnerWrapper = $('<div id = "' + e.id + '" class="col-xl-3 col-sm-6 p-b-15 lbl-card" data-clicked = "false">');
			let smallCard = $('<div class="card card-mini dash-card card-1"style="cursor : pointer;height : 100%">');
			smallCard.on('click', () => smallCardClicked(e.id));
			let cardBody = $('<div class="card-body">');
			let h2 = $('<h2 class="mb-1">'); // CardLayout header
			let p = $('<p>') // CardLayout body
			let span = $('<span id = "span_' + e.id + '" class="mdi mdi-file-document-box" style = "cursor : pointer">');
			span.on('click', () => editClicked(e.id));
			// h2 p span 은 card-body 안에
			$('#smallCardOuterWrapper').append(smallCardInnerWrapper); // smallCardInnerWrapper를 smallCardOuterWrapper에 추가
			smallCardInnerWrapper.append(smallCard);
			smallCard.append(cardBody);
			cardBody.append(h2);
			h2.html(e.name);
			cardBody.append(p);
			p.html(e.discription); // 또는 원하는 데이터를 여기에 설정
			cardBody.append(span);
		})
		if (count < 4) {
			makeAddPortfolioDiv();
		}
	}
}


// addPortfolio small Card 를 만듦.
function makeAddPortfolioDiv() {
	let smallCardInnerWrapper = $('<div id = "addCard" class="col-xl-3 col-sm-6 p-b-15 lbl-card" data-clicked = "false">');
	let smallCard = $('<div class="card card-mini dash-card card-1"style="cursor : pointer">');
	let cardBody = $('<div class="card-body d-flex justify-content-center">');
	let plusIcon = $('<div class = "mdi mdi-shape-square-plus"style="font-size: 2.5rem;">');
	// h2 p span 은 card-body 안에
	$('#smallCardOuterWrapper').append(smallCardInnerWrapper); // smallCardInnerWrapper를 smallCardOuterWrapper에 추가
	smallCardInnerWrapper.append(smallCard);
	smallCard.append(cardBody);
	cardBody.append(plusIcon);
	smallCard.append($('<p style = "text-align:center">add your portfolio</p>'));
	smallCard.on('click', () => smallCardClicked('addCard'));
}



function editClicked(id) {
	console.log('editButtonClicked');
	console.log(id);
}

function saveButtonClicked(title, discription) {
	console.log(title);
	console.log(discription);
	if (title == '' || discription == '' || title == ' ' || discription == ' ' || title == null || discription == null) {
		return;
	}
	console.log('saveButtonClicked');
	// 포트폴리오 저장 로직
	$.ajax({
		url: '/postExample',
		method: 'post',
		contentType: 'application/json',
		dataType: 'json',
		data: JSON.stringify({ 'title': title, 'discription': discription }),
		success: (data) => {
			console.log(data);
		}
	});
	$('#smallCardOuterWrapper').children().each((idx, e) => e.remove());
	$('#portfolioRegWrapper').remove();
	setSmallCard();


}

//smallCard 가 click 되면 해당 포트폴리오의 정보가 모두 다시 뿌려져야 한다.
function smallCardClicked(id) {
	var elements = $(".col-xl-3.col-sm-6.p-b-15.lbl-card");
	console.log(elements);
	let checker = new Checker(id, elements);
	console.log(checker.anyOfClickedBool());
	if (!checker.anyOfClickedBool()) {
		console.log('102줄 실행')
		setPortfolioInfo(id);
		//attatchDetailOuterWrapper(navTag);
		return;
	}
	if (checker.checkSelfClicked()) {
		console.log('108줄 실행')
		$('#' + id).attr('data-clicked','false');
		return;
	}
	if (
		!checker.checkSelfClicked() &&
		checker.anyOfClickedBool()
	) {
		console.log('실행됨116줄');
		detatch($(".DetailOuterWrapper--"));
		$(".col-xl-3 col-sm-6 p-b-15 lbl-card").each((idx, e) => e.setAttribute("data-clicked", "false"));
		detatchAll();
		setPortfolioInfo(id);
		$('#' + id).attr('data-clicked','true');
		//attatchDetailOuterWrapper(id);
		return;
	}
}

// info 관련 모든 정보를 detatch
function detatchAll(){
	$('#portfolioInfo').children().each((idx,e) => e.remove());
	//$('#doChart').remove();
	//doChart 의 footer 도 remove.
	//Stock 도 reomve
}

//CardHeader 에 portfolio 정보를 입력한다.
function setPortfolioInfo(id) {
	/*
		$.get('https://api.example.com/data', function(data) { console.log(data); })
	*/
	$('#' + id).attr('data-clicked','true');
}

// Card Headr 내부 작업. ( a)
function addCardClicked() {
	if ($('#portfolioRegWrapper').length != 1) {
		let portfolioRegDiv = $('<div id = "portfolioRegWrapper" style = "width : 100%; height :100%;">');
		let titleDiv = $('<div style = "height : 20%;">');
		let dsDiv = $('<div style = "height : 20%;">');

		let nameSpan = $('<span class="ec-register-wrap ec-register-half" >');
		let titlelabel = $('<label style = "height : 5%;width : 100%">Title</label>');
		let titleinput = $('<input id = "titleInput" type="text" placeholder="포트폴리오 제목을 입력하세요." style = "width: 90% ;height : 50%;margin-top : 2%;"required="">');

		let dsSpan = $('<span style = "margin-top:10%" class="ec-register-wrap ec-register-half">');
		let dslabel = $('<label style = "height : 5%;width : 100%">discription</label>');
		let dsinput = $('<input id = "discriptionInput" type="text" placeholder="포트폴리오 설명을 입력하세요." style = "width: 90% ;height : 50%;margin-top : 2%;"required="">');

		$('#portfolioInfo').append(portfolioRegDiv);
		portfolioRegDiv.append(titleDiv);
		titleDiv.append(nameSpan);
		nameSpan.append(titlelabel);
		nameSpan.append(titleinput);

		$('#portfolioInfo').append(portfolioRegDiv);
		portfolioRegDiv.append(dsDiv);
		dsDiv.append(dsSpan);
		dsSpan.append(dslabel);
		dsSpan.append(dsinput);

		let buttonWrapper = $('<div class = "buttonsWrapper" style = "display : flex;width : 40%; height : 13%;margin-top : 5%; float : right; justify-content: right;">');
		$('#portfolioRegWrapper').append(buttonWrapper);
		buttonWrapper.append($('<button type = "button" id = "saveButton" class = "btn btn-primary" style ="margin-right :25% ">저장</button>'));
		$('#saveButton').on('click', () => saveButtonClicked($('#titleInput').val(), $('#discriptionInput').val()));
	} else {
		$('#portfolioRegWrapper').remove();
	}
}



class Checker {
	constructor(tagName, tagList) {
		this.tagName = tagName;
		this.tagList = tagList;
	}
	// data-clicked 가 true 인 요소가 tag와 일치하면 true 반환
	// 재클릭 여부를 알려준다고 보면 됨.
	checkSelfClicked() {
		let a;
		this.tagList.each((idx, e) => {
			if (e.getAttribute("data-clicked") == "true") {
				console.log(e);
				a = e;
			}
		});
		return a.id == this.tagName;
	}

	// navEles 들 중 체크된 요소가 있는 지 확인.
	anyOfClickedBool() {
		console.log(this.tagList);
		for (let i = 0; i < this.tagList.length; i++) {
				console.log('202줄');
				console.log(this.tagList[i].getAttribute("data-clicked"));
			if (this.tagList[i].getAttribute("data-clicked") == "true") {
				console.log(this.tagList[i].getAttribute("data-clicked"));
				return true;
			}
		}
		return false;
	}

	// 클릭시 태그의 data-clicked 가 true 면 return true
	clickBool() {
		this.tagName.attr("data-clicked") == "true";
	}
}
/*
<span class="ec-register-wrap ec-register-half">
	<label>First Name*</label>
	<input type="text" name="firstname" placeholder="Enter your first name" required="">
</span>
*/
