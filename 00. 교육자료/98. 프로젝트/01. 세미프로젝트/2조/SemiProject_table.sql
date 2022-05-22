-- 계정 생성
-- CREATE USER SEMIWEB IDENTIFIED BY SEMIWEB;
-- GRANT RESOURCE, CONNECT TO SEMIWEB;


-- 테이블 삭제 후 재생성 시 시퀀스도 삭제 필수
-- 테이블 / 시퀀스 삭제
DROP TABLE TB_SPOT;
DROP TABLE TB_STAY;
DROP TABLE TB_REST;
DROP TABLE TB_COMMENT;
DROP TABLE TB_REVIEW;
DROP TABLE TB_MEM;
DROP TABLE TB_LOCAL;
DROP SEQUENCE SEQ_UNO;
DROP SEQUENCE SEQ_TB_LOCAL_NO;
DROP SEQUENCE SEQ_TB_SPOT_NO;
DROP SEQUENCE SEQ_TB_STAY_NO;
DROP SEQUENCE SEQ_TB_REST_NO;
DROP SEQUENCE SEQ_TB_COMMENT_NO;
DROP SEQUENCE SEQ_TB_REVIEW_NO;


------------------------------------------------
--------------- TB_MEM 관련 테이블 --------------
------------------------------------------------

CREATE TABLE TB_MEM (
    NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(30) NOT NULL UNIQUE,
    PASSWORD VARCHAR2(100) NOT NULL,
    ROLE VARCHAR2(10) DEFAULT 'ROLE_USER',
    MEM_NM VARCHAR2(50) NOT NULL,
    PHONE VARCHAR2(13) NOT NULL UNIQUE,
    EMAIL VARCHAR2(100),
    ADDR VARCHAR2(100),
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
    ENROLL_DATE DATE DEFAULT SYSDATE
);

-- ALTER TABLE TB_MEM MODIFY (MEM_NM VARCHAR2(50));

COMMENT ON COLUMN TB_MEM.NO IS '회원번호';
COMMENT ON COLUMN TB_MEM.MEM_ID IS '회원아이디';
COMMENT ON COLUMN TB_MEM.PASSWORD IS '회원비밀번호';
COMMENT ON COLUMN TB_MEM.ROLE IS '회원타입';
COMMENT ON COLUMN TB_MEM.MEM_NM IS '회원명';
COMMENT ON COLUMN TB_MEM.PHONE IS '전화번호';
COMMENT ON COLUMN TB_MEM.EMAIL IS '이메일';
COMMENT ON COLUMN TB_MEM.ADDR IS '주소';
COMMENT ON COLUMN TB_MEM.STATUS IS '상태값(Y/N)';
COMMENT ON COLUMN TB_MEM.ENROLL_DATE IS '회원가입일';

CREATE SEQUENCE SEQ_UNO;

INSERT INTO TB_MEM (NO, MEM_ID, PASSWORD, ROLE, MEM_NM, PHONE, EMAIL, ADDR,STATUS, ENROLL_DATE) 
        VALUES(SEQ_UNO.NEXTVAL, 'admin', '1234', 'ROLE_ADMIN', '관리자', '01041794341', 'admin@iei.or.kr', '서울시 강남구 역삼동', DEFAULT, DEFAULT);
INSERT INTO TB_MEM VALUES(SEQ_UNO.NEXTVAL, 'yiyoung', '1234', DEFAULT, '김이영', '01011111111', 'yiyoung@iei.or.kr', '서울시 강남구 역삼동', DEFAULT, DEFAULT);
INSERT INTO TB_MEM VALUES(SEQ_UNO.NEXTVAL, 'hyeongjin', '1234', DEFAULT, '김형진', '01011112222', 'hyeongjin@iei.or.kr', '서울시 강남구 역삼동', DEFAULT, DEFAULT);
INSERT INTO TB_MEM VALUES(SEQ_UNO.NEXTVAL, 'minyeong', '1234', DEFAULT, '박민영', '01011113333', 'minyeong@iei.or.kr', '서울시 강남구 역삼동', DEFAULT, DEFAULT);
INSERT INTO TB_MEM VALUES(SEQ_UNO.NEXTVAL, 'sohee', '1234', DEFAULT, '박소희', '01011114444', 'sohee@iei.or.kr', '서울시 강남구 역삼동', DEFAULT, DEFAULT);
INSERT INTO TB_MEM VALUES(SEQ_UNO.NEXTVAL, 'jinhyeon', '1234', DEFAULT, '유지현', '01011115555', 'jinhyeon@iei.or.kr', '서울시 강남구 역삼동', DEFAULT, DEFAULT);
INSERT INTO TB_MEM VALUES(SEQ_UNO.NEXTVAL, 'yooil', '1234', DEFAULT, '정유일', '01011116666', 'yooil@iei.or.kr', '서울시 강남구 역삼동', DEFAULT, DEFAULT);

UPDATE TB_MEM
SET PASSWORD = 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ='
WHERE PASSWORD= '1234';




/* -----------------------------------------------------
    지역 테이블
----------------------------------------------------- */
CREATE TABLE TB_LOCAL (
    NO NUMBER(20) PRIMARY KEY,
    LOCAL_NAME VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN TB_LOCAL.NO IS '지역고유번호';
COMMENT ON COLUMN TB_LOCAL.LOCAL_NAME IS '지역명';

CREATE SEQUENCE SEQ_TB_LOCAL_NO;

INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '추자도');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '차귀도');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '비양도');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '한경면');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '한림읍');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '애월읍');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '제주시');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '조천읍');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '구좌읍');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '우도');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '성산읍');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '표선면');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '남원읍');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '서귀포시');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '중문');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '안덕면');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '대정읍');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '가파도');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '마라도');




/* -----------------------------------------------------
    여행지 테이블
----------------------------------------------------- */
CREATE TABLE TB_SPOT (	
    SP_NO NUMBER(10) PRIMARY KEY,
    SP_TITLE VARCHAR2(50),
    SP_TYPE VARCHAR2(20),
    SP_IMG_PATH VARCHAR2(50),
    SP_ADDR VARCHAR2(100),
    SP_PHONE VARCHAR2(50),
    SP_PRICE VARCHAR2(100),
    SP_OFFDAY VARCHAR2(100),
    SP_CONTENT VARCHAR2(2000),
    SP_LAT VARCHAR2(100),
    SP_LONG VARCHAR2(100),
    LOCAL NUMBER(20),
    FOREIGN KEY (LOCAL) REFERENCES TB_LOCAL (NO)
);

