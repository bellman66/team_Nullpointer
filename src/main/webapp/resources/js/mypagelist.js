function art() {
	console.log('art함수');
	$('#tab1').css('display', 'block');
	$('#tab2').css('display', 'none');
}

function tat() {
	console.log('tat함수');
	$('#tab1').css('display', 'none');
	$('#tab2').css('display', 'block');
}

function more() {
	//더보기
	$('.btn_link').css('display', 'block');
}

//삭제 버튼 클릭 시, 해당 버튼이 위치한 li 삭제
function myArtistDelete(button) {
	
	// 클릭한 삭제 버튼이 해당되는 아티스트 닉네임 get
	var artist_nick = $(button).prev().html();
	
	console.log(artist_nick);
	
	$.ajax({
		url: '/springmvc/member/myArtistDelete.do',
		type: 'GET',
		data: {
			"artist_nick" : artist_nick
			},
		success: function(res) {
			if(res != null) {
				location.href='/springmvc/member/myartistlist.do';
			} else {
				alert('구독 취소에 실패하였습니다. 새로고침 후 다시 시도해주세요.');
			}
		}
		
	});
	
}