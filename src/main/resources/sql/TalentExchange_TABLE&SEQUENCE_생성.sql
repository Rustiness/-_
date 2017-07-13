/* 문의답변_시퀀스 */
CREATE SEQUENCE CounBDAnswer_seq
INCREMENT BY 1
START WITH 1;

/* 고객문의_시퀀스 */
CREATE SEQUENCE CounBoard_seq
INCREMENT BY 1
START WITH 1;

/* DF_관리등급_시퀀스 */
CREATE SEQUENCE DF_Grade_seq
INCREMENT BY 1
START WITH 1;

/* DF_메신저 목록_시퀀스 */
CREATE SEQUENCE DF_Messenger_seq
INCREMENT BY 1
START WITH 1;

/* DF_회원분류_시퀀스 */
CREATE SEQUENCE DF_Person_seq
INCREMENT BY 1
START WITH 1;

/* DF_직책_시퀀스 */
CREATE SEQUENCE DF_Position_seq
INCREMENT BY 1
START WITH 1;

/* DF_문의항목_시퀀스 */
CREATE SEQUENCE DF_Question_seq
INCREMENT BY 1
START WITH 1;

/* DF_재능카테고리_시퀀스 */
CREATE SEQUENCE DF_TalCategory_seq
INCREMENT BY 1
START WITH 1;

/* DF_재능항목_시퀀스 */
CREATE SEQUENCE DF_TalDiv_seq
INCREMENT BY 1
START WITH 1;

/* 직원 추가정보_시퀀스 */
CREATE SEQUENCE Emeployee_seq
INCREMENT BY 1
START WITH 1;

/* 회원_시퀀스 */
CREATE SEQUENCE Member_seq
INCREMENT BY 1
START WITH 1;

/* 재능글_첨부파일_시퀀스 */
CREATE SEQUENCE TalentBDFile_seq
INCREMENT BY 1
START WITH 1;

/* 재능글_시퀀스 */
CREATE SEQUENCE TalentBoard_seq
INCREMENT BY 1
START WITH 1;

/* 댓글_시퀀스 */
CREATE SEQUENCE TalExcComment_seq
INCREMENT BY 1
START WITH 1;

/* 재능연결_시퀀스 */
CREATE SEQUENCE TalExcConn_seq
INCREMENT BY 1
START WITH 1;

/* 재능교환후기_시퀀스 */
CREATE SEQUENCE TalReview_seq
INCREMENT BY 1
START WITH 1;

/* 회원 */
CREATE TABLE Member (
	memNO VARCHAR2(10) NOT NULL, /* 회원번호 */
	personDF VARCHAR2(6) NOT NULL, /* 회원분류번호 */
	email VARCHAR2(40) NOT NULL, /* 아이디(이메일) */
	pass VARCHAR2(100) NOT NULL, /* 비밀번호 */
	name VARCHAR2(50) NOT NULL, /* 이름 */
	nickName VARCHAR2(100) NOT NULL, /* 닉네임 */
	birth DATE NOT NULL, /* 생년월일 */
	sex VARCHAR2(3) NOT NULL, /* 성별 */
	tel VARCHAR2(30) NOT NULL, /* 전화번호 */
	joinDate DATE DEFAULT sysdate NOT NULL, /* 회원가입일 */
	latestDate DATE, /* 최근접속일 */
	state VARCHAR2(3) DEFAULT '1' NOT NULL /* 계정상태 */
);

CREATE UNIQUE INDEX PK_Member
	ON Member (
		memNO ASC
	);

CREATE UNIQUE INDEX UIX_Member
	ON Member (
		email ASC,
		nickName ASC
	);

ALTER TABLE Member
	ADD
	CONSTRAINT PK_Member
	PRIMARY KEY (
		memNO
	);

ALTER TABLE Member
	ADD
	CONSTRAINT UK_Member
	UNIQUE (
		email,
		nickName
	);

/* DF_회원분류 */
CREATE TABLE DF_Person (
	personDF VARCHAR2(6) NOT NULL, /* 회원분류번호 */
	name VARCHAR2(100) NOT NULL /* 분류명 */
);

CREATE UNIQUE INDEX PK_DF_Person
	ON DF_Person (
		personDF ASC
	);

CREATE UNIQUE INDEX UIX_DF_Person
	ON DF_Person (
		name ASC
	);

ALTER TABLE DF_Person
	ADD
	CONSTRAINT PK_DF_Person
	PRIMARY KEY (
		personDF
	);

