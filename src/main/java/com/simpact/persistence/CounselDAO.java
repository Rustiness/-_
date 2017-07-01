package com.simpact.persistence;

import java.util.List;



import com.simpact.domain.Criteria;
import com.simpact.domain.CSSearchCriteria;
import com.simpact.domain.CounselVO;

public interface CounselDAO {
	
	public void create(CounselVO vo)throws Exception; // 추가
	
	public void update(CounselVO vo)throws Exception; //수정
	
	public void delete(String csNO)throws Exception; // 삭제
	
	public CounselVO read(String csNO)throws Exception;// 한개 읽어
	
	public List<CounselVO> listAll() throws Exception; //다 읽어
	
	public List<CounselVO> listPage(int page)throws Exception;//조회(여러행-리스트)
	
	public List<CounselVO> listCriteria(Criteria cri)throws Exception;//조회(여러행-리스트)
	   
	   //전체레코드 수
	   public int countPaging()throws Exception;//조회(여러행-리스트)
	   
	   
	   public List<CounselVO> listSearch(CSSearchCriteria cri)throws Exception;//검색어 조회
	   
	   
	   public int listSearchCount(CSSearchCriteria cri) throws Exception;
	
	
}