COMMENT ON COLUMN TB_SPOT.SP_NO IS '게시글 번호';
COMMENT ON COLUMN TB_SPOT.SP_TITLE IS '게시글 제목';
COMMENT ON COLUMN TB_SPOT.SP_TYPE IS '여행지 형태';
COMMENT ON COLUMN TB_SPOT.SP_IMG_PATH IS '이미지 경로';
COMMENT ON COLUMN TB_SPOT.SP_ADDR IS '주소';
COMMENT ON COLUMN TB_SPOT.SP_PHONE IS '전화번호';
COMMENT ON COLUMN TB_SPOT.SP_PRICE IS '입장료';
COMMENT ON COLUMN TB_SPOT.SP_OFFDAY IS '휴관일';
COMMENT ON COLUMN TB_SPOT.SP_CONTENT IS '게시글 내용';
COMMENT ON COLUMN TB_SPOT.SP_LAT IS '위도(X)';
COMMENT ON COLUMN TB_SPOT.SP_LONG IS '경도(Y)';
COMMENT ON COLUMN TB_SPOT.LOCAL IS '지역고유번호';

CREATE SEQUENCE SEQ_TB_SPOT_NO;

-- 관광명소
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '우도 일주', '관광명소', '/resources/images/spot/spot', '제주도 제주시 우도면', '-', '-', '-', '제주도에서도 가장 제주도의 모습을 많이 지니고 있어 찾아볼 수 있는 곳은 8개의 유인도 중에서 바로 우도다. 우도는 제주도의 또 다른 속살이라고 불릴 만큼 제주도를 가장 많이 닮았다.', '33.504468693145434', '126.95567048276018', 10);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '올레길 1코스', '관광명소', '/resources/images/spot/spot', '제주도 서귀포시 성산읍', '-', '-', '-', '1코스는 오름과 해변을 즐기며 성산일출봉을 배경으로 한 광치기해변의 풍경을 가슴 가득하게 담을 수 있는 화려한 올레길이다.', '33.478781428006805', '126.90619206049644', 11);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '한림에서 일몰 감상', '관광명소', '/resources/images/spot/spot', '제주도 제주시 한림읍', '-', '-', '-', '한림항 방파제 너머로 보이는 장엄한 해넘이의 모습을 감상하세요.', '33.3938062728464', '126.23910861862116', 5);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '함덕 서우봉', '관광명소', '/resources/images/spot/spot', '제주도 제주시 조천읍 조함해안로 525', '-', '-', '-', '제주시 조천읍 함덕리에 자리한 함덕해수욕장은 해수욕장 바로 옆에 우뚝선 오름(서우봉) 덕분에 ‘함덕서우봉해변’이라고도 불린다. 제주공항에서 불과 20km 떨어졌지만, 이곳에 도착하는 순간 다른 나라에 온 것 같은 기분이 든다.', '33.54463437968791', '126.67279685587532', 8);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '마라도', '관광명소', '/resources/images/spot/spot', '제주도 서귀포시 대정읍 가파리 600', '-', '-', '-', '마라도는 대한민국 최남단에 위치한 섬이며, 모슬포항에서 11km 정도 떨어져 있다. 면적은 0.3km2, 해안선의 길이는 4.2km이고, 최고점은 39m이다. 인구수는 59가구 127명이다.', '33.118470081316794', '126.26716361294976', 19);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '김영갑갤러리두모악', '관광명소', '/resources/images/spot/spot', '제주도 서귀포시 성산읍 삼달로 137', '064-784-9907', '성인 4,500원', '-', '김영갑갤러리두모악 미술관은 우리 모두가 주인입니다. 김영갑 선생님께서 돌아가신 이후에도 많은 분들의 지속적인 관심과 후원으로 김영갑갤러리두모악을 지켜낼 수 있었습니다.', '33.371907836292344', '126.85411975896017', 11);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '카멜리아힐 동백꽃 축제', '관광명소', '/resources/images/spot/spot', '제주도 서귀포시 안덕면 병악로 166', '064-792-0088', '성인 9,000원', '-', '카멜리아힐은 30년 열정과 사랑으로 제주의 자연을 담은 동양에서 가장 큰 독백 수목원입니다.', '33.2896334751668', '126.3699987388998', 14);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '오설록 티 뮤지엄', '관광명소', '/resources/images/spot/spot', '제주도 서귀포시 안덕면 신화역사로 15 오설록', '064-794-5312', '-', '-', '제주 오설록 서광 차밭과 맞닿아 있는 오설록 티뮤지엄은 아모레퍼시픽이 차와 한국 전통차 문화를 소개하고, 널리 보급하고자 2001년 9월에 개관한 국내 최초의 차 박물관입니다. 동양과 서양, 전통과 현대가 조화를 이룬 문화공간으로 차 유물관, 자연친화적인 휴식공간, 2013년 티클래스를 더해 21세기형 차 박물관으로 발돋움했습니다.', '33.30592832770181', '126.28943924447807', 14);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '비자림 숲길 산책', '관광명소', '/resources/images/spot/spot', '제주도 제주시 구좌읍 비자숲길 55', '064-710-7912', '성인 3,000원', '-', '천연기념물로 지정보호하고 있는 비자림은 448,165㎡의 면적에 500∼800년생 비자나무 2,800여 그루가 밀집하여 자생되고 있다.', '33.49039663908823', '126.80998111906597', 9);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '성산일출봉에서 일출 감상', '관광명소', '/resources/images/spot/spot', '제주도 서귀포시 성산읍 성산리 1', '064-783-0959', '성인 5,000원', '매월 첫째 월요일', '그 탄생의 비밀] 푸른 바다 사이에 우뚝 솟은 성채와 같은 모양, 봉우리 정상에 있는 거대한 사발 모양의 분화구, 그리고 그 위에서 맞이하는 일출의 장관 때문에 성산일출봉은 많은 사람들의 감흥과 탄성을 자아낸다.', '33.45912955959465', '126.94053483591037', 11);
-- 체험
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '제주 민속촌 체험', '체험', '/resources/images/spot/spot', '제주도 서귀포시 표선면 민속해안로 631-34', '064-787-4501', '성인 11,000원', '-', '제주민속촌은 제주의 문화유산을 원형 그대로 보존하기 위해 19세기를 기준 연대로 산촌, 중간산촌, 어촌, 토속신앙을 비롯하여 제주영문과 유배소 등을 전문가의 고증을 통해 구성한 박물관입니다.', '33.32239415820749', '126.84230265692152', 12);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '김녕 요트 투어', '체험', '/resources/images/spot/spot', '제주도 제주시 구좌읍 구좌해안로 229-16', '064-787-4501', '성인 60,000원', '-', '한라산 동쪽 수려한 자연경관속 화려한 요트에서 즐기는 제주의 風光은 또다른 인생의 기쁨을 제공합니다.제주도 요트의 마을 제주 김녕!', '33.55825769580114', '126.73723723244173', 9);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '제주레일바이크', '체험', '/resources/images/spot/spot', '제주도 제주시 구좌읍 용눈이오름로 641', '064-783-0033', '성인 15,000원', '-', '스릴과 힐링 ! 제주의 대자연을 달리고 체험 할 수 있는 제주레일바이크!', '33.464610778200985', '126.83693323027171', 9);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '낭만농장 귤밭76번지', '체험', '/resources/images/spot/spot', '제주도 서귀포시 안덕면 병악로 76', '0507-1422-5303', '성인 2,000원', '-', '낭만농장 귤밭76번지에서 제주 감귤 따기 체험이 가능합니다.', '33.28306081396761', '126.36514557932507', 14);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '얼라이브 카트', '체험', '/resources/images/spot/spot', '제주도 서귀포시 중문관광로 42', '064-805-0987', '성인 25,000원', '-', '짜릿한 속도감을 느낄 수 있는 카트레이싱 체험! 최고의 시설과 안전함, 무엇과도 비교할 수 없는 제주의 아름다운 자연속에서 쌓인 스트레스를 한방에 날려버리세요.', '33.25487485151966', '126.40779698229491', 15);
-- 쇼핑
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '아더하프', '쇼핑', '/resources/images/spot/spot', '제주도 제주시 신설로4길 4 1층', '0507-1330-4958', '-', '매주 월요일', '제주 유일 애견용품 편집샵입니다. 인터넷으로만 구입해야 했던 다양한 브랜드의 애견 용품이 구비되어있습니다.', '33.493719741629874', '126.54210789426187', 7);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '텐저린 컬쳐스테이션 편집샵', '쇼핑', '/resources/images/spot/spot', '제주도 제주시 관덕로 26', '064-751-9505', '-', '-', '국내외 다양한 브랜드와 제주의 브랜드들이 함께 어울리게 되었습니다.', '33.51284760943955', '126.52197434145695', 7);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '제주 감성 편집샵 제주가 푸르다', '쇼핑', '/resources/images/spot/spot', '제주도 서귀포시 칠십리로 38-1', '064-763-5885', '-', '-', '제주 감성 편집샵 제주가 푸르다에서 제주에서만 느낄 수 있는 특별한 오브제를 만나보실 수 있습니다.', '33.24133703688292', '126.56117238220656', 14);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '서쪽가게', '쇼핑', '/resources/images/spot/spot', '제주 제주시 한림읍 한림로 372-7', '064-796-8178', '-', '-', '환경은 더 이상 선택이 아닌 필수가 되야 한다고 생각한 저희는 더 이상 지구가 아프지 않았으면 좋겠다는 바람으로 샵의 철학을 정리하는 시간을 가졌어요', '33.39566798622275', '126.24389155539822', 5);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '아코제주', '쇼핑', '/resources/images/spot/spot', '제주 제주시 구좌읍 구좌로 75-1', '070-8869-2177', '-', '-', '아코제주에서 제주를 연상케 하는 소품들을 준비했습니다. 다양한 소품을 통해 제주를 느껴보세요.', '33.521506314642444', '126.85880724374273', 9);

