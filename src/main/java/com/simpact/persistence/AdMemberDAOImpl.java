package com.simpact.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.simpact.domain.MemberVO;
import com.simpact.domain.SearchCriteria;

@Repository
public class AdMemberDAOImpl implements AdMemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public MemberVO read(String memNO) throws Exception {		//상세보기멤버
		return sqlSession.selectOne("member.read",memNO);
	}
	
	@Override
	public List<MemberVO> readmsg(String memNO) throws Exception {		//상세보기메신저
		return sqlSession.selectList("member.readmsg",memNO);
	}

	@Override
	public void update(MemberVO vo) throws Exception {	//수정
		sqlSession.update("member.update",vo);
	}

	@Override
	public void delete(int bno) throws Exception {		//삭제
		sqlSession.delete("member.delete",bno);
	}
	@Override
	public List<MemberVO> listSearch(SearchCriteria cri) throws Exception {		//목록및 검색
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sqlSession.selectList("member.listSearch",cri,bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {			//페이징
		int t = sqlSession.selectOne("member.listSearchCount",cri);
		System.out.println(t);
		return sqlSession.selectOne("member.listSearchCount",cri);
	}

}