ALTER TABLE DF_Person
	ADD
	CONSTRAINT UK_DF_Person
	UNIQUE (
		name
	);

/* 회원 추가정보 */
CREATE TABLE NP_MemMoreInfo (
	memNO VARCHAR2(10) NOT NULL, /* 회원번호 */
	memo VARCHAR2(1000), /* 회원메모 */
	memoDate DATE /* 회원메모수정일 */
);

/* 회원 메신저정보 */
CREATE TABLE NP_MemMes (
	no VARCHAR2(10) NOT NULL, /* 메신저번호 */
	memNO VARCHAR2(10) NOT NULL, /* 회원번호 */
	mesDF VARCHAR2(6) NOT NULL, /* 메신저구분번호 */
	id VARCHAR2(40) NOT NULL /* 메신저아이디 */
);

/* DF_메신저 목록 */
CREATE TABLE DF_Messenger (
	mesDF VARCHAR2(6) NOT NULL, /* 메신저구분번호 */
	name VARCHAR2(80) NOT NULL, /* 메신저명 */
	isYn VARCHAR2(1) DEFAULT 'N' NOT NULL /* 활성유무 */
);

CREATE UNIQUE INDEX PK_DF_Messenger
	ON DF_Messenger (
		mesDF ASC
	);

CREATE UNIQUE INDEX UIX_DF_Messenger
	ON DF_Messenger (
		name ASC
	);

ALTER TABLE DF_Messenger
	ADD
	CONSTRAINT PK_DF_Messenger
	PRIMARY KEY (
		mesDF
	);

ALTER TABLE DF_Messenger
	ADD
	CONSTRAINT UK_DF_Messenger
	UNIQUE (
		name
	);

/* 직원 추가정보 */
CREATE TABLE Employee (
	empNO VARCHAR2(10) NOT NULL, /* 직원번호 */
	memNO VARCHAR2(10) NOT NULL, /* 회원번호 */
	gradeDF VARCHAR2(6) NOT NULL, /* 관리등급번호 */
	posDF VARCHAR2(6) NOT NULL, /* 직책번호 */
	latestDate DATE NOT NULL, /* 입사일 */
	retireDate DATE, /* 퇴사일 */
	state VARCHAR2(3) DEFAULT '1' NOT NULL /* 직원상태 */
);

CREATE UNIQUE INDEX PK_Employee
	ON Employee (
		empNO ASC
	);

ALTER TABLE Employee
	ADD
	CONSTRAINT PK_Employee
	PRIMARY KEY (
		empNO
	);

/* DF_직책 */
CREATE TABLE DF_Position (
	posDF VARCHAR2(6) NOT NULL, /* 직책번호 */
	name VARCHAR2(80) NOT NULL, /* 직책명 */
	memo VARCHAR2(1000), /* 직책메모 */
	isYn VARCHAR2(1) DEFAULT 'N' NOT NULL /* 활성유무 */
);

CREATE UNIQUE INDEX PK_DF_Position
	ON DF_Position (
		posDF ASC
	);

CREATE UNIQUE INDEX UIX_DF_Position
	ON DF_Position (
		name ASC
	);

ALTER TABLE DF_Position
	ADD
	CONSTRAINT PK_DF_Position
	PRIMARY KEY (
		posDF
	);

ALTER TABLE DF_Position
	ADD
	CONSTRAINT UK_DF_Position
	UNIQUE (
		name
	);

/* DF_관리등급 */
CREATE TABLE DF_Grade (
	gradeDF VARCHAR2(6) NOT NULL, /* 관리등급번호 */
	name VARCHAR2(80) NOT NULL, /* 등급명 */
	memo VARCHAR2(1000), /* 등급메모 */
	isYn VARCHAR2(1) DEFAULT 'N' NOT NULL /* 활성유무 */
);

CREATE UNIQUE INDEX PK_DF_Grade
	ON DF_Grade (
		gradeDF ASC
	);

CREATE UNIQUE INDEX UIX_DF_Grade
	ON DF_Grade (
		name ASC
	);

ALTER TABLE DF_Grade
	ADD
	CONSTRAINT PK_DF_Grade
	PRIMARY KEY (
		gradeDF
	);

ALTER TABLE DF_Grade
	ADD
	CONSTRAINT UK_DF_Grade
	UNIQUE (
		name
	);

