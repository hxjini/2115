--강사테이블 생성 : tbl_teacher_202201
create table tbl_teacher_202201(
	teacher_code char(3),
	teacher_name varchar2(15),
	class_name varchar2(20),
	class_price number(8),
	teach_resist_date varchar2(8),
	primary key(teacher_code)
);

--강사테이블 제거
drop table tbl_teacher_202201;

--강사테이블 샘플데이터
insert into tbl_teacher_202201 values('100', '이초급', '초급반', 100000, '20220101');
insert into tbl_teacher_202201 values('200', '김중급', '중급반', 200000, '20220102');
insert into tbl_teacher_202201 values('300', '박고급', '고급반', 300000, '20220103');
insert into tbl_teacher_202201 values('400', '정심화', '심화반', 400000, '20220104');

--입력저장
commit;

--강사테이블 조회
select * from tbl_teacher_202201;

--회원테이블 생성 : tbl_member_202201
create table tbl_member_202201(
	c_no char(5) not null,
	c_name varchar2(15),
	phone varchar2(11),
	address varchar2(50),
	grade varchar2(6),
	primary key(c_no)
);

--회원테이블 제거
drop table tbl_member_202201;

--회원테이블 샘플데이터
insert into tbl_member_202201 values('10001', '홍길동', '01011112222', '서울시 강남구', '일반');
insert into tbl_member_202201 values('10002', '장발장', '01022223333', '성남시 분당구', '일반');
insert into tbl_member_202201 values('10003', '임꺽정', '01033334444', '대전시 유성구', '일반');
insert into tbl_member_202201 values('20001', '성춘향', '01044445555', '부산시 서구', 'VIP');
insert into tbl_member_202201 values('20002', '이몽룡', '01055556666', '대구시 북구', 'VIP');

--입력저장
commit;

--회원테이블 조회
select * from tbl_member_202201;

--수강테이블 생성 : tbl_class_202201;
create table tbl_class_202201 (
	resist_month varchar2(6) not null,
	c_no char(5) not null,
	class_area varchar2(15),
	tuition number(8),
	teacher_code char(3),
	primary key (resist_month, c_no)
);

--수강테이블 샘플데이터
insert into tbl_class_202201 values('202203', '10001', '서울본원', 100000, 100);
insert into tbl_class_202201 values('202203', '10002', '성남분원', 100000, 100);
insert into tbl_class_202201 values('202203', '10003', '대전분원', 200000, 200);
insert into tbl_class_202201 values('202203', '10004', '부산분원', 150000, 300);
insert into tbl_class_202201 values('202203', '10005', '대구분원', 200000, 400);

--입력저장
commit;

--수강테이블 조회
select * from tbl_class_202201;

--회원정보 조회
select class.resist_month, member.c_no, member.c_name, teacher.class_name, class.class_area, class.tuition, member.grade 
from tbl_teacher_202201 teacher, tbl_member_202201 member, tbl_class_202201 class 
where teacher.teacher_code = class.teacher_code and member.c_no = class.c_no 
order by class.c_no asc;

--회원정보 조회 : 수강료 필드 오류
select class.resist_month, member.c_no, member.c_name, teacher.class_name, class.class_area, teacher.class_price, member.grade 
from tbl_teacher_202201 teacher, tbl_member_202201 member, tbl_class_202201 class 
where teacher.teacher_code = class.teacher_code and member.c_no = class.c_no 
order by class.c_no asc;

--강사매출조회
select class.teacher_code, teacher.class_name, teacher.teacher_name, sum(class.tuition) as total 
from tbl_teacher_202201 teacher, tbl_class_202201 class 
where teacher.teacher_code = class.teacher_code 
group by class.teacher_code, teacher.class_name, teacher.teacher_name 
order by class.teacher_code asc;