-- 추가
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '이호테우해수욕장', '관광명소', '/resources/images/spot/spot', '제주 제주시 이호일동', '064-728-3994', '-', '-', '해수욕장 길목에는 아카시아숲이 우거져 있고, 모래사장 뒤에는 소나무숲이 형성되어 있는 도심에서 가장 가까운 해수욕장에서 해수욕과 산림욕을 즐겨보세요', '33.49809', '126.45318', 7);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '한라수목원', '관광명소', '/resources/images/spot/spot', '제주 제주시 수목원길 72', '064-710-7575', '-', '-', '녹색으로 가득한 한라수목원에서 마음의 여유를 느끼며 걸을 수 있어서 좋았습니다.', '33.47012', '126.49328', 7);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '제주양떼목장', '관광명소', '/resources/images/spot/spot', '제주 제주시 애월읍 도치돌길 289-13', '064-799-7346', '-', '-', '평창 양떼목장보다 규모는 작지만 아기자기하고 이쁜 카페가 있습니다. 이 곳에서 여유를 즐겨보세요', '33.41250', '126.36605', 6);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '새별오름', '관광명소', '/resources/images/spot/spot', '제주 제주시 애월읍 봉성리 산59-8', '-', '-', '-', '오름을 오르는 입구에서 약 30분 정도면 정상에 도착할 수 있는 아름다운 곳 입니다. ', '33.36662', '126.35644', 6);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '곽지해수욕장', '관광명소', '/resources/images/spot/spot', '제주 제주시 애월읍 곽지리', '064-728-3985', '-', '-', '해질녘의 모습은 감히 제주도를 넘어 전국 최고의 모습이 아닐까 하는 생각이 듭니다.', '33.45162', '126.30547', 6);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '981 파크', '체험', '/resources/images/spot/spot', '제주 제주시 애월읍 천덕로 880-24', '1833-9810', '-', '-', '같이 방문한 일행 뿐만아니라 지금까지 방문한 사람들과의 기록경쟁을 할 수 있습니다.', '33.39157', '126.36651', 6);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '중문 색달해수욕장', '관광명소', '/resources/images/spot/spot', '제주특별자치도 서귀포시 색달동', '064-760-4993', '-', '-', '중문 색달해수욕장은 중문 관광단지 가장 아래쪽에 위치한 곳으로 사계절 바문하기 좋은 해변입니다.', '33.24579', '126.41084', 15);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '천제연폭포', '관광명소', '/resources/images/spot/spot', '제주특별자치도 서귀포시 중문동 2232', '064-760-6331', '-', '-', '천재연폭포는 한라산에서 흐르는 중문천이 바다로 내려가면서 형성된 폭포입니다.', '33.25177', '126.41656', 15);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '퍼시픽랜드', '체험', '/resources/images/spot/spot', '제주 서귀포시 중문관광로 154-17', '1544-2988', '-', '-', '중문해수욕장 바로 옆에 위치한 퍼시픽랜드에서는 돌고래쇼, 요트체험, 제트보트 등을 체험할 수 있는 복합 문화공간입니다.', '33.24395', '126.41561', 15);



