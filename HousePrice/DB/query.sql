------------------------------- 화면별 쿼리 

------------------------------- 질문 답변 화면


--전체표시 : 테스트용
SELECT Q.*, A.*, NVL2(A.ANO,'답변','미답변') ANSWERED 
FROM H_QUESTION Q LEFT OUTER JOIN H_ANSWER A ON Q.cno = A.cno; 


----------------------- 질문답변 목록화면
-- 질문답변 목록 페이징용 쿼리 : 최근 게시글이 1번으로 시작, 
-- 정렬기준: 작성일 내림차순 > 문의번호 내림차순
-- ANSWERED 컬럼 사용하여 답변, 미답변 표시
--WHERE Q.mid = 'test_n2' 로그인된 유저만 볼때 사용, 전체 보기시 해당 부분 삭제해서 사용
--ROWNUM <= 10 페이지의 마지막 게시물 번호
--Q.RNUM >= 1 페이지의 첫 게시물 번호

SELECT * FROM 
(SELECT ROWNUM RNUM, Q.* FROM 
(SELECT * FROM
(SELECT Q.*, NVL2(A.ANO,'답변','미답변') ANSWERED 
FROM H_QUESTION Q LEFT OUTER JOIN H_ANSWER A ON Q.cno = A.cno WHERE Q.mid = 'test_n2') Q
ORDER BY q.CREGDATE DESC, Q.CNO DESC) Q
WHERE ROWNUM <= 11) Q
WHERE Q.RNUM >= 1;


----------------------- 질문답변 질문 작성 화면
--질문 작성
INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,--질문번호생성
'올 해 내집 마련 예정입니다.',--제목
'서울 강남 출퇴근 1시간 거리에 5억이하 전세 아파트는 어디가 좋을까요?',--내용
sysdate ,--게시일
0,--조회수
'test_n');--게시자id
----------------------- 질문답변 질문 작성 화면 끝 -------------------
----------------------- 질문답변 질문 변경 화면
--질문 상세 조회
SELECT * FROM H_QUESTION WHERE cno = 1;

--질문 변경 : 답변이 없는 경우만 가능
UPDATE H_QUESTION SET
ctitle = '공개4동 지역 아파트 수정',--제목
ccontent = '공개4동 하락 요건은 어떤가요?',--내용
cregdate = sysdate --작성일 현재시간
where
cno = 38 --변경할 질문 번호
and mid = 'test_n2';--작성자 id
----------------------- 질문답변 질문 변경 화면 끝 ----------------------

----------------------- 질문답변 답변 상세 화면 

--1.질문 조회수 추가(질문목록 클릭시 상세보기 진입할때 실행 - 상세보기 화면은 답변 상세보기임. 질문 상세보기는 삭제예정)
UPDATE H_QUESTION SET
CHIT = CHIT+1 -- BEAN에 저장된 조회수에 +1한 값으로 변경 
WHERE cno=1;
--위 쿼리 안되는 경우 아래처럼 분리해서 처리.
--MYBATIS에서 실제 쿼리 실행전 값 먼저 가져와서 BEAN에 저장하는 방식 사용
--1.아래 쿼리로 기존 조회수 가져와서 BEAN에 저장
SELECT CHIT FROM H_QUESTION WHERE cno=1;
--2.아래 쿼리로 조회수 추가 : MYBATIS 용 BEAN 지정 형식 때문에 애러 나므로 주석처리 - 주석 제거후 사용
--UPDATE H_QUESTION SET
--CHIT = #{CHIT+1} -- BEAN에 저장된 조회수에 +1한 값으로 변경 
--WHERE cno=1;


--2.질문 상세 조회( CNO: 질문번호 기준으로 조회)
SELECT * FROM H_QUESTION WHERE cno = 1;

--3.답변 상세 조회( H_QUESTION.CNO: 질문 테이블의 질문번호 기준으로 조회, 미답변 게시글인 경우 값이 없다. 값 유/무에 따라 화면 처리)
SELECT A.* FROM H_ANSWER A INNER JOIN H_QUESTION Q ON a.cno=q.cno WHERE Q.CNO=1;

----------------------- 질문답변 답변 상세 화면 끝 ----------------------------------------

----------------------- 질문답변 답변 작성/수정 화면 
--1.질문 상세 조회( CNO: 질문번호 기준으로 조회)
SELECT * FROM H_QUESTION WHERE cno = 1;

--2.답변 상세 조회( H_QUESTION.CNO: 질문 테이블의 질문번호 기준으로 답변 조회. 답변 수정일 경우만 필요)
SELECT A.* FROM H_ANSWER A INNER JOIN H_QUESTION Q ON a.cno=q.cno WHERE Q.CNO=1;

--3.답변 등록
INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,--답변 번호 생성
'올 해 서울 아파트 가격 답변',--제목
'부동산 정책 여파로 매매 공급량이 적어 좋은 매물을 찾기 힘들 수 있습니다. 관망하셔서 1년 이상 여유있게 찾아보시는걸 추천합니다.',--내용
SYSDATE,--작성일
1,--연관된 문의번호
'test_p');--작성자ID

--4.답변 변경
UPDATE H_ANSWER SET
atitle = '삼척4동 아파트 답변 수정',--제목
acontent = '삼척4동 주변 가격이 상승세로 반전하여 매수를 보류하시길 바랍니다.',--내용
aregdate = '18-11-25' --작성일 현재시간
where
ANO = 37 --변경할 답변 번호
and mid = 'test_p';--작성자 id

----------------------- 질문답변 답변 작성/수정 화면 끝 ----------------------------------------