/* 고객문의 */
CREATE TABLE CounBoard (
	csNO VARCHAR2(10) NOT NULL, /* 문의번호 */
	memNO VARCHAR2(10) NOT NULL, /* 회원번호 */
	questDF VARCHAR2(6) NOT NULL, /* 항목번호 */
	title VARCHAR2(100) NOT NULL, /* 문의제목 */
	content VARCHAR2(2000) NOT NULL, /* 문의내용 */
	writeDate DATE DEFAULT sysdate NOT NULL, /* 등록일시 */
	repairDate DATE, /* 수정일시 */
	state VARCHAR2(3) DEFAULT '1' NOT NULL /* 표시상태 */
);

CREATE UNIQUE INDEX PK_CounBoard
	ON CounBoard (
		csNO ASC
	);

ALTER TABLE CounBoard
	ADD
	CONSTRAINT PK_CounBoard
	PRIMARY KEY (
		csNO
	);

/* DF_문의항목 */
CREATE TABLE DF_Question (
	questDF VARCHAR2(6) NOT NULL, /* 항목번호 */
	name VARCHAR2(80) NOT NULL, /* 항목명 */
	isYn VARCHAR2(1) DEFAULT 'N' NOT NULL /* 활성유무 */
);

CREATE UNIQUE INDEX PK_DF_Question
	ON DF_Question (
		questDF ASC
	);

CREATE UNIQUE INDEX UIX_DF_Question
	ON DF_Question (
		name ASC
	);

ALTER TABLE DF_Question
	ADD
	CONSTRAINT PK_DF_Question
	PRIMARY KEY (
		questDF
	);

ALTER TABLE DF_Question
	ADD
	CONSTRAINT UK_DF_Question
	UNIQUE (
		name
	);

/* 문의답변 */
CREATE TABLE CounBDAnswer (
	answerNO VARCHAR2(10) NOT NULL, /* 문의답변번호 */
	csNO VARCHAR2(10) NOT NULL, /* 문의번호 */
	empNO VARCHAR2(10) NOT NULL, /* 직원번호 */
	content VARCHAR2(2000) NOT NULL, /* 답변내용 */
	writeDate DATE DEFAULT sysdate NOT NULL /* 등록일시 */
);

CREATE UNIQUE INDEX PK_CounBDAnswer
	ON CounBDAnswer (
		answerNO ASC
	);

ALTER TABLE CounBDAnswer
	ADD
	CONSTRAINT PK_CounBDAnswer
	PRIMARY KEY (
		answerNO
	);

/* DF_재능항목 */
CREATE TABLE DF_TalDiv (
	talDivDF VARCHAR2(6) NOT NULL, /* 재능항목번호 */
	talCateDF VARCHAR2(6) NOT NULL, /* 카테고리번호 */
	name VARCHAR2(80) NOT NULL, /* 재능명 */
	memo VARCHAR2(1000), /* 분류메모 */
	isYn VARCHAR2(1) DEFAULT 'N' NOT NULL /* 활성유무 */
);

CREATE UNIQUE INDEX PK_DF_TalDiv
	ON DF_TalDiv (
		talDivDF ASC
	);

CREATE UNIQUE INDEX UIX_DF_TalDiv
	ON DF_TalDiv (
		name ASC
	);

ALTER TABLE DF_TalDiv
	ADD
	CONSTRAINT PK_DF_TalDiv
	PRIMARY KEY (
		talDivDF
	);

ALTER TABLE DF_TalDiv
	ADD
	CONSTRAINT UK_DF_TalDiv
	UNIQUE (
		name
	);

/* 재능글 */
CREATE TABLE TalentBoard (
	talDocNO VARCHAR2(10) NOT NULL, /* 재능글번호 */
	memNO VARCHAR2(10) NOT NULL, /* 회원번호(작성자) */
	title VARCHAR2(100) NOT NULL, /* 제목 */
	contentHave VARCHAR2(2000) NOT NULL, /* 보유한 재능내용 */
	contentWant VARCHAR2(2000) NOT NULL, /* 원하는 재능내용 */
	excCalls NUMBER, /* 교환신청수 */
	views NUMBER, /* 조회수 */
	isYnConn VARCHAR2(1) DEFAULT 'N' NOT NULL, /* 재능연결유무 */
	isYnFile VARCHAR2(1) DEFAULT 'N' NOT NULL, /* 첨부파일유무 */
	writeDate DATE DEFAULT sysdate NOT NULL, /* 등록일시 */
	repairDate DATE, /* 수정일시 */
	state VARCHAR2(3) DEFAULT '1' NOT NULL /* 표시상태 */
);

CREATE UNIQUE INDEX PK_TalentBoard
	ON TalentBoard (
		talDocNO ASC
	);

