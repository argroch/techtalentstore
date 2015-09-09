$(document).ready(function(){
	for(i=1;i<=5;i++){
		var rate_star = "#rate_star" + i;
		$(rate_star).hover(function(){
			$(this).toggleClass("yellow");
			$(this).toggleClass("fa-star-o");
			$(this).toggleClass("fa-star");
		});
		if(i == 2){
			var previous_star = "#rate_star" + (i - 1);
			$(previous_star).hover(function(){
				$(this).toggleClass("yellow");
				$(this).toggleClass("fa-star-o");
				$(this).toggleClass("fa-star");
			});
		}
	}
})