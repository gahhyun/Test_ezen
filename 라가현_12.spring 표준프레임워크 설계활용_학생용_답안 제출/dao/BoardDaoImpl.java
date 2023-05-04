package com.earth.gahyun.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.earth.gahyun.dto.BoardDTO;
import com.earth.gahyun.dto.SearchItem;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.earth.gahyun.dao.BoardMapper.";
	
	
	//select
	@Override
	public BoardDTO select(Integer bno) throws Exception {
		return session.selectOne(namespace + "select", bno);
	}
	@Override
	public List<BoardDTO> selectPage(Map map) throws Exception {
		return session.selectList(namespace + "selectPage", map);
	}
	@Override
	public List<BoardDTO> selectAll() throws Exception {
		return session.selectList(namespace + "selectAll");
	}
	
	//insert
	@Override
	public int insert(BoardDTO dto) throws Exception {
		return session.insert(namespace+"insert", dto);
	}
	
	//delete
	@Override
	public int deleteAll() throws Exception {
		return session.delete(namespace+"deleteAll");
	}
	//게시글의 번호와 작성자를 매개변수로 받아 동일하면 삭제
	@Override
	public int delete(Integer bno, String writer) throws Exception {
		Map map = new HashMap();
		map.put("bno", bno);
		map.put("writer", writer);
			
		return session.delete(namespace+"delete", map);
	}
	
	//update
	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		return session.update(namespace+"update", boardDTO);
	}
	
	//전체 개체 수 구하기
	@Override
	public int count() throws Exception {
		return session.selectOne(namespace + "count");
	}
	//조회수 증가
	@Override
	public int increaseViewCnt(Integer bno) throws Exception {
		return session.update(namespace + "increaseViewCnt", bno);
	}
	@Override
	public int searchResultCnt(SearchItem sc) throws Exception {
		return session.selectOne(namespace + "searchResultCnt", sc);
	}
	//
	@Override
	public List<BoardDTO> searchSelectPage(SearchItem sc) throws Exception {
		return session.selectList(namespace + "searchSelectPage", sc);
	}

}