/* -----------------------------------------------------
숙박 게시판 테이블 생성
----------------------------------------------------- */
CREATE TABLE TB_STAY (	
    ST_NO NUMBER(10) PRIMARY KEY,
    ST_TYPE VARCHAR2(20), 
    ST_NAME VARCHAR2(100),
    ST_IMG_PATH VARCHAR2(50),
    ST_ADDR VARCHAR2(100),
    ST_PHONE VARCHAR2(100),
    ST_PRICE VARCHAR2(50),
    ST_CONTENT VARCHAR2(2000),
    ST_LAT VARCHAR2(100),
    ST_LONG VARCHAR2(100),
    LOCAL NUMBER(20),
    FOREIGN KEY (LOCAL) REFERENCES TB_LOCAL (NO)
);
-- 컬럼명 변경
ALTER TABLE TB_STAY RENAME COLUMN ST_PHONE TO ST_PRICE2;
ALTER TABLE TB_STAY RENAME COLUMN ST_PRICE TO ST_PHONE;
ALTER TABLE TB_STAY RENAME COLUMN ST_PRICE2 TO ST_PRICE;

COMMENT ON COLUMN TB_STAY.ST_NO IS '게시글 번호';
COMMENT ON COLUMN TB_STAY.ST_TYPE IS '숙박 형태';
COMMENT ON COLUMN TB_STAY.ST_NAME IS '숙소 이름';
COMMENT ON COLUMN TB_STAY.ST_IMG_PATH IS '이미지 경로';
COMMENT ON COLUMN TB_STAY.ST_ADDR IS '주소';
COMMENT ON COLUMN TB_STAY.ST_PHONE IS '전화번호';
COMMENT ON COLUMN TB_STAY.ST_PRICE IS '가격';
COMMENT ON COLUMN TB_STAY.ST_CONTENT IS '게시글 내용';
COMMENT ON COLUMN TB_STAY.ST_LAT IS '위도(X)';
COMMENT ON COLUMN TB_STAY.ST_LONG IS '경도(Y)';
COMMENT ON COLUMN TB_STAY.LOCAL IS '지역고유번호';

CREATE SEQUENCE SEQ_TB_STAY_NO;

-- 호텔
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '랜딩관 제주신화월드', '/resources/images/stay/stay', '제주도 서귀포시 안덕면 신화역사로 304번길 38', '92,000원', '064-111-9505', '제주 서귀포시 안덕면에 위치한 랜딩관 제주신화월드 호텔, 리조트는 5성급 부대시설과 서비스를 제공합니다.', '33.30577265332172', '126.31756179751882', 14);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '롯데 호텔 제주', '/resources/images/stay/stay', '제주도 서귀포시 중문관광로72번길 35', '105,000원', '064-751-9544', '천제연 폭포, 여미지식물원 등이 걸어서 10분, 중문색달해수욕장, 갯깍주상절리대 등이 걸어서 약 20분 내외의 거리에 있습니다.', '33.24841893785445', '126.41057948446223', 15);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '제주 신라 호텔', '/resources/images/stay/stay', '제주도 서귀포시 중문관광로72번길 75', '88,000원', '064-151-1105', '해변가가 내려다보이는 쉬리의 언덕이 유명한 제주 신라 호텔은 중문관광단지 내 자리하고 있어 여미지식물원, 천제연폭포, 별 내린 전망대 등이 아주 가까운 거리에 있습니다.', '33.24736986179169', '126.40800855848282', 15);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '호텔 리젠트 마린 더 블루', '/resources/images/stay/stay', '제주도 제주시 서부두2길 20', '99,000원', '064-551-9203', '제주 탑동에 위치한 호텔 리젠트 마린 더 블루는 제주 국제 공항에서 차로 약 15분 거리에 있습니다. 호텔 바로 앞에는 탁 트인 탑동 광장이 자리해 있으며, 옆에는 제주 최대의 횟집 단지인 서부두 명품 횟집 거리가 있습니다.', '33.51743221042272', '126.5266743748806', 7);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '메리어트관 제주신화월드', '/resources/images/stay/stay', '제주도 서귀포시 안덕면 신화역사로 304번길 38', '92,000원', '064-333-9505', '제주 최고의 프리미엄 서비스와 차별화된 혜택을 선보이는 글로벌 체인 메리어트 호텔입니다. 오설록, 협재해수욕장, 중문 관광 단지 등 제주의 인기 명소가 인접해 있습니다.', '33.30745441744823', '126.31761043851472', 14);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '그랜드 조선 제주', '/resources/images/stay/stay', '제주도 서귀포시 중문관광로72번길 60', '69,000원', '064-654-9505', '제주 대표 관광지가 모여 있는 중문관광단지에 위치하고 있어, 중문 색달해변, 천제연폭포, 여미지식물원, 테디베어 뮤지엄 등을 도보로 이동하실 수 있습니다.', '33.25221406351012', '126.40805906041149', 15);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '신라스테이 제주', '/resources/images/stay/stay', '제주도 제주시 노연로 100', '97,000원', '064-751-3456', '호텔신라의 프리미엄 비즈니스호텔인 신라스테이 제주는 제주 국제공항에서 차로 약 15분 거리에 있습니다.', '33.4855025649021', '126.49090803600815', 7);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '메종 글래드 제주', '/resources/images/stay/stay', '제주도 제주시 노연로 80', '99,000원', '064-751-9231', '40여 년의 역사와 전통을 자랑하는 메종 글래드 제주는 제주 관광의 랜드마크로서 제주 고유의 매력을 경험할 수 있는 호텔입니다.', '33.485204249438375', '126.48852651824107', 7);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '라마다 프라자 제주 호텔', '/resources/images/stay/stay', '제주도 제주시 탑동로 66', '92,000원', '064-121-8877', '제주시에 위치한 라마다 프라자 제주 호텔은 제주 공항에서 차로 단 10분 거리에 있습니다.', '33.518782227349575', '126.51787835576916', 7);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '유탑 유블레스호텔', '/resources/images/stay/stay', '제주도 제주시 조천읍 조함해안로 502', '54,000원', '064-251-6505', '유탑 유블레스호텔은 에메랄드빛 바다와 흰 모래밭이 어우러지는 함덕 서우봉 해변에서 도보로 약 3분 거리에 위치합니다.', '33.54240577648495', '126.66625901945214', 8);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '파크선샤인제주', '/resources/images/stay/stay', '제주특별자치도 서귀포시 천지동 남성중로 135', '90,000원', '064-766-1000', '깔끔한 객실을 갖춘 현대적인 호텔로 일부 객실에서는 산이 보이며 스타일리시한 레스토랑을 이용할 수 있습니다.', '33.61716532555025', '126.55330246926356', 14);

-- 에어비엔비
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '에어비엔비', '제주 애월 감성 공유 민박', '/resources/images/stay/stay', '제주도 제주시 애월읍', '110,000원', '064-781-1290', '제주 촌집의 따뜻한 감성은 남기고 이용에 편리하도록 리모델링한 숙소입니다.', '33.45224262788046', '126.30800060776457', 6);

