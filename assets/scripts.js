$(document).ready(function() {
	$('.btn-group.type-filter').show().find('button').click(function() {
		$(this).parent().click();
	});

	$('.type-filter button.error').click(function() {
		$('div.error').toggle($(this).hasClass('active'));
	});

	$('.type-filter button.warning').click(function() {
		$('div.warning').toggle($(this).hasClass('active'));
	});
});
