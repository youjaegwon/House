-------------------------- 관리자 회원관리 목록 페이지 쿼리

-- 관리자 회원관리 목록 조회 화면
-- 관리자 회원관리 목록 페이징용 쿼리 : 최근 가입된계정이 1번으로 시작, 
-- 정렬기준: 가입일 내림차순 > 아이디 오름차순
--ROWNUM <= 10 페이지의 마지막 게시물 번호
--Q.RNUM >= 1 페이지의 첫 게시물 번호
--전문가등록 버튼은 ano = 3 이면 '등록' ano=2 이면 '해지'로 표시.
--모든 아이디 조회시 사용
--WHERE NOT ANO=1 AND (MPROYN='Y' OR ANO=2)  >> 의 의미: 관리자를 제외하고 
--회원이 회원정보의 "전문가 등록 신청에 체크"했을경우 또는 이미 "전문가"인 경우 조회하도록 조건 설정한 것임

SELECT * FROM 
(SELECT ROWNUM RNUM, M.* FROM
(SELECT * FROM H_MEMBER WHERE NOT ANO=1 AND (MPROYN='Y' OR ANO=2) ORDER BY mdate DESC, mid ASC) M
WHERE ROWNUM <= 10) M
WHERE M.RNUM >= 1;

--검색 조회시 사용 :  AND mid LIKE '%사용자id(mid)%' 구문 추가
SELECT * FROM 
(SELECT ROWNUM RNUM, M.* FROM
(SELECT * FROM H_MEMBER WHERE NOT ANO=1 AND (MPROYN='Y' OR ANO=2) AND mid LIKE '%사용자id(mid)%' ORDER BY mdate DESC, mid ASC) M
WHERE ROWNUM <= 10) M
WHERE M.RNUM >= 1;


--목록에서 '등록'클릭시 : 즉 전문가가 아닌계정을 전문가로 변경
UPDATE H_MEMBER SET
ANO = 2--전문가 계정 번호(2)로 변경 
WHERE
MID = 'test_p';--해당 계정id (mid)

--목록에서 '해지'클릭시 : 즉 전문가계정을 일반계정으로 변경
UPDATE H_MEMBER SET
ANO = 3--일반 계정 번호(3)로 변경 
WHERE
MID = 'test_p';--해당 계정id (mid)

--테스트 전체 목록 조회용 쿼리 
SELECT * FROM H_MEMBER  ORDER BY mdate DESC, mid ASC;

	<![CDATA[
	SELECT * FROM
	(SELECT ROWNUM  RNUM, M.* FROM
	(SELECT * FROM h_member hm INNER JOIN h_auth an ON hm.ano = an.ano WHERE hm.mproyn='Y' AND (hm.ano=2 OR hm.ano=3) ORDER BY hm.mdate DESC, hm.mid ASC) M
	WHERE ROWNUM <= 10) M
	WHERE M.RNUM >= 1
	]]> 