-- 펜션
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '펜션', '더갤러리펜션', '/resources/images/stay/stay', '제주 제주시 조천읍 남조로 1717-24', '90,000원', '064-651-3344', '품격있는 휴식공간을 만들기 위해 최상의 자재로 럭셔리하고 클래식한 분위기와 아름다운 정원을 만들었습니다.', '33.422109416961966', '126.6755097508577', 8);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '펜션', '해와돌바라기휴양펜션', '/resources/images/stay/stay', '제주특별자치도 서귀포시 하효동', '50,000원', '064-767-8811', '객실이 깔끔함, 조식이 맛있음, 쇠소깍근처', '33.25245653459947', '126.61716532555025', 14);

-- 캠핑
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '캠핑', '디포레카라반파크', '/resources/images/stay/stay', '제주 제주시 구좌읍 송당6길 78-1', '90,000원', '064-051-0505', '디-포레 카라반 파크에서 새들의 지저귐과 안식향이 가득함 숲속에서 평생 처음 추억으로 간직해 드릴것을 약속 드립니다.', '33.46491693908225', '126.78236630273554', 9);

-- 추가
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '교윈스위트호텔제주', '/resources/images/stay/stay', '제주특별자치도 서귀포시 중문관광로72번길 67 스위트호텔', '178,000원', '064-738-3800', '깔끔하고 음식도 맛있었습니다', '33.24942', '126.40819', 15);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '리치호텔', '/resources/images/stay/stay', '제주특별자치도 제주시 애월읍 고내리 332-1', '80,000원', '06-4799-1991', '제주 리치 호텔은 곽지과물해변에서 차로 15분 거리에 있습니다. 또한, 차로 30분 거리에 있는 한림항에서 배를 타면 비양도까지 가실 수 있습니다. 아름다운 백록담을 품은 한라산은 차로 1시간 거리에 있으며 제주국제공항까지는 약 50분이 소요됩니다.', '33.47234', '126.34912', 6);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '제주 흰수염고래 리조트', '/resources/images/stay/stay', '제제주시 일주서로 6818', '50,000원', '064-747-3555', '제주시 애월읍 구엄리에 위치한 키즈펜션 가족리조트입니다.', '33.47541', '126.38151', 6);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '빌라드애월', '/resources/images/stay/stay', '제주특별자치도 제주시 애월읍 애월해안로 516-7', '70,000원', '064-720-9000', '텔 내에는 야외 수영장, SM디지털 아트 뮤지엄, 잔디 광장 등이 마련되어 있습니다. 특히, 요트 투어를 신청해서 즐길 수 있는 것이 특징입니다.', '33.47737', '126.35930', 6);

-- 에어비엔비 추가
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '에어비엔비', '묵다여관', '/resources/images/stay/stay', '제주 제주시 한경면 일주서로', '175,000원', '0507-1478-1635', '숙소에서 바로 바다를 볼 수 있고 1분이면 바다로 나갈 수 있는 묵다여관입니다.', '33.45224262788046', '126.30800060776457', 4);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '에어비엔비', '어울다', '/resources/images/stay/stay', '제주 제주시 한림읍 협재1길 63', '250,000원', '010-4472-2570', '침실에서 비양도를 바라보며 아름다운 노을을 감상해 보세요.', '33.39912001883623', '126.24631239142332', 5);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '에어비엔비', '류은주택', '/resources/images/stay/stay', '제주 서귀포시 남원읍 하례로620번길 80', '220,000원', '0507-1364-1354', '차와 커피를 마시며 휴식과 위로가 되는 공간을 느껴보세요.', '33.29546562140557', '126.6190792230592', 13);
-- 펜션 추가
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '펜션', '라만차', '/resources/images/stay/stay', '제주 제주시 한림읍 금능6길 16-5', '120,000원', '0507-1428-9030', '금능해수욕장과 2분거리인 팬션에서 바다도 즐기시고 편안한 휴식도 함께 가져보세요.', '33.38860913380529', '126.23187513971205', 5);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '펜션', '하모니리조트', '/resources/images/stay/stay', '제주 제주시 한림읍 협재로 213 하모니', '103,000원', '064-796-8441', '깨끗하고 조용한 환경에서 힐링여행을 즐겨보세요.', '33.379353806208684', '126.25208989059495', 5);
-- 캠핑 추가
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '캠핑', '어라운드폴리캠프', '/resources/images/stay/stay', '제주 서귀포시 성산읍 서성일로 431', '140,000원', '0507-1433-7079', '자연친화적인 환경 안에서 캠핑에 입문하는 사람들에 대한 편의성을 높였습니다.', '33.415552415777086', '126.83566763863982', 11);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '캠핑', '모구리야영장', '/resources/images/stay/stay', '제주 서귀포시 성산읍 서성일로 260', '5,000원', '064-760-3408', '저렴한 가격으로 가족과 좋은 추억을 보내보세요.', '33.407891382171556', '126.82768924600646', 11);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '캠핑', '김녕해수욕야영장', '/resources/images/stay/stay', '제주 제주시 구좌읍 행원리', '20,000원', '064-783-5044', '넓은 잔디와 아름다운 김녕 바다를 바로 볼수 있는곳에서 캠핑을 즐기세요.', '33.558149694179036', '126.76184161312845', 9);


/* -----------------------------------------------------
    맛집 테이블
----------------------------------------------------- */
CREATE TABLE TB_REST (	
    RS_NO NUMBER(10) PRIMARY KEY,
    RS_TYPE VARCHAR2(20), 
    RS_NAME VARCHAR2(100),
    RS_MENU VARCHAR2(50),
    RS_IMG_PATH VARCHAR2(50),
    RS_ADDR VARCHAR2(100),
    RS_PHONE VARCHAR2(50),
    RS_PRICE VARCHAR2(100),
    RS_OFFDAY VARCHAR2(30),
    RS_CONTENT VARCHAR2(2000),
    RS_LAT VARCHAR2(100),
    RS_LONG VARCHAR2(100),
    LOCAL NUMBER(20),
    FOREIGN KEY (LOCAL) REFERENCES TB_LOCAL (NO)
);

