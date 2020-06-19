package com.khfinal.project.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.project.member.model.vo.MyArtist;

@Repository
public class MyArtistDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	public MyArtist insertMyArtist() {
		return null;
	}
	
	public MyArtist deleteMyArtist() {
		return null;
	}
	
	/**
	 * @method : myArtistList()
	 * @date : 2020. 6. 19.
	 * @buildBy : 박혜연
	 * @comment : 일반회원 마이 페이지 내의 'My Artist' 부분 목록 추출
	 */
	public List<MyArtist> myArtistList(String m_id) {
		return session.selectList("MyArtist.myArtistList", m_id);
	}
	
	/**
	 * @method : myArtistDelete()
	 * @date : 2020. 6. 19.
	 * @buildBy : 박혜연
	 * @comment : 일반회원 마이 페이지 내의 'My Artist' 목록 삭제
	 */
	public int myArtistDelete(MyArtist myartist) {
		return session.delete("MyArtist.myArtistDelete", myartist);
	}

}
