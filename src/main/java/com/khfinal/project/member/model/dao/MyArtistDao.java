package com.khfinal.project.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.project.member.model.vo.MyArtist;

@Repository
public class MyArtistDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	/**
	 * @method : insertMyArtist()
	 * @date : 2020. 6. 21.
	 * @buildBy : 박혜연
	 * @comment : 일반회원 마이 페이지 내의 'My Artist' 부분 목록 추가
	 */
	public int insertMyArtist(MyArtist myartist) {
		return session.insert("MyArtist.insertMyArtist", myartist);
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
	
	/**
	 * @method : selectSame()
	 * @date : 2020. 6. 21.
	 * @buildBy : 박혜연
	 * @comment : 일반회원 마이 페이지 내의 'My Artist' 목록 중 중복값 확인
	 */
	public int selectSame(MyArtist myartist) {
		return session.selectOne("MyArtist.selectSame", myartist);
	}
	
	/**
	 * @method : maplusprofile()
	 * @date : 2020. 6. 21.
	 * @buildBy : 박혜연
	 * @comment : 일반회원 마이 페이지 내의 'My Artist' 목록 + 프로필사진 가져오기
	 */
	public List<Map<String, Object>> maplusprofile(MyArtist myartist) {
		return session.selectList("MyArtist.maplusprofile", myartist);
	}
	
}