COMMENT ON COLUMN TB_REST.RS_NO IS '게시글 번호';
COMMENT ON COLUMN TB_REST.RS_TYPE IS '맛집 형태';
COMMENT ON COLUMN TB_REST.RS_NAME IS '영업점 이름';
COMMENT ON COLUMN TB_REST.RS_MENU IS '대표 메뉴';
COMMENT ON COLUMN TB_REST.RS_IMG_PATH IS '이미지 경로';
COMMENT ON COLUMN TB_REST.RS_ADDR IS '주소';
COMMENT ON COLUMN TB_REST.RS_PHONE IS '전화번호';
COMMENT ON COLUMN TB_REST.RS_PRICE IS '가격';
COMMENT ON COLUMN TB_REST.RS_OFFDAY IS '휴무일';
COMMENT ON COLUMN TB_REST.RS_CONTENT IS '게시글 내용';
COMMENT ON COLUMN TB_REST.RS_LAT IS '위도(X)';
COMMENT ON COLUMN TB_REST.RS_LONG IS '경도(Y)';
COMMENT ON COLUMN TB_REST.LOCAL IS '지역고유번호';

CREATE SEQUENCE SEQ_TB_REST_NO;
 
-- 음식점
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '제주 더시즈닝 협재흑돼지', '시즈닝 흑돼지 한판', '/resources/images/rest/rest', '제주 제주시 한림읍 한림로 328 1층', '0507-1426-8791', '54,000원', '없음', '협재 더시즈닝 제주 흑돼지 스테이크 하우스 지오반니 메인 셰프가 선보이는 최고의 파스타와 흑돼지를 경험할수 있습니다.', '33.39282889573458', '126.23998235330946', 5);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '제주어향원', '전복돌솥밥', '/resources/images/rest/rest', '제주 서귀포시 남원읍 남원리 91-8', '0507-1480-0036', '15,000원', '매주 수요일', '국내에서 나오는 전복으로만 요리하는 전복요리전문점입니다.', '33.27784676333452', '126.721520165249', 14);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '소섬전복', '전복밥', '/resources/images/rest/rest', '제주 제주시 우도면 우도해안길 1158', '064-782-0062', '15,000원', '없음', '국내에서 나오는 전복으로만 요리하는 전복요리전문점입니다.', '33.49882090067145', '126.96508698741518', 10);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '만족한상회', '갈치 한상 2인', '/resources/images/rest/rest', '제주 서귀포시 중문상로 58-5', '0507-1318-1388', '60,000', '없음', '10년 이상 조리 경력으로 맛은 물론 가격까지 잡은 만족한상회 깔끔한 분위기 속에서 고객에게 만족한 한상을 제공하고자 다짐한 처음의 마음으로 최선을 다하겠습니다.', '33.25350515196506', '126.4267198077927', 15);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '모루쿠다', '해산물 라멘', '/resources/images/rest/rest', '제주 서귀포시 태평로431번길 32 1층 모루쿠다', '064-733-1477', '14,000', '없음', '모루쿠다 제주도에서 나오는 산해진미를 한곳에서 드실 수 있고 관광객과 도민들이 가격 부담 없이 즐길 수 있도록 가격을 맞췄습니다.', '33.24827695482613', '126.56620253171889', 14);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '올래국수', '고기국수', '/resources/images/rest/rest', '제주 제주시 귀아랑길 24 올래국수', '064-742-7355', '8,500', '매주 일요일', '올래국수는 제주 특산물로 요리합니다.', '33.49152410302074', '126.49726450101656', 7);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '이춘옥원조고등어쌈밥', '고등어 묵은지찜', '/resources/images/rest/rest', '제주 제주시 애월읍 일주서로 7213', '0507-1402-9914', '32,000', '없음', '완벽한 시간으로기억되도록 맛있는 음식과 미소로 보답하겠습니다.', '33.488994080660966', '126.41869273421905', 6);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '춘심이네 본점', '통갈치구이 2인', '/resources/images/rest/rest', '제주 서귀포시 안덕면 창천중앙로24번길 16', '064-794-4010', '78,000', '없음', '통갈치구이, 통갈치찜 전문점입니다.', '33.26447661771', '126.37053358227429', 14);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '우진해장국', '고사리 육개장', '/resources/images/rest/rest', '제주 제주시 서사로 11', '064-757-3393', '9,000', '없음', '제주산 고사리를 갈아 넣고 푹 끓여 갈색 빛깔이 나는 제주식 해장국을 만날 수 있는 한식당입니다.', '33.51152360621972', '126.51998778956236', 7);

-- 카페
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '카페', '카페 노티드 제주', '우유생크림 도넛', '/resources/images/rest/rest', '제주 제주시 애월읍 애월로1길 24-9 1,2층', '0507-1319-2204', '3,500', '없음', '고객님들께 더 좋은 서비스를 제공하기 위하여 항상 노력하겠습니다.', '33.463265085280455', '126.30972286754209', 6);

-- 술집
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '술집', '미드나잇 제주', '감바스파스타', '/resources/images/rest/rest', '제주 서귀포시 안덕면 신화역사로304번길 98 F002호', '0507-1319-2204', '27,000', '둘째주, 넷째주 수요일', '고객님들께 더 좋은 서비스를 제공하기 위하여 항상 노력하겠습니다.', '33.304712014520646', '126.31610441791032', 14);

