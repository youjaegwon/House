
-- 질문답변 목록 페이징용 쿼리 : 최근 게시글 내림 차순 기준 
--R.mid = 로그인 유저 내꺼만 볼때 사용, 전체보기시 조건삭제
--R.RNUM>=11 페이지의 마지막 줄번호
--R.RNUM<=20 페이지의 첫 줄번호
SELECT * FROM (
SELECT * FROM 
(SELECT ROWNUM RNUM, Q.*, NVL2(A.ANO,'답변','미답변') ANSWERED 
FROM H_QUESTION Q LEFT OUTER JOIN H_ANSWER A ON Q.cno = A.cno) R
WHERE R.mid='test_n' AND R.RNUM>=11 ORDER BY cregdate DESC, cno DESC)
WHERE RNUM<=20;

SELECT * FROM 
(SELECT * FROM 
(SELECT ROWNUM RNUM, Q.* FROM H_QUESTION Q WHERE mid='test_n') 
WHERE RNUM>=11 ORDER BY cregdate DESC, cno DESC ) WHERE RNUM<=20;

SELECT * FROM h_question;
SELECT * FROM H_ANSWER;

-- WHERE mid='test_n' ORDER BY cregdate DESC;