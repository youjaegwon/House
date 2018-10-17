﻿------------테스트 데이터 생성 sql문

-------------------------------권한 목록
INSERT INTO H_AUTH VALUES (SEQ_H_AUTH_ANO.nextval, '관리자계정', 'A');
INSERT INTO H_AUTH VALUES (SEQ_H_AUTH_ANO.nextval, '전문가계정', 'P');
INSERT INTO H_AUTH VALUES (SEQ_H_AUTH_ANO.nextval, '일반계정', 'N');

SELECT * FROM H_AUTH;
SELECT * FROM H_MEMBER;
--SELECT * FROM H_AUTH;
$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2
-------------------------계정 생성

--관리자
INSERT INTO H_MEMBER VALUES ('test','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트관리자','01011111111','2018-10-10','N',1);

--전문가
INSERT INTO H_MEMBER VALUES ('test_p','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트전문가','01022222222','2018-10-11','Y',2);
INSERT INTO H_MEMBER VALUES ('test_p2','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트전문가','01022222222','2018-10-11','Y',3);
--일반
INSERT INTO H_MEMBER VALUES ('test_n','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트일반','01033333333','2018-10-12','N',3);
INSERT INTO H_MEMBER VALUES ('test_n2','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트일반','01044444444','2018-10-12','N',3);

INSERT INTO H_MEMBER VALUES ('test_n3','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트일반3','01044444444','2018-10-13','N',3);
INSERT INTO H_MEMBER VALUES ('test_n4','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트일반4','01044444444','2018-10-14','N',3);
INSERT INTO H_MEMBER VALUES ('test_n5','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트일반5','01044444444','2018-10-15','N',3);
INSERT INTO H_MEMBER VALUES ('test_n6','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트일반6','01044444444','2018-10-16','N',3);
INSERT INTO H_MEMBER VALUES ('test_n7','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트일반7','01044444444','2018-10-17','N',3);
INSERT INTO H_MEMBER VALUES ('test_p3','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트전문가3','01022222222','2018-10-18','Y',2);
INSERT INTO H_MEMBER VALUES ('test_n8','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트일반8','01044444444','2018-10-18','N',3);
INSERT INTO H_MEMBER VALUES ('test_n9','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트일반9','01044444444','2018-10-19','N',3);
INSERT INTO H_MEMBER VALUES ('test_n10','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트일반10','01044444444','2018-10-20','N',3);
INSERT INTO H_MEMBER VALUES ('test_n11','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트일반11','01044444444','2018-10-21','N',3);
INSERT INTO H_MEMBER VALUES ('test_p4','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트전문가4','01022222222','2018-10-22','Y',2);
INSERT INTO H_MEMBER VALUES ('test_n12','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트일반12','01044444444','2018-10-22','N',3);
INSERT INTO H_MEMBER VALUES ('test_n13','$2a$10$24R.G00XMRup4e.wz/IOzu6JHr14JqUbY/hyl6xjeae73O1x5MGF2','테스트일반13','01044444444','2018-10-23','N',3);
SELECT * FROM H_MEMBER order by mdate desc;


--------------------------질문 등록
INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'올 해 내집 마련 예정입니다.',
'서울 강남 출퇴근 1시간 거리에 5억이하 전세 아파트는 어디가 좋을까요?',
'2018-10-13',
0,
'test_n');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'질문 또 드립니다.',
'서울이 힘들다면 수도권에서는 어떨런지요?',
'2018-10-13',
0,
'test_n');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'공릉동 지역 아파트 가격 문의',
'공릉동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-14',
0,
'test_n');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'삼척동 지역 아파트 가격 문의',
'삼척동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-15',
0,
'test_n');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'공개동 지역 아파트 가격 문의',
'공개동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-16',
0,
'test_n');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'상이동 지역 아파트 가격 문의',
'상이동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-17',
0,
'test_n');

