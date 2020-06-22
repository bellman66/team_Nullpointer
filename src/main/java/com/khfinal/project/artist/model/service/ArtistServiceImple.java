package com.khfinal.project.artist.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.project.artist.model.dao.ArtistDao;
import com.khfinal.project.artist.model.vo.Artist;
import com.khfinal.project.artist.model.vo.ArtistPlus;
import com.khfinal.project.board.model.vo.Board;
import com.khfinal.project.member.model.dao.MemberDao;
import com.khfinal.project.member.model.vo.Member;
import com.khfinal.project.schedule.model.vo.Schedule;

import common.util.Paging;

@Service
public class ArtistServiceImple implements ArtistService {

	@Autowired
	ArtistDao ad;
	@Autowired
	MemberDao md;

	/**
	 * @method : todayList()
	 * @date : 2020. 6. 1.
	 * @buildBy : 박혜연
	 * @comment : DB 내 영상 파일 중, 랜덤으로 4개만 main페이지 today video에 노출
	 */
	@Override
	public List<Artist> todayList() {

		List<Artist> list = ad.todayList();
		List<Artist> res = new ArrayList<>();

		/*
		 * class Inner extends Artist { private Artist artist;
		 * 
		 * public Inner(Artist artist) { this.artist = artist; }
		 * 
		 * public Artist getArtist() { return artist; }
		 * 
		 * @Override public boolean equals(Object obj) { Artist other = (Artist) obj; if
		 * (artist.getM_id() == null) { if (other.getM_id() != null) return false; }
		 * else if (!artist.getM_id().equals(other.getM_id())) return false; return
		 * true; }
		 * 
		 * @Override public int hashCode() { final int prime = 31; int result = 1;
		 * result = prime * result + ((artist.getM_id() == null) ? 0 :
		 * artist.getM_id().hashCode()); return result; } }
		 * 
		 * Set<Inner> ranSet = new HashSet<>(); Random random = new Random();
		 * 
		 * while (ranSet.size() < 4) { Artist artist =
		 * list.get(random.nextInt(list.size())); ranSet.add(new Inner(artist)); }
		 * 
		 * for (Inner i : ranSet) { res.add(i.getArtist()); }
		 */

		// 수정자 : 박혜연
		// 기존 inner class 사용 시, 새로고침할 때마다 inner class 호출되어 메모리에 등록됨
		// 메모리 효율을 위해 while문으로 변경
		Set<Artist> ranSet = new HashSet<>();
		Random random = new Random();

		while (ranSet.size() < 4) {
			Artist artist = list.get(random.nextInt(list.size()));
			List<Artist> compareList = new ArrayList(ranSet);

			if (ranSet.size() == 0) {
				ranSet.add(artist);
				compareList.add(artist);
			}

			boolean flg = true;
			for (int i = 0; i < compareList.size(); i++) {
				if (compareList.get(i).getM_id().equals(artist.getM_id())) {
					flg = false;
				}
			}

			if (flg) {
				ranSet.add(artist);
			}
		}

		for (Artist i : ranSet) {
			res.add(i);
		}

		return res;
	}

	/**
	 * @method : bestContent()
	 * @date : 2020. 6. 1.
	 * @buildBy : 박혜연
	 * @comment : DB 내 영상 파일 중, au_like 숫자가 높은 순서대로 4개 노출
	 */
	@Override
	public List<Artist> bestContent() {

		List<Artist> res = ad.bestContent();
		List<Artist> bcon = new ArrayList<>();
		bcon.add(res.get(0));
		bcon.add(res.get(1));
		bcon.add(res.get(2));
		bcon.add(res.get(3));

		return bcon;
	}

	/**
	 * @method : uploadList()
	 * @date : 2020. 6. 12.
	 * @buildBy : 박혜연
	 * @comment : 마이페이지 내 '나의 업로드 목록' 노출
	 */
	@Override
	public List<Artist> uploadList(String m_id) {
		return ad.uploadList(m_id);
	}

