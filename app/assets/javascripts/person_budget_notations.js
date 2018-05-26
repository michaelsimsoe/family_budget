$(document).ready(function() {
	var selectGroup = "";
	var infoMessage = "";
	$('input#withdrawal').on('change', function() {
		// $('#pbn-info-message')
		selectGroup = $(this)[0].parentNode.nextElementSibling;
		infoMessage = selectGroup.parentNode.parentNode.children[0];
		infoMessage.classList.add("out-visible");
		selectGroup.classList.remove('hidden');
	})
	$('input#deposit').on('change', function() {
		selectGroup = $(this)[0].parentNode.nextElementSibling;
		infoMessage = selectGroup.parentNode.parentNode.children[0];
		infoMessage.classList.remove("out-visible");
		selectGroup.classList.add('hidden');
	})
	$('.new-btn').on('click', function() {
		this.parentNode.parentNode.parentNode.classList.add('current');
	})
});