----

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'공릉2동 지역 아파트 가격 문의',
'공릉2동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-18',
0,
'test_n');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'삼척2동 지역 아파트 가격 문의',
'삼척2동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-19',
0,
'test_n');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'공개2동 지역 아파트 가격 문의',
'공개2동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-20',
0,
'test_n');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'상이2동 지역 아파트 가격 문의',
'상이2동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-21',
0,
'test_n');
INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'어디2동 지역 아파트 가격 문의',
'어디2동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-22',
0,
'test_n');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'공릉3동 지역 아파트 가격 문의',
'공릉3동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-23',
0,
'test_n');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'삼척3동 지역 아파트 가격 문의',
'삼척3동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-23',
0,
'test_n');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'공개3동 지역 아파트 가격 문의',
'공개3동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-24',
0,
'test_n');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'상이3동 지역 아파트 가격 문의',
'상이3동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-24',
0,
'test_n');

----

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'공릉4동 지역 아파트 가격 문의',
'공릉4동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-24',
0,
'test_n');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'삼척4동 지역 아파트 가격 문의',
'삼척4동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-25',
0,
'test_n');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'공개4동 지역 아파트 가격 문의',
'공개4동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-25',
0,
'test_n');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'상이4동 지역 아파트 가격 문의',
'상이4동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-25',
0,
'test_n');
INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'어디4동 지역 아파트 가격 문의',
'어디4동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-10-25',
0,
'test_n');
SELECT * FROM H_QUESTION;


----------------------------답변 등록
INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'올 해 서울 아파트 가격 답변',
'부동산 정책 여파로 매매 공급량이 적어 좋은 매물을 찾기 힘들 수 있습니다. 관망하셔서 1년 이상 여유있게 찾아보시는걸 추천합니다.',
'2018-10-14',
1,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'수도권 지역 답변',
'미분양 단지가 신도시 주변으로 발생하므로 새 아파트 위주로 살펴 보시는게 좋을 것으로 판단됩니다.',
'2018-10-14',
2,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'공릉동 아파트 가격 답변',
'주변에 신시가지 조성중으로 오름세를 유지할 것으로 보입니다.',
'2018-10-15',
3,
'test_p');


INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'삼척동 아파트 가격 답변',
'주변 단지가 하락중이므로 동반 하락세가 유지될 것으로 보입니다.',
'2018-10-16',
4,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'공개동 아파트 답변',
'공개동 지역은 낙후 주택단지가 많으므로 10년 이후를 내다보고 장기 투자가 유리할 것으로 보입니다.',
'2018-10-17',
5,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'상이동 아파트 가격 답변',
'부동산 정책 여파로 매매 공급량이 적어 좋은 매물을 찾기 힘들 수 있습니다. 관망하셔서 1년 이상 여유있게 찾아보시는걸 추천합니다.',
'2018-10-18',
6,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'공릉2동 아파트 가격 답변',
'주변에 신시가지 조성중으로 오름세를 유지할 것으로 보입니다.',
'2018-10-19',
7,
'test_p');


INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'삼척2동 아파트 가격 답변',
'주변 단지가 하락중이므로 동반 하락세가 유지될 것으로 보입니다.',
'2018-10-20',
8,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'공개2동 아파트 답변',
'공개동 지역은 낙후 주택단지가 많으므로 10년 이후를 내다보고 장기 투자가 유리할 것으로 보입니다.',
'2018-10-21',
9,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'상이2동 아파트 가격 답변',
'부동산 정책 여파로 매매 공급량이 적어 좋은 매물을 찾기 힘들 수 있습니다. 관망하셔서 1년 이상 여유있게 찾아보시는걸 추천합니다.',
'2018-10-22',
10,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'어디2동 아파트 가격 답변',
'어디동은 거래량이 줄어드는 관계로 관망하셔서 1년 이상 여유있게 찾아보시는걸 추천합니다.',
'2018-10-23',
11,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'공릉3동 아파트 가격 답변',
'주변에 신시가지 조성중으로 오름세를 유지할 것으로 보입니다.',
'2018-10-24',
12,
'test_p');


INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'삼척3동 아파트 가격 답변',
'주변 단지가 하락중이므로 동반 하락세가 유지될 것으로 보입니다.',
'2018-10-24',
13,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'공개3동 아파트 답변',
'공개동 지역은 낙후 주택단지가 많으므로 10년 이후를 내다보고 장기 투자가 유리할 것으로 보입니다.',
'2018-10-25',
14,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'상이3동 아파트 가격 답변',
'부동산 정책 여파로 매매 공급량이 적어 좋은 매물을 찾기 힘들 수 있습니다. 관망하셔서 1년 이상 여유있게 찾아보시는걸 추천합니다.',
'2018-10-25',
15,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'공릉4동 아파트 가격 답변',
'주변에 신시가지 조성중으로 오름세를 유지할 것으로 보입니다.',
'2018-10-25',
16,
'test_p');


INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'삼척4동 아파트 가격 답변',
'주변 단지가 하락중이므로 동반 하락세가 유지될 것으로 보입니다.',
'2018-10-25',
17,
'test_p');

---------- 미답변으로 남겨두기
--INSERT INTO H_ANSWER VALUES (
--SEQ_H_ANSWER_ANO.nextval,
--'공개4동 아파트 답변',
--'공개동 지역은 낙후 주택단지가 많으므로 10년 이후를 내다보고 장기 투자가 유리할 것으로 보입니다.',
--'2018-10-25',
--18,
--'test_p');
--
--INSERT INTO H_ANSWER VALUES (
--SEQ_H_ANSWER_ANO.nextval,
--'상이4동 아파트 가격 답변',
--'부동산 정책 여파로 매매 공급량이 적어 좋은 매물을 찾기 힘들 수 있습니다. 관망하셔서 1년 이상 여유있게 찾아보시는걸 추천합니다.',
--'2018-10-25',
--19,
--'test_p');
--
--INSERT INTO H_ANSWER VALUES (
--SEQ_H_ANSWER_ANO.nextval,
--'어디4동 아파트 가격 답변',
--'어디동은 거래량이 줄어드는 관계로 관망하셔서 1년 이상 여유있게 찾아보시는걸 추천합니다.',
--'2018-10-25',
--20,
--'test_p');
SELECT * FROM H_ANSWER;



-----------------------------------
-----------------------------------테스트용 추가 질문
INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'올 해 내집 마련 예정입니다.',
'서울 강남 출퇴근 1시간 거리에 5억이하 전세 아파트는 어디가 좋을까요?',
'2018-11-13',
0,
'test_n2');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'질문 또 드립니다.',
'서울이 힘들다면 수도권에서는 어떨런지요?',
'2018-11-13',
0,
'test_n2');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'공릉동 지역 아파트 가격 문의',
'공릉동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-14',
0,
'test_n2');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'삼척동 지역 아파트 가격 문의',
'삼척동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-15',
0,
'test_n2');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'공개동 지역 아파트 가격 문의',
'공개동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-16',
0,
'test_n2');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'상이동 지역 아파트 가격 문의',
'상이동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-17',
0,
'test_n2');

----

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'공릉2동 지역 아파트 가격 문의',
'공릉2동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-18',
0,
'test_n2');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'삼척2동 지역 아파트 가격 문의',
'삼척2동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-19',
0,
'test_n2');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'공개2동 지역 아파트 가격 문의',
'공개2동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-20',
0,
'test_n2');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'상이2동 지역 아파트 가격 문의',
'상이2동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-21',
0,
'test_n2');
INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'어디2동 지역 아파트 가격 문의',
'어디2동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-22',
0,
'test_n2');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'공릉3동 지역 아파트 가격 문의',
'공릉3동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-23',
0,
'test_n2');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'삼척3동 지역 아파트 가격 문의',
'삼척3동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-23',
0,
'test_n2');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'공개3동 지역 아파트 가격 문의',
'공개3동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-24',
0,
'test_n2');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'상이3동 지역 아파트 가격 문의',
'상이3동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-24',
0,
'test_n2');

----

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'공릉4동 지역 아파트 가격 문의',
'공릉4동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-24',
0,
'test_n2');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'삼척4동 지역 아파트 가격 문의',
'삼척4동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-25',
0,
'test_n2');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'공개4동 지역 아파트 가격 문의',
'공개4동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-25',
0,
'test_n2');

INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'상이4동 지역 아파트 가격 문의',
'상이4동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-25',
0,
'test_n2');
INSERT INTO H_QUESTION VALUES (
SEQ_H_QUESTION_CNO.nextval,
'어디4동 지역 아파트 가격 문의',
'어디4동 자이 아파트 가격 상승 요건이 어떤게 있을지요?',
'2018-11-25',
0,
'test_n2');
SELECT * FROM H_QUESTION;

---------------------------------
---------------------------------테스트용 답변
INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'올 해 서울 아파트 가격 답변',
'부동산 정책 여파로 매매 공급량이 적어 좋은 매물을 찾기 힘들 수 있습니다. 관망하셔서 1년 이상 여유있게 찾아보시는걸 추천합니다.',
'2018-11-14',
21,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'수도권 지역 답변',
'미분양 단지가 신도시 주변으로 발생하므로 새 아파트 위주로 살펴 보시는게 좋을 것으로 판단됩니다.',
'2018-11-14',
22,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'공릉동 아파트 가격 답변',
'주변에 신시가지 조성중으로 오름세를 유지할 것으로 보입니다.',
'2018-11-15',
23,
'test_p');


INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'삼척동 아파트 가격 답변',
'주변 단지가 하락중이므로 동반 하락세가 유지될 것으로 보입니다.',
'2018-11-16',
24,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'공개동 아파트 답변',
'공개동 지역은 낙후 주택단지가 많으므로 10년 이후를 내다보고 장기 투자가 유리할 것으로 보입니다.',
'2018-11-17',
25,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'상이동 아파트 가격 답변',
'부동산 정책 여파로 매매 공급량이 적어 좋은 매물을 찾기 힘들 수 있습니다. 관망하셔서 1년 이상 여유있게 찾아보시는걸 추천합니다.',
'2018-11-18',
26,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'공릉2동 아파트 가격 답변',
'주변에 신시가지 조성중으로 오름세를 유지할 것으로 보입니다.',
'2018-11-19',
27,
'test_p');


INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'삼척2동 아파트 가격 답변',
'주변 단지가 하락중이므로 동반 하락세가 유지될 것으로 보입니다.',
'2018-11-20',
28,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'공개2동 아파트 답변',
'공개동 지역은 낙후 주택단지가 많으므로 10년 이후를 내다보고 장기 투자가 유리할 것으로 보입니다.',
'2018-11-21',
29,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'상이2동 아파트 가격 답변',
'부동산 정책 여파로 매매 공급량이 적어 좋은 매물을 찾기 힘들 수 있습니다. 관망하셔서 1년 이상 여유있게 찾아보시는걸 추천합니다.',
'2018-11-22',
30,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'어디2동 아파트 가격 답변',
'어디동은 거래량이 줄어드는 관계로 관망하셔서 1년 이상 여유있게 찾아보시는걸 추천합니다.',
'2018-11-23',
31,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'공릉3동 아파트 가격 답변',
'주변에 신시가지 조성중으로 오름세를 유지할 것으로 보입니다.',
'2018-11-24',
32,
'test_p');


INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'삼척3동 아파트 가격 답변',
'주변 단지가 하락중이므로 동반 하락세가 유지될 것으로 보입니다.',
'2018-11-24',
33,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'공개3동 아파트 답변',
'공개동 지역은 낙후 주택단지가 많으므로 10년 이후를 내다보고 장기 투자가 유리할 것으로 보입니다.',
'2018-11-25',
34,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'상이3동 아파트 가격 답변',
'부동산 정책 여파로 매매 공급량이 적어 좋은 매물을 찾기 힘들 수 있습니다. 관망하셔서 1년 이상 여유있게 찾아보시는걸 추천합니다.',
'2018-11-25',
35,
'test_p');

INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'공릉4동 아파트 가격 답변',
'주변에 신시가지 조성중으로 오름세를 유지할 것으로 보입니다.',
'2018-11-25',
36,
'test_p');


INSERT INTO H_ANSWER VALUES (
SEQ_H_ANSWER_ANO.nextval,
'삼척4동 아파트 가격 답변',
'주변 단지가 하락중이므로 동반 하락세가 유지될 것으로 보입니다.',
'2018-11-25',
37,
'test_p');

SELECT * FROM h_answer;