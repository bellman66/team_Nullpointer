package com.khfinal.project.artist.model.service;

import java.util.ArrayList;
import java.util.List;

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
	public List<Artist> todayList() {

		List<Artist> list = ad.todayList();
		List<Artist> res = new ArrayList<>();
		

		return res;
	}

}
