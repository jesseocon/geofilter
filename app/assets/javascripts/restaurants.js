$(document).ready(function(){

	$('#home-icon').on('click', function(){
		
		var homeAddress = $(this).data('home-address');
		$('#search-input').val(homeAddress)
	});
});