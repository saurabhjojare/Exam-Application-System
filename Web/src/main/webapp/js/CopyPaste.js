
		 $(document).ready(function(){
		     $(document).on("contextmenu",function(e){
		         return false;
		     });
		 });

		$(document).ready(function() {
			$(document).on("copy paste", function(e) {
				e.preventDefault();
			});
		});