-- 추가
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '호커센터', '발리식폭립', '/resources/images/rest/rest', '제주 제주시 애월읍 애월로11길 25-2 호커센터', '0507-1405-8989', '23,000', '없음', '동남아식 음식을 제주도에서 맛보실 수 있습니다.', '33.46707', '126.32040', 6);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '뚱딴지 애월본점', '활오복탕', '/resources/images/rest/rest', '제주 제주시 애월읍 부룡수길 17', '0507-1370-2085', '120,000', '없음', '애월맛집 흑돼지가 맛있는곳', '33.47475', '126.35473', 6);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '모들한상', '모들 돈가스', '/resources/images/rest/rest', '제주 제주시 애월읍 하가로 180', '070-7576-3503', '13,000', '없음', '재료로 조미료없이 정성으로 만든 제주 애월 맛집', '33.45568', '126.34738', 6);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '트룰리하우스', '페퍼로니 피자', '/resources/images/rest/rest', '제주 제주시 노연로 89 2층 201호', '064-901-0716', '15,500', '없음', '페페로니 피자가 맛있는 피자집', '33.48619', '126.48975', 7);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '돈사돈', '흑돼지고기', '/resources/images/rest/rest', '제주 제주시 우평로 19', '064-746-8989', '44,000', '없음', '지드레곤 태양 무조건 들린다는 수요미식회 흑돼지맛집', '33.47897', '126.46408', 7);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '중문수두리보말칼국수', '수두리보말칼국수', '/resources/images/rest/rest', '제주 서귀포시 천제연로 192 1층', '064-739-1070', '10,000', '없음', '제주중문에서 아침식사 하기좋은 수두리보말칼국수', '33.25174', '126.42522', 15);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '중문회포장센터 새벽야시장', '각종회', '/resources/images/rest/rest', '제주 서귀포시 천제연로 192 1층', '064-739-1070', '10,000', '없음', '고등어회 딱새우회 포장도 되는 제주 중문 맛집', '33.24678', '126.42921', 15);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '흑돈플러스', '흑돼지고기', '/resources/images/rest/rest', '제주 서귀포시 대포로 132', '0507-1442-9193', '20,000', '없음', '제주 1100고지습지 탐방 후 들린 흑돼지무한리필집', '33.23932', '126.43503', 15);
-- 까페 추가
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '카페', '니모메빈티지라운지', '때때로맑음 에이드', '/resources/images/rest/rest', '제주 제주시 일주서로 7335-8', '064-742-3008', '7,500원', '없음', '시원한 바다뷰를 보면서 맛있는 에이드 한잔 하세요.', '33.49369173624675', '126.43091504164053', 7);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '카페', '에스프레소 라운지', '카페라떼', '/resources/images/rest/rest', '제주 제주시 한라대학로 1', '0507-1422-5151', '5,000원', '없음', '맛있는 빵과 커피를 먹으며 여운을 즐기세요.', '33.4806392405611', '126.47276170486371', 7);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '카페', '슬로우벗커피로스터스', '핸드드립', '/resources/images/rest/rest', '제주 제주시 흥운길 77-1', '064-722-9082', '6,000원', '매주 월요일', '바다와 용연구름다리 사이의 전망좋은 카페', '33.515517054101416', '126.51405392701167', 7);
-- 술집 추가
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '술집', '제주맥주', '치킨', '/resources/images/rest/rest', '제주특별자치도 제주시 한림읍 금능농공길 62-11', '064-798-9872', '20,000원', '월, 화, 수, 목', '제주맥주양조장에서 특별한 체험과 맛있는 경험을 해보세요.', '33.358503789378965', '126.24120482665897', 7);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '술집', '맥파이 브루어리', '페일에일', '/resources/images/rest/rest', '제주 제주시 동회천1길 23', '0507-1383-0227', '7,000원', '매주 월요일, 화요일', '맛있는 음식과 맥주 브루어리 투어를 통한 추억을 쌓으세요.', '33.50320222013382', '126.61717088033707', 7);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '술집', '랜돌프비어 제주시청점', '수제맥주', '/resources/images/rest/rest', '제주 제주시 신성로13길 27 2층 랜돌프비어', '064-755-8608', '4,900원', '없음', '다양한 수제생맥주와 뉴욕식 씬페페로니 피자를 즐겨보세요!', '33.497895225348046', '126.53035883897287', 7);

/* -----------------------------------------------------
    여행후기 테이블
----------------------------------------------------- */
CREATE TABLE TB_REVIEW (   
    RV_NO NUMBER PRIMARY KEY,
    RV_TYPE VARCHAR2(20),
    RV_TITLE VARCHAR2(100), 
    RV_DATE DATE DEFAULT SYSDATE,
    RV_IMG_PATH VARCHAR(100),
    RV_CONTENT CLOB,
    RV_HITS NUMBER DEFAULT 0,
    MEM_NO NUMBER,
    FOREIGN KEY (MEM_NO) REFERENCES TB_MEM (NO)
);


COMMENT ON COLUMN TB_REVIEW.RV_NO IS '게시글 번호';
COMMENT ON COLUMN TB_REVIEW.RV_TYPE IS '후기 형태(여행지/숙박/맛집)';
COMMENT ON COLUMN TB_REVIEW.RV_TITLE IS '게시글 제목';
COMMENT ON COLUMN TB_REVIEW.RV_DATE IS '게시글 등록일';
COMMENT ON COLUMN TB_REVIEW.RV_IMG_PATH IS '이미지 경로';
COMMENT ON COLUMN TB_REVIEW.RV_CONTENT IS '게시글 내용';
COMMENT ON COLUMN TB_REVIEW.RV_HITS IS '댓글 내용';
COMMENT ON COLUMN TB_REVIEW.MEM_NO IS '작성자 회원번호';

CREATE SEQUENCE SEQ_TB_REVIEW_NO;