ALTER TABLE TalentBoard
	ADD
	CONSTRAINT PK_TalentBoard
	PRIMARY KEY (
		talDocNO
	);

/* 보유한재능(작성자) */
CREATE TABLE NP_TalHave (
	talDocNO VARCHAR2(10) NOT NULL, /* 재능글번호 */
	talDivDF VARCHAR2(6) NOT NULL /* 재능항목번호 */
);

/* 원하는재능(작성자) */
CREATE TABLE NP_TalWant (
	talDocNO VARCHAR2(10) NOT NULL, /* 재능글번호 */
	talDivDF VARCHAR2(6) NOT NULL /* 재능항목번호 */
);

/* 재능연결 */
CREATE TABLE TalExcConn (
	talConnNO VARCHAR2(10) NOT NULL, /* 재능연결번호 */
	talDocNO VARCHAR2(10) NOT NULL, /* 재능글번호 */
	memNO VARCHAR2(10) NOT NULL, /* 회원번호(신청자) */
	title VARCHAR2(100) NOT NULL, /* 신청제목 */
	content VARCHAR2(2000) NOT NULL, /* 신청내용 */
	reqDate DATE DEFAULT sysdate NOT NULL, /* 신청일시 */
	isYNview VARCHAR2(1) DEFAULT 'N' NOT NULL, /* 신청확인유무 */
	state VARCHAR2(3) DEFAULT '1' NOT NULL /* 진행상태 */
);

CREATE UNIQUE INDEX PK_TalExcConn
	ON TalExcConn (
		talConnNO ASC
	);

ALTER TABLE TalExcConn
	ADD
	CONSTRAINT PK_TalExcConn
	PRIMARY KEY (
		talConnNO
	);

/* 재능교환완료(후기) */
CREATE TABLE TalReview (
	talReviewNO VARCHAR2(10) NOT NULL, /* 재능리뷰번호 */
	talConnNO VARCHAR2(10) NOT NULL, /* 재능연결번호 */
	memNO VARCHAR2(10) NOT NULL, /* 회원번호(작성자) */
	title VARCHAR2(100) NOT NULL, /* 후기제목 */
	content VARCHAR2(2000) NOT NULL, /* 후기내용 */
	writeDate DATE DEFAULT sysdate NOT NULL, /* 등록일시 */
	repairDate DATE, /* 수정일시 */
	state VARCHAR2(3) DEFAULT '1' NOT NULL /* 표시상태 */
);

CREATE UNIQUE INDEX PK_TalReview
	ON TalReview (
		talReviewNO ASC
	);

ALTER TABLE TalReview
	ADD
	CONSTRAINT PK_TalReview
	PRIMARY KEY (
		talReviewNO
	);

/* 만족도 */
CREATE TABLE NP_TalPoint (
	talReviewNO VARCHAR2(10) NOT NULL, /* 재능리뷰번호 */
	memNO VARCHAR2(10) NOT NULL, /* 회원번호(상대) */
	point NUMBER NOT NULL /* 만족도 */
);

/* 보유한재능(신청자) */
CREATE TABLE NP_TalHaveCn (
	talConnNO VARCHAR2(10) NOT NULL, /* 재능연결번호 */
	talDivDF VARCHAR2(6) NOT NULL /* 재능항목번호 */
);

/* DF_재능카테고리 */
CREATE TABLE DF_TalCategory (
	talCateDF VARCHAR2(6) NOT NULL, /* 카테고리번호 */
	name VARCHAR2(80) NOT NULL, /* 카테고리명 */
	memo VARCHAR2(1000), /* 분류메모 */
	isYn VARCHAR2(1) DEFAULT 'N' NOT NULL /* 활성유무 */
);

CREATE UNIQUE INDEX PK_DF_TalCategory
	ON DF_TalCategory (
		talCateDF ASC
	);

CREATE UNIQUE INDEX UIX_DF_TalCategory
	ON DF_TalCategory (
		name ASC
	);

ALTER TABLE DF_TalCategory
	ADD
	CONSTRAINT PK_DF_TalCategory
	PRIMARY KEY (
		talCateDF
	);

ALTER TABLE DF_TalCategory
	ADD
	CONSTRAINT UK_DF_TalCategory
	UNIQUE (
		name
	);

