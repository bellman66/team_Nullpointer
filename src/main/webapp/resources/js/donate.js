// 결제 시스템 이용을 위한 cookie SameSite 설정 변경
document.cookie = "safeCookie1=foo; SameSite=Lax";
document.cookie = "safeCookie2=foo";
document.cookie = "crossCookie=bar; SameSite=None; Secure";

// 팝업
function layer_popup(el) {

	var $el = $(el); // 레이어의 id를 $el 변수에 저장
	var isDim = $el.prev().hasClass('dimBg'); // dimmed 레이어를 감지하기 위한 boolean
	// 변수
	
	if($el.attr('id') == 'layer2') {
		isDim ? $('#dim-layer-do').fadeIn() : $el.fadeIn();
	} else if($el.attr('id') == 'layer3') {
		isDim ? $('#dim-layer-sub').fadeIn() : $el.fadeIn();
	}

	var $elWidth = ~~($el.outerWidth()), $elHeight = ~~($el.outerHeight()), docWidth = $(
			document).width(), docHeight = $(document).height();

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
	
	if($el.attr('id') == 'layer2') {
		// 확인 버튼 클릭 시, 결제 시스템 이동
		$el.find('a.btn-yes').click(function() {
			isDim ? $('#dim-layer-do').fadeOut() : $el.fadeOut();
			$(function(){
		        var IMP = window.IMP; // 생략가능
		        IMP.init('imp28619981'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		        var msg;
		        
		        IMP.request_pay({
		            pg : 'kakaopay',
		            pay_method : 'card',
		            merchant_uid : 'merchant_' + new Date().getTime(),
		            name : 'test',
		            amount : '2000원',
		            buyer_email : 'eternita9210@gmail.com',
		            buyer_name : 'testtest',
		            buyer_tel : '01074752312',
		            buyer_addr : 'test',
		            buyer_postcode : '123-456',
		            // m_redirect_url : 'http://www.naver.com'
		        }, function(rsp) {
		            if ( rsp.success ) {
		                // [1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		                jQuery.ajax({
		                    url: "/payments/complete", // cross-domain error가 발생하지
														// 않도록 주의해주세요
		                    type: 'POST',
		                    dataType: 'json',
		                    data: {
		                        imp_uid : rsp.imp_uid
		                        // 기타 필요한 데이터가 있으면 추가 전달
		                    }
		                }).done(function(data) {
		                    // [2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		                    if ( everythings_fine ) {
		                        msg = '결제가 완료되었습니다.';
		                        msg += '\n고유ID : ' + rsp.imp_uid;
		                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		                        msg += '\결제 금액 : ' + rsp.paid_amount;
		                        msg += '카드 승인번호 : ' + rsp.apply_num;
		                        
		                        alert(msg);
		                    } else {
		                        // [3] 아직 제대로 결제가 되지 않았습니다.
		                        // [4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		                    }
		                });
		                // 성공시 이동할 페이지
		                location.href='<%=request.getContextPath()%>/main/index.do?msg='+msg;
		            } else {
		                msg = '결제에 실패하였습니다.';
		                msg += '에러내용 : ' + rsp.error_msg;
		                // 실패시 이동할 페이지
		                location.href="<%=request.getContextPath()%>/artist/artist.do";
		                alert(msg);
		            }
		        });
		        
		    });
			return false;
		});
	} else if($el.attr('id') == 'layer3') {
		//구독 버튼 클릭 확인 버튼 클릭 시, 마이페이지 이동
		$el.find('a.btn-yes').click(function() {
			isDim ? $('#dim-layer-sub').fadeOut() : $el.fadeOut();
			location.href = "<%=request.getContextPath()%>/member/myPage.do"
		});
	}
	
	// 닫기 버튼을 클릭하면 레이어가 닫힌다.
	$el.find('a.btn-layerClose').click(function() {
		isDim ? $('.dim-layer').fadeOut() : $el.fadeOut();
		return false;
	});
}

function donate() {
	
	var loginChk = $('.ta_cash').attr('id');
	
	// 비회원 또는 미로그인 상태일 때 제한
	if(loginChk != "") {
		// 결제 시스템 안내
        layer_popup('#layer2');
     } else {
    	 alert('로그인 이후 가능합니다. 로그인 해주세요.');
     }
	
}

function subscribe() {
	
	var loginChk = $('.ta_cash').attr('id');
	var a_nick = $('h3').html();
	console.log(loginChk);
	console.log(a_nick);
	
	// 비회원 또는 미로그인 상태일 때 제한
	if(loginChk != "") {
		// 회원의 tb_myartist에 추가
		$.ajax({
			url : '/springmvc/member/insertMyArtist.do',
			type : 'GET',
			data : {
				"artist_nick" : a_nick
			},
			success : function(res) {
				
				console.log(res);
				if(res == true) {
					// 확인 팝업
			        layer_popup('#layer3');
				} else {
					alert('시스템 오류로 구독에 실패했습니다. 관리자에게 문의하세요.');
				}
			}
		});
     } else {
    	 alert('로그인 이후 가능합니다. 로그인 해주세요.');
     }

}