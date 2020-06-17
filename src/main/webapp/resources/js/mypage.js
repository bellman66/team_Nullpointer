var infoModify = true;

// 프로필 사진 수정 시, 파일 확장자 확인
$('#userPicture').on('change',
	function(e) {

		var get_file = e.target.files;
		var pathpoint = get_file[0].name.lastIndexOf('.');
		var filepoint = get_file[0].name.substring(pathpoint + 1,
				get_file[0].name.length);
		var filetype = filepoint.toLowerCase();

		console.log(filetype);

		if (filetype == 'jpg' || filetype == 'gif' || filetype == 'png'
				|| filetype == 'jpeg' || filetype == 'bmp') {

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
		reader.onload = (function(aImg) {
			// 비동기를 위한 콜백 함수 사용
			// img 태그 안의 내용 aImg 활용
			return function(e) {
				// 선택된 파일의 정보 e의 result 값(img/png; base64; 등)
				// aImg 태그의 src에 담기
				aImg.src = e.target.result
			}
		})(image)

		if (get_file) {
			/*
			 * get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 onload 에
			 * 설정했던 return 으로 넘어간다. 이와 함께 base64 인코딩 된 스트링
			 * 데이터(e.target.result)가 result 속성에 담겨진다. MDN 출처
			 */
			reader.readAsDataURL(get_file[0]);
		}
		// 이미지가 보여지는 곳에 원래 사진 삭제
		$('.profile').html("");
		// 이미지 모양 클래스 추가
		image.setAttribute('img', 'profile');
		// 이미지 보여지는 공간에 업로드한 이미지 넣기
		$('.profile').html(image);
	});

// 닉네임 중복 확인
function nickCheck() {
	$.ajax({
		url : '/springmvc/member/nicknamecheck.do',
		type : 'GET',
		data : $('#NICKNAME'),
		// data 받아오는 것이 성공하면(success) 아래 함수 호출
		success : function(data) {
			if (data != '') {
				// 입력한 data와 동일한 값이 있다면
				document.querySelector('#nickCheckMsg').innerHTML = '이미 존재하는 닉네임입니다.';
				infoModify = false;
			} else {
				document.querySelector('#nickCheckMsg').innerHTML = '사용 가능한 닉네임입니다.';
				infoModify = true;
			}

		}

	});
}

// 비밀번호 확인
$(function() {
	$('#PWD_MODIFY_CHECK').keyup(function() {
		var pwd1 = $("#USER_PWD_MODIFY").val();
		var pwd2 = $("#PWD_MODIFY_CHECK").val();
		if (pwd1 != "" || pwd2 != "") {
			if (pwd1 == pwd2) {
				$("#same").css('display', 'block');
				$("#different").css('display', 'none');
				infoModify = true;
			} else {
				$("#same").css('display', 'none');
				$("#different").css('display', 'block');
				infoModify = false;
			}
		}
	});
});

// mypage 정보 수정
function modify() {
	// 기본 정보란에 입력된 값이 있다면, 해당 값 > request로 받아 dao로 넘긴 뒤, db update

	if (infoModify) {
		// 수정 내용에 이상이 없다면
		// controller 통해서 정보 수정 후 main으로 이동
		location.href = '/springmvc/member/infoModify.do';
	} else {
		// 수정 내용에 이상이 있다면
		// 1) 닉네임 중복 확인 후 수정 가능
		var checkornot = $('#nickCheckMsg').val();
		if (checkornot == '이미 존재하는 닉네임입니다.' || checkornot == null) {
			alert('닉네임을 확인해주세요.');
		}
		// 2) 비밀번호와 비밀번호 확인란과 동일해야 수정 가능
		if ($('#same').style.display === none) {
			alert('비밀번호를 확인해주세요.');
		}
	}
}

// mypage 탈퇴 버튼 클릭
function withdrawal() {
	layer_popup("#layer2");
}

// 팝업
function layer_popup(el) {

	var $el = $(el); // 레이어의 id를 $el 변수에 저장
	var isDim = $el.prev().hasClass('dimBg'); // dimmed 레이어를 감지하기 위한 boolean
												// 변수

	isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

	var $elWidth = ~~($el.outerWidth()), 
		$elHeight = ~~($el.outerHeight()), 
		docWidth = $(document).width(), 
		docHeight = $(document).height();

	// 화면의 중앙에 레이어를 띄운다.
	if ($elHeight < docHeight || $elWidth < docWidth) {
		$el.css({
			marginTop : -$elHeight / 2,
			marginLeft : -$elWidth / 2
		})
	} else {
		$el.css({
			top : 0,
			left : 0
		});
	}

	// 확인 버튼 클릭 시, 비밀번호 확인 > member leave_YN = 'Y'로 변경
	$el.find('a.btn-withdrawal').click(function() {
		isDim ? $('.dim-layer').fadeOut() : $el.fadeOut();
		location.href = '/springmvc/member/withdrawal.do';
		return false;
	});

	// 닫기 버튼을 클릭하면 레이어가 닫힌다.
	$el.find('a.btn-layerClose').click(function() {
		isDim ? $('.dim-layer').fadeOut() : $el.fadeOut();
		return false;
	});
}

// 탈퇴 팝업에서 확인 버튼 클릭 시, 예외 확인
function validata() {
	
	var inputpwd = $('#pwd');

	// 비밀번호 란이 비어있는 경우
	if (inputpwd.val() == '') {
		alert('비밀번호 란이 비어있습니다. 비밀번호를 입력해주세요.');
		return false;
	}

	// 동의란 동의 체크 없는 경우
	if (!$('#customCheck').is(':checked')) {
		alert('동의란에 체크하지 않았습니다. 내용을 확인하고 동의란에 체크해주세요.');
		return false;
	}

	return true;

}