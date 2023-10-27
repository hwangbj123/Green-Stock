$(document).ready(function() {
	setSmallCard();
});


function setSmallCard() {
	$.get('portfolio/getMyPortfolioList', function(data) {
		console.log(data);
		makeSmallCard(data);
	})

}

function makeSmallCard(data) {
	//smallCard 의 순서는 ajax get 으로 받아온 포트폴리오의 순번일것이다.
	if (data.length == 0) {
		makeAddPortfolioDiv();
	} else {
		let count = 0;
		data.forEach((e, idx) => {
			count++;
			let smallCardInnerWrapper = $('<div id = "' + e.id + '" class="col-xl-3 col-sm-6 p-b-15 lbl-card" data-clicked = "false">');
			let smallCard = $('<div class="card card-mini dash-card card-1"style="cursor : pointer;height : 100%">');
			smallCard.on('click', () => smallCardClicked(e.id));
			let cardBody = $('<div class="card-body">');
			let h2 = $('<h2 class="mb-1">'); // CardLayout header
			let p = $('<p>') // CardLayout body
			let span = $('<span id = "span_' + e.id + '" class="mdi mdi-file-document-box" style = "cursor : pointer">');
			span.on('click', (event) => {
				event.stopImmediatePropagation();
				editClicked(e.id);
			});
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


//editBtnCLicked
function editClicked(id) {
	console.log('editClicked');
	console.log(id);
}

function saveButtonClicked(title, discription) {
	if (title == '' || discription == '' || title.trim() == '' || discription.trim() == '' || title == null || discription == null) {
		alert('값넣어라');
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
	$('#addCard').attr('data-clicked', 'false');
	setSmallCard();
	$('#body_body').append($('<div id = "asdf">'));

}

//smallCard 가 click 되면 해당 포트폴리오의 정보가 모두 다시 뿌려져야 한다.
function smallCardClicked(id) {
	console.log('실행');
	var elements = $(".col-xl-3.col-sm-6.p-b-15.lbl-card");
	let checker = new Checker(id, elements);
	if (!checker.anyOfClickedBool()) {
		console.log('101');
		if (id == "addCard") {
			addCardClicked();
			$('#' + id).attr('data-clicked', 'true');
			return;
		} else {
			$('#' + id).attr('data-clicked', 'true');
			attatchPortfolioInfo(id);
			return;
		}
	}
	if (checker.checkSelfClicked()) {
		console.log('113');
		if (id == "addCard") {
			detatchAll();
			$('#' + id).attr('data-clicked', 'false');
		} else {
			$('#' + id).attr('data-clicked', 'false');
			detatchAll();
		}
		return;
	}
	if (
		!checker.checkSelfClicked() &&
		checker.anyOfClickedBool()
	) {
		console.log('126');
		//$('#portfolioRegWrapper').remove();
		// detatchAll(); attatch(); if(addCard) => addCardClicked() else attatch()  attatch 의 경우 차트와 orderReport, 및 모두를 없애야됨.
		// 만약 addCard 클릭시에는 이 if 문이 실행되었을 경우 다른애들이 detatchALl 을 실행하고 해야됨. addCard 말고 실행될시에도 다른애들 다 없애고 attatch().
		if (id == 'addCard') {
			elements.each((idx, e) => e.setAttribute("data-clicked", "false"));
			$('#' + id).attr('data-clicked', 'true');
			detatchAll();
			addCardClicked();
		} else {
			elements.each((idx, e) => e.setAttribute("data-clicked", "false"));
			detatchAll();
			$('#' + id).attr('data-clicked', 'true');
			attatchPortfolioInfo(id);
		}
		$('#' + id).attr('data-clicked', 'true');
		return;
	}
}

function attatchPortfolioInfo(id) {
	$.get('portfolio/getMyPortfolioInfo/' + id, function(data) {
		setPortfolioInfo(data);
		setChart(data.stockList);
		setMyStock(data);
	})
}

function setPortfolioInfo(data) {
	console.log(data);
	let portfolioInfoWrapper = $('<div id = "portfolioInfoWrapper" style = "width : 100%; height :90%;background-color:whitesmoke;margin:auto">');
	$('#portfolioInfo').append(portfolioInfoWrapper);

	let titleDivWrapper = $('<div style = "height : 10%; background-Color :white; display:flex;">' + data.title + '</div>');
	let dsDivWrapper = $('<div style = "height : 10%;background-Color : white; display:flex;">' + data.discription + '</div>');
	let ror = $('<div style = "height : 15%;background-Color : white; display:flex;font-size:xx-large;color : red;font-weight : bold;">ROR : -99%</div>');

	portfolioInfoWrapper.append(titleDivWrapper);
	portfolioInfoWrapper.append(dsDivWrapper);
	portfolioInfoWrapper.append(ror);
}

function setMyStock(data) {
	console.log(data);
}


// info 관련 모든 정보를 detatch
function detatchAll() {
	if ($('#portfolioInfoWrapper').length > 0) {
		console.log('detatchInfoWrapper')
		$('#portfolioInfoWrapper').remove();
		console.log('실행');
	}
	if ($('#portfolioRegWrapper').length > 0) {
		$('#portfolioRegWrapper').remove();
		console.log('실행');
	}
}

//CardHeader 에 portfolio 정보를 입력한다.
//addCard 가 아닌 다른 smallCards 가 클릭될 시 실행된다.

function setChart(data) {
	$('#donutChartBody').append($('<canvas id="doChart"></canvas>'));
	console.log(data[0].amount);
	console.log(data[0].stock);
	let amountList = [];
	let stockList = [];
	let stockNameList = [];
	data.forEach(e => {
		amountList.push(e.amount);
	})
	data.forEach(e => {
		stockList.push(e.stock);
	})
	stockList.forEach(e => {
		stockNameList.push(e.name);
	})
	console.log(stockNameList);
	let colorList = ["#88aaf3", "#50d7ab", "#9586cd", "#f3d676", "#ed9090", "#a4d9e5","#a4d9e5","#a4d9e5","#a4d9e5","#a4d9e5"];
	let doughnut = document.getElementById("doChart");
	if (doughnut !== null) {
		let myDoughnutChart = new Chart(doughnut, {
			type: "doughnut",
			data: {
				labels: stockNameList,
				datasets: [
					{
						label: stockNameList,
						data: amountList,
						backgroundColor: colorList,
						borderWidth: 1
						// borderColor: ['#88aaf3','#29cc97','#8061ef','#fec402']
						// hoverBorderColor: ['#88aaf3', '#29cc97', '#8061ef', '#fec402']
					}
				]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				legend: {
					display: false
				},
				cutoutPercentage: 75,
				tooltips: {
					callbacks: {
						title: function(tooltipItem, data) {
							return "Order : " + data["labels"][tooltipItem[0]["index"]];
						},
						label: function(tooltipItem, data) {
							return data["datasets"][0]["data"][tooltipItem["index"]];
						}
					},
					titleFontColor: "#888",
					bodyFontColor: "#555",
					titleFontSize: 12,
					bodyFontSize: 14,
					backgroundColor: "rgba(256,256,256,0.95)",
					displayColors: true,
					borderColor: "rgba(220, 220, 220, 0.9)",
					borderWidth: 2
				}
			}
		});
	}
}

function setMyStock() {

}

// Card Headr 내부 작업. ( a)
function addCardClicked() {
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
				a = e;
			}
		});
		return a.id == this.tagName;
	}

	// navEles 들 중 체크된 요소가 있는 지 확인.
	anyOfClickedBool() {
		for (let i = 0; i < this.tagList.length; i++) {
			if (this.tagList[i].getAttribute("data-clicked") == "true") {
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


// Chart