	/**
	 * @method : scheduleList()
	 * @date : 2020. 6. 18.
	 * @buildBy : 박혜연
	 * @comment : 마이페이지 내 '나의 스케줄 목록' 노출
	 */
	@Override
	public List<Schedule> scheduleList(String m_id) {
		// TODO Auto-generated method stub
		return ad.scheduleList(m_id);
	}

	/**
	 * @method : decrementAuLike
	 * @date : 2020. 6. 19.
	 * @buildBy : 박혜연
	 * @comment : 아티스트 회원의 정보 수정 시, 한줄소개 입력
	 */
	@Override
	public int aWordInsert(ArtistPlus artistplus) {
		return ad.aWordInsert(artistplus);
	}

	/**
	 * @method : auWordModify
	 * @date : 2020. 6. 17.
	 * @buildBy : 박혜연
	 * @comment : 회원 정보 수정 시, 한줄소개 수정
	 */
	@Override
	public int aWordModify(ArtistPlus artistplus) {
		return ad.aWordModify(artistplus);
	}

	/**
	 * @method : auWordModify
	 * @date : 2020. 6. 17.
	 * @buildBy : 박혜연
	 * @comment : 아티스트 회원의 마이페이지 로드 시, 한줄 소개(au_word) 가져오기
	 */
	@Override
	public String aWord(String m_id) {
		// TODO Auto-generated method stub
		return ad.aWord(m_id);
	}

	/**
	 * @method : selectArtList
	 * @date : 2020. 6. 16.
	 * @buildBy : hajin
	 * @comment : 전체 아티스트 tab 메인페이지
	 */
	@Override
	public List<Member> selectArtist() {
		return ad.selectArtist();
	}

	/**
	 * @method : selectArtList
	 * @date : 2020. 6. 19.
	 * @buildBy : hajin
	 * @comment : 뮤지션만 받아주는 tab
	 */
	/*
	 * @Override public List<Member> selectArtTab(String m_class) { return
	 * ad.selectArtTab(m_class); }
	 */

	/**
	 * @method : selectArtList
	 * @date : 2020. 6. 19.
	 * @buildBy : hajin
	 * @comment : 타투이스트만 받아주는 tab
	 */
	@Override
	public List<Member> selectTattooist() {
		return ad.selectTattooist();
	}

	/**
	 * @method : decrementAuLike
	 * @date : 2020. 6. 19.
	 * @buildBy : 박혜연
	 * @comment : 일반회원의 '나의 아티스트' 목록에서 구독 삭제 시, 해당 아티스트의 구독자수 -1
	 */
	@Override
	public int decrementSubscribe(String m_nickname) {
		return ad.decrementSubscribe(m_nickname);
	}

	/**
	 * @method : plusSubscribe
	 * @date : 2020. 6. 21.
	 * @buildBy : 박혜연
	 * @comment : 일반회원의 '나의 아티스트' 목록에서 구독 cnrk시, 해당 아티스트의 구독자수 +1
	 */
	@Override
	public int plusSubscribe(String m_nickname) {
		return ad.plusSubscribe(m_nickname);
	}

	/**
	 * 작성자 : 김경호 설명 : 스케줄 관련 서비스
	 */
	@Override
	public List<Artist> schedule(String m_nickname) {
		Map<String, Object> res = new HashMap<String, Object>();

		List<Artist> aslist = ad.artSchedule(m_nickname);

		/* res.put("aslist", aslist); */

		return aslist;
	}

	@Override
	public int scheduleadd(Artist artist) {
		int res = ad.artScheduleadd(artist);

		return res;
	}

	@Override
	public int artScDelete(String scdelete, String  m_id, String m_nickname) {

		int res = ad.artScDelete(scdelete, m_id, m_nickname);

		return res;
	}

	/**
	 * @method : selectArtPage
	 * @date : 2020. 6. 21.
	 * @buildBy : hajin
	 * @comment : 아티스트 개인 페이지관련
	 */
	@Override
	public List<Artist> selectArtPageVideo(String m_nickname) {
		// 수정자 : 박혜연
		// 쿼리 작동을 위한 매개변수설정
		return ad.selectArtPageVideo(m_nickname);
	}
	
