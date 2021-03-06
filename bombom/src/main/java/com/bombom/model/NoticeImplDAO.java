package com.bombom.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeImplDAO implements NoticeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	

	@Override
	public List<NoticeDTO> getNewsList(NoticePageDTO dto) {
		// 글 리스트 뽑아오기
		return this.sqlSession.selectList("notice_list", dto);
	
	}
	
	@Override
	public int insertNews(NoticeDTO dto) {
	
		return this.sqlSession.insert("notice_insert", dto);
	}

	@Override
	public NoticeDTO newsCont(int no) {
		
		return this.sqlSession.selectOne("notice_cont", no);
	}

	@Override
	public void Hit(int no) {
		this.sqlSession.update("Hit", no);

	}

	@Override
	public int updateNews(NoticeDTO dto) {
		
		return this.sqlSession.update("notice_update", dto);
	}

	@Override
	public int deleteNews(int no) {
		
		return this.sqlSession.delete("del", no);
	}

	@Override
	public void updateSequence(int no) {
		
		this.sqlSession.update("seq", no);

	}

	@Override
	public int searchNewsCont(String field, String keyword) {
		
		return this.sqlSession.selectOne(field, keyword);
	}

	@Override
	public List<NoticeDTO> searchNewsList(NoticePageDTO dto) {

		if(dto.getField().equals("title")) {
			
			return this.sqlSession.selectList("titleList", dto);
			
		}else {
			
			return this.sqlSession.selectList("titleCont", dto);
			
		}
		
		//if(dto.getField().equals("title_cont"))
		
	}

	@Override
	public int getListCount() {
		
		return this.sqlSession.selectOne("count");
	}

	

}
