
-- �����亯 ��� ����¡�� ���� : �ֱ� �Խñ� ���� ���� ���� 
--R.mid = �α��� ���� ������ ���� ���, ��ü����� ���ǻ���
--R.RNUM>=11 �������� ������ �ٹ�ȣ
--R.RNUM<=20 �������� ù �ٹ�ȣ
SELECT * FROM (
SELECT * FROM 
(SELECT ROWNUM RNUM, Q.*, NVL2(A.ANO,'�亯','�̴亯') ANSWERED 
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