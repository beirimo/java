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

insert into professors(pcode,pname,dept,hiredate,title,salary) values('221','�̺���','����','75/04/03','������',3000000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('228','���籤','����','91/09/19','�α���',2500000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('311','������','����','94/06/09','�α���',2300000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('509','����ȯ','����','92/10/14','������',2000000);

select * from professors;


insert into students(scode,sname,dept,year,birthday,advisor) values('92414029','������','����',3,'73/10/06','228');
insert into students(scode,sname,dept,year,birthday,advisor) values('92414033','��â��','����',4,'73/10/26','221');
insert into students(scode,sname,dept,year,birthday,advisor) values('92514009','������','����',4,'73/11/16','311');
insert into students(scode,sname,dept,year,birthday,advisor) values('92514023','������','����',4,'73/08/29','311');
insert into students(scode,sname,dept,year,birthday,advisor) values('92454018','�̿���','����',3,'74/09/30','509');
insert into students(scode,sname,dept,year,birthday,advisor) values('95454003','���翵','����',4,'76/02/06','509');
insert into students(scode,sname,dept,year,birthday,advisor) values('95414058','������','����',4,'76/03/12','221');
insert into students(scode,sname,dept,year,birthday,advisor) values('96414404','�����','����',3,'77/12/22','228');

select * from professors;


insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C301','����ó����', 3 ,'506','221',100,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C401','�����ͺ��̽�',3,'414','221',80,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C421','�˰���',3,'510','228',80,72);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C312','�ڷᱸ��',2,'510','228',100,60);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('E221','��ȸ��',3,'304','311',100,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('A109','�ѱ��ǰ��๮ȭ',2,'101','509',120,36);

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


/*���� ���̺��� �������� �ٹ��ϴ� �Ҽ��а� �̸��� �˻��Ͻÿ�(�� , �ߺ� ���� �����Ͻÿ�).*/
select distinct(dept) from professors;


select  distinct(dept) 
from    professors;




/*�л� ���̺��� '����'�̸鼭 '3'�г� �л����� �̸�, �й�, ��������� �˻��Ͻÿ�. */
select sname, scode, birthday   
from students
where dept='����' and year='3';



select sname, scode, birthday
from students
where dept='����' and year='3';
/*���� ���̺��� '1993��3��1��' ������ �ӿ�� �������� �̸� �Ҽ��а��� �˻��Ͻÿ�.*/

select pname, dept
from professors
where hiredate <= '1993/3/1';




select pname, dept, hiredate
from professors
where hiredate <= '1993/03/01';

/*�л� ���̺��� ������ȣ�� '221'�� ������ �������� �ʴ� �л����� �˻��Ͻÿ�. */
select sname
from students
where advisor <> '221';



select *
from students
where advisor <> '221';


select *
from
where 

/*������û ���̺��� ������ 80�� �̻��� �����ȣ, �л���ȣ�� �˻��Ͻÿ�*/
select  lcode , 
from  enrollments
where enrollments







select lcode, scode,grade 
from enrollments
where grade >=80;


/* ���� ���̺��� �����̸��� '����'�̶�� �ܾ �����ϴ� ������ ���¹�ȣ, �����̸�, ��米��, ���ǽð����� �˻��Ͻÿ� - like ������ */
select lcode, lname, instructor, hours
from courses
where lname like'%����%';
/* ������û ���̺��� 1998�� 3�� 1�Ͽ��� 3��3�� ���̿� ������û �� ���¹�ȣ, �л���ȣ, ������û���� �˻��Ͻÿ�. */
select *
from enrollments
where ebate beween '98/03/01' and '98/03/03';

/* �л� ���̺��� �г��� 2�г�� 4�г� ���̿� �л����� �й�, �л���, �а�, �г��� �˻��Ͻÿ�. */
select * 
from enrollments
where edate >= '98/03/01' and edate <= '98/03/03';

/* ���� ��û���̺��� ������ �Էµ��� ���� ������� ���¹�ȣ, �л���ȣ�� ��� �˻��Ͻÿ�. */
/* ���� ��û���̺��� ������ �Էµ� ������� ���¹�ȣ, �л���ȣ�� ��� �˻��Ͻÿ�. */
/* ���� ���̺��� ������ '������' �̰ų� '�α���'�� �������� ������ȣ, ������, ������ �˻��Ͻÿ� */
select  *
from professors 
where title, = '������' or title='�α���';

/*Ÿ��Ʋ�� ������ �̰ų� �α��� */
select * 
from professors
where title in('������', '�α���');  

/* '����'�� �л����� �й�, �̸�, ��������� �̸��� �������� ��������, ��������� �������� �������� ������ �Ͻÿ�. */
select  *
from students
where dept='����' 
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
/*�л����� �а�, �л��̸�, ���������̸��� �˻��Ͻÿ�.*/
select s.dept, s.name, p.pname, p.dept
from professors p, students s;
where p.pcode=s.advisor;

/*���¹�ȣ, ���¸�, �����̸��� �˻��Ͻÿ�.*/
select c.lcode, p.pcode,p.pname
from 
where
/*�й�, �л��̸�, �л����� ������û �� ���¹�ȣ, ������û���� �˻��Ͻÿ�*/
select 
from
where

select s.code, sname, e.lcode, e.grade
from students s, enrollments e
where s.scode=e.scode
order by  e.scode;

/*�й�, �л����� ������û �� ���¹�ȣ, ���¸�, ������ �˻��Ͻÿ�.*/
select s.scode, sname, e.lcode, c.lname, e.grade  
from students s, enrollments e, courses c
where s.scode=e.scode and e.lcode=c.lcode
order by  e.scode;
select * from view1;
/*'�̺���'�� ������ �����ϴ� �л����� �̸�, �г�, ��������� �˻��Ͻÿ�*/
select s.pcode, pname 
from 
where
order by

/*'98/03/03'�� ������û �� �л����� �й�, �л��̸�, ���¹�ȣ�� �˻��Ͻÿ�.*/
/*'����'�� �������� �����ϴ� �л����� �̸�, �г�, ��������� �˻��Ͻÿ�.*/
/*�ڷᱸ��'�� �����ϴ�   ������ �а���, ���� ���� �˻��Ͻÿ�.*/
/*'����ó����'�� ������û �� �л����� �й�, ������û��, ������ �˻��Ͻÿ�.*/
/*'�ڷᱸ��' ������ ������û �� �л����� �а�, �л��̸�, ������ �˻��Ͻÿ�.*/
/*'����'�� �л����� �й�, �л��̸�, ������û �� ���¹�ȣ, ���� ��, ������ �˻��Ͻÿ�.*/
/*'����ó����'�� �����ϴ� ������ �̸�, �� ������ �����ϴ� �л����� �й�, �л����� �˻��Ͻÿ�.*/
/*'�����ͺ��̽�'�� �����ϴ� ������, �� ������ ������û �� �л����� �а�, �̸�, ������ �˻��Ͻÿ�.*/


/*������ 80�� �̻��� �л����� �й�, �л��̸�, ���¹�ȣ, ���¸�, ��米�� ���� �˻��Ͻÿ�.*/





/*3.��ȸ*/
/*3.�������� �� �޿��װ� ��� �޿����� ���Ͻÿ�.*/
select sum(salary) salary_sum, avg(salary) salary_avg
from professors;

/*����� �������� �� �޿��װ� ��� �޿����� ���Ͻÿ�.*/
select sum(salary), avg(salary)
from professors
where dept='����';

/*������û �� ����� �߿��� �ְ� ������ ���� ������ ���Ͻÿ�.*/
select max(grade), min(grade)
from   enrollments;

/*����� �л����� ��� �� ������ ���Ͻÿ�.*/
select count(scode)
from students
where dept='����';

/*������û �� �л����� ��� �� ������ ���Ͻÿ�.*/
select count(distinct(scode))
from enrollments;



/*�� �а��� �л����� ���� ���Ͻÿ�.*/
select count(scode)
from students
group by dept 
order by count(scode) desc;


/*�������� �Ҽ��а���, ���޺��� �з��Ͽ� �� ���޺� ��� �޿��׼��� ���Ͻÿ�.*/

select avg(salary) , dept, title
from professors
group by dept, title
order by dept, title;


/*�� �л��鿡 ���� �й�, �л��̸�, ������û ������� ��� ������ ���Ͻÿ�.*/



/* �� ������ ���Ѿ� �ұ�?*/



/*�� �л��鿡 ���� ������û ����(�ڵ�,�ڵ��)���� ��� ������ ���Ͻÿ�.*/

select scode, sname, avg(grade),dept
from enr_stu_pro
where dept ='����' or dept='����'
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


/*������û �� ������� �л����� �׷����Ͽ� ��� ������ ���� ����, �л���ȣ, 
��� ������ //������ ���� ������ �����Ͽ� ����Ͻÿ�.*/
select avg(grade),scode   
from
where
group by  ������û �� ���
oder by desc;


/*������û ������� ��� ������ 85�� �̻��� �л����� �л���ȣ, ��� ������ ���Ͻÿ�.*/



/*���º� ��������� 80�� �̻��� ���µ��� ���¹�ȣ�� ��������� ����Ͻÿ�.*/



/*�л����� 3�� �̻��� �а� ���� ����, �а���, �л����� ����Ͻÿ�.*/





/*4.��ȸ*/
/*'�˰���'�� �����ϴ� ������ ������ȣ, �����̸�, �Ҽ��а��� �˻��Ͻÿ�.*/
select *from professors;  where pcode in  /* ~in -> or */
(select instructor from  courses where lname='�˰���');


/*���ǽ� '510'ȣ���� �����ϴ� ������ ������ȣ, �����̸�, �Ҽ��а��� �˻��Ͻÿ�.*/
select * from professors where pcode in 
select instructor from courses where room='510';


/*'��â��' �л��� �Ҽӵ� �а��� �����ϴ� �������� �̸�, ����, �ӿ����ڸ� �˻��Ͻÿ�.*/

select dept from student where sname='��â��';
where 
/*������û ������ ������ 90�� �̻��� �л����� �̸�, �л���ȣ, �Ҽ��а�, �г��� �˻��Ͻÿ�.*/
select avg(grade) ,scode , sname, dept,

elect * from students where scode in 
(seleft scode from enlloments group bt scode having avg(grade)>=80);

/* ���������� �ϳ��� Ư�����°ǰ� */

from
where
group by

/*'����'�� �������� ����ϴ� ������ �̸�, ���ǽð���, ���ǽ��� �˻��Ͻÿ�.*/
/*'98/03/02'�� ������û �� �л����� �а�, �й�, �л��̸�, �г��� �˻��Ͻÿ�.*/
/*'509'ȣ���� ���Ǹ� ��� �л����� �а�, �й�, �л��̸��� �˻��Ͻÿ�.*/
/*������û ������ ��������� 80�� �̻��� �л����� �̸�, �л���ȣ, �Ҽ��а�, �г��� �˻��Ͻÿ�.*/
/*'����'�� �л����� �����ϴ� ������ �̸�, ������ȣ, �Ҽ��а�, ������ �˻��Ͻÿ�.*/
/*�л����� '3'�� �̻��� �а��� �ٹ��ϴ� �������� �̸�, �Ҽ��а�, ������ �˻��Ͻÿ�.*/
/*'�̿���'�� ������û�� ������ ��ȣ, �����, ������ �˻��Ͻÿ�.*/
/*'�˰���'�� ������û�� �л����� �й�, �л��̸�, �а��� �˻��Ͻÿ�.*/
/*'1973'��� �л����� �����ϴ� �������� �̸�, �Ҽ��а�, ������ �˻��Ͻÿ�.*/
/*��ü �л��� 30% �̻��� ������û�� ������ ��ȣ�� �˻��Ͻÿ�.*/


/*������û ��������� 85�� �̻��� �л����� �л���ȣ, �л��̸�, ��� ������ ��������� ���� ������ ����Ͻÿ�.*/



/*���º� ��������� 80�� �̻��� ���µ��� ���¹�ȣ, ���¸�, ��������� ��������� ���� ������ ����Ͻÿ�.*/

/*1.����*/
/*'98414022', '������', '75-05-10', '����' ���� �л����̺� �����Ͻÿ�.*/
insert into students(scode, sname, birthday, dept)
values('98414022', '������', '75-05-10', '����');
select * from students;

/*�������� ������û ������ ������û(Enrollments)���̺� �����Ͻÿ�.*/
insert into oldenrollment(scode,

/*'1998�� 1�� 1��' ������ �߻��� ��� ������û �����͸� oldEnrollments���̺�� �����Ͻÿ�.*/



/*4�г� �л����� ��� �л� �����͸� oldstudents ���̺�� �����Ͻÿ�.*/
select 
/*�л����̺��� '������'�� �����͸� �����Ͻÿ�.*/
/*'1998�� 1�� 1��' ������ ��û�� ��� ������û �����͸� �����Ͻÿ�.*/
/*������û �� ���� ���� ������ ���� ���� ���� ������û �����͸� �����Ͻÿ�.*/
/*������û �� ���� ���� ������ ���� ���� ���� ������û �����͸� �����Ͻÿ�.*/
/*�л����̺��� ����� 3�г� �����͸� 4�г����� �����Ͻÿ�.*/
/*'����ȯ' ������ ������ '������'���� '�α���'�� �����Ͻÿ�.*/
/*'�����' �л��� ��û�� ��� ������û �����͸� �����Ͻÿ�.*/
/*'����'�� �������� �޿��� 10% ���� ��Ű�ÿ�.*/
/*��� �������� �޿��� 10% ���� ��Ű�ÿ�.*/
/*'����'�� �л����� ��û�� ������û �����͸� ��� �����Ͻÿ�.*/
/*'����'�� ������ ����ϴ� ������ ���ǽ��� ��� '123'ȣ�Ƿ� �����Ͻ�*/









drop table  professors;
drop table  students;
drop table  professors
/* ó������ �ٽ� ����  - �� �������� ������ */ 
/* �����ͺ��̽� ��ȸ (1)*/

/*���� ���̺��� ��� �����͸� �˻��Ͻÿ�.*/
select * from professors;


/*���� ���̺��� ��� ������ �̸�, �Ҽ��а�, ������ �˻��Ͻÿ�.*/
select pname, dept, title
from professors;

/*���� ���̺��� �������� �ٹ��ϴ� �Ҽ��а� �̸��� �˻��Ͻÿ�(�� , �ߺ� ���� �����Ͻÿ�).*/
select  distinct(dept)
from professors;



/*�л� ���̺��� '����'�̸鼭 '3'�г� �л����� �̸�, �й�, ��������� �˻��Ͻÿ�.*/
select sname, scode, birthday
from students
where dept = '����' and year = '3';


/*���� ���̺��� '1993��3��1��' ������ �ӿ�� �������� �̸� �Ҽ��а��� �˻��Ͻÿ�.*/
select pname, dept 
from professors
where hiredate < '1993/03/01';


/*�л� ���̺��� ������ȣ�� '221'�� ������ �������� �ʴ� �л����� �˻��Ͻÿ�.*/

select *
from students
where advisor!='221'; 

select * from students where advisor <> '221'; ( where advisor != '221' );

/*���� �� �´°���???   <> 221;(where advisor!=221)  �̷��� ���°� ���ε� ��ȣ�� �ƴϳ� ���ٴ°ǰ�? */


/*������û ���̺��� ������ 80�� �̻��� �����ȣ, �л���ȣ�� �˻��Ͻÿ�.*/
select lcode, scode
from enrollments
where grade >= 80;

select lcode, scode 
from enrollments
where grade >= 80;


/*���� ���̺��� �����̸��� '����'�̶�� �ܾ �����ϴ� ������ ���¹�ȣ, �����̸�, ��米��, ���ǽð����� �˻��Ͻÿ�.*/
select lcode, lname, hours, instructor
from courses
where lname like '%����%';

/*������û ���̺��� 1998�� 3�� 1�Ͽ��� 3��3�� ���̿� ������û �� ���¹�ȣ, �л���ȣ, ������û���� �˻��Ͻÿ�.*/
select lcode, scode, edate
from enrollments
where edate between '1998-03-01' and '1998-03-03';

/*�л� ���̺��� �г��� 2�г�� 4�г� ���̿� �л����� �й�, �л���, �а�, �г��� �˻��Ͻÿ�*/

select scode, sname, dept, year
from students 
where year between '2' and '4';

/*���� ��û���̺��� ������ �Էµ��� ���� ������� ���¹�ȣ, �л���ȣ�� ��� �˻��Ͻÿ�.*/

select lcode, scode 
from  enrollments
where grade is null;

select lcode, scode from enrollments where grade is null;


/*���� ��û���̺��� ������ �Էµ� ������� ���¹�ȣ, �л���ȣ�� ��� �˻��Ͻÿ�.*/

select lcode, scode
from enrollments
where grade is not null;

/*���� ���̺��� ������ '������' �̰ų� '�α���'�� �������� ������ȣ, ������, ������ �˻��Ͻÿ�.*/

select pcode, pname, title
from professors
where title = '������' or title= '�α���';



/*�л� ���̺��� '����'�� �Ǵ� '����'�� �Ǵ� '����'�� �л����� �̸�, �Ҽ��а�, �г��� �˻��Ͻÿ�.*/

select sname, dept, year
from students
where dept in ('����','����','����');
/*where dept='����' and dept='����' and dept = '����'; */

/*����'�� �л����� �й�, �̸�, ��������� �̸��� �������� ��������, ��������� �������� �������� ������ �Ͻÿ�. */
select  dept, sname,scode, birthday
from students
where dept= '����'
order by dept asc, birthday desc;


/* ----------------------------------------------------- 
    �����ͺ��̽� ��ȸ (2)
    
*/
/*�л����� �а�, �л��̸�, ���������̸��� �˻��Ͻÿ�.*/
/*���¹�ȣ, ���¸�, �����̸��� �˻��Ͻÿ�.*/
/*�й�, �л��̸�, �л����� ������û �� ���¹�ȣ, ������û���� �˻��Ͻÿ�*/
/*�й�, �л����� ������û �� ���¹�ȣ, ���¸�, ������ �˻��Ͻÿ�.*/
/*'�̺���'�� ������ �����ϴ� �л����� �̸�, �г�, ��������� �˻��Ͻÿ�*/
/*'98/03/03'�� ������û �� �л����� �й�, �л��̸�, ���¹�ȣ�� �˻��Ͻÿ�.*/
/*'����'�� �������� �����ϴ� �л����� �̸�, �г�, ��������� �˻��Ͻÿ�.*/
/*�ڷᱸ��'�� �����ϴ� ������ �а���, ���� ���� �˻��Ͻÿ�.*/
/*'����ó����'�� ������û �� �л����� �й�, ������û��, ������ �˻��Ͻÿ�.*/
/*'�ڷᱸ��' ������ ������û �� �л����� �а�, �л��̸�, ������ �˻��Ͻÿ�.*/
/*'����'�� �л����� �й�, �л��̸�, ������û �� ���¹�ȣ, ���� ��, ������ �˻��Ͻÿ�.*/
/*'����ó����'�� �����ϴ� ������ �̸�, �� ������ �����ϴ� �л����� �й�, �л����� �˻��Ͻÿ�.*/
/*'�����ͺ��̽�'�� �����ϴ� ������, �� ������ ������û �� �л����� �а�, �̸�, ������ �˻��Ͻÿ�.*/
/*������ 80�� �̻��� �л����� �й�, �л��̸�, ���¹�ȣ, ���¸�, ��米�� ���� �˻��Ͻÿ�.*/



/*3.�����ͺ��̽� ��ȸ(3)*/
/*�������� �� �޿��װ� ��� �޿����� ���Ͻÿ�.*/
/*����� �������� �� �޿��װ� ��� �޿����� ���Ͻÿ�.*/
/*������û �� ����� �߿��� �ְ� ������ ���� ������ ���Ͻÿ�.*/
/*����� �л����� ��� �� ������ ���Ͻÿ�.*/
/*������û �� �л����� ��� �� ������ ���Ͻÿ�.*/
/*�� �а��� �л����� ���� ���Ͻÿ�.*/
/*�������� �Ҽ��а���, ���޺��� �з��Ͽ� �� ���޺� ��� �޿��׼��� ���Ͻÿ�.*/
/*�� �л��鿡 ���� �й�, �л��̸�, ������û ������� ��� ������ ���Ͻÿ�.*/
/*�� �л��鿡 ���� ������û ������� ��� ������ ���Ͻÿ�.*/
/*������û �� ������� �л����� �׷����Ͽ� ��� ������ ���� ����, �л���ȣ, ��� ������ ������ ���� ������ �����Ͽ� ����Ͻÿ�.*/
/*������û ������� ��� ������ 85�� �̻��� �л����� �л���ȣ, ��� ������ ���Ͻÿ�.*/
/*���º� ��������� 80�� �̻��� ���µ��� ���¹�ȣ�� ��������� ����Ͻÿ�.*/
/*�л����� 3�� �̻��� �а� ���� ����, �а���, �л����� ����Ͻÿ�.*/
/*������û ��������� 85�� �̻��� �л����� �л���ȣ, �л��̸�, ��� ������ ��������� ���� ������ ����Ͻÿ�.*/
/*���º� ��������� 80�� �̻��� ���µ��� ���¹�ȣ, ���¸�, ��������� ��������� ���� ������ ����Ͻÿ�.*/


/*4.�����ͺ��̽� ��ȸ(4)*/
/*'�˰���'�� �����ϴ� ������ ������ȣ, �����̸�, �Ҽ��а��� �˻��Ͻÿ�.*/
/*���ǽ� '510'ȣ���� �����ϴ� ������ ������ȣ, �����̸�, �Ҽ��а��� �˻��Ͻÿ�.*/
/*'��â��' �л��� �Ҽӵ� �а��� �����ϴ� �������� �̸�, ����, �ӿ����ڸ� �˻��Ͻÿ�.*/
/*������û ������ ������ 90�� �̻��� �л����� �̸�, �л���ȣ, �Ҽ��а�, �г��� �˻��Ͻÿ�.*/
/*'����'�� �������� ����ϴ� ������ �̸�, ���ǽð���, ���ǽ��� �˻��Ͻÿ�.*/
/*'98/03/02'�� ������û �� �л����� �а�, �й�, �л��̸�, �г��� �˻��Ͻÿ�.*/
/*'509'ȣ���� ���Ǹ� ��� �л����� �а�, �й�, �л��̸��� �˻��Ͻÿ�.*/
/*������û ������ ��������� 80�� �̻��� �л����� �̸�, �л���ȣ, �Ҽ��а�, �г��� �˻��Ͻÿ�.*/
/*'����'�� �л����� �����ϴ� ������ �̸�, ������ȣ, �Ҽ��а�, ������ �˻��Ͻÿ�.*/
/*�л����� '3'�� �̻��� �а��� �ٹ��ϴ� �������� �̸�, �Ҽ��а�, ������ �˻��Ͻÿ�.*/
/*'�̿���'�� ������û�� ������ ��ȣ, �����, ������ �˻��Ͻÿ�.*/
/*'�˰���'�� ������û�� �л����� �й�, �л��̸�, �а��� �˻��Ͻÿ�.*/
/*'1973'��� �л����� �����ϴ� �������� �̸�, �Ҽ��а�, ������ �˻��Ͻÿ�.*/
/*��ü �л��� 30% �̻��� ������û�� ������ ��ȣ�� �˻��Ͻÿ�.*/


/*1.�����ͺ��̽� ����*/
/*'98414022', '������', '75-05-10', '����' ���� �л����̺� �����Ͻÿ�.*/
/*�������� ������û ������ ������û(Enrollments)���̺� �����Ͻÿ�.*/
/*'1998�� 1�� 1��' ������ �߻��� ��� ������û �����͸� oldEnrollments���̺�� �����Ͻÿ�.*/
/*4�г� �л����� ��� �л� �����͸� oldstudents ���̺�� �����Ͻÿ�.*/
/*�л����̺��� '������'�� �����͸� �����Ͻÿ�.*/
/*'1998�� 1�� 1��' ������ ��û�� ��� ������û �����͸� �����Ͻÿ�.*/
/*������û �� ���� ���� ������ ���� ���� ���� ������û �����͸� �����Ͻÿ�.*/
/*������û �� ���� ���� ������ ���� ���� ���� ������û �����͸� �����Ͻÿ�.*/
/*�л����̺��� ����� 3�г� �����͸� 4�г����� �����Ͻÿ�.*/
/*'����ȯ' ������ ������ '������'���� '�α���'�� �����Ͻÿ�.*/
/*'�����' �л��� ��û�� ��� ������û �����͸� �����Ͻÿ�.*/
/*'����'�� �������� �޿��� 10% ���� ��Ű�ÿ�.*/
/*��� �������� �޿��� 10% ���� ��Ű�ÿ�.*/
/*'����'�� �л����� ��û�� ������û �����͸� ��� �����Ͻÿ�.*/
/*'����'�� ������ ����ϴ� ������ ���ǽ��� ��� '123'ȣ�Ƿ� �����Ͻÿ�.*/


/*2.�����ͺ��̽� ����*/
/*'���籤' ������ �����ϴ� �л����� ���������� ������ȣ '221'�� �����Ͻÿ�.*/
/*'����ó����' ������ ������û �� �л����� ������ 5���� ���� ��Ű�ÿ�. */
/*'����'�� �л����� ������û �� ������û �������� ������ 0�� ó�� �Ͻÿ�.*/
/*'������' �л��� ���������� �����ϴ� ������ ���ǽ��� '304'ȣ�� �����Ͻÿ�.*/
/*'��ȸ��'�� �����ϴ� ������ �޿��� 100000�� �λ��Ͻÿ�.*/
/*������û�ο����� 80�� �̻��� ���¸� �����ϴ� �������� �޿��� 100000�� �λ��Ͻÿ�.*/
/*������' �л��� ��� ���� ������ 5���� ���� ��Ű�ÿ�.*/
/*'����'�� 3�г� �л����� ������û �� ������� ������ 5���� ���� ��Ű�ÿ�.*/
/*'����'�� '�α���'�� �����ϴ� ���ǽð����� 1�� ���� ��Ű�ÿ�.*/
/*������û �� ������3���� �̻��� �л����� �г��� 1�� ���� ��Ű�ÿ�.*/
/*������û ��������� 80�� �̸��� �л����� �г��� 1�� ���ҽ�Ű�ÿ�.*/
/*'����ó����'�� ������û �� �л����� �а��� '����'���� �����Ͻÿ�.*/
/*���º� ��������� 80�� �̻��� ������� ���ǽ��� '509'ȣ�� �����Ͻÿ�.*/
/*'����ȯ' ������ �����ϴ� ���¸� ��û�� ������û �����͸� �����Ͻÿ�.*/
/*'�ڷᱸ��'�� ������û �� �л��� �г��� 1�� ���� ��Ű�ÿ�.*/










