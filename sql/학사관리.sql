create table professors(
 pcode char(3) not null, 
 pname varchar(15) not null, 
 dept varchar(30),
 hiredate date, 
 title varchar(15),
 salary int default 0,
 primary key(pcode)
);

desc professors;

create table students(
 scode char(8) not null, 
 sname varchar(15) not null, 
 dept varchar(30),
 year int default 1,
 birthday date, advisor char(3), 
 primary key(scode),
 foreign key(advisor) references professors(pcode)
 /* on delete cascade */
);

desc students;

create table courses(
 lcode char(4) not null,
 lname varchar(50) not null, hours int, 
 room char(3), instructor char(3), 
 capacity int default 0, 
 persons int default 0, 
 primary key(lcode), 
 /* constraint child_pk foreign key(instructor) references professors(pcode) */
 foreign key(instructor) references professors(pcode)
);
desc courses;


create table enrollments(
 lcode char(4) not null, 
 scode char(8) not null, 
 edate date, grade int default 0, 
 primary key(lcode, scode), 
 foreign key(lcode) references courses(lcode), 
 foreign key(scode) references students(scode)
);
desc enrollments

drop table enrollments;
drop table students;
drop table courses;
drop table professors;

insert into professors(pcode,pname,dept,hiredate,title,salary) values('221','이병렬','전산','75/04/03','정교수',3000000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('228','이재광','전산','91/09/19','부교수',2500000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('311','강승일','전자','94/06/09','부교수',2300000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('509','오문환','건축','92/10/14','조교수',2000000);

select * from professors;


insert into students(scode,sname,dept,year,birthday,advisor) values('92414029','서연우','전산',3,'73/10/06','228');
insert into students(scode,sname,dept,year,birthday,advisor) values('92414033','김창덕','전산',4,'73/10/26','221');
insert into students(scode,sname,dept,year,birthday,advisor) values('92514009','이지행','전자',4,'73/11/16','311');
insert into students(scode,sname,dept,year,birthday,advisor) values('92514023','김형명','전자',4,'73/08/29','311');
insert into students(scode,sname,dept,year,birthday,advisor) values('92454018','이원구','건축',3,'74/09/30','509');
insert into students(scode,sname,dept,year,birthday,advisor) values('95454003','이재영','건축',4,'76/02/06','509');
insert into students(scode,sname,dept,year,birthday,advisor) values('95414058','박혜경','전산',4,'76/03/12','221');
insert into students(scode,sname,dept,year,birthday,advisor) values('96414404','김수정','전산',3,'77/12/22','228');

select * from professors;


insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C301','파일처리론', 3 ,'506','221',100,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C401','데이터베이스',3,'414','221',80,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C421','알고리즘',3,'510','228',80,72);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C312','자료구조',2,'510','228',100,60);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('E221','논리회로',3,'304','311',100,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('A109','한국의건축문화',2,'101','509',120,36);

select *from courses;
insert into enrollments(lcode, scode, edate, grade) values('C401','92414033','98/03/02',85);
insert into enrollments(lcode, scode, edate, grade) values('C301','92414033','98/03/02',80);
insert into enrollments(lcode, scode, edate, grade) values('C421','92414033','98/03/02', 0);
insert into enrollments(lcode, scode, edate, grade) values('C401','95414058','98/03/03',90);
insert into enrollments(lcode, scode, edate, grade) values('C301','95414058','98/03/03',80);
insert into enrollments(lcode, scode, edate, grade) values('C312','95414058','98/03/03',80);
insert into enrollments(lcode, scode, edate, grade) values('C401','92514023','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('C301','92514023','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('C421','92514023','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('C301','92414029','98/03/03',90);
insert into enrollments(lcode, scode, edate, grade) values('C421','92414029','98/03/03',0);
insert into enrollments(lcode, scode, edate, grade) values('C312','92414029','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('E221','92414029','98/03/03',75);
insert into enrollments(lcode, scode, edate, grade) values('A109','92414029','98/03/03',90);
insert into enrollments(lcode, scode, edate, grade) values('C301','92514009','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('C401','92514009','98/03/03',85);
insert into enrollments(lcode, scode, edate, grade) values('E221','92514009','98/03/03',85);
insert into enrollments(lcode, scode, edate, grade) values('C301','96414404','98/03/04',75);
insert into enrollments(lcode, scode, edate, grade) values('C401','96414404','98/03/04',75);
insert into enrollments(lcode, scode, edate, grade) values('C421','96414404','98/03/04',75);
insert into enrollments(lcode, scode, edate, grade) values('C312','92454018','98/03/04',90);
insert into enrollments(lcode, scode, edate, grade) values('E221','92454018','98/03/04',90);
insert into enrollments(lcode, scode, edate, grade) values('A109','95454003','98/03/05',85);
insert into enrollments(lcode, scode, edate, grade) values('C301','95454003','98/03/05',83);
insert into enrollments(lcode, scode, edate, grade) values('E221','95454003','98/03/05',75);

select count (*) from enrollments;


/*교수 테이블에서 교수들이 근무하는 소속학과 이름을 검색하시오(단 , 중복 값은 제거하시오).*/
select distinct(dept) from professors;


select  distinct(dept) 
from    professors;




/*학생 테이블에서 '전산'이면서 '3'학년 학생들의 이름, 학번, 생년월일을 검색하시오. */
select sname, scode, birthday   
from students
where dept='전산' and year='3';



select sname, scode, birthday
from students
where dept='전산' and year='3';
/*교수 테이블에서 '1993년3월1일' 이전에 임용된 교수들의 이름 소속학과를 검색하시오.*/

select pname, dept
from professors
where hiredate <= '1993/3/1';




select pname, dept, hiredate
from professors
where hiredate <= '1993/03/01';

/*학생 테이블에서 교수번호가 '221'인 교수가 지도하지 않는 학생들을 검색하시오. */
select sname
from students
where advisor <> '221';



select *
from students
where advisor <> '221';


select *
from
where 

/*수강신청 테이블에서 성적이 80점 이상인 과목번호, 학생번호를 검색하시오*/
select  lcode , 
from  enrollments
where enrollments







select lcode, scode,grade 
from enrollments
where grade >=80;


/* 강좌 테이블에서 강좌이름이 '건축'이라는 단어를 포함하는 강좌의 강좌번호, 강좌이름, 담당교수, 강의시간수를 검색하시오 - like 연산자 */
select lcode, lname, instructor, hours
from courses
where lname like'%건축%';
/* 수강신청 테이블에서 1998년 3월 1일에서 3월3일 사이에 수강신청 한 강좌번호, 학생번호, 수강신청일을 검색하시오. */
select *
from enrollments
where ebate beween '98/03/01' and '98/03/03';

/* 학생 테이블에서 학년이 2학년과 4학년 사이에 학생들의 학번, 학생명, 학과, 학년을 검색하시오. */
select * 
from enrollments
where edate >= '98/03/01' and edate <= '98/03/03';

/* 수강 신청테이블에서 성적이 입력되지 않은 과목들의 강좌번호, 학생번호를 모두 검색하시오. */
/* 수강 신청테이블에서 성적이 입력된 과목들의 강좌번호, 학생번호를 모두 검색하시오. */
/* 교수 테이블에서 직급이 '정교수' 이거나 '부교수'인 교수들의 교수번호, 교수명, 직급을 검색하시오 */
select  *
from professors 
where title, = '정교수' or title='부교수';

/*타이틀이 정교수 이거나 부교수 */
select * 
from professors
where title in('정교수', '부교수');  

/* '전산'과 학생들의 학번, 이름, 생년월일을 이름을 기준으로 오름차순, 생년월일을 기준으로 내림차순 정렬을 하시오. */
select  *
from students
where dept='전산' 
order by sname asc, birthday desc; 

select  *
from students
order by sname asc, sname desc; 
/* */
/* */
/* */
/* */
/* */
/* */
/*학생들의 학과, 학생이름, 지도교수이름을 검색하시오.*/
select s.dept, s.name, p.pname, p.dept
from professors p, students s;
where p.pcode=s.advisor;

/*강좌번호, 강좌명, 교수이름을 검색하시오.*/
select c.lcode, p.pcode,p.pname
from 
where
/*학번, 학생이름, 학생들이 수강신청 한 강좌번호, 수강신청일을 검색하시오*/
select 
from
where

select s.code, sname, e.lcode, e.grade
from students s, enrollments e
where s.scode=e.scode
order by  e.scode;

/*학번, 학생들이 수강신청 한 강좌번호, 강좌명, 성적을 검색하시오.*/
select s.scode, sname, e.lcode, c.lname, e.grade  
from students s, enrollments e, courses c
where s.scode=e.scode and e.lcode=c.lcode
order by  e.scode;
select * from view1;
/*'이병렬'과 교수가 지도하는 학생들의 이름, 학년, 생년월일을 검색하시오*/
select s.pcode, pname 
from 
where
order by

/*'98/03/03'에 수강신청 한 학생들의 학번, 학생이름, 강좌번호를 검색하시오.*/
/*'전산'과 교수들이 지도하는 학생들의 이름, 학년, 생년월일을 검색하시오.*/
/*자료구조'를 강의하는   교수의 학과명, 교수 명을 검색하시오.*/
/*'파일처리론'을 수강신청 한 학생들의 학번, 수강신청일, 점수를 검색하시오.*/
/*'자료구조' 과목을 수강신청 한 학생들의 학과, 학생이름, 성적을 검색하시오.*/
/*'전자'과 학생들의 학번, 학생이름, 수강신청 한 강좌번호, 강좌 명, 성적을 검색하시오.*/
/*'파일처리론'을 강의하는 교수의 이름, 이 교수가 지도하는 학생들의 학번, 학생명을 검색하시오.*/
/*'데이터베이스'를 강의하는 교수명, 이 과목을 수강신청 한 학생들의 학과, 이름, 성적을 검색하시오.*/


/*성적이 80점 이상인 학생들의 학번, 학생이름, 강좌번호, 강좌명, 담당교수 명을 검색하시오.*/





/*3.조회*/
/*3.교수들의 총 급여액과 평균 급여액을 구하시오.*/
select sum(salary) salary_sum, avg(salary) salary_avg
from professors;

/*전산과 교수들의 총 급여액과 평균 급여액을 구하시오.*/
select sum(salary), avg(salary)
from professors
where dept='전산';

/*수강신청 한 과목들 중에서 최고 점수와 최저 점수를 구하시오.*/
select max(grade), min(grade)
from   enrollments;

/*전산과 학생들은 모두 몇 명인지 구하시오.*/
select count(scode)
from students
where dept='전산';

/*수강신청 한 학생들은 모두 몇 명인지 구하시오.*/
select count(distinct(scode))
from enrollments;



/*각 학과별 학생들의 수를 구하시오.*/
select count(scode)
from students
group by dept 
order by count(scode) desc;


/*교수들을 소속학과별, 직급별로 분류하여 각 직급별 평균 급여액수를 구하시오.*/

select avg(salary) , dept, title
from professors
group by dept, title
order by dept, title;


/*각 학생들에 대해 학번, 학생이름, 수강신청 과목들의 평균 점수를 구하시오.*/



/* 왜 순서를 지켜야 할까?*/



/*각 학생들에 대해 수강신청 과목(코드,코드명)들의 평균 점수를 구하시오.*/

select scode, sname, avg(grade),dept
from enr_stu_pro
where dept ='전산' or dept='전자'
group by scode, sname,pname ,dept
having avg(grade)>=75
order by dept,  avg(grade) desc ;




select  avg(grade), 
from students
where enrollments;

drop view stu_enr_pro;

create view stu_enr_pro as 
select e.*,sname,s.dept stu_dept, pname, p.dept pro_dept
from enrollments e , students s , professors p
where e.scode = s.scode  and advisor=p.pcode; 
select * from stu_enr_pro;


advisor = pcode;

create view enr_stu_cou as
select e.*, s.sname, c.lname 
from enrollments e , students s, courses c
where e.scode=s.scode and e.lcode=c.lcode;



create view enr_stu_cou as
select e.*, s.sname, c.lname
from enrollments e, students s, courses c
where e.scode=s.scode and e.lcode=c.lcode;
select *  from enr_stu_cou;




create view enr_stu_pro as
select e.*, p.pname, s.sname, s.dept
from enrollments e, students s, professors p
where e.scode=s.scode and p.pcode=s.advisor;
select * from enr_stu_pro;


/*수강신청 한 과목들을 학생별로 그룹핑하여 평균 점수를 구한 다음, 학생번호, 
평균 점수를 //성적이 높은 순으로 정렬하여 출력하시오.*/
select avg(grade),scode   
from
where
group by  수강신청 한 놈들
oder by desc;


/*수강신청 과목들의 평균 점수가 85점 이상인 학생들의 학생번호, 평균 점수를 구하시오.*/



/*강좌별 평균점수가 80점 이상인 강좌들의 강좌번호와 평균점수를 출력하시오.*/



/*학생수가 3명 이상인 학과 구한 다음, 학과명, 학생수를 출력하시오.*/





/*4.조회*/
/*'알고리즘'을 강의하는 교수의 교수번호, 교수이름, 소속학과를 검색하시오.*/
select *from professors;  where pcode in  /* ~in -> or */
(select instructor from  courses where lname='알고리즘');


/*강의실 '510'호에서 강의하는 교수의 교수번호, 교수이름, 소속학과를 검색하시오.*/
select * from professors where pcode in 
select instructor from courses where room='510';


/*'김창덕' 학생이 소속된 학과에 재직하는 교수들의 이름, 직급, 임용일자를 검색하시오.*/

select dept from student where sname='김창덕';
where 
/*수강신청 과목의 점수가 90점 이상인 학생들의 이름, 학생번호, 소속학과, 학년을 검색하시오.*/
select avg(grade) ,scode , sname, dept,

elect * from students where scode in 
(seleft scode from enlloments group bt scode having avg(grade)>=80);

/* 서브쿼리는 하나를 특정짓는건가 */

from
where
group by

/*'전산'과 교수들이 담당하는 강좌의 이름, 강의시간수, 강의실을 검색하시오.*/
/*'98/03/02'에 수강신청 한 학생들의 학과, 학번, 학생이름, 학년을 검색하시오.*/
/*'509'호에서 강의를 듣는 학생들의 학과, 학번, 학생이름을 검색하시오.*/
/*수강신청 과목의 평균점수가 80점 이상인 학생들의 이름, 학생번호, 소속학과, 학년을 검색하시오.*/
/*'건축'과 학생들을 지도하는 교수의 이름, 교수번호, 소속학과, 직급을 검색하시오.*/
/*학생수가 '3'명 이상인 학과에 근무하는 교수들의 이름, 소속학과, 직급을 검색하시오.*/
/*'이원구'가 수강신청한 과목의 번호, 과목명, 점수를 검색하시오.*/
/*'알고리즘'을 수강신청한 학생들의 학번, 학생이름, 학과를 검색하시오.*/
/*'1973'년생 학생들을 지도하는 교수들의 이름, 소속학과, 직급을 검색하시오.*/
/*전체 학생의 30% 이상이 수강신청한 강좌의 번호를 검색하시오.*/


/*수강신청 평균점수가 85점 이상인 학생들의 학생번호, 학생이름, 평균 점수를 평균점수가 높은 순으로 출력하시오.*/



/*강좌별 평균점수가 80점 이상인 강좌들의 강좌번호, 강좌명, 평균점수를 평균점수가 높은 순으로 출력하시오.*/

/*1.갱신*/
/*'98414022', '노진순', '75-05-10', '전산' 값을 학생테이블에 삽입하시오.*/
insert into students(scode, sname, birthday, dept)
values('98414022', '노진순', '75-05-10', '전산');
select * from students;

/*노진순의 수강신청 내용을 수강신청(Enrollments)테이블에 삽입하시오.*/
insert into oldenrollment(scode,

/*'1998년 1월 1일' 이전에 발생한 모든 수강신청 데이터를 oldEnrollments테이블로 복사하시오.*/



/*4학년 학생들의 모든 학생 데이터를 oldstudents 테이블로 복사하시오.*/
select 
/*학생테이블에서 '노진순'의 데이터를 삭제하시오.*/
/*'1998년 1월 1일' 이전에 신청한 모든 수강신청 데이터를 삭제하시오.*/
/*수강신청 한 과목에 대해 성적을 아직 받지 못한 수강신청 데이터를 삭제하시오.*/
/*수강신청 한 과목에 대해 성적을 아직 받지 못한 수강신청 데이터를 삭제하시오.*/
/*학생테이블에서 전산과 3학년 데이터를 4학년으로 변경하시오.*/
/*'오문환' 교수의 직급을 '조교수'에서 '부교수'로 변경하시오.*/
/*'건축과' 학생이 신청한 모든 수강신청 데이터를 삭제하시오.*/
/*'전산'과 교수들의 급여를 10% 증가 시키시오.*/
/*모든 교수들의 급여를 10% 증가 시키시오.*/
/*'전자'과 학생들이 신청한 수강신청 데이터를 모두 삭제하시오.*/
/*'전산'과 교수가 담당하는 강좌의 강의실을 모두 '123'호실로 변경하시*/









drop table  professors;
drop table  students;
drop table  professors
/* 처음부터 다시 시작  - 아 오류나네 문제나 */ 
/* 데이터베이스 조회 (1)*/

/*교수 테이블의 모든 데이터를 검색하시오.*/
select * from professors;


/*교수 테이블에서 모든 교수의 이름, 소속학과, 직급을 검색하시오.*/
select pname, dept, title
from professors;

/*교수 테이블에서 교수들이 근무하는 소속학과 이름을 검색하시오(단 , 중복 값은 제거하시오).*/
select  distinct(dept)
from professors;



/*학생 테이블에서 '전산'이면서 '3'학년 학생들의 이름, 학번, 생년월일을 검색하시오.*/
select sname, scode, birthday
from students
where dept = '전산' and year = '3';


/*교수 테이블에서 '1993년3월1일' 이전에 임용된 교수들의 이름 소속학과를 검색하시오.*/
select pname, dept 
from professors
where hiredate < '1993/03/01';


/*학생 테이블에서 교수번호가 '221'인 교수가 지도하지 않는 학생들을 검색하시오.*/

select *
from students
where advisor!='221'; 

select * from students where advisor <> '221'; ( where advisor != '221' );

/*뭐지 왜 맞는거지???   <> 221;(where advisor!=221)  이렇게 적는게 답인데 괄호나 아니나 같다는건가? */


/*수강신청 테이블에서 성적이 80점 이상인 과목번호, 학생번호를 검색하시오.*/
select lcode, scode
from enrollments
where grade >= 80;

select lcode, scode 
from enrollments
where grade >= 80;


/*강좌 테이블에서 강좌이름이 '건축'이라는 단어를 포함하는 강좌의 강좌번호, 강좌이름, 담당교수, 강의시간수를 검색하시오.*/
select lcode, lname, hours, instructor
from courses
where lname like '%건축%';

/*수강신청 테이블에서 1998년 3월 1일에서 3월3일 사이에 수강신청 한 강좌번호, 학생번호, 수강신청일을 검색하시오.*/
select lcode, scode, edate
from enrollments
where edate between '1998-03-01' and '1998-03-03';

/*학생 테이블에서 학년이 2학년과 4학년 사이에 학생들의 학번, 학생명, 학과, 학년을 검색하시오*/

select scode, sname, dept, year
from students 
where year between '2' and '4';

/*수강 신청테이블에서 성적이 입력되지 않은 과목들의 강좌번호, 학생번호를 모두 검색하시오.*/

select lcode, scode 
from  enrollments
where grade is null;

select lcode, scode from enrollments where grade is null;


/*수강 신청테이블에서 성적이 입력된 과목들의 강좌번호, 학생번호를 모두 검색하시오.*/

select lcode, scode
from enrollments
where grade is not null;

/*교수 테이블에서 직급이 '정교수' 이거나 '부교수'인 교수들의 교수번호, 교수명, 직급을 검색하시오.*/

select pcode, pname, title
from professors
where title = '정교수' or title= '부교수';



/*학생 테이블에서 '전산'과 또는 '건축'과 또는 '전자'과 학생들의 이름, 소속학과, 학년을 검색하시오.*/

select sname, dept, year
from students
where dept in ('전산','건축','전자');
/*where dept='전산' and dept='건축' and dept = '전자'; */

/*전산'과 학생들의 학번, 이름, 생년월일을 이름을 기준으로 오름차순, 생년월일을 기준으로 내림차순 정렬을 하시오. */
select  dept, sname,scode, birthday
from students
where dept= '전산'
order by dept asc, birthday desc;


/* ----------------------------------------------------- 
    데이터베이스 조회 (2)
    
*/
/*학생들의 학과, 학생이름, 지도교수이름을 검색하시오.*/
/*강좌번호, 강좌명, 교수이름을 검색하시오.*/
/*학번, 학생이름, 학생들이 수강신청 한 강좌번호, 수강신청일을 검색하시오*/
/*학번, 학생들이 수강신청 한 강좌번호, 강좌명, 성적을 검색하시오.*/
/*'이병렬'과 교수가 지도하는 학생들의 이름, 학년, 생년월일을 검색하시오*/
/*'98/03/03'에 수강신청 한 학생들의 학번, 학생이름, 강좌번호를 검색하시오.*/
/*'전산'과 교수들이 지도하는 학생들의 이름, 학년, 생년월일을 검색하시오.*/
/*자료구조'를 강의하는 교수의 학과명, 교수 명을 검색하시오.*/
/*'파일처리론'을 수강신청 한 학생들의 학번, 수강신청일, 점수를 검색하시오.*/
/*'자료구조' 과목을 수강신청 한 학생들의 학과, 학생이름, 성적을 검색하시오.*/
/*'전자'과 학생들의 학번, 학생이름, 수강신청 한 강좌번호, 강좌 명, 성적을 검색하시오.*/
/*'파일처리론'을 강의하는 교수의 이름, 이 교수가 지도하는 학생들의 학번, 학생명을 검색하시오.*/
/*'데이터베이스'를 강의하는 교수명, 이 과목을 수강신청 한 학생들의 학과, 이름, 성적을 검색하시오.*/
/*성적이 80점 이상인 학생들의 학번, 학생이름, 강좌번호, 강좌명, 담당교수 명을 검색하시오.*/



/*3.데이터베이스 조회(3)*/
/*교수들의 총 급여액과 평균 급여액을 구하시오.*/
/*전산과 교수들의 총 급여액과 평균 급여액을 구하시오.*/
/*수강신청 한 과목들 중에서 최고 점수와 최저 점수를 구하시오.*/
/*전산과 학생들은 모두 몇 명인지 구하시오.*/
/*수강신청 한 학생들은 모두 몇 명인지 구하시오.*/
/*각 학과별 학생들의 수를 구하시오.*/
/*교수들을 소속학과별, 직급별로 분류하여 각 직급별 평균 급여액수를 구하시오.*/
/*각 학생들에 대해 학번, 학생이름, 수강신청 과목들의 평균 점수를 구하시오.*/
/*각 학생들에 대해 수강신청 과목들의 평균 점수를 구하시오.*/
/*수강신청 한 과목들을 학생별로 그룹핑하여 평균 점수를 구한 다음, 학생번호, 평균 점수를 성적이 높은 순으로 정렬하여 출력하시오.*/
/*수강신청 과목들의 평균 점수가 85점 이상인 학생들의 학생번호, 평균 점수를 구하시오.*/
/*강좌별 평균점수가 80점 이상인 강좌들의 강좌번호와 평균점수를 출력하시오.*/
/*학생수가 3명 이상인 학과 구한 다음, 학과명, 학생수를 출력하시오.*/
/*수강신청 평균점수가 85점 이상인 학생들의 학생번호, 학생이름, 평균 점수를 평균점수가 높은 순으로 출력하시오.*/
/*강좌별 평균점수가 80점 이상인 강좌들의 강좌번호, 강좌명, 평균점수를 평균점수가 높은 순으로 출력하시오.*/


/*4.데이터베이스 조회(4)*/
/*'알고리즘'을 강의하는 교수의 교수번호, 교수이름, 소속학과를 검색하시오.*/
/*강의실 '510'호에서 강의하는 교수의 교수번호, 교수이름, 소속학과를 검색하시오.*/
/*'김창덕' 학생이 소속된 학과에 재직하는 교수들의 이름, 직급, 임용일자를 검색하시오.*/
/*수강신청 과목의 점수가 90점 이상인 학생들의 이름, 학생번호, 소속학과, 학년을 검색하시오.*/
/*'전산'과 교수들이 담당하는 강좌의 이름, 강의시간수, 강의실을 검색하시오.*/
/*'98/03/02'에 수강신청 한 학생들의 학과, 학번, 학생이름, 학년을 검색하시오.*/
/*'509'호에서 강의를 듣는 학생들의 학과, 학번, 학생이름을 검색하시오.*/
/*수강신청 과목의 평균점수가 80점 이상인 학생들의 이름, 학생번호, 소속학과, 학년을 검색하시오.*/
/*'건축'과 학생들을 지도하는 교수의 이름, 교수번호, 소속학과, 직급을 검색하시오.*/
/*학생수가 '3'명 이상인 학과에 근무하는 교수들의 이름, 소속학과, 직급을 검색하시오.*/
/*'이원구'가 수강신청한 과목의 번호, 과목명, 점수를 검색하시오.*/
/*'알고리즘'을 수강신청한 학생들의 학번, 학생이름, 학과를 검색하시오.*/
/*'1973'년생 학생들을 지도하는 교수들의 이름, 소속학과, 직급을 검색하시오.*/
/*전체 학생의 30% 이상이 수강신청한 강좌의 번호를 검색하시오.*/


/*1.데이터베이스 갱신*/
/*'98414022', '노진순', '75-05-10', '전산' 값을 학생테이블에 삽입하시오.*/
/*노진순의 수강신청 내용을 수강신청(Enrollments)테이블에 삽입하시오.*/
/*'1998년 1월 1일' 이전에 발생한 모든 수강신청 데이터를 oldEnrollments테이블로 복사하시오.*/
/*4학년 학생들의 모든 학생 데이터를 oldstudents 테이블로 복사하시오.*/
/*학생테이블에서 '노진순'의 데이터를 삭제하시오.*/
/*'1998년 1월 1일' 이전에 신청한 모든 수강신청 데이터를 삭제하시오.*/
/*수강신청 한 과목에 대해 성적을 아직 받지 못한 수강신청 데이터를 삭제하시오.*/
/*수강신청 한 과목에 대해 성적을 아직 받지 못한 수강신청 데이터를 삭제하시오.*/
/*학생테이블에서 전산과 3학년 데이터를 4학년으로 변경하시오.*/
/*'오문환' 교수의 직급을 '조교수'에서 '부교수'로 변경하시오.*/
/*'건축과' 학생이 신청한 모든 수강신청 데이터를 삭제하시오.*/
/*'전산'과 교수들의 급여를 10% 증가 시키시오.*/
/*모든 교수들의 급여를 10% 증가 시키시오.*/
/*'전자'과 학생들이 신청한 수강신청 데이터를 모두 삭제하시오.*/
/*'전산'과 교수가 담당하는 강좌의 강의실을 모두 '123'호실로 변경하시오.*/


/*2.데이터베이스 갱신*/
/*'이재광' 교수가 지도하는 학생들의 지도교수를 교수번호 '221'로 변경하시오.*/
/*'파일처리론' 과목을 수강신청 한 학생들의 점수를 5점씩 증가 시키시오. */
/*'전자'과 학생들이 수강신청 한 수강신청 데이터의 점수를 0점 처리 하시오.*/
/*'서연우' 학생의 지도교수가 강의하는 강좌의 강의실을 '304'호로 변경하시오.*/
/*'논리회로'를 강의하는 교수의 급여를 100000원 인상하시오.*/
/*수강신청인원수가 80명 이상인 강좌를 강의하는 교수들의 급여를 100000원 인상하시오.*/
/*서연우' 학생의 모든 과목 점수를 5점씩 감소 시키시오.*/
/*'전산'과 3학년 학생들이 수강신청 한 과목들의 성적을 5점씩 증가 시키시오.*/
/*'전산'과 '부교수'가 강의하는 강의시간수를 1씩 증가 시키시오.*/
/*수강신청 한 과목이3과목 이상인 학생들의 학년을 1씩 증가 시키시오.*/
/*수강신청 평균점수가 80점 미만인 학생들의 학년을 1씩 감소시키시오.*/
/*'파일처리론'을 수강신청 한 학생들의 학과를 '건축'으로 수정하시오.*/
/*강좌별 평균점수가 80점 이상인 과목들의 강의실을 '509'호로 변경하시오.*/
/*'오문환' 교수가 강의하는 강좌를 신청한 수강신청 데이터를 삭제하시오.*/
/*'자료구조'를 수강신청 한 학생의 학년을 1씩 증가 시키시오.*/