/* 재능글_첨부파일 */
CREATE TABLE TalentBDFile (
	fileNO VARCHAR2(10) NOT NULL, /* 첨부파일번호 */
	talDocNO VARCHAR2(10) NOT NULL, /* 재능글번호 */
	name VARCHAR2(80) NOT NULL, /* 파일명 */
	url VARCHAR2(500), /* 파일경로 */
	fileSize VARCHAR2(100) /* 파일크기 */
);

CREATE UNIQUE INDEX PK_TalentBDFile
	ON TalentBDFile (
		fileNO ASC
	);

CREATE UNIQUE INDEX UIX_TalentBDFile
	ON TalentBDFile (
		name ASC
	);

ALTER TABLE TalentBDFile
	ADD
	CONSTRAINT PK_TalentBDFile
	PRIMARY KEY (
		fileNO
	);

ALTER TABLE TalentBDFile
	ADD
	CONSTRAINT UK_TalentBDFile
	UNIQUE (
		name
	);

/* 댓글 */
CREATE TABLE TalExcComment (
	commExNO VARCHAR2(10) NOT NULL, /* 댓글번호 */
	talReviewNO VARCHAR2(10) NOT NULL, /* 재능리뷰번호 */
	memNO VARCHAR2(10) NOT NULL, /* 회원번호(작성자) */
	content VARCHAR2(2000) NOT NULL, /* 댓글내용 */
	writeDate DATE DEFAULT sysdate NOT NULL, /* 등록일시 */
	repairDate DATE, /* 수정일시 */
	state VARCHAR2(3) DEFAULT '1' NOT NULL /* 표시상태 */
);

CREATE UNIQUE INDEX PK_TalExcComment
	ON TalExcComment (
		commExNO ASC
	);

ALTER TABLE TalExcComment
	ADD
	CONSTRAINT PK_TalExcComment
	PRIMARY KEY (
		commExNO
	);

/* 새 테이블 */
CREATE TABLE NP_TalWantCn (
	talConnNO VARCHAR2(10) NOT NULL, /* 재능연결번호 */
	talDivDF VARCHAR2(6) NOT NULL /* 재능항목번호 */
);

ALTER TABLE Member
	ADD
	CONSTRAINT FK_DF_Person_TO_Member
	FOREIGN KEY (
		personDF
	)
	REFERENCES DF_Person (
		personDF
	);

ALTER TABLE NP_MemMoreInfo
	ADD
	CONSTRAINT FK_Member_TO_NP_MemMoreInfo
	FOREIGN KEY (
		memNO
	)
	REFERENCES Member (
		memNO
	);

ALTER TABLE NP_MemMes
	ADD
	CONSTRAINT FK_DF_Messenger_TO_NP_MemMes
	FOREIGN KEY (
		mesDF
	)
	REFERENCES DF_Messenger (
		mesDF
	);

ALTER TABLE NP_MemMes
	ADD
	CONSTRAINT FK_Member_TO_NP_MemMes
	FOREIGN KEY (
		memNO
	)
	REFERENCES Member (
		memNO
	);

ALTER TABLE Employee
	ADD
	CONSTRAINT FK_Member_TO_Employee
	FOREIGN KEY (
		memNO
	)
	REFERENCES Member (
		memNO
	);

ALTER TABLE Employee
	ADD
	CONSTRAINT FK_DF_Position_TO_Employee
	FOREIGN KEY (
		posDF
	)
	REFERENCES DF_Position (
		posDF
	);

ALTER TABLE Employee
	ADD
	CONSTRAINT FK_DF_Grade_TO_Employee
	FOREIGN KEY (
		gradeDF
	)
	REFERENCES DF_Grade (
		gradeDF
	);

ALTER TABLE CounBoard
	ADD
	CONSTRAINT FK_DF_Question_TO_CounBoard
	FOREIGN KEY (
		questDF
	)
	REFERENCES DF_Question (
		questDF
	);

ALTER TABLE CounBoard
	ADD
	CONSTRAINT FK_Member_TO_CounBoard
	FOREIGN KEY (
		memNO
	)
	REFERENCES Member (
		memNO
	);

ALTER TABLE CounBDAnswer
	ADD
	CONSTRAINT FK_CounBoard_TO_CounBDAnswer
	FOREIGN KEY (
		csNO
	)
	REFERENCES CounBoard (
		csNO
	);

ALTER TABLE CounBDAnswer
	ADD
	CONSTRAINT FK_Employee_TO_CounBDAnswer
	FOREIGN KEY (
		empNO
	)
	REFERENCES Employee (
		empNO
	);

