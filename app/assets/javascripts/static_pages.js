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
    
    $(".nav-list > li > a, #side-bar-title > a").click(function(){
  		$(".nav-list > li > a").css("color","#23cccc");
  		$(this).css("color","black");
		});
});