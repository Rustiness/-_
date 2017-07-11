package com.simpact.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.simpact.domain.MemberVO;
import com.simpact.domain.PersonDFVO;
import com.simpact.domain.SearchCriteria;

@Repository
public class AdMemberDAOImpl implements AdMemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public MemberVO read(String memNO) throws Exception {		//상세보기멤버
		return sqlSession.selectOne("Admember.read",memNO);
	}
	
	@Override
	public List<PersonDFVO> getGrade() throws Exception {		//회원분류 얻어오기
		return sqlSession.selectList("personDF.list");
	}

	@Override
	public List<MemberVO> readmsg(String memNO) throws Exception {		//상세보기메신저
		return sqlSession.selectList("Admember.readmsg",memNO);
	}

	@Override
	public int update(MemberVO vo) throws Exception {	//수정
		return sqlSession.update("Admember.update",vo);
	}

	@Override
	public void modifyTOEMP(String memNO) throws Exception {	//직원으로 변경
		sqlSession.insert("Admember.newAdmin",memNO);
	}

	@Override
	public List<MemberVO> listSearch(SearchCriteria cri) throws Exception {		//목록및 검색
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sqlSession.selectList("Admember.listSearch",cri,bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {			//페이징
		int t = sqlSession.selectOne("Admember.listSearchCount",cri);
		return sqlSession.selectOne("Admember.listSearchCount",cri);
	}

}
