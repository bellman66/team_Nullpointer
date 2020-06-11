/**
 * 
 */

$(document).ready(function() {

			//img 불러줄 div를 가져와!
			var $img = $(".logImg").find("ul");
			
			//이미지 폭
			var $width = $img.children().outerWidth();
			//이미지 높이
			var $height = $img.children().outerHeight();
			//이미지 갯수
			var $length = $img.children().length;
			var rollingId;

			//정해진 초마다 함수 실행
			rollingId = setInterval(function() { rollingStart(); }, 3000);

			function rollingStart() {
				$img.css("width", $width * $length + "px");
				$img.css("height", $height + "px");
				
				$img.animate({left:-$width + "px"}, 1500, function(){
					$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
					$(this).find("li:first").remove();
					$(this).css("left", 0);
				});
			}
		});