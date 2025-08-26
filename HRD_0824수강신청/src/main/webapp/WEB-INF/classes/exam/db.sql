--과목정보테이블 생성 :tbl_course_202301
create table tbl_course_202301(
	c_id varchar2(5) not null,
	c_name varchar2(40),
	credit number(6),
	l_id varchar2(10),
	week number(2),
	start_hour number(4),
	end_hour number(4),
	primary key(c_id),
	foreign key(l_id) references tbl_lecturer_202301 (l_id)
);

--과목정보테이블 샘플데이터
insert into tbl_course_202301 values('10001', '애플리케이션 배포', 2, '1', 1, 0900, 1100);
insert into tbl_course_202301 values('10002', '프로그래밍 언어 활용', 2, '2', 2, 0900, 1200);
insert into tbl_course_202301 values('10003', '응용SW기초기술 활용', 3, '6', 3, 0900, 1200);
insert into tbl_course_202301 values('10004', '화면구현', 3, '4', 4, 0900, 1200);
insert into tbl_course_202301 values('20001', '애플리케이션 테스트 수행', 2, '5', 1, 1300, 1600);
insert into tbl_course_202301 values('20002', 'SQL 활용', 3, '5', 2, 1500, 1800);
insert into tbl_course_202301 values('20003', 'UI 테스트', 3, '6', 3, 1330, 1630);
insert into tbl_course_202301 values('30001', '화면 설계', 2, '3', 4, 1330, 1530);
insert into tbl_course_202301 values('30002', '네트워크 프로그래밍 구현', 3, '3', 5, 0900, 1200);
insert into tbl_course_202301 values('40001', '스마트문화앱구현', 3, '2', 5, 1300, 1600);

--입력저장
commit;

--과목정보테이블 조회
select * from tbl_course_202301;

--강사정보테이블 생성 :tbl_lecturer_202301
create table tbl_lecturer_202301(
	l_id varchar2(10) not null,
	l_name varchar2(10),
	major varchar2(40),
	primary key(l_id)
);

--강사정보테이블 샘플데이터
insert into tbl_lecturer_202301 values('1', '김교수', '소프트웨어공학');
insert into tbl_lecturer_202301 values('2', '이교수', '프로그래밍');
insert into tbl_lecturer_202301 values('3', '박교수', '네트워크');
insert into tbl_lecturer_202301 values('4', '우교수', '운영체제');
insert into tbl_lecturer_202301 values('5', '최교수', '자료구조');
insert into tbl_lecturer_202301 values('6', '임교수', '인공지능');

--입력저장
commit;

--강사정보테이블 조회
select * from tbl_lecturer_202301;

--교과목 수정 
select * from tbl_course_202301 where c_id = ?;

--교과목 목록 조회
--과목코드, 과목명, 학점, 담당강사, 요일, 시작시간, 종료시간
select course.c_id, course.c_name, course.credit, lecturer.l_name, course.week, course.start_hour, course.end_hour 
from tbl_course_202301 course, tbl_lecturer_202301 lecturer 
where course.l_id = lecturer.l_id 
order by course.c_id asc;



--교과목 수정
update tbl_course_202301 
set c_name = ?, credit = ?, l_id = ?, week = ?, start_hour = ?, end_hour = ? 
where c_id = ?;

--삭제
delete from tbl_course_202301 where c_id = ?;










