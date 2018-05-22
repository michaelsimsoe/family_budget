function createFlashMessage(notice, alert) {
	noticeMessage = notice;
	alertMessage = alert;
	var message = '';
	var messageType = '';
	
	if (noticeMessage != '') {
		message = noticeMessage;
		messageType = 'success'
	} else if (alertMessage != '') {
		message = alertMessage;
		messageType = 'danger'
	}

	return {
		message,
		messageType
	}
}
