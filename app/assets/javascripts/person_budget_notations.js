$(document).ready(function() {
	$('.new-btn').on('click', function() {
		this.parentNode.parentNode.parentNode.classList += ' current';
	})
});