	/**
	 * @method : selectArtPage
	 * @date : 2020. 6. 21.
	 * @buildBy : hajin
	 * @comment : 아티스트 개인 페이지관련
	 */
	@Override
	public List<Artist> selectArtPagePhoto(String m_nickname) {
		// 수정자 : 박혜연
		// 쿼리 작동을 위한 매개변수설정
		return ad.selectArtPagePhoto(m_nickname);
	}

	/**
	 * @method : selectProfile
	 * @date : 2020. 6. 21.
	 * @buildBy : hajin
	 * @comment : 프로필 사진을 가져옵니다.
	 */
	@Override
	public Member selectProfile(String m_nickname) {
		// 수정자 : 박혜연
		// 쿼리 작동을 위한 매개변수설정
		return md.selectProfile(m_nickname);
	}

	/**
	 * @method : selectAll
	 * @date : 2020. 6. 21.
	 * @buildBy : hajin
	 * @comment : 아티스트 개인 페이지관련
	 */
	@Override
	public ArtistPlus selectAll(String m_nickname) {
		// 수정자 : 박혜연
		// 쿼리 작동을 위한 매개변수설정
		return ad.selectAll(m_nickname);
	}
	
	/**
	 * 작성자 : 김경호
	 * 설명 : 게시판 관련 서비스
	 */
	@Override
	public Map<String, Object> selectBoardList(int currentPage, int cntPerPage, String m_nickname) {
		
		Map<String, Object> res = new HashMap<String, Object>();
		Paging page = new Paging(ad.contentCnt(m_nickname), currentPage, cntPerPage);

		List<Artist> blist = ad.selectBoardList(page, m_nickname);
		res.put("paging", page);
		res.put("blist", blist);

		return res;
		
	}

	@Override
	public Map<String, Object> aboardRead(int b_num) {
		Map<String, Object> res = new HashMap<String, Object>();
		
		Board artRead = ad.aboardRead(b_num); 
		//파일 읽어주는 코드
//		List<Map<String, String>> flist = bd.boardResdFile(b_num);
				
		res.put("artRead", artRead);
//		res.put("flist", flist);
				
		return res;
	}

	@Override
	public int aboardUpload(Board board) {
		
		int res = ad.aboardUpload(board);
		return res;
	}

	@Override
	public int aboardDelect(int b_num) {
		return ad.aboardDelect(b_num);
	}

	@Override
	public Map<String, Object> aboardSearch(String searchType, String searchWord, int currentPage, int cntPerPage, String m_nickname) {
		Map<String, Object> res = new HashMap<String, Object>();

		if(searchType.equals("write")) {
			Paging page = new Paging(ad.contentWrSeCnt(searchWord, m_nickname), currentPage, cntPerPage);
			List<Board> blist = ad.searchWrBoardList(searchWord, page, m_nickname);
			res.put("paging", page);
			res.put("blist", blist);
		}else if(searchType.equals("title")){
			Paging page = new Paging(ad.contentTiSeCnt(searchWord, m_nickname), currentPage, cntPerPage);
			List<Board> blist = ad.searchTiBoardList(searchWord, page, m_nickname);
			res.put("paging", page);
			res.put("blist", blist);
		}else {
			Paging page = new Paging(ad.contentWTSeCnt(searchWord, m_nickname), currentPage, cntPerPage);
			List<Board> blist = ad.searchWTBoardList(searchWord, page, m_nickname);
			res.put("paging", page);
			res.put("blist", blist);
		}
		
		return res;
	}

	/**
	 * @method : selectPhotoList
	 * @date : 2020. 6. 21.
	 * @buildBy : hajin
	 * @comment : 아티스트 개인 페이지 사진게시판관련
	 */
	@Override
	public List<Board> selectPhotoList() {
		return ad.selectPhotoList();
	}


}
