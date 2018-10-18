--테스트용 전체 쿼리
SELECT * FROM H_QUESTION WHERE mid='test_n2' ORDER BY cregdate DESC, cno desc ;


--마이페이지 내질문 게시판 페이징 쿼리
--WHERE mid='test_n2' : 로그인 유저아이디
--ROWNUM <= 10 : 해당 페이지의 마지막 번호
-- Q.RNUM >= 1 : 해당 페이지의 첫 번호
SELECT * FROM 
(SELECT ROWNUM RNUM, Q.* FROM
(SELECT * FROM H_QUESTION WHERE mid='test_n2' ORDER BY cregdate DESC, cno desc) Q
WHERE ROWNUM <= 10) Q
WHERE Q.RNUM >= 1;


--제목 검색시 사용할 쿼리 
-- and ctitle like '%공%' 검색어 추가
SELECT * FROM 
(SELECT ROWNUM RNUM, Q.* FROM
(SELECT * FROM H_QUESTION WHERE mid='test_n2' and ctitle like '%공%' ORDER BY cregdate DESC, cno desc) Q
WHERE ROWNUM <= 10) Q
WHERE Q.RNUM >= 1;