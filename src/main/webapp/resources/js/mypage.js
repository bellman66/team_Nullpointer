// mypage 수정

// 프로필 사진 수정 시, 파일 확장자 확인
$('#userPicture').on('change',function (e) {

	var get_file = e.target.files;
	var pathpoint = get_file[0].name.lastIndexOf('.');
	var filepoint = get_file[0].name.substring(pathpoint+1,get_file[0].name.length);
	var filetype = filepoint.toLowerCase();
		
	console.log(filetype);

	if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {

		// 정상적인 이미지 확장자 파일인 경우

	} else {
			
		alert('이미지 파일이 아닙니다.');
		$('#userPicture').val("");
		return false;
	}
	
	// 확장자 확인 후 이미지 변경
	var image = document.querySelector('.profile');
    var reader = new FileReader();
    
    /* reader onload 함수 구현 */
    reader.onload = (function (aImg) {
    	// 비동기를 위한 콜백 함수 사용
    	// img 태그 안의 내용 aImg 활용
        return function (e) {
            // 선택된 파일의 정보 e의 result 값(img/png; base64; 등)
        	// aImg 태그의 src에 담기
            aImg.src = e.target.result
        }
    })(image)

    if(get_file){
        /* get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
           onload 에 설정했던 return 으로 넘어간다. 
                          이와 함께 base64 인코딩 된 스트링 데이터(e.target.result)가 result 속성에 담겨진다.
           MDN 출처
        */
        reader.readAsDataURL(get_file[0]);
    }
    //이미지가 보여지는 곳에 원래 사진 삭제
    $('.profile').html("");
    //이미지 모양 클래스 추가
    image.setAttribute('img','profile');
    //이미지 보여지는 공간에 업로드한 이미지 넣기
    $('.profile').html(image);
    
});

function modify() {
	// 기본 정보란에 입력된 값이 있다면, 해당 값 > request로 받아 dao로 넘긴 뒤, db update
	// 프로필 사진 변경

	// 닉네임 변경 > 중복 확인 후 수정 가능
	
	// 비밀번호 변경 > 비밀번화 확인란과 동일해야 수정 가능
	
	// 한 줄 소개 변경
	
	// 휴대 전화 변경
	
	// 이메일 변경
}

// mypage 탈퇴

function withdrawal() {
	// 탈퇴 버튼 클릭 시, alert pop up > 탈퇴 동의 > 비밀번호 확인 > member leave_YN = 'Y'로 변경
	

}