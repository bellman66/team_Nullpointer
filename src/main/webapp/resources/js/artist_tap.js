//artist_tap

$(document).ready(function() {
	$("#artTab div").hide();
	$("#atTab li:first").attr("id", "current");
	$("#artTab div:first").fadeIn();

	$('#atTab a').click(function(e) {
		e.preventDefault();
		$("#artTab div").hide();
		$("atTab li").attr("id", "");
		$(this).parent().attr("id", "current");
		$('#' + $(this).attr('title')).fadeIn();
	});
});