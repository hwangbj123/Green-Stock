$(document).ready(function() {
	setSmallCard();
});


function setSmallCard() {
	$.get('portfolio/getMyPortfolioList', function(data) {
		$('#addStock').on('click', () => addStockClicked());
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
			console.log(e.pid);
			let pid = e.pid;
			console.log(pid);
			count++;
			let smallCardInnerWrapper = $('<div id="' + pid + '" class="col-xl-3 col-sm-6 p-b-15 lbl-card" data-clicked="false">');
			let smallCard = $('<div id = "smallCardC_' + pid + '" class="card card-mini dash-card card-1"style="cursor : pointer;height : 100%">');
			smallCard.on('click', () => smallCardClicked(pid));
			let cardBody = $('<div style="display:flex; justify-content: space-between;" class="card-body" id="smallCard_' + pid + '">');
			let infoWrapper = $('<div id = "infoWrpper">')
			let h2 = $('<h2 class = "editableH2s" id = "h2_' + pid + '" class="mb-1">'); // CardLayout header
			let p = $('<p class = "editablePs" id = "p_' + pid + '">') // CardLayout body
			let span = $('<span data-clicked="false" class = "editSpans" id="span_' + pid + '" style="height : 20%;width : 15%;cursor: pointer; font-size: smaller">변경</span>');
			span.on('click', (event) => {
				event.stopImmediatePropagation();
				editClicked(pid);
			});
			// h2 p span 은 card-body 안에
			$('#smallCardOuterWrapper').append(smallCardInnerWrapper); // smallCardInnerWrapper를 smallCardOuterWrapper에 추가
			smallCardInnerWrapper.append(smallCard);
			smallCard.append(cardBody);
			infoWrapper.append(h2);
			h2.html(e.title);
			infoWrapper.append(p);
			cardBody.append(infoWrapper);
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
	let eles = $('.editSpans');
	let checker = new Checker('span_' + id, eles);
	let delButton = $('<div class = "delButtons"style=  "position : absolute; z-index : 999; bottom : 90%; left : 97%; background : url(\'/resources/img/icons/x.png\');background-size: cover;background-repeat : no-repeat; height : 20%;width : 10%;">');
	delButton.on('click', (e) => {
		e.stopPropagation();
		delButtonClicked(id);
	});
	console.log('실행됨');
	if (!checker.anyOfClickedBool()) { // nothing checked
		console.log('실행됨');
		$('#span_' + id).attr('data-clicked', 'true');
		$('#' + id).children().append(delButton);
		$('.editSpans').each((idx, e) => $(e).html('변경'));
		$('#span_' + id).html('확인');
		pfedit(id);
		return;
	}
	if (checker.checkSelfClicked()) { // 내가 체크되있음
		console.log('실행됨');
		$('#span_' + id).attr('data-clicked', 'false');
		$('#span_' + id).html('변경');
		$('.delButtons').each((idx, e) => $(e).remove());
		return;
	}
	if (!checker.checkSelfClicked() && checker.anyOfClickedBool()) { // 나 아니고 딴애들
		console.log('실행됨');
		$('.delButtons').each((idx, e) => e.remove());
		$('#span_' + id).children().append(delButton);
		$('#span_' + id).attr('data-clicked', 'true');
		$('#' + id).children().append(delButton);
		$('.editSpans').each((idx, e) => $(e).html('변경'));
		$('#span_' + id).html('확인');
		pfedit(id);
	}


}

function pfedit(id) {
	$('.editableH2s').each((idx, e) => $(e).attr("contenteditable", "false"));
	$('.editablePs').each((idx, e) => $(e).attr("contenteditable", "false"));

	let h2 = $('#h2_' + id);
	let p = $('#p_' + id);
	$('#span_' + id).attr('data-clicked', 'true');
	h2.attr("contenteditable", "true");
	p.attr("contenteditable", "true");
	let originalH2 = $("#h2_" + id).text();
	let originalP = $("#p_" + id).text();
	let editedH2;
	let editedP;
	h2.focus();
	h2.on("blur keypress", (e) => {
		if (e.type == "blur" || e.type == "keypress && e.which ==13") {
			editedH2 = h2.text();
			$("#" + e.target.id).attr("contenteditable", "false");
			console.log(originalH2 + " : " + editedH2);
			if (originalH2 != editedH2) {
				console.log(id);
				$.ajax({
					url: "portfolio/testCode123/title",
					method: "post",
					contentType: "application/json",
					dataType: "json",
					data: JSON.stringify({ 'pid': id, 'title': editedH2 }),
					success: (data) => {
						console.log(data);
						$('#span_' + id).attr('data-clicked', 'false');
					}
				});
			} else {
				console.log("title 안바뀜");
				return;
			}
		}
	});
	p.on("blur keypress", (e) => {
		if (e.type == "blur" || e.type == "keypress && e.which ==13") {
			editedP = p.text();
			$("#" + e.target.id).attr("contenteditable", "false");
			console.log(originalP + " : " + editedP);
			if (originalP != editedP) {
				console.log(id);
				$.ajax({
					url: "portfolio/testCode123/dis",
					method: "post",
					contentType: "application/json",
					dataType: "json",
					data: JSON.stringify({ 'pid': id, 'discription': editedP }),
					success: (data) => {
						console.log(data);
						$('#span_' + id).attr('data-clicked', 'false');
					}
				});
			} else {
				console.log("discription 안바뀜");
				return;
			}
		}
	});
}

function delButtonClicked(id) {
	console.log(id);
	if (confirm('삭제하시겠습니까?')) {
		$.get('portfolio/deletePortfolio/' + id, function(data) {
			console.log('삭제됨');
			location.reload();
		})
	}
}


function saveButtonClicked(title, discription) {
	if (title == '' || discription == '' || title.trim() == '' || discription.trim() == '' || title == null || discription == null) {
		alert('값이 비었습니다.');
		return;
	}
	console.log('saveButtonClicked');
	// 포트폴리오 저장 로직
	$.ajax({
		url: 'portfolio/addPortfolio',
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
			detatchAll();
			$('#' + id).attr('data-clicked', 'false');
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
		//$('#' + id).attr('data-clicked', 'true');
		return;
	}
}

function attatchPortfolioInfo(id) {
	$.get('portfolio/getAllDataInfo/' + id, function(data) {
		console.log(data);
		if (data == null) {
			//alert('stock 을 추가하세요.');
			console.log('setStock');
		} else {
			setPortfolioInfo(data);
			setDonutChart(data);
			setMyStock(data);
			setMonthlyAssetChart();
		}
	})
}

async function setPortfolioInfo(data) {
	console.log(data);
	let sellMoney = 0;
	if (data.sellMoney != null) {
		sellMoney = data.sellMoney;
	}
	let stockTotalAmount = 0;
	for (let i = 0; i < data.stockList.length; i++) {
		let nowprice = await $.get('portfolio/getNowPrice/' + data.stockList[i].companyCode, function(data) {
		})
		stockTotalAmount += data.stockList[i].amount * nowprice;
	}
	let rorData = ((stockTotalAmount + sellMoney - data.totalAsset) / data.totalAsset) * 100;
	console.log(rorData);
	let portfolioInfoWrapper = $('<div id = "portfolioInfoWrapper" style = "width : 100%; height :90%;background-color:whitesmoke;margin:auto">');
	$('#portfolioInfo').append(portfolioInfoWrapper);

	let titleDivWrapper = $('<div style = "height : 10%; background-Color :white; display:flex;">' + data.title + '</div>');
	let dsDivWrapper = $('<div style = "height : 10%;background-Color : white; display:flex;">' + data.discription + '</div>');
	let totalAssetDivWrapper = $('<div style = "height : 10%;background-Color : white; display:flex;">' + stockTotalAmount + '</div>');
	let ror = $('<div style = "height : 15%;background-Color : white; display:flex;font-size:xx-large;color : red;font-weight : bold;">' + rorData.toFixed(2) + '%</div>');

	portfolioInfoWrapper.append(titleDivWrapper);
	portfolioInfoWrapper.append(dsDivWrapper);
	portfolioInfoWrapper.append(totalAssetDivWrapper);
	portfolioInfoWrapper.append(ror);
}

// info 관련 모든 정보를 detatch
function detatchAll() {
	console.log('실행됨');
	if ($('#portfolioInfoWrapper').length > 0 && $('#donutChartBody').children().length > 0 && $('#myStockCardTable').children().length > 0 && $('#assetBody').children().length > 0) {
		console.log('detatchInfoWrapper')
		$('#portfolioInfoWrapper').remove();
		$('#donutChartBody').children().each((idx, e) => {
			$(e).remove();
		});
		$('#donutChartBody').children().each((idx, e) => {
			$(e).remove();
		});
		$('#assetBody').children().each((idx, e) => {
			$(e).remove();
		});
		console.log('실행');
	}
	if ($('#cardFooterWrapper').length > 0) {
		$('#cardFooterWrapper').remove();
	}
	if ($('#portfolioRegWrapper').length > 0) {
		$('#portfolioRegWrapper').remove();
	}
	if ($('#myStockCardTable').children().length > 0) {
		$('#myStockCardTable').children().each((idx, e) => {
			$(e).remove();
		})
		console.log('실행');
	}
}

//CardHeader 에 portfolio 정보를 입력한다.
//addCard 가 아닌 다른 smallCards 가 클릭될 시 실행된다.

function setDonutChart(data) {
	/*$.get('/portfolio/getStockList/' + data.pid, function(data) {
		console.log(data);
	})*/
	$('#donutChartBody').append($('<canvas id="doChart"></canvas>'));
	let stockNameList = [];
	let amountList = [];
	data.stockList.forEach(stock => {
		stockNameList.push(stock.companyName);
		amountList.push(stock.amount * stock.price);
		console.log(stock.amount * stock.price);
	});
	console.log(stockNameList);
	let colorList = ["#88aaf3", "#50d7ab", "#9586cd", "#f3d676", "#ed9090", "#a4d9e5", "#a4d9e5", "#a4d9e5", "#a4d9e5", "#a4d9e5"];
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
						backgroundColor: colorList.slice(0, stockNameList.length),
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
	console.log(data.totalAsset);
	$('#donutChartBody').append($('<div id="donutCenterText" style="position: absolute; top: 60%; left: 50%; transform: translate(-50%, -50%); font-size: 24px;">' + data.totalAsset + '</div>'));
}

function setRanking() {
	$.get('portfolio/getRanking', function(data) {

	});
}

function setMonthlyAssetChart() {
	/*======== 16. ANALYTICS - ACTIVITY CHART ========*/
	//<canvas id="monthlyAsset" class="chartjs"></canvas>
	$.get('portfolio/getMonthlyAsset', function(data) {
		console.log(data);
		$('#assetBody').append($('<canvas style = "height : 300px" id="monthlyAsset" class="chartjs"></canvas>'))
		var activity = document.getElementById("monthlyAsset");
		if (activity !== null) {
			var config = {
				// The type of chart we want to create
				type: "line",
				// The data for our dataset
				data: {
					labels: [
						"4 Jan",
						"5 Jan",
						"6 Jan",
						"7 Jan",
						"8 Jan",
						"9 Jan",
						"10 Jan"
					],
					datasets: [
						{
							label: "Monthly Asset",
							backgroundColor: "transparent",
							borderColor: "rgba(82, 136, 255, .8)",
							data: data,
							lineTension: 0,
							pointRadius: 5,
							pointBackgroundColor: "rgba(255,255,255,1)",
							pointHoverBackgroundColor: "rgba(255,255,255,1)",
							pointBorderWidth: 2,
							pointHoverRadius: 7,
							pointHoverBorderWidth: 1
						}/*,
					{
						label: "Inactive",
						backgroundColor: "transparent",
						borderColor: "rgba(255, 199, 15, .8)",
						data: activityData[0].second,
						lineTension: 0,
						borderDash: [10, 5],
						borderWidth: 1,
						pointRadius: 5,
						pointBackgroundColor: "rgba(255,255,255,1)",
						pointHoverBackgroundColor: "rgba(255,255,255,1)",
						pointBorderWidth: 2,
						pointHoverRadius: 7,
						pointHoverBorderWidth: 1
					}*/
					]
				},
				// Configuration options go here
				options: {
					responsive: true,
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					scales: {
						xAxes: [
							{
								gridLines: {
									display: false,
								},
								ticks: {
									fontColor: "#8a909d", // this here
								},
							}
						],
						yAxes: [
							{
								gridLines: {
									fontColor: "#8a909d",
									fontFamily: "Roboto, sans-serif",
									display: true,
									color: "#eee",
									zeroLineColor: "#eee"
								},
								ticks: {
									// callback: function(tick, index, array) {
									//   return (index % 2) ? "" : tick;
									// }
									//stepSize: 50,
									fontColor: "#8a909d",
									fontFamily: "Roboto, sans-serif"
								}
							}
						]
					},
					tooltips: {
						mode: "index",
						intersect: false,
						titleFontColor: "#888",
						bodyFontColor: "#555",
						titleFontSize: 12,
						bodyFontSize: 15,
						backgroundColor: "rgba(256,256,256,0.95)",
						displayColors: true,
						xPadding: 10,
						yPadding: 7,
						borderColor: "rgba(220, 220, 220, 0.9)",
						borderWidth: 2,
						caretSize: 6,
						caretPadding: 5
					}
				}
			};

			var ctx = document.getElementById("monthlyAsset").getContext("2d");
			var myLine = new Chart(ctx, config);

			/*var items = document.querySelectorAll("#user-activity .nav-tabs .nav-item");
			items.forEach(function(item, index) {
				item.addEventListener("click", function() {
					config.data.datasets[0].data = activityData[index].first;
					config.data.datasets[1].data = activityData[index].second;
					myLine.update();
				});
			});*/
		}
	})
}


function setMyStock(data) {
	let headArr = ['주식명', '가격'];
	let thead = $('<thead>');
	headArr.forEach(e => {
		let th = $('<th>' + e + '</th>');
		thead.append(th);
	})
	let amount = $('<th>amount</th>');
	let nowPriceTh = $('<th>nowPrice</th>')
	let nowRor = $('<th>ROR</th>');
	let totalAmountTh = $('<th>totalAmount</th>')
	thead.append(amount);
	thead.append(nowPriceTh);
	thead.append(nowRor);
	thead.append(totalAmountTh);
	$('#myStockCardTable').append(thead);


	//table body
	let tbody = $('<tbody>');

	data.stockList.forEach(e => console.log(e));
	data.stockList.forEach(async e => {
		let tr = $('<tr>');
		let td = $('<td>' + e.companyName + '</td>');
		let td2 = $('<td>' + e.price + '</td>');
		let td3 = $('<td>' + e.amount + '</td>');
		let nowprice = await $.get('portfolio/getNowPrice/' + e.companyCode, function(data) {
			console.log(data);
		});
		let td4 = $('<td>' + nowprice + '</td>');
		let td5 = $('<td>' + ifPlus(calculatePercentageChange(e.price, nowprice, tr).toFixed(2)) + '</td>');
		let td6 = $('<td>' + (e.amount * nowprice).toFixed(0) + '</td>');

		let buyTd = $('<td style="cursor:pointer"id = addBtn>buy</td>');
		let sellTd = $('<td style="cursor:pointer" id = sellBtn>sell</td>');

		tr.append(td, td2, td3, td4, td5, td6, buyTd, sellTd);
		buyTd.on('click', () => buyClicked(e.pid, e.companyCode, e.companyName));
		sellTd.on('click', () => sellClicked(e.pid, e.companyCode, e.companyName));
		tbody.append(tr);
	});
	//tr.append($('<td>' + values[i] + '</td>'))
	/*$.get('portfolio/getStock/' + stockList[idx].id, function(data) {
		tr.append($('<td>' + (initialData.stockList[idx].amount).toFixed(2) + '</td>'));
		tr.append($('<td>' + data.price + '</td>'));
		tr.append($('<td>' + ifPlus(calculatePercentageChange(stockList[idx].price, data.price, tr).toFixed(2)) + '</td>'));
		let totalStocksTd = $('<td>' + (initialData.stockList[idx].amount * data.price).toFixed(0) + '</td>');
		let buyTd = $('<td style="cursor:pointer"id = addBtn>buy</td>');
		let sellTd = $('<td style="cursor:pointer" id = sellBtn>sell</td>');
		tr.append(totalStocksTd);
		tr.append(buyTd);
		tr.append(sellTd);
		buyTd.on('click', () => buyClicked(portfolioId, e.id, e.name));
		sellTd.on('click', () => sellClicked(portfolioId, e.id, e.name));
		tbody.append(tr);
	});
})*/

	/*let addTr = $('<tr>');
	addTr.append($('<td colspan = "' + collength + '"style="cursor:pointer;width:100%;text-align:center">+</td>'));
	addTr.on('click', () => addStockClicked(portfolioId));
	tbody.append(addTr);*/
	$('#myStockCardTable').append(tbody);
}

function calculatePercentageChange(oldValue, newValue, tr) {
	console.log('----------------');
	console.log(oldValue);
	console.log(newValue);
	if (oldValue === 0) {
		if (newValue === 0) {
			return 0; // 두 값이 모두 0이면 변화가 없음
		} else {
			return Infinity; // 이전 값이 0이고 새 값이 0이 아니면 무한대 (무한한 증가)
		}
	}

	const change = ((newValue - oldValue) / Math.abs(oldValue)) * 100;
	if (change < 0) {
		tr.css('color', 'blue');
	} else if (change == 0) {
		tr.css('color', 'black');
	} else {
		tr.css('color', 'red');
	}
	return change;
}

function ifPlus(ele) {
	if (ele > 0) {
		return '+' + ele + '%';
	} else {
		return ele + '%';
	}
}

function buyClicked(pId, stockId, stockname) {
	console.log(pId + '    ' + stockId);
	newWindow(pId, stockId, 'buy', stockname);
}

function sellClicked(pId, stockId, stockname) {
	console.log(pId + '    ' + stockId);
	newWindow(pId, stockId, 'sell', stockname)
}

async function addStockClicked() {
	if ($('div[data-clicked="true"]').length == 0 || $('#portfolioRegWrapper').length > 0) {
		alert('포트폴리오를 선택해주세요.');
		return;
	} else {
		if ($('#cardFooterWrapper').length > 0) {
			$('#cardFooterWrapper').remove();
			return;
		}
		let stockNameInput = $('<input style = "width : 30%"id = "stockName" type = "text" placeholder="주식명">');
		let stockAmountInput = $('<input style = "width : 30%"id = "stockName" type = "text" placeholder="수량">');
		let confirmDiv = $('<button style = " width : 20%;margin-left : 3%; height : 100%; display : inline-block;background-color : black;color : white"id = "addStockDiv">확인</button>');
		$('#stockCardFooter').append($('<div class = "d-block h-100" id = "cardFooterWrapper">'));
		$('#cardFooterWrapper').css('display', 'flex');
		$('#cardFooterWrapper').css('justify-content', 'space-around');
		//$('#stockCardFooter').css('height','10%');
		$('#cardFooterWrapper').css('width', '40%');
		$('#cardFooterWrapper').append(stockNameInput, stockAmountInput, confirmDiv);


		//autoComplete
		let autoCompleteData = await getAutoCompleteData();
		stockNameInput.autocomplete({
			source: autoCompleteData, // 자동완성 데이터 소스
			minLength: 1, // 입력한 문자 수가 이 값 이상일 때 자동완성이 시작됩니다.
			select: function(event, ui) {
				// 사용자가 항목을 선택했을 때 수행할 작업을 정의합니다.
				alert("선택한 항목: " + ui.item.value);
			},
			minLength: 1,// 최소 글자수
			autoFocus: false,
			delay: 100,	//autocomplete 딜레이 시간(ms)
			focus: function(event, ui) {
				// 아래와 위 방향키로 항목을 선택할 때 selectedValue 업데이트
				//selectedValue = ui.item.value;
				return true;
			},
			//disabled: true, //자동완성 기능 끄기
		});
		confirmDiv.on('click', () => confrimBtnClicked(stockNameInput.val(), stockAmountInput.val()));
	}
}
async function confrimBtnClicked(stockName, stockAmount) {
	console.log($('div[data-clicked="true"]').attr('id'));
	let pfid = $('div[data-clicked="true"]').attr('id');
	console.log(pfid);
	let stock = await getStockByStockName(stockName);
	let data = {
		'portfolioId': pfid,
		'companyName': stockName,
		'stockId': stock.companyCode,
		'amount': stockAmount,
		'price': stock.price
	};
	console.log(stock);
	if (stock.companyCode == undefined || stock.companyCode == "" || stockAmount == undefined || stockAmount == "" || stock.price == undefined || stock.price == "") {
		//alert('값을 제대로 입력해주세요.');
	}
	$.ajax({
		url: "portfolio/buySell/" + 'buy',
		method: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		success: (data) => {
			console.log(data);
			window.location.reload;
		},
	});

}

async function getAutoCompleteData() {
	let fetchData = await fetch("/portfolio/getAutoCompleteData").then((les) => les.json());
	return fetchData;
}

async function getStockByStockName(stockName) {
	let fetchData = await fetch("/portfolio/getStockByStockName/" + stockName).then((les) => les.json());
	console.log(fetchData);
	return fetchData;
}

function saveStockIntoPortfolio(stockId) {
	let pId = $('div[data-clicked="true"]').attr('id');
	$.ajax({
		url: 'portfolio/saveStocks',
		method: 'post',
		contentType: 'application/json',
		dataType: 'json',
		data: JSON.stringify({ 'pid': pId, 'stockId': stockId }),
		success: (data) => {
			console.log(data);
		}
	});
}



function newWindow(pId, stockId, type, stockname) {
	console.log(pId, stockId, type, stockname);
	var newWindow = window.open(
		"portfolio/popUpPage",
		"_blank",
		"width=200,height=100"
	);

	newWindow.onload = function() {
		var contentDiv = newWindow.document.createElement("div");
		contentDiv.innerHTML =
			'<div id="dataForm" method="post"><input style = "height : 20px" type="text" id="inputField" placeholder = "' + stockname + '"><button style = "height : 25px;margin-left : 3%"type="button" id="submitButton">' + type + '</button></div>';
		newWindow.document.body.appendChild(contentDiv);
		contentDiv
			.querySelector("#submitButton")
			.addEventListener("click", function() {
				var inputData = contentDiv.querySelector("#inputField").value;
				$.ajax({
					url: "portfolio/buySell/" + type,
					method: "post",
					contentType: "application/json",
					data: JSON.stringify({ 'portfolioId': pId, 'stockId': stockId, 'amount': inputData,'companyName' : stockname }),
					success: (data) => {
						console.log(data);
					},
				});
				newWindow.close();
				setTimeout(function() {
					$('#smallCardC_' + pId).click();
					$('#smallCardC_' + pId).click();
				}, 1000); // 1000ms (1초) 후에 클릭 이벤트 발생
			});
	};
}

// Card Header 내부 작업. ( a)
function addCardClicked() {
	let portfolioRegDiv = $('<div id = "portfolioRegWrapper" style = "width : 100%; height :100%;">');
	let titleDiv = $('<div style = "height : 20%;">');
	let dsDiv = $('<div style = "margin-top : 5%;height : 20%;">');

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

	let buttonWrapper = $('<div class = "buttonsWrapper" style = "display : flex;width : 40%; height : 20%;margin-top : 10%; float : right; justify-content: right;">');
	$('#portfolioRegWrapper').append(buttonWrapper);
	buttonWrapper.append($('<button type = "button" id = "saveButton" class = "btn btn-primary" style ="height : 100%;margin-top 10%;margin-right :25% ">저장</button>'));
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

