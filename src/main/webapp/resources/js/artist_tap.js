//artist_tap

$(document).ready(function() {

	$("#subContent div").hide();
	$("#artmenu li:first").attr("id", "current");
	$("#subContent div:first").fadeIn();

	$("#artmenu a").click(function(e) {
		e.preventDefault();
		$("#subContent div").hide();
		$("#artmenu li").attr("id", "");
		$(this).parent().attr("id", "current");
		$('#' + $(this).attr('title')).fadeIn();
		
	});
	
	//artist메뉴 클릭 시 인디 뮤지션 a:hover시 변경되는 color와 border-color로 
	//시작하는 는 것을 js로 만들어줘!
	

});


//라이트 박스
$(".lightbox").lightGallery({

}); 