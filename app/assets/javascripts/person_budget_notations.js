$(document).ready(function() {
	$('input#withdrawal').on('change', function() {
		$('#select-group').removeClass('hidden');
	})
	$('input#deposit').on('change', function() {
		$('#select-group').addClass('hidden');
	})
	$('.new-btn').on('click', function() {
		this.parentNode.parentNode.parentNode.classList.add('current');
	})
});