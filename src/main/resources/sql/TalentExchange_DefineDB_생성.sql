/* 최초생성 DefineDB ==> 테이블 및 시퀸스 생성후 진행 */

/* DF_관리등급_기본 데이터 */
INSERT INTO DF_Grade VALUES ('D_GR' || LPAD(DF_Grade_seq.nextval, 2, 0),'고객문의담당자','고객문의 담당','Y');
INSERT INTO DF_Grade VALUES ('D_GR' || LPAD(DF_Grade_seq.nextval, 2, 0),'총괄관리자','사이트 관리 담당','Y');


/* DF_메신저 목록_기본 데이터 */
INSERT INTO DF_Messenger VALUES ('D_ME' || LPAD(DF_Messenger_seq.nextval, 2, 0),'카카오톡','Y');
INSERT INTO DF_Messenger VALUES ('D_ME' || LPAD(DF_Messenger_seq.nextval, 2, 0),'라인','Y');
INSERT INTO DF_Messenger VALUES ('D_ME' || LPAD(DF_Messenger_seq.nextval, 2, 0),'텔레그램','Y');
INSERT INTO DF_Messenger VALUES ('D_ME' || LPAD(DF_Messenger_seq.nextval, 2, 0),'인스타그램','Y');
INSERT INTO DF_Messenger VALUES ('D_ME' || LPAD(DF_Messenger_seq.nextval, 2, 0),'페이스북','Y');


/* DF_회원분류_기본 데이터 */
INSERT INTO DF_Person VALUES ('D_PE' || LPAD(DF_Person_seq.nextval, 2, 0),'회원');
INSERT INTO DF_Person VALUES ('D_PE' || LPAD(DF_Person_seq.nextval, 2, 0),'직원');


/* DF_직책_기본 데이터 */
INSERT INTO DF_Position VALUES ('D_PO' || LPAD(DF_Position_seq.nextval, 2, 0),'사원','인턴, 사원급','Y');
INSERT INTO DF_Position VALUES ('D_PO' || LPAD(DF_Position_seq.nextval, 2, 0),'부장','부장급','Y');
INSERT INTO DF_Position VALUES ('D_PO' || LPAD(DF_Position_seq.nextval, 2, 0),'과장','과장급','Y');


/* DF_문의항목_기본 데이터 */
INSERT INTO DF_Question VALUES ('D_QU' || LPAD(DF_Question_seq.nextval, 2, 0),'회원-개인정보 관련','Y');
INSERT INTO DF_Question VALUES ('D_QU' || LPAD(DF_Question_seq.nextval, 2, 0),'회원-가입문의','Y');
INSERT INTO DF_Question VALUES ('D_QU' || LPAD(DF_Question_seq.nextval, 2, 0),'회원-탈퇴문의','Y');
INSERT INTO DF_Question VALUES ('D_QU' || LPAD(DF_Question_seq.nextval, 2, 0),'회원-기타','Y');
INSERT INTO DF_Question VALUES ('D_QU' || LPAD(DF_Question_seq.nextval, 2, 0),'재능교환-교환 방법','Y');
INSERT INTO DF_Question VALUES ('D_QU' || LPAD(DF_Question_seq.nextval, 2, 0),'재능교환-교환내역 확인','Y');
INSERT INTO DF_Question VALUES ('D_QU' || LPAD(DF_Question_seq.nextval, 2, 0),'재능교환-댓글 수정삭제','Y');
INSERT INTO DF_Question VALUES ('D_QU' || LPAD(DF_Question_seq.nextval, 2, 0),'재능교환-기타','Y');
INSERT INTO DF_Question VALUES ('D_QU' || LPAD(DF_Question_seq.nextval, 2, 0),'신고-회원 신고','Y');
INSERT INTO DF_Question VALUES ('D_QU' || LPAD(DF_Question_seq.nextval, 2, 0),'신고-욕설비방어 신고','Y');
INSERT INTO DF_Question VALUES ('D_QU' || LPAD(DF_Question_seq.nextval, 2, 0),'신고-불친절 신고','Y');
INSERT INTO DF_Question VALUES ('D_QU' || LPAD(DF_Question_seq.nextval, 2, 0),'신고-불법행위 신고','Y');
INSERT INTO DF_Question VALUES ('D_QU' || LPAD(DF_Question_seq.nextval, 2, 0),'신고-홍보·광고 글 신고','Y');
INSERT INTO DF_Question VALUES ('D_QU' || LPAD(DF_Question_seq.nextval, 2, 0),'신고-기타','Y');
INSERT INTO DF_Question VALUES ('D_QU' || LPAD(DF_Question_seq.nextval, 2, 0),'기타-상담사 친절 접수','Y');
INSERT INTO DF_Question VALUES ('D_QU' || LPAD(DF_Question_seq.nextval, 2, 0),'기타-상담사 불만 접수','Y');
INSERT INTO DF_Question VALUES ('D_QU' || LPAD(DF_Question_seq.nextval, 2, 0),'기타','Y');


/*DF_재능카테고리_기본 데이터 */
INSERT INTO DF_TalCategory VALUES ('D_TC' || LPAD(DF_TalCategory_seq.nextval, 2, 0),'디자인','설명','Y');
INSERT INTO DF_TalCategory VALUES ('D_TC' || LPAD(DF_TalCategory_seq.nextval, 2, 0),'문서','설명','Y');
INSERT INTO DF_TalCategory VALUES ('D_TC' || LPAD(DF_TalCategory_seq.nextval, 2, 0),'번역','설명','Y');
INSERT INTO DF_TalCategory VALUES ('D_TC' || LPAD(DF_TalCategory_seq.nextval, 2, 0),'컨텐츠제작','설명','Y');
INSERT INTO DF_TalCategory VALUES ('D_TC' || LPAD(DF_TalCategory_seq.nextval, 2, 0),'마케팅','설명','Y');
INSERT INTO DF_TalCategory VALUES ('D_TC' || LPAD(DF_TalCategory_seq.nextval, 2, 0),'상담&노하우','설명','Y');
INSERT INTO DF_TalCategory VALUES ('D_TC' || LPAD(DF_TalCategory_seq.nextval, 2, 0),'IT&프로그래밍','설명','Y');


/* DF_재능항목_기본 데이터 */
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC01','로고디자인','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC01','웹디자인','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC01','인테리어','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC01','포토샵편집','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC01','커뮤니티&sns','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC02','자소서교정&첨삭','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC02','보고서','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC02','엑셀','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC02','리서치','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC02','브랜드네이밍','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC03','영어','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC03','일본어','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC03','중국어','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC03','프랑스어','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC03','독일어','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC04','영상제작(홍보물)','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC04','사진촬영','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC04','더빙','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC04','녹음','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC04','음악','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC04','BGM','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC04','제작','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC04','애니메이션','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC05','SNS마케팅','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC05','키워드광고','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC05','카페&블로그','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC05','해외마케팅','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC05','언론홍보','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC06','뷰티','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC06','헬스','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC06','육아&교육','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC06','여행','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC06','자산관리','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC06','커리어&자기계발','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC07','모바일앱&웹','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC07','커머스&쇼핑몰','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC07','프로그램','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC07','개발','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC07','데이터베이스','설명','Y');
INSERT INTO DF_TalDiv VALUES ('D_TD' || LPAD(DF_TalDiv_seq.nextval, 2, 0),'D_TC07','데이터분석','설명','Y');






