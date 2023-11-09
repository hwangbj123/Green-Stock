function infoClicked(data) {
	console.log(dataToObject(data));
	data = dataToObject(data);
	$('#modal-username').html(data.advisorFullName);
	$('#modal-career').html(data.career);
	$('#modal-introduction').html(data.introduction);
	$('#modal-speciality').html(data.specialization);
	$('#modal-email').html(data.email);
	$('#modal-phone').html(data.tel);
	$('#modal-image').attr('src', '/upload/20231108/c160eaa1-eda3-4269-ba93-ae374a5cdc46.png');
}

function approveClicked(id,email) {
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