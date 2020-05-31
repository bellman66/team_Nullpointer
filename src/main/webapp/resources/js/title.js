//main화면 로고 클릭 시, 화면 리로드

function reload() {

	var reload = document.getElementById("header_tit");
	
	reload.addEventListener('click', function(e) {
		location.href = "/springmvc/main/index.do";
	});
}