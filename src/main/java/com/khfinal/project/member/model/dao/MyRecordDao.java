package com.khfinal.project.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.project.member.model.vo.MyRecord;

import common.util.Paging;

@Repository
public class MyRecordDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	/**
	 * @method : myRecordList()
	 * @date : 2020. 6. 22.
	 * @buildBy : 박혜연
	 * @comment : 회원의 시청기록 전부 가져오기
	 */
	public List<MyRecord> myRecordList(String m_id) {
		return session.selectList("MyRecord.myRecordList", m_id);
	}
	
	/**
	 * @method : contentCntPr()
	 * @date : 2020. 6. 22.
	 * @buildBy : 박혜연
	 * @comment : 일반회원 마이 페이지 내 시청기록 페이징을 위한 전체 count
	 */
	public int contentCntMr(String m_id) {
		return session.selectOne("MyRecord.contentCntMr", m_id);
	}
	
	/**
	 * @method : contentCntPr()
	 * @date : 2020. 6. 22.
	 * @buildBy : 박혜연
	 * @comment : 일반회원 마이 페이지 내 시청기록 페이징을 위한 전체 count
	 */
	public List<MyRecord> selectMRList(String m_id, Paging page) {
		Map<String, Object> data = new HashMap<String, Object>();

		data.put("page", page);
		data.put("m_id", m_id);
		return session.selectList("MyRecord.selectMRList", data);
	}
	
	

}