-- 여행지
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '여행지', '신창 풍차해안도로 다녀왔어요!', '/resources/images/review/review', SYSDATE, 
'제주도 드라이브코스 하면 단연 먼저 생각나는 건 제주 신창 풍차 해안도로에요.<br>드라이브하면서 봐도 좋고 일몰 때 시간 맞추고 가서 봐도 좋더라구요.<br>기회되신다면 꼭 가보세요. 바람도 시원하고 엄청 좋았어요!', 2);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '여행지', '우도 방문 후기', '/resources/images/review/review', SYSDATE, '이번에 우도 처음 방문했어요.<br>배 타고 들어가는데 가는 길도 이쁘고 좋았습니다.<br>바다도 너무 예쁘고요.<br>스쿠터 빌려서 한바퀴 돌아보시는 분들도 많더라구요.<br>다음엔 저도 스쿠터 빌려서 다녀야겠어요.<br>', 3);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '여행지', '올레길 1코스 다녀왔습니다!', '/resources/images/review/review', SYSDATE, '성산일출봉이 보이는 광치기 해변의 풍경이 너무 아름다워요.<br>광치기 해변은 물때를 잘 맞춰가셔야 더 멋진 풍경을 보실 수 있어요!', 4);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '여행지', '함덕으로 가신다면 서우봉 추천드려요', '/resources/images/review/review', SYSDATE, '함덕 해수욕장 바로 옆 오름이라 접근성도 좋고 뷰도 탁 트여서 좋았습니다.<br>올라가다보면 말도 몇 마리 있어요. 아이들이 좋아하더라구요.<br>둘레길 코스랑 등산 코스 있었는데.. 전 등산코스는 너무 가파른 거 같아 둘레길 코스로 돌았는데 1시간 반정도 걸렸어요.', 5);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '여행지', '마라도 가보셨나요?', '/resources/images/review/review', SYSDATE, '섬은 우도 외에 안가봤는데 마라도도 너무 좋았어요.<br>남단쪽으로 가신다면 마라도 가보시는거 추천드려요!!', 6);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '여행지', '카멜리아 힐에서 인생사진 찍었어요!', '/resources/images/review/review', SYSDATE, '사람은 많지만 동백꽃이 너무 예뻐서 꼭 방문하시는걸 추천드려요!<br>포토스팟이 많아서 사진찍기 좋더라구요. 커플 분들 많았어요~', 7);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '여행지', '오설록 티 뮤지엄 다녀왔습니다~!', '/resources/images/review/review', SYSDATE, '녹차밭에서 인생사진 건졌어요ㅠㅠ<br> 오설록 녹차스프레드도 꼭 드셔보시고 옆에 이니스프리 매장도 들려보세요!', 2);
-- 숙박
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '숙박', '히든클리프 1박 후기', '/resources/images/review/review', SYSDATE, '룸컨디션도 깔끔하고 직원도 친절해서 좋았는데 무엇보다 가장 큰 장점은 수영장이었던 거 같아요.', 3);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '숙박', '롯데 호텔 제주에서 묵었어요', '/resources/images/review/review', SYSDATE, '천지연 폭포와 중문 해수욕장이 가까워서 여기저기 보러다니기도 편해요~~', 4);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '숙박', '제주신라호텔은 꼭 하루라도 가보세요!', '/resources/images/review/review', SYSDATE, '중문 관광단지 내에 있어 운전하기도 편하고 근처에 핫플레이스도 많아요! 시설과 서비스는 물론 좋구요ㅎㅎ', 5);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '숙박', '신라스테이 제주 가성비 최고..!', '/resources/images/review/review', SYSDATE, '국제공항에서 가까워서 여행 첫날이나 마지막날 묵기에 깔끔하고 너무 좋았어요 ㅎㅎ', 6);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '숙박', '게스트 하우스는 바바호미 추천드려요~!', '/resources/images/review/review', SYSDATE, '깔끔한 게스트하우스 찾아보다가 예약했는데.. 사장님도 친절하시고 너무 깔끔하고 예뻐서 잘묵고왔어요ㅎㅎ', 7);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '숙박', '가족들과 방문하신다면 더갤러리펜션 가보세요', '/resources/images/review/review', SYSDATE, '펜션 내 정원도 있어 아이들과 사진찍고 놀기에도 좋았어요 ㅎㅎ', 2);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '숙박', '라마다 호텔에서 묵어본 후기입니다', '/resources/images/review/review', SYSDATE, '첫날 저녁 비행기라 저렴하고 공항 근처 호텔 찾다가 예약했는데 가성비도 좋고 깔끔합니다.', 3);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '숙박', '캠핑 좋아하시는 분들 디포레 카라반파크 가보세요', '/resources/images/review/review', SYSDATE, '캠핑장 관리도 깔끔하게 되어있어 캠핑 초보분들도 가기 좋습니다 ㅎㅎ', 4);
-- 맛집
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '맛집', '명진전복에서 전복돌솥밥 먹었어요!', '/resources/images/review/review', SYSDATE, '수요미식회에 소개되었던 전복돌솥밥이 맛있는 명진전복에 다녀왔습니다.', 5);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '맛집', '흑돼지는 더시즈닝 협재흑돼지 추천합니다', '/resources/images/review/review', SYSDATE, '흑돼지는 물론 파스타도 맛있게 먹었습니다.', 6);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '맛집', '대우정식당 다녀왔어요!', '/resources/images/review/review', SYSDATE, '전복 솥밥에 마가린+소스 비벼먹고 뚝배기에 누룽지까지 너무 완벽한 식사였습니다..', 7);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '맛집', '올레국수에서 고기국수 먹었어요!', '/resources/images/review/review', SYSDATE, '고기국수 맛집이 많아서 고민하다 올레국수 가봤는데 국물도 진하고 맛있었어요 ㅎㅎ', 2);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '맛집', '핫플 우진해장국 추천합니다..', '/resources/images/review/review', SYSDATE, '웨이팅은 많지만 든든한 한끼먹기 너무 좋았어서 방문 추천드립니다', 3);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '맛집', '스시도모다찌에서 초밥 먹고 왔어요!!', '/resources/images/review/review', SYSDATE, '재료가 싱싱하다 보니 퀄리티도 너무 좋고 가격도 육지에 비해 너무 저렴해서 아주 잘먹고왔습니다.^^', 4);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '맛집', '제주어항원 다녀왔습니다.', '/resources/images/review/review', SYSDATE, '전복을 좋아해서 갔는데 만족스럽습니다. ^^', 5);
INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_DATE, RV_CONTENT, MEM_NO) 
VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '맛집', '모루쿠다 후기', '/resources/images/review/review', SYSDATE, '해산물 들어간 라멘인데 맛있어요', 6);





/* -----------------------------------------------------
    여행후기 댓글 테이블
----------------------------------------------------- */
CREATE TABLE TB_COMMENT (   
    CM_NO NUMBER PRIMARY KEY,
    RV_NO NUMBER,
    MEM_NO NUMBER,
    CM_CONTENT VARCHAR2(1000),    
    CM_DATE DATE DEFAULT SYSDATE,
    FOREIGN KEY (MEM_NO) REFERENCES TB_MEM (NO),
    FOREIGN KEY (RV_NO) REFERENCES TB_REVIEW (RV_NO)
);

COMMENT ON COLUMN TB_COMMENT.CM_NO IS '댓글 번호';
COMMENT ON COLUMN TB_COMMENT.RV_NO IS '여행 후기 게시글 번호';
COMMENT ON COLUMN TB_COMMENT.MEM_NO IS '회원번호';
COMMENT ON COLUMN TB_COMMENT.CM_CONTENT IS '댓글 내용';
COMMENT ON COLUMN TB_COMMENT.CM_DATE IS '댓글 작성일';

CREATE SEQUENCE SEQ_TB_COMMENT_NO;

INSERT INTO TB_COMMENT VALUES(SEQ_TB_COMMENT_NO.NEXTVAL, NULL, NULL, '저도 가보고싶어요 ㅠㅠ', SYSDATE);






/* -----------------------------------------------------
    마이플래너 테이블
----------------------------------------------------- */
--CREATE TABLE TB_PLAN(
--    PL_NO NUMBER(10) PRIMARY KEY,
--    PL_TITLE VARCHAR2(20),
--    PL_S_DATE DATE,
--    PL_E_DATE DATE,
--    PL_CONTENT VARCHAR2(20),
--    PL_REG_DATE DATE,
--    MEM_NO NUMBER(30) PRIMARY KEY
--);
--
--COMMENT ON COLUMN TB_PLAN.PL_NO IS '마이플래너 번호';
--COMMENT ON COLUMN TB_PLAN.PL_TITLE IS '마이플래너 제목';
--COMMENT ON COLUMN TB_PLAN.PL_S_DATE IS '시작 날짜';
--COMMENT ON COLUMN TB_PLAN.PL_E_DATE IS '종료 날짜';
--COMMENT ON COLUMN TB_PLAN.PL_CONTENT IS '계획(내용)';
--COMMENT ON COLUMN TB_PLAN.PL_REG_DATE IS '등록일자';
--COMMENT ON COLUMN TB_PLAN.MEM_NO IS '회원번호';
--
--
--CREATE SEQUENCE SEQ_TB_PLAN_NO;






COMMIT;
