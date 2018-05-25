$(document).ready(function() {
	var selectGroup = "";
	$('input#withdrawal').on('change', function() {
		selectGroup = $(this)[0].parentNode.nextElementSibling;
		selectGroup.classList.remove('hidden');
	})
	$('input#deposit').on('change', function() {
		selectGroup = $(this)[0].parentNode.nextElementSibling;
		selectGroup.classList.add('hidden');
	})
	$('.new-btn').on('click', function() {
		this.parentNode.parentNode.parentNode.classList.add('current');
	})
});