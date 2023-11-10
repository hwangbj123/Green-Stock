


function infoClicked(data) {
	console.log(dataToObject(data));
	data = dataToObject(data);
	$('#modal-username').html(data.advisorFullName);
	$('#modal-career').html(data.career);
	$('#modal-introduction').html(data.introduction);
	$('#modal-speciality').html(data.specialization);
	$('#modal-email').html(data.email);
	$('#modal-phone').html(data.tel);
	$('#modal-image').attr('src', '/upload/' + data.imgName);
	$.get('/getRefuseData/' + data.advisorId, function(data) {
		if ($('#refuseReasonH4').length > 0) {
			$('#refuseReasonH4').remove();
			$('#refuseReasonH5').remove();
			$('#refuseDate').remove();
		}
		if (data) {
			console.log(data);
			let refuseReasonH4 = $('<h4 style="font-weight : bold" class="text-dark font-weight-medium pt-4 mb-2" id = "refuseReasonH4">');
			let refuseReasonH5 = $('<h5 id = "refuseReasonH5">');
			let refuseDate = $('<p style = "margin-top:5%" id = "refuseDate">');
			refuseReasonH4.html('반려사유');
			refuseReasonH5.html(data.refuseMsg);
			//refuseDate.html(data.date.slice(0,10) + ' ' + data.date.slice(10,16));
			refuseDate.html('반려일 : ' + data.date);
			$('#modal-portfolio-info').append(refuseReasonH4);
			$('#modal-portfolio-info').append(refuseReasonH5);
			$('#modal-portfolio-info').append(refuseDate);
		} else {
			$('#refuseReasonH4').remove();
			$('#refuseReasonH5').remove();
			$('#refuseDate').remove();
			return;
		}
	})
}

function approveClicked(id, email) {
	console.log(id);
	$.get('/approve/' + id + "/" + email, function(data) {
		console.log(data);
		window.location.reload();
	})
}

function refuseClicked(advisorId, email) {
	$('#refuseMsg').val('');
	$('#hidden_advisorId').html(advisorId);
	$('#hidden_email').html(email);
}


function modalConfirmClicked() {
	console.log($('#refuseMsg').val());
	console.log($('#hidden_email').text());
	console.log($('#hidden_advisorId').text());
	$('#modal-refuse-contact').modal('hide');
	$.ajax({
		url: '/refuse',
		method: 'post',
		contentType: 'application/json',
		data: JSON.stringify({
			"refuseMsg": $('#refuseMsg').val(),
			"email": $('#hidden_email').text(), "advisorId": $('#hidden_advisorId').text()
		}),
		success: (data) => {
			console.log(data);
			alert(data);
			window.location.reload();
		}, error: (jqXHR, textStatus, errorThrown) => {
			console.error('AJAX Error:', textStatus, errorThrown);
			alert('AJAX Error: ' + textStatus);
		}
	});
}

function dataToObject(data) {
	// 정규식을 사용하여 필요한 정보를 추출
	const matches = data.match(/(\w+)=([^,]+)/g);
	// 결과를 담을 객체 생성
	const result = {};
	// 추출된 정보를 객체에 추가
	matches.forEach(match => {
		const [fullMatch, key, value] = match.match(/(\w+)=(.+)/);
		result[key] = value.replace(/"/g, ''); // 큰따옴표 제거
	});
	return result;
}