package com.khfinal.project.artist.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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

		// list에 담긴 값들 중 4개만 랜덤으로 뽑아 res에 담기
		// 조건 1. 업로더 이름이 동일하면 안 됨 > Artist.m_id
		// 조건 2. 영상이 동일하면 안 됨 > Artist.au_file

		Random random = new Random();

		for (int i = 0; i < 4; i++) {
			int num = random.nextInt(list.size());

			if (res != null) {
				// res에 값이 있을 때, 조건 1과 2에 부합하도록 분기 설정
				// 조건 2 > 동일한 인덱스 값이 있는지 확인하기
				if (res.contains(list.get(num))) {
					
				} else {
					// 조건 1 > res에 들어가 있는 인덱스 값의 m_id 변수 값 비교
					
				}
			} else {
				// res에 값이 없다면 바로 list.get()으로 넣기
				res.add(list.get(num));
			}
		}

		return res;
	}

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

}