ALTER TABLE DF_TalDiv
	ADD
	CONSTRAINT FK_DF_TalCategory_TO_DF_TalDiv
	FOREIGN KEY (
		talCateDF
	)
	REFERENCES DF_TalCategory (
		talCateDF
	);

ALTER TABLE TalentBoard
	ADD
	CONSTRAINT FK_Member_TO_TalentBoard
	FOREIGN KEY (
		memNO
	)
	REFERENCES Member (
		memNO
	);

ALTER TABLE NP_TalHave
	ADD
	CONSTRAINT FK_TalentBoard_TO_NP_TalHave
	FOREIGN KEY (
		talDocNO
	)
	REFERENCES TalentBoard (
		talDocNO
	);

ALTER TABLE NP_TalHave
	ADD
	CONSTRAINT FK_DF_TalDiv_TO_NP_TalHave
	FOREIGN KEY (
		talDivDF
	)
	REFERENCES DF_TalDiv (
		talDivDF
	);

ALTER TABLE NP_TalWant
	ADD
	CONSTRAINT FK_TalentBoard_TO_NP_TalWant
	FOREIGN KEY (
		talDocNO
	)
	REFERENCES TalentBoard (
		talDocNO
	);

ALTER TABLE NP_TalWant
	ADD
	CONSTRAINT FK_DF_TalDiv_TO_NP_TalWant
	FOREIGN KEY (
		talDivDF
	)
	REFERENCES DF_TalDiv (
		talDivDF
	);

ALTER TABLE TalExcConn
	ADD
	CONSTRAINT FK_TalentBoard_TO_TalExcConn
	FOREIGN KEY (
		talDocNO
	)
	REFERENCES TalentBoard (
		talDocNO
	);

ALTER TABLE TalExcConn
	ADD
	CONSTRAINT FK_Member_TO_TalExcConn
	FOREIGN KEY (
		memNO
	)
	REFERENCES Member (
		memNO
	);

ALTER TABLE TalReview
	ADD
	CONSTRAINT FK_TalExcConn_TO_TalReview
	FOREIGN KEY (
		talConnNO
	)
	REFERENCES TalExcConn (
		talConnNO
	);

ALTER TABLE TalReview
	ADD
	CONSTRAINT FK_Member_TO_TalReview
	FOREIGN KEY (
		memNO
	)
	REFERENCES Member (
		memNO
	);

ALTER TABLE NP_TalPoint
	ADD
	CONSTRAINT FK_TalReview_TO_NP_TalPoint
	FOREIGN KEY (
		talReviewNO
	)
	REFERENCES TalReview (
		talReviewNO
	);

ALTER TABLE NP_TalPoint
	ADD
	CONSTRAINT FK_Member_TO_NP_TalPoint
	FOREIGN KEY (
		memNO
	)
	REFERENCES Member (
		memNO
	);

ALTER TABLE NP_TalHaveCn
	ADD
	CONSTRAINT FK_DF_TalDiv_TO_NP_TalHaveCn
	FOREIGN KEY (
		talDivDF
	)
	REFERENCES DF_TalDiv (
		talDivDF
	);

ALTER TABLE NP_TalHaveCn
	ADD
	CONSTRAINT FK_TalExcConn_TO_NP_TalHaveCn
	FOREIGN KEY (
		talConnNO
	)
	REFERENCES TalExcConn (
		talConnNO
	);

ALTER TABLE TalentBDFile
	ADD
	CONSTRAINT FK_TalentBoard_TO_TalentBDFile
	FOREIGN KEY (
		talDocNO
	)
	REFERENCES TalentBoard (
		talDocNO
	);

ALTER TABLE TalExcComment
	ADD
	CONSTRAINT FK_TalReview_TO_TalExcComment
	FOREIGN KEY (
		talReviewNO
	)
	REFERENCES TalReview (
		talReviewNO
	);

ALTER TABLE TalExcComment
	ADD
	CONSTRAINT FK_Member_TO_TalExcComment
	FOREIGN KEY (
		memNO
	)
	REFERENCES Member (
		memNO
	);

ALTER TABLE NP_TalWantCn
	ADD
	CONSTRAINT FK_TalExcConn_TO_NP_TalWantCn
	FOREIGN KEY (
		talConnNO
	)
	REFERENCES TalExcConn (
		talConnNO
	);

ALTER TABLE NP_TalWantCn
	ADD
	CONSTRAINT FK_DF_TalDiv_TO_NP_TalWantCn
	FOREIGN KEY (
		talDivDF
	)
	REFERENCES DF_TalDiv (
		talDivDF
	);