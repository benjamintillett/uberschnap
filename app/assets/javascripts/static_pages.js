$(document).ready(function(){

	$(function(){
		$('#carousel-example-generic').carousel({
		  interval: 5000
		});
	});
    setTimeout(function(){
        $('#carousel-1').carousel({
		  interval: 5000
		});
    }, 2500);

});