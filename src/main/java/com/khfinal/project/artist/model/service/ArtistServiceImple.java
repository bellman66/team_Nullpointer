package com.khfinal.project.artist.model.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.project.artist.model.dao.ArtistDao;
import com.khfinal.project.artist.model.vo.Artist;

@Service
public class ArtistServiceImple implements ArtistService {

	@Autowired
	ArtistDao ad;

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

}
