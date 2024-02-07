

select  *  from employee ;

CREATE or replace  FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    /* Write your PL/SQL query statement below */
 select salary  into  result  from 
       Employee     a  where  N = 
    (select  count(*)  from Employee  b  where   a.salary <= b.salary );
    
    RETURN result;
END;
/
select getNthHighestSalary(2)  from dual ;
select  *  from Employee;


create table Employee1 ( id number ,name varchar2(10),salary number ,managerId number );


select salary  into  result  from 
       Employee     a  where  N = 
    (select  count(*)  from Employee  b  where   a.salary >= b.salary );
    
    insert into Employee1 values (1,'joe',70000,3);
insert into Employee1 values (2,'Henry',80000,4);
insert into Employee1 values (3,'Sam',60000,null);
insert into Employee1 values (4,'Max',90000,null);



select  *  from Employee1 ;

with  d as   (select  a.*,b.salary  mg_salary   
from Employee1 a , Employee1 b where a.managerid = b.id(+))
select    name  employee  from d where salary > mg_salary  and MANAGERID is not null ;



create table activities (player_id number  ,device_id number ,event_date date ,games_played number );

insert into activities   values (1,2,to_date('2016-03-01','yyyy-mm-dd'),5);
insert into activities   values (1,2,to_date('2016-03-02','yyyy-mm-dd'),5);
insert into activities   values (2,3,to_date('2017-06-25','yyyy-mm-dd'),5);
insert into activities   values (3,1,to_date('2016-03-02','yyyy-mm-dd'),5);
insert into activities   values (3,4,to_date('2018-07-03','yyyy-mm-dd'),5);
select * from activities;

with d  as   (select  max(EVENT_DATE)   max1,min(EVENT_DATE) min1   ,player_id    from activities
group by player_id),
d1  as 
(select d.* ,count(unique player_id)  over  ()  c  from d  )
select   round( player_id /   c  ,2)  from d1  where max1-min1 = 1

create table trinage ( x int ,y int ,z int );
insert into trinage values (13,15,30);
insert into trinage values (10,20,15);

select  a.*,
case when  x+y  <  z then 'No' else 'Yes' end triangle   
from trinage a
drop table movies
create table movies( id int ,movie varchar2(10),description varchar2(20),rating number);
insert into movies   values (1,'war','great 3d',8.9);
insert into movies   values (2,'Science','fiction',8.5);
insert into movies    values (3,'irish','boring',6.2);
insert into movies    values (4,'Ice song','Fantacy',8.6);
insert into  movies   values (5,'House card','Interesting',9.1);

select  *   from movies  where mod( id ,2 )  != 0  and 
DESCRIPTION != 'boring' order by id desc;




create table ActorDirector  ( actor_id number, director_id number,timestamp number);

insert into ActorDirector  values (1,1,0);
insert into ActorDirector  values (1,1,1);
insert into ActorDirector  values (1,1,2);
insert into ActorDirector  values (1,2,3);
insert into ActorDirector  values (1,2,4);
insert into ActorDirector  values (2,1,5);
insert into ActorDirector  values (2,1,6);

select  *  from ActorDirector ;

select  actor_id,director_id ,count(*)  from ActorDirector
group by actor_id,director_id  having count(*) =3 ;

create table Weather  ( id number ,recordDate date ,temp int );

create table Weather  ( id number ,recordDate date ,temp int );
insert into weather  values ( 1,to_date('20150101','yyyymmdd'),10);
insert into weather values  ( 2,to_date('20150102','yyyymmdd'),25);
insert into weather  values ( 3,to_date('20150103','yyyymmdd'),20);
insert into weather values  ( 4,to_date('20150104','yyyymmdd'),30);

select *  from Weather ;

with d  as  (select  a.* ,b.temp  temp1   from 
weather a left outer join weather b   on  a.recorddate = b.recorddate+1
order by a.id  ) 
select  id from d where  temp > temp1 ;






create table Orders   ( order_number int ,customer_number int );
insert into Orders values (1,1);
insert into Orders values (2,2);
insert into Orders values (3,3);
insert into Orders values (4,3);

select  *  from Orders ;

select  customer_number  from Orders
group by customer_number having count(*) = (select  max(count(*) )  from 
Orders  group by customer_number) ;



create table Salary   (  id int ,name varchar2(10),sex varchar2(10),salary int );
insert into salary values (1,'A','m',2500);
insert into salary values (2,'B','f',1500);
insert into salary values (3,'C','m',5500);
insert into salary values (4,'D','f',500);

select  *  from Salary;
update Salary set sex =decode(sex,'m','f','f','m') ;






create table Project ( project_id number ,employee_id number);
insert into Project values (1,1);
insert into Project values (1,2);
insert into Project values (1,3);
insert into Project values (2,1);
insert into Project values (2,4);

delete   from Project  where project_id = 1 and employee_id = 4 

select  *  from Project ;



create table customer ( customer int ,name varchar2(10),visited_on date ,amount int );


insert into customer values (1,'Jhon',to_date('2019-01-01','yyyy-mm-dd') ,100);
insert into customer values (2,'Daniel',to_date('2019-01-02','yyyy-mm-dd') ,110);
insert into customer values (3,'Jade',to_date('2019-01-03','yyyy-mm-dd') ,120);
insert into customer values (4,'Khaled',to_date('2019-01-04','yyyy-mm-dd') ,130);
insert into customer values (5,'Winston',to_date('2019-01-05','yyyy-mm-dd') ,110);
insert into customer values (6,'Elvis',to_date('2019-01-06','yyyy-mm-dd') ,140);
insert into customer values (7,'Anna',to_date('2019-01-07','yyyy-mm-dd') ,150);
insert into customer values (8,'Maria',to_date('2019-01-08','yyyy-mm-dd') ,80);
insert into customer values (9,'Jaze',to_date('2019-01-09','yyyy-mm-dd') ,110);
insert into customer values (1,'Jhon',to_date('2019-01-10','yyyy-mm-dd') ,130);
insert into customer values (3,'Jade',to_date('2019-01-10','yyyy-mm-dd') ,150);




with d  as   (select  dense_rank()  over (  order by visited_on ) dense1
,a.*  from customer a),
d1 as (select  unique VISITED_ON   vitsied_days  from d where dense1<= 4 )
select  case when  visited_on >= VITSIED_DAYS   and visited_on <= VITSIED_DAYS +6 
  from customer  a ,d1   where a.VISITED_ON = d1.VITSIED_DAYS(+) ;
  
  
  
  
  
  
  
  
  create table MyNumbers   ( num int );
insert into MyNumbers  values (8);
insert into MyNumbers  values (8);
insert into MyNumbers  values (3);
insert into MyNumbers  values (3);
insert into MyNumbers  values (1);
insert into MyNumbers  values (4);
insert into MyNumbers  values (5);
insert into MyNumbers  values (6);
select *  from MyNumbers ;

with d  as   (select   num  from MyNumbers  
group by num having count(*) =1 ) 
select max(num )  from d ;




create table RequestAccepted  ( requester_id number ,accepter_id number ,accepter_date date );

insert into RequestAccepted values (1,2,to_date('2016/06/03','YYYY/MM/DD'));
insert into RequestAccepted values (1,3,to_date('2016/06/08','YYYY/MM/DD'));
insert into RequestAccepted values (2,3,to_date('2016/06/03','YYYY/MM/DD'));
insert into RequestAccepted values (3,4,to_date('2016/06/09','YYYY/MM/DD'));



select  *  from RequestAccepted ;


with d  as  ( select  requester_id   from RequestAccepted  union all 
select  accepter_id   from RequestAccepted ),
d1  as    (select  requester_id  id ,count(*)  num    from d  
group by requester_id  ) 
select *  from d1  where num = (select max(num)  from     d1  )


drop table employee
create table employee( id number ,name varchar2(10),salary number ,departmentId number );
insert into employee  values (1,'Joe',70000,1);
insert into employee  values (2,'Jim',90000,1);
insert into employee  values (3,'Henry',80000,2);
insert into employee  values (4,'Sam',60000,2);
insert into employee  values (5,'Max',90000,1);

select  *  from employee ;
create table Department ( id number ,name varchar2(10));
insert into Department  values (1,'IT');
insert into Department  values (2,'Sales');
select  *  from employee;

select  max(salary),departmentId   from 
employee  group by departmentId ;

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
| IT         | Max      | 90000  |
+------------+----------+--------+

select  b.name Department , a.name  Employee  ,a.salary salary   from employee a,Department b 
where (salary ,departmentId) in 
( select  max(salary),departmentId   from 
employee  group by departmentId)   and     a.departmentId = b.id(+) ;



select  *  from V$version;
select sysdate from dual ;





create table insurnace (  pid int ,tiv_2015 float ,tiv_2016 int ,lat float ,lon float );
insert into insurnace values ( 1,10,5,10,10);
insert into insurnace values ( 2,20,20,20,20);
insert into insurnace values ( 3,10,30,20,20);
insert into insurnace values ( 4,10,40,40,40);
commit;
select *  from insurnace ;


with  d1  as  ( select  count(*) c,lat,lon  from insurnace   group by lat,lon   having  count(*) =1 ),
d2  as  ( select  count(*) c ,tiv_2015   from insurnace   group by  tiv_2015  having count(*)  > 1 ),
d3  as   (select  *  from insurnace where  (lat,lon) in (select  lat,lon  from d1 )  )
select  sum( TIV_2016)  TIV_2016   from d3  where   tiv_2015  in (select  tiv_2015  from d2);


create table Seat (  id  number,student varchar2(100));
insert into Seat values (1,'Abbot');
insert into Seat values (2,'Doris');
insert into Seat values (3,'Emerson');
insert into Seat values (4,'Green');
insert into Seat values (5,'Jeames');


select  *  from Seat ;


with d  as   (select     ceil(id/2)  c  ,id ,student  from Seat),
d1  as  ( select    student     from d  order  by c,id  desc ) 
select  rownum  id ,student  from d1
;

drop table Customer;
create table Customer ( customer_id int ,product_key int );
insert into Customer  values (1,5);
insert into Customer  values (2,6);
insert into Customer  values (3,5);
insert into Customer  values (3,6);
insert into Customer  values (1,6);
commit ;

select  *  from Customer;

with d  as   (  select  unique  PRODUCT_KEY    from Customer)
select  customer_id  customer_id  from Customer  where PRODUCT_KEY  in 
(select PRODUCT_KEY  from d)  group by  customer_id   having  
count(unique PRODUCT_KEY ) in (select  count(*)  from d );

---------------------HARD ------------

Employee table:
+----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 85000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
| 7  | Will  | 70000  | 1            |
+----+-------+--------+--------------+
create table employee ( id int ,name varchar2(10),salary int,departmentId int );
insert into employee (1,'Joe',85000,1);
insert into employee (2,'Henry',80000,2);
insert into employee (3,'Sam',60000,2);
insert into employee (4,'Max',90000,1);
insert into employee (5,'Janet',69000,1);
insert into employee (6,'Randy',85000,1);
insert into employee (7,'Will',70000,1);
commit ;
select    *  from Department;


Department table:
+----+-------+
| id | name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+
---| Department | Employee | Salary 
select  *  from department;
with d  as  (select    a.*  ,dense_rank() over (partition by  departmentId  order by salary desc )  d   from 
employee a ) 
select  d1.name  Department  ,d.name employee ,d.salary  salary   from d , department  d1    where     d.departmentId = d1.id (+)  and  d <=3 ;





create table Stadium( id int ,visit_date date ,people  int );
insert into Stadium values (1,to_date ('2017-01-01','yyyy-mm-dd') ,10);
insert into Stadium values (2,to_date ('2017-01-02','yyyy-mm-dd') ,109);
insert into Stadium values (3,to_date ('2017-01-03','yyyy-mm-dd') ,150);
insert into Stadium values (4,to_date ('2017-01-04','yyyy-mm-dd') ,99);
insert into Stadium values (5,to_date ('2017-01-05','yyyy-mm-dd') ,145);
insert into Stadium values (6,to_date ('2017-01-06','yyyy-mm-dd') ,1455);
insert into Stadium values (7,to_date ('2017-01-07','yyyy-mm-dd') ,199);
insert into Stadium values (8,to_date ('2017-01-09','yyyy-mm-dd') ,188);



with d  as  (select  *  from Stadium where people >= 100 ) ,
d1   as   (  select   count( id -rownum) over ( partition by   id -rownum )  r1   ,d.* ,rank() over  ( partition  by  visit_date order by visit_date desc   )  visit_rank   from d  )
select  id  ,to_char(visit_date,'yyyy-mm-dd')   visit_date  ,people    from d1  where  r1 >=3   and visit_rank =1 ;


create table SalesPerson( sales_id int ,name varchar2(10),salary int ,commission_rate int ,hire_date date );
insert into SalesPerson  values (1,'John',100000,6,to_date('4/1/2006','mm-dd-yyyy');


insert into SalesPerson  values (2,'Amy',12000,5,to_date('5/1/2010','mm-dd-yyyy');
insert into SalesPerson  values (3,'Mark',65000,12,to_date('12/25/2008','mm-dd-yyyy');
insert into SalesPerson  values (4,'Pam',25000,25,to_date('1/1/2005','mm-dd-yyyy');
insert into SalesPerson  values (5,'Alex',5000,10,to_date('2/3/2007','mm-dd-yyyy');


create table Activity ( user_id int ,session_id int ,activity_date date  ,activity_type varchar2(100));
insert into Activity  values(1,1,to_date('2019-07-20','yyyy-mm-dd'),'open_session');
insert into Activity  values(1,1,to_date('2019-07-20','yyyy-mm-dd'),'scroll_down');
insert into Activity  values(1,1,to_date('2019-07-20','yyyy-mm-dd'),'end_session');
insert into Activity  values(2,4,to_date('2019-07-20','yyyy-mm-dd'),'open_session');
insert into Activity  values(2,4,to_date('2019-07-21','yyyy-mm-dd'),'send_message');
insert into Activity  values(2,4,to_date('2019-07-21','yyyy-mm-dd'),'end_session');
insert into Activity  values(3,2,to_date('2019-07-21','yyyy-mm-dd'),'open_session');
insert into Activity  values(3,2,to_date('2019-07-21','yyyy-mm-dd'),'send_message');
insert into Activity  values(3,2,to_date('2019-07-21','yyyy-mm-dd'),'end_session');
insert into Activity  values(4,3,to_date('2019-07-25','yyyy-mm-dd'),'open_session');
insert into Activity  values(4,3,to_date('2019-07-25','yyyy-mm-dd'),'end_session');

select  *  from Activity ;
with d  as  (select   user_id,session_id,activity_date ,listagg(activity_type,',')  la  from Activity     a
group by  user_id,session_id,activity_date ) 
select   activity_date day  ,count(*)  active_users   from d   where  la != 'open_session,end_session'
group by activity_date;



select *  from Views ;
create table Views ( article_id id ,author_id int ,viewer_id int ,view_date date );
insert into Views values ( 1,3,5, to_date('2019-08-01','yyyy-mm-dd');
insert into Views values ( 1,3,6, to_date('2019-08-02','yyyy-mm-dd');
insert into Views values ( 2,7,7, to_date('2019-08-01','yyyy-mm-dd');
insert into Views values ( 2,7,6, to_date('2019-08-02','yyyy-mm-dd');
insert into Views values ( 4,7,1, to_date('2019-07-22','yyyy-mm-dd');
insert into Views values ( 3,4,4, to_date('2019-07-21','yyyy-mm-dd');
insert into Views values ( 3,4,4, to_date('2019-07-21','yyyy-mm-dd');

----------------

Products table:
+------------+-----------+-------------+
| product_id | new_price | change_date |
+------------+-----------+-------------+
| 1          | 20        | 2019-08-14  |
| 2          | 50        | 2019-08-14  |
| 1          | 30        | 2019-08-15  |
| 1          | 35        | 2019-08-16  |
| 2          | 65        | 2019-08-17  |
| 3          | 20        | 2019-08-18  |
+------------+-----------+-------------+
Output: 
drop table Products;

create table Products ( product_id int ,new_price int ,change_date  date );
insert into Products  values ( 1,20,to_date ('2019-08-14','yyyy-mm-dd'));
insert into Products  values ( 2,50,to_date ('2019-08-14','yyyy-mm-dd'));
insert into Products  values ( 1,30,to_date ('2019-08-15','yyyy-mm-dd'));
insert into Products  values ( 1,35,to_date ('2019-08-16','yyyy-mm-dd'));
insert into Products  values ( 2,65,to_date ('2019-08-17','yyyy-mm-dd'));
insert into Products  values ( 3,20,to_date ('2019-08-18','yyyy-mm-dd'));

with d  as  (select  a.* ,case  when  change_date <= to_date('16-08-2019','dd-mm-yyyy')   then  new_price else  10 end   p1  from Products  a ) 
select  *  from d   order by 1;

with d  as   (select  product_id,max(  price  from Products  where  change_date <= to_date('16-08-2019','dd-mm-yyyy') 
group by product_id) ,
d1  as  (  select unique product_id  from Products  where  product_id  not in (select  product_id  from d ) ) 
select  *  from d union all 
select  product_id,10  from d1 

select  product_id,max(  change_date)   from Products  where  change_date <= to_date('16-08-2019','dd-mm-yyyy') 
group by product_id
select  *  from Products order by 1 

with  d  as  ( select  product_id,max(  change_date)   change_date  from Products  where  change_date <= to_date('16-08-2019','dd-mm-yyyy') 
group by product_id  ) ,
d1    as  (  select unique product_id  from Products  where  product_id  not in (select  product_id  from d ) ) 
select  product_id ,NEW_PRICE  price  from Products  where  ( product_id,change_date) in (select  *  from d)  union all 
 select  product_id,10  from d1 ;
 
 select  *  from Products;



select  *  from Products
;


---------------------------------


create table sales( sale_id int , product_id int ,year int ,quantity int ,price int );
insert into Sales values (1,100,2008,10,5000);
insert into Sales values (2,100,2009,12,5000);
insert into Sales    values (7,200,2011,15,9000);
select  *  from Sales ;
-----------------
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+ 
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+
-----------------------------
select  product_id , year   first_year , quantity , price
from Sales   where  (product_id,year) in 
(select  product_id,min(year)  from sales  group by product_id ) 


select  *  from Customer  ;



create table Transactions  (  id int , country varchar2(10), state varchar2(15), amount int ,trans_date date );
insert into  Transactions   values (121,'US','approved',1000,to_date('2018-12-18','yyyy-mm-dd'));
insert into  Transactions   values (122,'US','declined',2000,to_date('2018-12-19','yyyy-mm-dd'));
insert into  Transactions   values (123,'US','approved',2000, to_date('2019-01-01','yyyy-mm-dd'));
insert into  Transactions   values (124,'DE','approved',2000,to_date('2019-01-07','yyyy-mm-dd'));

select  *  from Transactions ;


select   to_char(trans_date,'yyyy-mm') month   , country 
 ,sum (decode(state ,'approved',1,0))+ sum (decode(state ,'declined',1,0)) trans_count  ,
 sum (decode(state ,'approved',1,0))   approved_count   ,
 sum(amount) trans_total_amount ,
    sum(decode(state ,'approved',amount ,0) )     approved_total_amount 
from Transactions  group by  to_char(trans_date,'yyyy-mm') ,country;

-------------------------

Input: 
Users table:
+---------+------------+----------------+
| user_id | join_date  | favorite_brand |
+---------+------------+----------------+
| 1       | 2018-01-01 | Lenovo         |
| 2       | 2018-02-09 | Samsung        |
| 3       | 2018-01-19 | LG             |
| 4       | 2018-05-21 | HP             |
+---------+------------+----------------+
Orders table:
+----------+------------+---------+----------+-----------+
| order_id | order_date | item_id | buyer_id | seller_id |
+----------+------------+---------+----------+-----------+
| 1        | 2019-08-01 | 4       | 1        | 2         |
| 2        | 2018-08-02 | 2       | 1        | 3         |
| 3        | 2019-08-03 | 3       | 2        | 3         |
| 4        | 2018-08-04 | 1       | 4        | 2         |
| 5        | 2018-08-04 | 1       | 3        | 4         |
| 6        | 2019-08-05 | 2       | 2        | 4         |
+----------+------------+---------+----------+-----------+
Items table:
+---------+------------+
| item_id | item_brand |
+---------+------------+
| 1       | Samsung    |
| 2       | Lenovo     |
| 3       | LG         |
| 4       | HP         |
+---------+------------+
Output: 
+-----------+------------+----------------+
| buyer_id  | join_date  | orders_in_2019 |
+-----------+------------+----------------+
| 1         | 2018-01-01 | 1              |
| 2         | 2018-02-09 | 2              |
| 3         | 2018-01-19 | 0              |
| 4         | 2018-05-21 | 0              |
+-----------+------------+----------------+

create table Users  ( user_id int ,join_date date ,favorite_brand varchar2(100));
insert into Users values ( 1,to_date('2018-01-01','yyyy-mm-dd'),'Lenovo');
insert into Users values ( 2,to_date('2018-02-09','yyyy-mm-dd'),'Samsung');
insert into Users values ( 3,to_date('2018-01-19','yyyy-mm-dd'),'LG');
insert into Users values ( 4,to_date('2018-05-21','yyyy-mm-dd'),'HP');

drop table Orders 
create table Orders( order_id int ,order_date  date ,item_id int ,buyer_id int ,seller_id int );
insert into Orders values ( 1,to_date('2019-08-01','yyyy-mm-dd'),4,1,2);
insert into Orders values ( 2,to_date('2018-08-02','yyyy-mm-dd'),2,1,3);
insert into Orders values ( 3,to_date('2019-08-03','yyyy-mm-dd'),3,2,3);
insert into Orders values ( 4,to_date('2018-08-04','yyyy-mm-dd'),1,4,2);
insert into Orders values ( 5,to_date('2018-08-04','yyyy-mm-dd'),1,3,4);
insert into Orders values ( 6,to_date('2019-08-05','yyyy-mm-dd'),2,2,4);


Queue table:
+-----------+-------------+--------+------+
| person_id | person_name | weight | turn |
+-----------+-------------+--------+------+
| 5         | Alice       | 250    | 1    |
| 4         | Bob         | 175    | 5    |
| 3         | Alex        | 350    | 2    |
| 6         | John Cena   | 400    | 3    |
| 1         | Winston     | 500    | 6    |
| 2         | Marie       | 200    | 4    |
+-----------+-------------+--------+------+

create table Queue( person_id int ,person_name varchar2(100),weight int ,turn int );
insert into Queue values ( 5,'Alice',250 ,1);
insert into Queue values ( 4,'Bob',175 ,5);
insert into Queue values ( 3,'Alex',350 ,2);
insert into Queue values ( 6,'John Cena',400 ,3);
insert into Queue values ( 1,'Winston',500 ,6);
insert into Queue values ( 2,'Marie',200 ,4);


Employees table:
+-------------+---------+------------+-----+
| employee_id | name    | reports_to | age |
+-------------+---------+------------+-----+
| 9           | Hercy   | null       | 43  |
| 6           | Alice   | 9          | 41  |
| 4           | Bob     | 9          | 36  |
| 2           | Winston | null       | 37  |
+-------------+---------+------------+-----+


create table Employee( employee int ,name varchar2(100),reports_to int  ,age int );
insert into Employee values (9,'Hercy',null,43);
insert into Employee values (6,'Alice',9,41);
insert into Employee values (4,'Bob',9,36);
insert into Employee values (2,'Winston',null,37);

drop table Employee
create table Employee( employee int ,name varchar2(100),reports_to int  ,age int );
insert into Employee values (9,'Hercy',null,43);
insert into Employee values (6,'Alice',9,41);
insert into Employee values (4,'Bob',9,36);
insert into Employee values (2,'Winston',null,37);

select  *  from Employee ;


with d as   (select  round(avg(age) ) rnd  ,reports_to,count(*)  c   from Employee  where reports_to is not null 
group by reports_to) 
select      d.reports_to employee_id  , name  ,  c reports_count  ,rnd   from d
,Employee  where d .reports_to = Employee.employee;


create table Tree( id int ,p_id int );
insert into Tree values ( 1,null);
insert into Tree values ( 2,1);
insert into Tree values ( 3,1);
insert into Tree values ( 4,2);
insert into Tree values ( 5,2);
commit ;

select  *   from Tree ;

select  unique p_id  from Tree

select  *  from Tree ;

select  id ,decode( p_id ,null ,'root')  from tree ;

with d  as  (select   id,decode( p_id ,null ,'Root','Inner')   type    from Tree where id in (select unique  nvl( p_id,id)    from tree  ) union all 
select   id,'Leaf' from Tree where id not  in (select unique  nvl(p_id ,id)   from tree   ) ) 
select *  from d order by 1 
;


create table Stocks  ( stock_name varchar2(15), operation  varchar2(10),operation_day int ,price int );
drop table Stocks
insert into  Stocks  values ( 'Leetcode','Buy',1,1000);
insert into  Stocks  values ( 'Corona Masks','Buy',2,10);
insert into  Stocks  values ( 'Leetcode','Sell',5,9000);
insert into  Stocks  values ( 'Handbags','Buy',17,30000);
insert into  Stocks  values ( 'Corona Masks','Sell',3,1010);
insert into  Stocks  values ( 'Corona Masks','Buy',4,1000);
insert into  Stocks  values ( 'Corona Masks','Sell',5,500);
insert into  Stocks  values ( 'Corona Masks','Buy',6,1000);
insert into  Stocks  values ( 'Handbags','Sell',29,7000);
insert into  Stocks  values ( 'Corona Masks','Sell',10,10000);


select  *  from Stocks ;

with d  as  (select  
a.* ,dense_rank() over ( partition by stock_name order by operation ,operation_day)    buy_rnk  from Stocks a  where operation  = 'Buy' ) ,
d1  as  
( select   a.* ,dense_rank() over ( partition by stock_name order by operation ,operation_day)    sell_rnk  from Stocks a  where operation  = 'Sell') 
select    d.stock_name,  sum(d1.price - d.price)  capital_gain_loss     from d ,d1   where  d.stock_name = d1.stock_name (+)    and d.buy_rnk = d1.sell_rnk(+) 
group by d.stock_name  order by 2  desc ;



Accounts table:
+------------+--------+
| account_id | income |
+------------+--------+
| 3          | 108939 |
| 2          | 12747  |
| 8          | 87709  |
| 6          | 91796  |
+------------+--------+

create table Accounts ( account_id int ,income int );
insert into Accounts values (3,108939);
insert into Accounts values (2,12747);
insert into Accounts values (8,87709);
insert into Accounts values (6,91796);

create table Accounts ( account_id int ,income int );
insert into Accounts values (3,108939);
insert into Accounts values (2,12747);
insert into Accounts values (8,87709);
insert into Accounts values (6,91796);

select  *  from  Accounts;;

"Low Salary": All the salaries strictly less than $20000.
"Average Salary": All the salaries in the inclusive range [$20000, $50000].
"High Salary": All the salaries strictly greater than $50000.
The result table must contain all three categories. If there are no acc

select   case when income <20000  then 'Low Salary'   when  income  >= 20000  and income <= 50000 then 'Average Salary'  when income > 50000  then   'High Salary' end salary_range  from Accounts;

+----------------+----------------+
| category       | accounts_count |
+----------------+----------------+
| Low Salary     | 1              |
| Average Salary | 0              |
| High Salary    | 3              |
+----------------+----------------+


with d as ( select   case when income <20000  then 'Low Salary'   when  income  >= 20000  and income <= 50000 then 'Average Salary'  when income > 50000  then   'High Salary' end category  from Accounts) ,
d1 as ( select 'Low Salary'  category from dual union all
select 'Average Salary'  from dual  union all 
select 'High Salary'  from dual ) 
select category ,count(*)   from d  group by category  union all 
select  category ,0   from d1  where category not in ( select category  from d ) ;

----------------------

Input: 
Signups table:
+---------+---------------------+
| user_id | time_stamp          |
+---------+---------------------+
| 3       | 2020-03-21 10:16:13 |
| 7       | 2020-01-04 13:57:59 |
| 2       | 2020-07-29 23:09:44 |
| 6       | 2020-12-09 10:39:37 |
+---------+---------------------+
Confirmations table:
+---------+---------------------+-----------+
| user_id | time_stamp          | action    |
+---------+---------------------+-----------+
| 3       | 2021-01-06 03:30:46 | timeout   |
| 3       | 2021-07-14 14:00:00 | timeout   |
| 7       | 2021-06-12 11:57:29 | confirmed |
| 7       | 2021-06-13 12:58:28 | confirmed |
| 7       | 2021-06-14 13:59:27 | confirmed |
| 2       | 2021-01-22 00:00:00 | confirmed |
| 2       | 2021-02-28 23:59:59 | timeout   |
+---------+---------------------+-----------+

------------------

create table Signups( user_id int ,time_stamp date );
insert into Signups  values (3,to_date('2020-03-21 10:16:13','yyyy-mm-dd hh:mm:ss'));
insert into Signups  values (7,to_date('2020-01-04 13:57:59','yyyy-mm-dd hh:mm:ss'));
insert into Signups  values (2,to_date('2020-07-29 23:09:44','yyyy-mm-dd hh:mm:ss'));
insert into Signups  values (6,to_date('2020-12-09 10:39:37','yyyy-mm-dd hh:mm:ss'));


+---------+---------------------+-----------+
| user_id | time_stamp          | action    |
+---------+---------------------+-----------+
| 3       | 2021-01-06 03:30:46 | timeout   |
| 3       | 2021-07-14 14:00:00 | timeout   |
| 7       | 2021-06-12 11:57:29 | confirmed |
| 7       | 2021-06-13 12:58:28 | confirmed |
| 7       | 2021-06-14 13:59:27 | confirmed |
| 2       | 2021-01-22 00:00:00 | confirmed |
| 2       | 2021-02-28 23:59:59 | timeout   |
+---------+---------------------+-----------+

create table Confirmations  (user_id int ,action varchar2(100));
insert into Confirmations values (3,'timeout');
insert into Confirmations values (3,'timeout');
insert into Confirmations values (7,'confirmed');
insert into Confirmations values (7,'confirmed');
insert into Confirmations values (7,'confirmed');
insert into Confirmations values (2,'confirmed');
insert into Confirmations values (2,'timeout');


Trips table:
+----+-----------+-----------+---------+---------------------+------------+
| id | client_id | driver_id | city_id | status              | request_at |
+----+-----------+-----------+---------+---------------------+------------+
| 1  | 1         | 10        | 1       | completed           | 2013-10-01 |
| 2  | 2         | 11        | 1       | cancelled_by_driver | 2013-10-01 |
| 3  | 3         | 12        | 6       | completed           | 2013-10-01 |
| 4  | 4         | 13        | 6       | cancelled_by_client | 2013-10-01 |
| 5  | 1         | 10        | 1       | completed           | 2013-10-02 |
| 6  | 2         | 11        | 6       | completed           | 2013-10-02 |
| 7  | 3         | 12        | 6       | completed           | 2013-10-02 |
| 8  | 2         | 12        | 12      | completed           | 2013-10-03 |
| 9  | 3         | 10        | 12      | completed           | 2013-10-03 |
| 10 | 4         | 13        | 12      | cancelled_by_driver | 2013-10-03 |
+----+-----------+-----------+---------+---------------------+------------+


create table Trips ( id int ,client_id int ,driver_id int ,city_id int ,status varchar2(100) ,request_at date );
insert into Trips  values ( 1,1,,10,1,'completed',to_date('2013-10-01','yyyy-mm-dd'));
insert into Trips  values ( 2,2,,11,1,'cancelled_by_driver',to_date('2013-10-01','yyyy-mm-dd'));
insert into Trips  values ( 3,3,,12,6,'completed',to_date('2013-10-01','yyyy-mm-dd'));
insert into Trips  values ( 4,4,13,6,'cancelled_by_client',to_date('2013-10-01','yyyy-mm-dd'));
insert into Trips  values ( 5,1,10,1,'completed',to_date('2013-10-02','yyyy-mm-dd'));
insert into Trips  values ( 6,2,11,6,'completed',to_date('2013-10-02','yyyy-mm-dd'));
insert into Trips  values ( 7,3,12,6,'completed',to_date('2013-10-02','yyyy-mm-dd'));
insert into Trips  values ( 8,2,12,12,'completed',to_date('2013-10-03','yyyy-mm-dd'));
insert into Trips  values ( 9,3,10,12,'completed',to_date('2013-10-03','yyyy-mm-dd'));
insert into Trips  values ( 10,4,13,12,'cancelled_by_driver',to_date('2013-10-03','yyyy-mm-dd'));


Users table:
+----------+--------+--------+
| users_id | banned | role   |
+----------+--------+--------+
| 1        | No     | client |
| 2        | Yes    | client |
| 3        | No     | client |
| 4        | No     | client |
| 10       | No     | driver |
| 11       | No     | driver |
| 12       | No     | driver |
| 13       | No     | driver |
+----------+--------+--------+

drop table Users;
create table Users ( users_id int ,banned varchar2(10),role varchar2(10));
insert into Users values  ( 1,'No','Client');
insert into Users values  ( 2,'Yes','Client');
insert into Users   values ( 3,'No','client');
insert into Users  values ( 4,'No','Client');
insert into Users values  ( 10,'No','driver');
insert into Users values  ( 11,'No','driver');
insert into Users values  ( 12,'No','driver');
insert into Users values  ( 13,'No','driver');

select  *  from Users ;

select  to_char( request_at,'yyyy-mm-dd')   request_at ,round(avg ( decode( status ,'completed',0,1)) ,2)   "Cancellation Rate"   from Trips    where client_id not in (select   users_id  from Users   where banned = 'Yes'  and role  = 'Client') 
and driver_id not in ( select  users_id   from Users   where banned = 'Yes'  and role  = 'driver') 
 group by to_char( request_at,'yyyy-mm-dd') order by 1 
 
 
 select  *  from Trips ;
 
 
 select  *  from Trips    where client_id not in (select   users_id  from Users   where banned = 'Yes'  and role  = 'Client') 
and driver_id not in ( select  users_id   from Users   where banned = 'Yes'  and role  = 'driver') 
order by 6


Employee table:
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | None      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+

drop table Employee;
create table Employee ( id int ,name varchar2(100) ,department varchar2(1), managerId    int );
insert into Employee  values (101,'John','A',null);
insert into Employee  values (102,'Dan','A',101);
insert into Employee  values (103,'James','A',101);
insert into Employee  values (104,'Amy','A',101);
insert into Employee  values (105,'Anne','A',101);
insert into Employee  values (106,'Ron','B',101);
with d  as   (select   managerId  ,count( unique id )  c   from Employee 
group by managerId  having count( unique id )   >=5 ) 
select  name  from d ,Employee  where d.managerId  =    id ;
-----------------

Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
drop table Logs ;
create table Logs( id int ,num int );
insert into Logs values (1,1);
insert into Logs values (2,1);
insert into Logs values (3,1);
insert into Logs values (4,2);
insert into Logs values (5,1);
insert into Logs values (6,2);
insert into Logs values (7,2);

select  *  from Logs ;

select  a.*,id-( num  +rownum -1  )
from logs  a order by 1 


Scores table:
+----+-------+
| id | score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+
Output: 


create table Scores ( id int ,score number(2));
insert into Scores (1,3.50);
insert into Scores (2,3.65);
insert into Scores (3,4.00);
insert into Scores (4,3.85);
insert into Scores (5,4.00);
insert into Scores (6,3.65);

create table Scores ( id int ,score  varchar2(5));
insert into Scores  values  (1,3.50);
insert into Scores  values  (2,3.65);
insert into Scores values  (3,4.00);
insert into Scores values  (4,3.85);
insert into Scores values  (5,4.00);
insert into Scores  values (6,3.65);
commit ;
drop table Scores
select  *  from Scores;

select  score, dense_rank() over ( order by score desc ) rank  
from Scores a;

Delivery table:
+-------------+-------------+------------+-----------------------------+
| delivery_id | customer_id | order_date | customer_pref_delivery_date |
+-------------+-------------+------------+-----------------------------+
| 1           | 1           | 2019-08-01 | 2019-08-02                  |
| 2           | 2           | 2019-08-02 | 2019-08-02                  |
| 3           | 1           | 2019-08-11 | 2019-08-12                  |
| 4           | 3           | 2019-08-24 | 2019-08-24                  |
| 5           | 3           | 2019-08-21 | 2019-08-22                  |
| 6           | 2           | 2019-08-11 | 2019-08-13                  |
| 7           | 4           | 2019-08-09 | 2019-08-09                  |
+-------------+-------------+------------+-----------------------------+

drop table Delivery
create table Delivery ( delivery_id int ,customer_id int ,order_date date ,customer_pref_delivery_date date );
insert into Delivery values ( 1,1,to_date('2019-08-01','yyyy-mm-dd'),to_date('2019-08-02','yyyy-mm-dd'));
insert into Delivery  values ( 2,2,to_date('2019-08-02','yyyy-mm-dd'),to_date('2019-08-02','yyyy-mm-dd'));
insert into Delivery  values ( 3,1,to_date('2019-08-11','yyyy-mm-dd'),to_date('2019-08-12','yyyy-mm-dd'));
insert into Delivery values ( 4,3,to_date('2019-08-24','yyyy-mm-dd'),to_date('2019-08-24','yyyy-mm-dd'));
insert into Delivery   values ( 5,3,to_date('2019-08-21','yyyy-mm-dd'),to_date('2019-08-22','yyyy-mm-dd'));
insert into Delivery   values ( 6,2,to_date('2019-08-11','yyyy-mm-dd'),to_date('2019-08-13','yyyy-mm-dd'));
insert into Delivery  values ( 7,4,to_date('2019-08-09','yyyy-mm-dd'),to_date('2019-08-09','yyyy-mm-dd'));
select  *  from Delivery ;

with d  as  (select  dense_rank() over ( partition by customer_id order by order_date )  rk ,a.*  from Delivery a)
select  round(avg ( case when order_date =   customer_pref_delivery_date  then 100 else 0 end ) ,2)   IMMEDIATE_PERCENTAGE   from d  where rk = 1

---------------------

+-------------+--------------+--------------+-------------+
| movie_id    | user_id      | rating       | created_at  |
+-------------+--------------+--------------+-------------+
| 1           | 1            | 3            | 2020-01-12  |
| 1           | 2            | 4            | 2020-02-11  |
| 1           | 3            | 2            | 2020-02-12  |
| 1           | 4            | 1            | 2020-01-01  |
| 2           | 1            | 5            | 2020-02-17  | 
| 2           | 2            | 2            | 2020-02-01  | 
| 2           | 3            | 2            | 2020-03-01  |
| 3           | 1            | 3            | 2020-02-22  | 
| 3           | 2            | 4            | 2020-02-25  | 
+-------------+--------------+--------------+-------------+
Output: 


create table MovieRating ( movie_id int ,user_id int ,rating int ,created_at date );

insert into  MovieRating values   ( 1,1,3,to_date('2020-01-12','yyyy-mm-dd'));
insert into  MovieRating  values  ( 1,2,4,to_date('2020-02-11','yyyy-mm-dd'));
insert into  MovieRating  values  ( 1,3,2,to_date('2020-02-12','yyyy-mm-dd'));
insert into  MovieRating  values  ( 1,4,1,to_date('2020-01-01','yyyy-mm-dd'));
insert into  MovieRating  values  ( 2,1,5,to_date('2020-01-17','yyyy-mm-dd'));
insert into  MovieRating  values  ( 2,2,2,to_date('2020-02-01','yyyy-mm-dd'));
insert into  MovieRating  values  ( 2,3,2,to_date('2020-03-01','yyyy-mm-dd'));
insert into  MovieRating  values  ( 3,1,3,to_date('2020-02-22','yyyy-mm-dd'));
insert into  MovieRating   values ( 3,2,4,to_date('2020-02-25','yyyy-mm-dd'));

select  user_id ,count(*)  from MovieRating 
group by user_id;
select   avg(RATING) ,movie_id      from MovieRating where  to_char( created_at ,'yyyymm') = '202002' 
group by movie_id         ;

select  *  from MovieRating;


Movies table:
+-------------+--------------+
| movie_id    |  title       |
+-------------+--------------+
| 1           | Avengers     |
| 2           | Frozen 2     |
| 3           | Joker        |
+-------------+--------------+
Users table:
+-------------+--------------+
| user_id     |  name        |
+-------------+--------------+
| 1           | Daniel       |
| 2           | Monica       |
| 3           | Maria        |
| 4           | James        |
+-------------+--------------+


create table Movies( movie_id int ,title varchar2(10));
insert into Movies values ( 1,'Avengers');
insert into Movies values ( 1,'Frozen 2');
insert into Movies values ( 1,'Joker');
commit;

create table Users( user_id int ,name varchar2(10));
insert into Users values ( 1,'Daniel');
insert into Users values ( 2,'Monica');
insert into Users values ( 3,'Maria');
insert into Users values ( 4,'James');
commit ;
  drop table Movies;
create table Movies( movie_id int ,title varchar2(10));
insert into Movies values ( 1,'Avengers');
insert into Movies values ( 2,'Frozen 2');
insert into Movies values ( 3,'Joker');
commit;
  drop table Users;
create table Users( user_id int ,name varchar2(10));
insert into Users values ( 1,'Daniel');
insert into Users values ( 2,'Monica');
insert into Users values ( 3,'Maria');
insert into Users values ( 4,'James');
commit ;


 with d  as   (  select  name ,count(*)  from MovieRating  a , Users  b where a.user_id  =  b.user_id 
group by name),d1
as  (select *  from d order by 2 desc ,1 ) ,d2
as(  select  title ,avg(RATING) from MovieRating  a , Movies  b where a.movie_id  =  b.movie_id  and   to_char( created_at ,'yyyymm') = '202002' 
group by title)  ,d3  as  ( select * from d2    order by 2 desc ,1   ) 
select name  from d1 where rownum = 1  union all 
select title  from d3 where rownum = 1

select  name   from d1  where rownum = 1
select   avg(RATING) ,movie_id      from MovieRating where  to_char( created_at ,'yyyymm') = '202002' 
group by movie_id         ;
select *  from Movies
;


select   *  from Users ;


drop table Users;

+---------+------------+----------------+
| user_id | join_date  | favorite_brand |
+---------+------------+----------------+
| 1       | 2018-01-01 | Lenovo         |
| 2       | 2018-02-09 | Samsung        |
| 3       | 2018-01-19 | LG             |
| 4       | 2018-05-21 | HP             |
+---------+------------+----------------+
Orders table:
+----------+------------+---------+----------+-----------+
| order_id | order_date | item_id | buyer_id | seller_id |
+----------+------------+---------+----------+-----------+
| 1        | 2019-08-01 | 4       | 1        | 2         |
| 2        | 2018-08-02 | 2       | 1        | 3         |
| 3        | 2019-08-03 | 3       | 2        | 3         |
| 4        | 2018-08-04 | 1       | 4        | 2         |
| 5        | 2018-08-04 | 1       | 3        | 4         |
| 6        | 2019-08-05 | 2       | 2        | 4         |
+----------+------------+---------+----------+-----------+


create table Users ( user_id int ,join_date date ,favorite_brand varchar2(100));
insert into Users values ( 1,to_date ('2018-01-01','yyyy-mm-dd'),'Lenovo');
insert into Users values ( 2,to_date ('2018-02-09','yyyy-mm-dd'),'Samsung');
insert into Users values ( 3,to_date ('2018-01-19','yyyy-mm-dd'),'LG');
insert into Users values ( 4,to_date ('2018-05-21','yyyy-mm-dd'),'HP');
select  *  from Users;



create table Orders( order_id int ,order_date date ,item_id int ,buyer_id int ,seller_id int );
insert into Orders values ( 1,to_date('2019-08-01','yyyy-mm-dd') ,4,1,2);
insert into Orders values ( 2,to_date('2018-08-02','yyyy-mm-dd') ,2,1,3);
insert into Orders values ( 3,to_date('2019-08-03','yyyy-mm-dd') ,3,2,3);
insert into Orders values ( 4,to_date('2018-08-04','yyyy-mm-dd') ,1,4,2);
insert into Orders values ( 5,to_date('2018-08-04','yyyy-mm-dd') ,1,3,4);
insert into Orders values ( 6,to_date('2019-08-05','yyyy-mm-dd') ,2,2,4);
commit ;

drop table Orders;
select *  from Users;
select  *  from Orders;
select    buyer_id,     to_char(join_date,'yyyy-mm-dd')  join_date,   sum(decode( to_char(ORDER_DATE,'yyyy') ,'2019',1,0) )  orders_in_2019   from Orders  t ,Users t2  where t2.user_id = t.buyer_id (+) 
group by buyer_id,   to_char(join_date,'yyyy-mm-dd') order by 1;

create table test1(  a date ,price int );

insert into test1 values ( to_date('2023-01-05','yyyy-mm-dd'),100);
insert into test1 values ( to_date('2023-01-10','yyyy-mm-dd'),200);
insert into test1 values ( to_date('2023-01-15','yyyy-mm-dd'),300);
commit ;
select  *  from test1  order by 1
with d  as  ( select max( a) - min(a)  days   ,min(a)  min1 from test1),
d1   as  (select   min1+ level  -1    days2 from dual  ,d connect by level <= ( select   days +1   from d )) 
select  days2 ,nvl ( price,(select max(price)   from test1   where a < days2)  )     from d1 ,test1  where days2 = a(+)  order by  1 ;

create table  test2( id int ,dt date ,val int );

insert into test2 values ( 1,to_date('2023-01','yyyy-mm'),100);
insert into test2 values ( 1,to_date('2023-01','yyyy-mm'),60);
insert into test2 values ( 1,to_date('2023-01','yyyy-mm'),40);
insert into test2 values ( 2,to_date('2023-02','yyyy-mm'),30);
insert into test2 values ( 2,to_date('2023-02','yyyy-mm'),20);
commit ;
with d  as  (select  *  from test2  order by 1 ,val  desc  ) 
select  a.* ,round(avg  (val) over ( partition by  id  order by val   desc  ) ,2)   from d a ;


create table Match1 ( match_no int ,teama varchar2(20), teamb varchar2(20));
insert into Match1 values ( 'WL','SL','WL');
insert into Match1 values ( 'IND','SL','IND');
insert into Match1 values ( 'AUS','SL','AUS');
insert into Match1 values ( 'WI','SL','SL');
insert into Match1 values ( 'AUS','IND','AUS');
insert into Match1 values ( 'WI','SL','WL');
insert into Match1 values ( 'IND','WL','WL');
insert into Match1 values ( 'WL','AUS','AUS');
insert into Match1 values ( 'AUS','WI','WI');
insert into Match1 values ( 'WI','SL','WL');
insert into Match1 values ( 'IND','AUS','IND');
insert into Match1 values ( 'SL','NZ','SL');
insert into Match1 values ( 'NZ','IND','IND');
commit ;


with d  as  (select  a.* ,case  when  teamb = win  then teama else teamb end  lost1 from match1 a) ,
d1  as   (select  win,count(*) win_no   from d  group by win ) ,
d2   as   (select  lost1,count(*)  lost_no from d  group by lost1) 
select  win team,win_no ,lost_no ,win_no + lost_no total_games_played    from d1,d2  where win = lost1 ;


with d  as   (select  a.name  city1 ,b.name city2    from city a   ,city  b 
where a.name !=  b.name ) ,
d1  as  (select  d.* , dense_rank()  over ( partition by city1  order by city2  )  rk1 ,
dense_rank()  over ( partition by city2  order by city1  )  rk2
  from d  ),
  d2   as   ( select d1.* ,dense_rank () over  ( partition by     rk1 ,rk2  order by rownum  )   rk3   from d1   where rk1 = rk2 ) 
  select  city1 ,city2   from d1  where rk1  != rk2  union all 
  select  city1 ,city2   from d2   where rk3 = 1 


+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-05-02 | 6            |
| 1         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |
+-----------+-----------+------------+--------------+

create table Activity  ( player_id int ,device_id int ,event_date date ,games_played int );
insert into Activity( 1,2,to_date('2016-03-01','yyyy-mm-dd'),5);
insert into Activity( 1,2,to_date('2016-05-02','yyyy-mm-dd'),6);
insert into Activity( 1,3,to_date('2017-06-25','yyyy-mm-dd'),1);
insert into Activity( 3,1,to_date('2016-03-01','yyyy-mm-dd'),0);
insert into Activity( 3,4,to_date('2016-03-01','yyyy-mm-dd'),5);


Traffic table:
+---------+----------+---------------+
| user_id | activity | activity_date |
+---------+----------+---------------+
| 1       | login    | 2019-05-01    |
| 1       | homepage | 2019-05-01    |
| 1       | logout   | 2019-05-01    |
| 2       | login    | 2019-06-21    |
| 2       | logout   | 2019-06-21    |
| 3       | login    | 2019-01-01    |
| 3       | jobs     | 2019-01-01    |
| 3       | logout   | 2019-01-01    |
| 4       | login    | 2019-06-21    |
| 4       | groups   | 2019-06-21    |
| 4       | logout   | 2019-06-21    |
| 5       | login    | 2019-03-01    |
| 5       | logout   | 2019-03-01    |
| 5       | login    | 2019-06-21    |
| 5       | logout   | 2019-06-21    |
+---------+----------+---------------+


create table Traffic ( user_id int ,Activity varchar2(10),activity_date date );
insert into Traffic  values ( 1,'login',to_date('2019-05-01','yyyy-mm-dd'));
insert into Traffic  values ( 1,'homepage',to_date('2019-05-01','yyyy-mm-dd'));
insert into Traffic  values ( 1,'logout',to_date('2019-05-01','yyyy-mm-dd'));
insert into Traffic  values ( 2,'login',to_date('2019-06-21','yyyy-mm-dd'));
insert into Traffic  values ( 2,'logout',to_date('2019-06-21','yyyy-mm-dd'));
insert into Traffic  values ( 3,'login',to_date('2019-01-01','yyyy-mm-dd'));
insert into Traffic  values ( 3,'jobs',to_date('2019-01-01','yyyy-mm-dd'));
insert into Traffic  values ( 3,'login',to_date('2019-01-01','yyyy-mm-dd'));
insert into Traffic  values ( 4,'login',to_date('2019-06-21','yyyy-mm-dd'));
insert into Traffic  values ( 4,'groups',to_date('2019-06-21','yyyy-mm-dd'));
insert into Traffic  values ( 4,'logout',to_date('2019-06-21','yyyy-mm-dd'));
insert into Traffic  values ( 5,'login',to_date('2019-03-01','yyyy-mm-dd'));
insert into Traffic  values ( 5,'logout',to_date('2019-03-01','yyyy-mm-dd'));
insert into Traffic  values ( 5,'login',to_date('2019-06-21','yyyy-mm-dd'));
insert into Traffic  values ( 5,'logout',to_date('2019-06-21','yyyy-mm-dd'));
commit ;


Orders table:
+------------+--------------+---------------+
| order_id   | customer_id  | product_name  |
+------------+--------------+---------------+
| 10         |     1        |     A         |
| 20         |     1        |     B         |
| 30         |     1        |     D         |
| 40         |     1        |     C         |
| 50         |     2        |     A         |
| 60         |     3        |     A         |
| 70         |     3        |     B         |
| 80         |     3        |     D         |
| 90         |     4        |     C         |


create table Orders ( order_id int ,customer_id int ,product_name varchar2);
insert into orders values (10,1,'A');
insert into orders values (20,1,'B');
insert into orders values (30,1,'D');
insert into orders values (40,1,'C');
insert into orders values (50,2,'A');
insert into orders values (60,1,'A');
insert into orders values (70,1,'B');
insert into orders values (80,1,'D');
insert into orders values (90,1,'C');

+------------+--------------+---------------+
| order_id   | customer_id  | product_name  |
+------------+--------------+---------------+
| 10         |     1        |     A         |
| 20         |     1        |     B         |
| 30         |     1        |     D         |
| 40         |     1        |     C         |
| 50         |     2        |     A         |
| 60         |     3        |     A         |
| 70         |     3        |     B         |
| 80         |     3        |     D         |
| 90         |     4        |     C         |
+------------+--------------+---------------+


create table Orders ( order_id int ,customer_id int ,product_name varchar2(1));
insert into orders values (10,1,'A');
insert into orders values (20,1,'B');
insert into orders values (30,1,'D');
insert into orders values (40,1,'C');
insert into orders values (50,2,'A');
insert into orders values (60,3,'A');
insert into orders values (70,3,'B');
insert into orders values (80,3,'D');
insert into orders values (90,4,'C');
commit;


+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
| 1           | Daniel        |
| 2           | Diana         |
| 3           | Elizabeth     |
| 4           | Jhon          |
+-------------+---------------+

create table  Customers  ( customer_id int ,customer_name varchar2(10));
insert into Customers values ( 1,'Daniel');
insert into Customers values ( 2,'Diana');
insert into Customers values ( 3,'Elizabeth');
insert into Customers values ( 4,'Jhon');



Logins table:
+----+------------+
| id | login_date |
+----+------------+
| 7  | 2020-05-30 |
| 1  | 2020-05-30 |
| 7  | 2020-05-31 |
| 7  | 2020-06-01 |
| 7  | 2020-06-02 |
| 7  | 2020-06-02 |
| 7  | 2020-06-03 |
| 1  | 2020-06-07 |
| 7  | 2020-06-10 |


create table Logins( id int ,login_date date ) ;

insert into logins values ( 7 ,to_date( '2020-05-30','yyyy-mm-dd'));
insert into logins values ( 1 ,to_date( '2020-05-30','yyyy-mm-dd'));
insert into logins values ( 7 ,to_date( '2020-05-31','yyyy-mm-dd'));
insert into logins values ( 7 ,to_date( '2020-06-01','yyyy-mm-dd'));
insert into logins values ( 7 ,to_date( '2020-06-02','yyyy-mm-dd'));
insert into logins values ( 7 ,to_date( '2020-06-02','yyyy-mm-dd'));
insert into logins values ( 7 ,to_date( '2020-06-03','yyyy-mm-dd'));
insert into logins values ( 1 ,to_date( '2020-06-07','yyyy-mm-dd'));
insert into logins values ( 7 ,to_date( '2020-06-10','yyyy-mm-dd'));
commit ;



Accounts table:
+----+----------+
| id | name     |
+----+----------+
| 1  | Winston  |
| 7  | Jonathan |
+----+----------+

create table Accounts ( id int ,name varchar2(10));
insert into Accounts  values ( 1,'Winston');
insert into Accounts  values ( 7,'Jonathan');
commit ;


with d  as   (select   a.*  ,dense_rank() over ( partition by id order by   login_date) a1 from logins a ),d1 as  
( select  a.id ,sum(decode(a.login_date-b.login_date ,1,1,0)) num    from d b  ,d a   where a.id = b.id  and 
(a.a1-1) = b.a1    group by  a.id  ) 
select  d1.id ,Accounts.name  from d1,accounts    where num != 0 
and d1.id   = accounts.id 







Input: 
Person table:
+----+----------+--------------+
| id | name     | phone_number |
+----+----------+--------------+
| 3  | Jonathan | 051-1234567  |
| 12 | Elvis    | 051-7654321  |
| 1  | Moncef   | 212-1234567  |
| 2  | Maroua   | 212-6523651  |
| 7  | Meir     | 972-1234567  |
| 9  | Rachel   | 972-0011100  |
+----+----------+--------------+
Country table:
+----------+--------------+
| name     | country_code |
+----------+--------------+
| Peru     | 051          |
| Israel   | 972          |
| Morocco  | 212          |
| Germany  | 049          |
| Ethiopia | 251          |
+----------+--------------+
Calls table:
+-----------+-----------+----------+
| caller_id | callee_id | duration |
+-----------+-----------+----------+
| 1         | 9         | 33       |
| 2         | 9         | 4        |
| 1         | 2         | 59       |
| 3         | 12        | 102      |
| 3         | 12        | 330      |
| 12        | 3         | 5        |
| 7         | 9         | 13       |
| 7         | 1         | 3        |
| 9         | 7         | 1        |
| 1         | 7         | 7        |
+-----------+-----------+----------+
Output: 


create table Person ( id int ,name varchar2(10),phone_number  varchar2(20));
insert into Person  values ( 3,'Jonathan','051-1234567');
insert into Person  values ( 12,'Elvis','051-7654321');
insert into Person  values ( 1,'Moncef','212-1234567');
insert into Person  values ( 2,'Maroua','212-6523651');
insert into Person  values ( 7,'Meir','972-1234567');
insert into Person  values ( 9,'Rachel','972-0011100');

Country table:
+----------+--------------+
| name     | country_code |
+----------+--------------+
| Peru     | 051          |
| Israel   | 972          |
| Morocco  | 212          |
| Germany  | 049          |
| Ethiopia | 251          |
+----------+--------------+

create table Country ( name varchar2(10),country_code varchar2(10));
insert into Country  values ( 'Peru','051');
insert into Country  values ( 'Israel','972');
insert into Country  values ( 'Morocco','212');
insert into Country  values ( 'Germany','049');
insert into Country  values ( 'Ethiopia','251');

Calls table:
+-----------+-----------+----------+
| caller_id | callee_id | duration |
+-----------+-----------+----------+
| 1         | 9         | 33       |
| 2         | 9         | 4        |
| 1         | 2         | 59       |
| 3         | 12        | 102      |
| 3         | 12        | 330      |
| 12        | 3         | 5        |
| 7         | 9         | 13       |
| 7         | 1         | 3        |
| 9         | 7         | 1        |
| 1         | 7         | 7        |
+-----------+-----------+----------+

create table Calls  (  caller_id int ,callee_id  int ,duration  int );
insert into Calls  values ( 1,9,33);
insert into Calls  values ( 2,9,4);
insert into Calls  values ( 1,2,59);
insert into Calls  values ( 3,12,102);
insert into Calls  values ( 3,12,330);
insert into Calls  values ( 12,3,5);
insert into Calls  values ( 7,9,13);
insert into Calls  values ( 7,1,3);
insert into Calls  values ( 9,7,1);
insert into Calls  values ( 1,7,7);

with d  as  (select  
substr(phone_number ,1,3) ph, 
round(avg(duration)  over ( partition by substr(phone_number ,1,3)),2) lc ,
avg(duration) over ()  gl from ( select  caller_id, duration  from  Calls   union all 
select  callee_id , duration  from  Calls)
,Person   where caller_id  = id ) 
select unique     name   country    from d ,Country   where lc > gl  and country_code  = ph;


Input: 
Student table:
+------------+--------------+--------+---------+
| student_id | student_name | gender | dept_id |
+------------+--------------+--------+---------+
| 1          | Jack         | M      | 1       |
| 2          | Jane         | F      | 1       |
| 3          | Mark         | M      | 2       |
+------------+--------------+--------+---------+
Department table:
+---------+-------------+
| dept_id | dept_name   |
+---------+-------------+
| 1       | Engineering |
| 2       | Science     |
| 3       | Law         |
+---------+-------------+
Output: 
+-------------+----------------+
| dept_name   | student_number |
+-------------+----------------+
| Engineering | 2              |
| Science     | 1              |
| Law         | 0              |
+-------------+----------------+

create table Student ( student_id int ,student_name varchar2(10),gender varchar2(1) ,dept_id int );
insert into Student  values ( 1,'Jack','M',1);
insert into Student  values ( 2,'Jane','F',1);
insert into Student  values ( 3,'Mark','M',2);
commit ;


create table Department ( dept_id int ,dept_name varchar2(15));
insert into Department values ( 1,'Engineering');
insert into Department values ( 2,'Science');
insert into Department values ( 3,'Law');
commit ;


| DEPT_NAME          | STUDENT_NUMBER |
| ------------------ | -------------- |
| Engineering        | 3              |
| Biotechnology      | 3              |
| East Asian Studies | 3              |
| Law                | 1              |
| Politics           | 1              |
| Architecture       | 0              |
| Art                | 0              |


| dept_name          | student_number |
| ------------------ | -------------- |
| Biotechnology      | 3              |
| East Asian Studies | 3              |
| Engineering        | 3              |
| Law                | 1              |
| Politics           | 1              |
| Architecture       | 0              |
| Art                | 0              |



Input: 
Sales table:
+------------+------------+-------------+
| sale_date  | fruit      | sold_num    |
+------------+------------+-------------+
| 2020-05-01 | apples     | 10          |
| 2020-05-01 | oranges    | 8           |
| 2020-05-02 | apples     | 15          |
| 2020-05-02 | oranges    | 15          |
| 2020-05-03 | apples     | 20          |
| 2020-05-03 | oranges    | 0           |
| 2020-05-04 | apples     | 15          |
| 2020-05-04 | oranges    | 16          |
+------------+------------+-------------+


create table Sales( sale_date date ,fruit  varchar2(15), sold_num );
insert into Sales  values ( to_date('2020-05-01','yyyy-mm-dd'), 'apples',10);
insert into Sales  values ( to_date('2020-05-01','yyyy-mm-dd'), 'oranges',8);
insert into Sales  values ( to_date('2020-05-02','yyyy-mm-dd'), 'apples',15);
insert into Sales  values ( to_date('2020-05-02','yyyy-mm-dd'), 'oranges',10);
insert into Sales  values ( to_date('2020-05-03','yyyy-mm-dd'), 'apples',20);
insert into Sales  values ( to_date('2020-05-03','yyyy-mm-dd'), 'oranges',0);
insert into Sales  values ( to_date('2020-05-04','yyyy-mm-dd'), 'apples',15);
insert into Sales  values ( to_date('2020-05-04','yyyy-mm-dd'), 'oranges',16);
commit ;


Input: 
Customers table:
+-------------+-----------+
| customer_id | name      |
+-------------+-----------+
| 1           | Winston   |
| 2           | Jonathan  |
| 3           | Annabelle |
| 4           | Marwan    |
| 5           | Khaled    |
+-------------+-----------+
Orders table:
+----------+------------+-------------+------+
| order_id | order_date | customer_id | cost |
+----------+------------+-------------+------+
| 1        | 2020-07-31 | 1           | 30   |
| 2        | 2020-07-30 | 2           | 40   |
| 3        | 2020-07-31 | 3           | 70   |
| 4        | 2020-07-29 | 4           | 100  |
| 5        | 2020-06-10 | 1           | 1010 |
| 6        | 2020-08-01 | 2           | 102  |
| 7        | 2020-08-01 | 3           | 111  |
| 8        | 2020-08-03 | 1           | 99   |
| 9        | 2020-08-07 | 2           | 32   |
| 10       | 2020-07-15 | 1           | 2    |
+----------+------------+-------------+------+




create table orders ( order_id int ,order_date date ,customer_id int ,cost int );
insert into orders  values ( 1,to_date('2020-07-31','yyyy-mm-dd'),1,30);
insert into orders  values ( 2,to_date('2020-07-30','yyyy-mm-dd'),2,40);
insert into orders  values ( 3,to_date('2020-07-31','yyyy-mm-dd'),3,70);
insert into orders  values ( 4,to_date('2020-07-29','yyyy-mm-dd'),4,100);
insert into orders  values ( 5,to_date('2020-06-10','yyyy-mm-dd'),1,1010);
insert into orders  values ( 6,to_date('2020-08-01','yyyy-mm-dd'),2,102);
insert into orders  values ( 7,to_date('2020-08-01','yyyy-mm-dd'),3,111);
insert into orders  values ( 8,to_date('2020-08-03','yyyy-mm-dd'),1,99);
insert into orders  values ( 9,to_date('2020-08-07','yyyy-mm-dd'),2,32);
insert into orders  values ( 10,to_date('2020-07-15','yyyy-mm-dd'),1,2);
commit ;

Customers table:
+-------------+-----------+
| customer_id | name      |
+-------------+-----------+
| 1           | Winston   |
| 2           | Jonathan  |
| 3           | Jonathan |
| 4           | Marwan    |
| 5           | Khaled    |
+-------------+-----------+

create table Customers  ( customer_id int ,name varchar2(15));
insert into Customers  values( 1,'Winston');
insert into Customers  values( 2,'Jonathan');
insert into Customers  values( 3,'Jonathan');
insert into Customers  values( 4,'Marwan');
insert into Customers  values( 5,'Khaled');


Candidate table:
+----+------+
| id | name |
+----+------+
| 1  | A    |
| 2  | B    |
| 3  | C    |
| 4  | D    |
| 5  | E    |
+----+------+
Vote table:
+----+-------------+
| id | candidateId |
+----+-------------+
| 1  | 2           |
| 2  | 4           |
| 3  | 3           |
| 4  | 2           |
| 5  | 5           |
+----+-------------+

create table candidate ( id int ,name varchar2(2));
insert into candidate values (1,'A');
insert into candidate values (2,'B');
insert into candidate values (3,'C');
insert into candidate values (4,'D');
insert into candidate values (5,'E');
commit ;

create table vote ( id int ,candidateId int );
insert into vote values (1,2);
insert into vote values (2,4);
insert into vote values (3,3);
insert into vote values (4,2);
insert into vote values (5,5);
commit ;



Scores table:
+-------------+--------+------------+--------------+
| player_name | gender | day        | score_points |
+-------------+--------+------------+--------------+
| Aron        | F      | 2020-01-01 | 17           |
| Alice       | F      | 2020-01-07 | 23           |
| Bajrang     | M      | 2020-01-07 | 7            |
| Khali       | M      | 2019-12-25 | 11           |
| Slaman      | M      | 2019-12-30 | 13           |
| Joe         | M      | 2019-12-31 | 3            |
| Jose        | M      | 2019-12-18 | 2            |
| Priya       | F      | 2019-12-31 | 23           |
| Priyanka    | F      | 2019-12-30 | 17           |
+-------------+--------+------------+--------------+


create table Scores (  player_name varchar2(10),gender varchar2(1),day date ,score_points int );
insert into Scores values ( 'Aron','F',to_date('2020-01-01','yyyy-mm-dd'),17);
insert into Scores values ( 'Alice','F',to_date('2020-01-07','yyyy-mm-dd'),23);
insert into Scores values ( 'Bajrang','M',to_date('2020-01-07','yyyy-mm-dd'),7);
insert into Scores values ( 'Khali','M',to_date('2019-12-25','yyyy-mm-dd'),11);
insert into Scores values ( 'Slaman','M',to_date('2019-12-30','yyyy-mm-dd'),13);
insert into Scores values ( 'Joe','M',to_date('2019-12-31','yyyy-mm-dd'),3);
insert into Scores values ( 'Jose','M',to_date('2019-12-18','yyyy-mm-dd'),2);
insert into Scores values ( 'Priya','F',to_date('2019-12-31','yyyy-mm-dd'),23);
insert into Scores values ( 'Priyanka','F',to_date('2019-12-30','yyyy-mm-dd'),17);



SurveyLog table:
+----+--------+-------------+-----------+-------+-----------+
| id | action | question_id | answer_id | q_num | timestamp |
+----+--------+-------------+-----------+-------+-----------+
| 5  | show   | 285         | null      | 1     | 123       |
| 5  | answer | 285         | 124124    | 1     | 124       |
| 5  | show   | 369         | null      | 2     | 125       |
| 5  | skip   | 369         | null      | 2     | 126       |
+----+--------+-------------+-----------+-------+-----------+


create table SurveyLog  ( id int ,action varchar2(10),question_id int ,answer_id int );

insert into SurveyLog  values ( 5,'show',285,null,1);
insert into SurveyLog  values ( 5,'answer',285,124124,1);
insert into SurveyLog  values ( 5,'show',369,null,2);
insert into SurveyLog  values ( 5,'skip',369,null,2);


Input: 
Follow table:
+----------+----------+
| followee | follower |
+----------+----------+
| Alice    | Bob      |
| Bob      | Cena     |
| Bob      | Donald   |
| Donald   | Edward   |
+----------+----------+


create table follow ( followee varchar2(10),follower varchar2(10));
insert into follow  values ( 'Alice','Bob');
insert into follow  values ( 'Bob','Cena');
insert into follow  values ( 'Bob','Donald');
insert into follow  values ( 'Donald','Edward');



Input: 
Actions table:
+---------+---------+-------------+--------+--------+
| user_id | post_id | action_date | action | extra  |
+---------+---------+-------------+--------+--------+
| 1       | 1       | 2019-07-01  | view   | null   |
| 1       | 1       | 2019-07-01  | like   | null   |
| 1       | 1       | 2019-07-01  | share  | null   |
| 2       | 2       | 2019-07-04  | view   | null   |
| 2       | 2       | 2019-07-04  | report | spam   |
| 3       | 4       | 2019-07-04  | view   | null   |
| 3       | 4       | 2019-07-04  | report | spam   |
| 4       | 3       | 2019-07-02  | view   | null   |
| 4       | 3       | 2019-07-02  | report | spam   |
| 5       | 2       | 2019-07-03  | view   | null   |
| 5       | 2       | 2019-07-03  | report | racism |
| 5       | 5       | 2019-07-03  | view   | null   |
| 5       | 5       | 2019-07-03  | report | racism |
+---------+---------+-------------+--------+--------+


create table Actions ( user_id int ,post_id int ,action_date date ,action varchar2(10),extra varchar2(10));
insert into Actions values ( 1,1,to_date('2019-07-01','yyyy-mm-dd'),'view',null);
insert into Actions values ( 1,1,to_date('2019-07-01','yyyy-mm-dd'),'like',null);
insert into Actions values ( 1,1,to_date('2019-07-01','yyyy-mm-dd'),'share',null);
insert into Actions values ( 2,2,to_date('2019-07-04','yyyy-mm-dd'),'view',null);
insert into Actions values ( 2,2,to_date('2019-07-04','yyyy-mm-dd'),'report','spam');
insert into Actions values ( 3,4,to_date('2019-07-04','yyyy-mm-dd'),'view',null);
insert into Actions values ( 3,4,to_date('2019-07-04','yyyy-mm-dd'),'report','spam');
insert into Actions values ( 4,3,to_date('2019-07-02','yyyy-mm-dd'),'view',null);
insert into Actions values ( 4,3,to_date('2019-07-02','yyyy-mm-dd'),'view',null);
insert into Actions values ( 4,3,to_date('2019-07-02','yyyy-mm-dd'),'report','spam');
insert into Actions values ( 5,2,to_date('2019-07-03','yyyy-mm-dd'),'view',null);
insert into Actions values ( 5,5,to_date('2019-07-03','yyyy-mm-dd'),'view',null);
insert into Actions values ( 5,5,to_date('2019-07-03','yyyy-mm-dd'),'report','racism');

+---------+-------------+
| post_id | remove_date |
+---------+-------------+
| 2       | 2019-07-20  |
| 3       | 2019-07-18  |
+---------+-------------+


create table Removals   ( post_id int ,remove_date date );
insert into Removals values ( 2,to_date('2019-07-20','yyyy-mm-dd'));
insert into Removals values ( 3,to_date('2019-07-18','yyyy-mm-dd'));

with d  as  ( select unique  *  from Actions) ,
 d1  as   ( select  avg( decode( remove_date ,null ,0 ,100) ) value  ,action_date   from d   a,removals b 
where  ( a.post_id = b.post_id (+)    )    and extra = 'spam'
group by action_date ) 
select  round(avg(value),2)    average_daily_percent  from d1



Matches table:
+------------+--------------+---------------+-------------+--------------+
| match_id   | host_team    | guest_team    | host_goals  | guest_goals  |
+------------+--------------+---------------+-------------+--------------+
| 1          | 10           | 20            | 3           | 0            |
| 2          | 30           | 10            | 2           | 2            |
| 3          | 10           | 50            | 5           | 1            |
| 4          | 20           | 30            | 1           | 0            |
| 5          | 50           | 30            | 1           | 0            |
+------------+--------------+---------------+-------------+--------------+


create table   Matches(match_id int ,host_team int ,guest_team int ,host_goals int ,guest_goals int );
insert into Matches  values ( 1,10,20,3,0);
insert into Matches  values ( 2,30,10,2,2);
insert into Matches  values ( 3,10,50,5,1);
insert into Matches  values ( 4,20,30,1,0);
insert into Matches  values ( 5,50,30,1,0);
commit ;

Teams table:
+-----------+--------------+
| team_id   | team_name    |
+-----------+--------------+
| 10        | Leetcode FC  |
| 20        | NewYork FC   |
| 30        | Atlanta FC   |
| 40        | Chicago FC   |
| 50        | Toronto FC   |


create table Teams ( team_id int ,team_name varchar2(30));
insert into Teams  values ( 10,'Leetcode FC');
insert into Teams  values ( 20,'NewYork FC');
insert into Teams  values ( 30,'Atlanta FC');
insert into Teams  values ( 40,'Chicago FC');
insert into Teams  values ( 50,'Toronto FC');
commit ;

with d  as  (select   host_team ,guest_team ,host_goals ,guest_goals  from Matches union all
select guest_team,host_team,guest_goals,host_goals  from Matches) 
select    team_id ,team_name ,sum(case when  host_goals > guest_goals then 3 when  host_goals <  guest_goals      then 0 when  host_goals= guest_goals then    1  else 0 end ) num_points    from d ,Teams  where 
Teams.team_id = d.host_team(+) 
group by team_id , team_name order by  3 desc,1   ;

Enrollments table:
+------------+-------------------+
| student_id | course_id | grade |
+------------+-----------+-------+
| 2          | 2         | 95    |
| 2          | 3         | 95    |
| 1          | 1         | 90    |
| 1          | 2         | 99    |
| 3          | 1         | 80    |
| 3          | 2         | 75    |
| 3          | 3         | 82    |
+------------+-----------+-------+


create table Enrollments ( student_id int ,course_id int ,grade int );
insert into Enrollments  values ( 2,2,95);
insert into Enrollments  values ( 2,3,95);
insert into Enrollments  values ( 1,1,90);
insert into Enrollments  values ( 1,2,99);
insert into Enrollments  values ( 3,1,80);
insert into Enrollments  values ( 3,2,75);
insert into Enrollments  values ( 3,3,82);
commit ;


Invoices table:
+------------+-------+---------+
| invoice_id | price | user_id |
+------------+-------+---------+
| 77         | 100   | 1       |
| 88         | 200   | 1       |
| 99         | 300   | 2       |
| 66         | 400   | 2       |
| 55         | 500   | 13      |
| 44         | 60    | 6       |
+------------+-------+---------+
Output: 


create table invoices( invoice_id int ,price int ,user_id int );
insert into invoices  values ( 77,100,1);
insert into invoices  values ( 88,200,1);
insert into invoices  values ( 99,300,2);
insert into invoices  values ( 66,400,2);
insert into invoices  values ( 55,500,13);
insert into invoices  values ( 44,60,6);
commit ;


Customers table:
+-------------+---------------+--------------------+
| customer_id | customer_name | email              |
+-------------+---------------+--------------------+
| 1           | Alice         | alice@leetcode.com |
| 2           | Bob           | bob@leetcode.com   |
| 13          | John          | john@leetcode.com  |
| 6           | Alex          | alex@leetcode.com  |
+-------------+---------------+--------------------+
Contacts table:
+-------------+--------------+--------------------+
| user_id     | contact_name | contact_email      |
+-------------+--------------+--------------------+
| 1           | Bob          | bob@leetcode.com   |
| 1           | John         | john@leetcode.com  |
| 1           | Jal          | jal@leetcode.com   |
| 2           | Omar         | omar@leetcode.com  |
| 2           | Meir         | meir@leetcode.com  |
| 6           | Alice        | alice@leetcode.com |
+-------------+--------------+--------------------+


create table Customers ( customer_id  int ,customer_name varchar2(10));
insert into Customers values  ( 1,'Alice');
insert into Customers values  ( 2,'Bob');
insert into Customers values  ( 13,'John');
insert into Customers values  ( 6,'Alex');
commit ;


create table contacts ( user_id int ,contact_name varchar2(10));
insert into contacts  values ( 1'Bob');
insert into contacts  values ( 1'John');
insert into contacts  values ( 1'Jal');
insert into contacts  values ( 2'Omar');
insert into contacts  values ( 2'Meir');
insert into contacts  values ( 6'Alice');
commit ;

with d  as  ( select   user_id ,count(*)   contacts_cnt   from contacts
group by user_id) ,d1   as 
( select   user_id ,count(*)   trusted_cnt from contacts  where contact_name  in ( select  customer_name   from customers) 
group by user_id) ,d2  as 
( select  d.user_id ,d.contacts_cnt ,d1.trusted_cnt  from d,d1 
where d.user_id = d1.user_id(+) ) 
select  invoice_id ,customer_name , price , nvl(contacts_cnt,0)   contacts_cnt  , nvl(trusted_cnt,0) trusted_contacts_cnt 
from Customers  a ,invoices b ,d2 
where a.CUSTOMER_ID = b.user_id(+)   and a.CUSTOMER_ID = d2.user_id(+)  order by 1 


Friends table:
+------+--------------+---------------+
| id   | name         | activity      |
+------+--------------+---------------+
| 1    | Jonathan D.  | Eating        |
| 2    | Jade W.      | Singing       |
| 3    | Victor J.    | Singing       |
| 4    | Elvis Q.     | Eating        |
| 5    | Daniel A.    | Eating        |
| 6    | Bob B.       | Horse Riding  |
+------+--------------+---------------+

create table Friends ( id int ,name varchar2(10),activity int );
insert into Friends  values ( 1,'Jonathan D.' ,'Eating');
insert into Friends  values ( 2,'Jade W.' ,'Singing');
insert into Friends  values ( 3,'Victor J.' ,'Singing');
insert into Friends  values ( 4,'Elvis Q.' ,'Eating');
insert into Friends  values ( 5,'Daniel A..' ,'Eating');
insert into Friends  values ( 6,'Bob B.' ,'Horse Riding');
commit ;


with d  as  ( select  count(*) c ,activity   from Friends  group by activity  order by 1 ) 
select  activity  from d   where   c not in ( select max(c)      from d) and c not in ( select min(c)  from d) ;


+------------+-----------+-----------+------------+
| article_id | author_id | viewer_id | view_date  |
+------------+-----------+-----------+------------+
| 1          | 3         | 5         | 2019-08-01 |
| 3          | 4         | 5         | 2019-08-01 |
| 1          | 3         | 6         | 2019-08-02 |
| 2          | 7         | 7         | 2019-08-01 |
| 2          | 7         | 6         | 2019-08-02 |
| 4          | 7         | 1         | 2019-07-22 |
| 3          | 4         | 4         | 2019-07-21 |
| 3          | 4         | 4         | 2019-07-21 |
+------------+-----------+-----------+------------+

create table Views  ( article_id int ,author_id int ,viewer_id int ,view_date date );
insert into Views  values ( 1,3,5,to_date('2019-08-01','yyyy-mm-dd'));
insert into Views  values ( 3,4,5,to_date('2019-08-01','yyyy-mm-dd'));
insert into Views  values ( 1,3,6,to_date('2019-08-02','yyyy-mm-dd'));
insert into Views  values ( 2,7,7,to_date('2019-08-01','yyyy-mm-dd'));
insert into Views  values ( 2,7,6,to_date('2019-08-02','yyyy-mm-dd'));
insert into Views  values ( 4,7,1,to_date('2019-07-22','yyyy-mm-dd'));
insert into Views  values ( 3,4,4,to_date('2019-07-21','yyyy-mm-dd'));
insert into Views  values ( 3,4,4,to_date('2019-07-21','yyyy-mm-dd'));
commit ;

Users table:
+---------+-------------------+------------+--------+ 
| user_id | item              | created_at | amount |  
+---------+-------------------+------------+--------+
| 5       | Smart Crock Pot   | 2021-09-18 | 698882 |
| 6       | Smart Lock        | 2021-09-14 | 11487  |
| 6       | Smart Thermostat  | 2021-09-10 | 674762 |
| 8       | Smart Light Strip | 2021-09-29 | 630773 |
| 4       | Smart Cat Feeder  | 2021-09-02 | 693545 |
| 4       | Smart Bed         | 2021-09-13 | 170249 |
+---------+-------------------+------------+--------+

create table users ( user_id int ,created_at date );
insert into users  values ( 5,to_date ('2021-09-18','yyyy-mm-dd'));
insert into users  values ( 6,to_date ('2021-09-14','yyyy-mm-dd'));
insert into users  values ( 6,to_date ('2021-09-10','yyyy-mm-dd'));
insert into users  values ( 8,to_date ('2021-09-29','yyyy-mm-dd'));
insert into users  values ( 4,to_date ('2021-09-02','yyyy-mm-dd'));
insert into users  values ( 4,to_date ('2021-09-13','yyyy-mm-dd'));
insert into users values (1,to_date ('2021-09-09','yyyy-mm-dd'));
insert into users values (1,to_date ('2021-09-09','yyyy-mm-dd'));

commit ;

 with d  as   (  select   a.*  ,row_number()  over  ( partition by  user_id  order by  created_at ) rk1   from users a) 
 --select  *  from d 
 select  unique a.user_id   from  d  a,d b   where   a.rk1 = b.rk1-1  and a.user_id = b.user_id
  and  b.created_at -  a.created_at  <=7;
  
  
  Buses table:
+--------+--------------+
| bus_id | arrival_time |
+--------+--------------+
| 1      | 2            |
| 2      | 4            |
| 3      | 7            |
+--------+--------------+
Passengers table:
+--------------+--------------+
| passenger_id | arrival_time |
+--------------+--------------+
| 11           | 1            |
| 12           | 5            |
| 13           | 6            |
| 14           | 7            |
+--------------+--------------+


create table Buses( bus_id int ,arrival_time int );
insert into Buses  values ( 1,2);
insert into Buses  values ( 2,4);
insert into Buses  values ( 3,7);
commit ;

create table Passengers ( passenger_id int ,arrival_time int );
insert into Passengers  values (11,1);
insert into Passengers  values (12,5);
insert into Passengers  values (13,6);
insert into Passengers  values (14,7);
commit ;

with d  as   ( select  a.passenger_id,a.arrival_time psnger_a,b.bus_id ,
b.arrival_time bus1_a
   from passengers a  ,buses  b   where  b.arrival_time >= a.arrival_time ) ,d1 as 
   --select  *  from d 
(select  dense_rank() over  ( partition by  passenger_id  order by   psnger_a, bus1_a)  rnk1   ,d.* 
from d )  ,d2  as ( 
select  passenger_id ,bus_id   from d1 where rnk1 =1) 
select  d3.bus_id , count(d2.passenger_id )   passengers_cnt  from d2,buses  d3   where  d3.BUS_ID  = d2.bus_id (+)   
group by d3.bus_id order by 1 ;

Delivery table:
+-------------+-------------+------------+-----------------------------+
| delivery_id | customer_id | order_date | customer_pref_delivery_date |
+-------------+-------------+------------+-----------------------------+
| 1           | 1           | 2019-08-01 | 2019-08-02                  |
| 2           | 2           | 2019-08-01 | 2019-08-01                  |
| 3           | 1           | 2019-08-01 | 2019-08-01                  |
| 4           | 3           | 2019-08-02 | 2019-08-13                  |
| 5           | 3           | 2019-08-02 | 2019-08-02                  |
| 6           | 2           | 2019-08-02 | 2019-08-02                  |
| 7           | 4           | 2019-08-03 | 2019-08-03                  |
| 8           | 1           | 2019-08-03 | 2019-08-03                  |
| 9           | 5           | 2019-08-04 | 2019-08-08                  |
| 10          | 2           | 2019-08-04 | 2019-08-18                  |
+-------------+-------------+------------+-----------------------------+


create table Delivery (  order_date date ,customer_pref_delivery_date date );
insert into Delivery values ( to_date( '2019-08-01','yyyy-mm-dd') ,to_date ( '2019-08-02','yyyy-mm-dd'));
insert into Delivery values ( to_date( '2019-08-01','yyyy-mm-dd') ,to_date ( '2019-08-01','yyyy-mm-dd'));
insert into Delivery values ( to_date( '2019-08-01','yyyy-mm-dd') ,to_date ( '2019-08-01','yyyy-mm-dd'));
insert into Delivery values ( to_date( '2019-08-02','yyyy-mm-dd') ,to_date ( '2019-08-13','yyyy-mm-dd'));
insert into Delivery values ( to_date( '2019-08-02','yyyy-mm-dd') ,to_date ( '2019-08-02','yyyy-mm-dd'));
insert into Delivery values ( to_date( '2019-08-02','yyyy-mm-dd') ,to_date ( '2019-08-02','yyyy-mm-dd'));
insert into Delivery values ( to_date( '2019-08-03','yyyy-mm-dd') ,to_date ( '2019-08-03','yyyy-mm-dd'));
insert into Delivery values ( to_date( '2019-08-03','yyyy-mm-dd') ,to_date ( '2019-08-03','yyyy-mm-dd'));
insert into Delivery values ( to_date( '2019-08-03','yyyy-mm-dd') ,to_date ( '2019-08-08','yyyy-mm-dd'));
insert into Delivery values ( to_date( '2019-08-04','yyyy-mm-dd') ,to_date ( '2019-08-18','yyyy-mm-dd'));
commit ;

Transactions table:
+----------------+------------+----------+--------+---------------------+
| transaction_id | account_id | type     | amount | day                 |
+----------------+------------+----------+--------+---------------------+
| 2              | 3          | Creditor | 107100 | 2021-06-02 11:38:14 |
| 4              | 4          | Creditor | 10400  | 2021-06-20 12:39:18 |
| 11             | 4          | Debtor   | 58800  | 2021-07-23 12:41:55 |
| 1              | 4          | Creditor | 49300  | 2021-05-03 16:11:04 |
| 15             | 3          | Debtor   | 75500  | 2021-05-23 14:40:20 |
| 10             | 3          | Creditor | 102100 | 2021-06-15 10:37:16 |
| 14             | 4          | Creditor | 56300  | 2021-07-21 12:12:25 |
| 19             | 4          | Debtor   | 101100 | 2021-05-09 15:21:49 |
| 8              | 3          | Creditor | 64900  | 2021-07-26 15:09:56 |
| 7              | 3          | Creditor | 90900  | 2021-06-14 11:23:07 |
+----------------+------------+----------+--------+---------------------+


create table Transactions( transaction_id int ,account_id int ,type varchar2(100),amount int ,day date);
insert into Transactions  values (2,3,'Creditor',107100,to_date('2021-06-02','yyyy-mm-dd'));
insert into Transactions  values (4,4,'Creditor',10400,to_date('2021-06-20','yyyy-mm-dd'));
insert into Transactions  values (11,4,'Debtor',58800,to_date('2021-07-23','yyyy-mm-dd'));
insert into Transactions  values (1,4,'Creditor',49300,to_date('2021-05-03','yyyy-mm-dd'));
insert into Transactions  values (15,3,'Debtor',75500,to_date('2021-05-23','yyyy-mm-dd'));
insert into Transactions  values (10,3,'Creditor',102100,to_date('2021-06-15','yyyy-mm-dd'));
insert into Transactions  values (14,4,'Creditor',56300,to_date('2021-07-21','yyyy-mm-dd'));
insert into Transactions  values (19,4,'Debtor',101100,to_date('2021-05-09','yyyy-mm-dd'));
insert into Transactions  values (8,3,'Creditor',64900,to_date('2021-07-26','yyyy-mm-dd'));
insert into Transactions  values (7,3,'Creditor',90900,to_date('2021-06-14','yyyy-mm-dd'));
commit ;

with d  as  (select  to_char( day,'yyyy-mm')  mth,sum(amount) sum1 ,account_id
from Transactions   where type = 'Creditor' 
group by to_char( day,'yyyy-mm'),account_id order by 3 ) ,
d1  as 
( select d.* ,dense_rank() over  (  partition by  account_id order by mth)  rnk1    from d ) ,d2  as 
( select  a.account_id ,a.sum1  sump, b.sum1  sumn ,a.mth mtho,b.mth mthn  from d1 a ,d1 b  where  a.rnk1  = b.rnk1- 1 
and a.account_id = b.account_id ) 
--select  d2.*, to_date(mthn,'yyyy-mm') -to_date(mtho,'yyyy-mm')   from d2
--where to_date(mthn,'yyyy-mm') -to_date(mtho,'yyyy-mm')   <= 31
select  unique  account_id   from d2  where ( sump >= 21000   and sumn >= 21000 )   and 
 to_date(mthn,'yyyy-mm') -to_date(mtho,'yyyy-mm')   <= 31 

+----------+----------+
| user1_id | user2_id |
+----------+----------+
| 1        | 2        |
| 1        | 3        |
| 2        | 3        |
| 1        | 4        |
| 2        | 4        |
| 1        | 5        |
| 2        | 5        |
| 1        | 7        |
| 3        | 7        |
| 1        | 6        |
| 3        | 6        |
| 2        | 6        |
+----------+----------+


create table Friendship  ( user1_id int ,user2_id int );
insert into Friendship values ( 1,2);
insert into Friendship values ( 1,3);
insert into Friendship values ( 2,3);
insert into Friendship values ( 1,4);
insert into Friendship values ( 2,2);
insert into Friendship values ( 1,5);
insert into Friendship values ( 2,2);
insert into Friendship values ( 1,7);
insert into Friendship values ( 3,7);
insert into Friendship values ( 1,6);
insert into Friendship values ( 3,6);
insert into Friendship values ( 2,6);
commit ;


Orders table:
+----------+------------+-------------+------------+
| order_id | order_date | customer_id | product_id |
+----------+------------+-------------+------------+
| 1        | 2020-07-31 | 1           | 1          |
| 2        | 2020-07-30 | 2           | 2          |
| 3        | 2020-08-29 | 3           | 3          |
| 4        | 2020-07-29 | 4           | 1          |
| 5        | 2020-06-10 | 1           | 2          |
| 6        | 2020-08-01 | 2           | 1          |
| 7        | 2020-08-01 | 3           | 3          |
| 8        | 2020-08-03 | 1           | 2          |
| 9        | 2020-08-07 | 2           | 3          |
| 10       | 2020-07-15 | 1           | 2          |
+----------+------------+-------------+------------+
Products table:


create table Orders ( customer_id int ,product_id int );
insert into Orders values(1,1);
insert into Orders values(2,2);
insert into Orders values(3,3);
insert into Orders values(4,1);
insert into Orders values(1,2);
insert into Orders values(2,1);
insert into Orders values(3,3);
insert into Orders values(1,2);
insert into Orders values(2,3);
insert into Orders values(1,2);
commit ;
drop table Orders;

Products table:
+------------+--------------+-------+
| product_id | product_name | price |
+------------+--------------+-------+
| 1          | keyboard     | 120   |
| 2          | mouse        | 80    |
| 3          | screen       | 600   |
| 4          | hard disk    | 450   |
+------------+--------------+-------+

create table Products( product_id int ,product_name varchar2(20) );
insert into Products  values ( 1,'keyboard');
insert into Products  values ( 2,'mouse');
insert into Products  values ( 3,'screen');
insert into Products  values ( 4,'hard disk');
commit ;

with d  as  (select  customer_id ,product_id ,count(*) c1 from Orders
group by customer_id,product_id order by 1 ),
d1  as 
( select  d.*  ,dense_rank()  over  ( partition by customer_id order by  c1 desc  ) rnk1   from d ) 
select  d1.customer_id ,d1.product_id,d2.product_name from  d1,Products  d2     where rnk1  = 1     and  d1.product_id  = d2.product_id     order by 1 ,2 




Transactions table:
+------------+------------+------------+----------+---------------+
| trans_id   | paid_by    | paid_to    | amount   | transacted_on |
+------------+------------+------------+----------+---------------+
| 1          | 1          | 3          | 400      | 2020-08-01    |
| 2          | 3          | 2          | 500      | 2020-08-02    |
| 3          | 2          | 1          | 200      | 2020-08-03    |
+------------+------------+------------+----------+---------------+
drop table Transactions;
create table Transactions ( paid_by int ,paid_to int ,amount int );
insert into Transactions  values ( 1,3,400);
insert into Transactions  values ( 3,2,500);
insert into Transactions  values ( 2,1,200);
commit ;


Users table:
+------------+--------------+-------------+
| user_id    | user_name    | credit      |
+------------+--------------+-------------+
| 1          | Moustafa     | 100         |
| 2          | Jonathan     | 200         |
| 3          | Winston      | 10000       |
| 4          | Luis         | 800         | 
+------------+--------------+-------------+

drop table Users;
create table Users( user_id int ,user_name varchar2(15),credit int );
insert into Users  values ( 1,'Moustafa',100);
insert into Users  values ( 2,'Jonathan',200);
insert into Users  values ( 3,'Winston',10000);
insert into Users  values ( 4,'Luis',800);
commit ;

with d  as   (select   paid_by user_id  ,-amount   amt  from Transactions  union all 
select  paid_to ,amount  from Transactions union all 
select      user_id ,credit   from users ) ,d1  as 
( select  user_id ,sum(amt ) amt1    from d group by    user_id ) 
select    d2.user_id ,d2.user_name ,d1.amt1 credit  ,case when amt1<0 then 'Yes'  else 'No'  end credit_limit_breached      
   from d1,users  d2 where  d2.user_id= d1.user_id(+) 
order by 1



Experiments table:
+---------------+----------+-----------------+
| experiment_id | platform | experiment_name |
+---------------+----------+-----------------+
| 4             | IOS      | Programming     |
| 13            | IOS      | Sports          |
| 14            | Android  | Reading         |
| 8             | Web      | Reading         |
| 12            | Web      | Reading         |
| 18            | Web      | Programming     |
+---------------+----------+-----------------+

drop table Experiments;
create table Experiments ( platform varchar2(20) ,experiment_name varchar2(25));
insert into Experiments values ( 'IOS','Programming');
insert into Experiments values ( 'IOS','Sports');
insert into Experiments values ( 'Android','Reading');
insert into Experiments values ( 'Web','Reading');
insert into Experiments values ( 'Web','Reading');
insert into Experiments values ( 'Web','Programming');

 with d  as   ( select  platform ,experiment_name ,count(*)  ct1  from  Experiments
group by platform ,experiment_name)  ,d2  as 
(select  unique  platform  ,d1.experiment_name  from  Experiments ,(  select  'Reading'  experiment_name from dual 
union all  select  'Sports'  from dual  union all 
select  'Programming'  from dual   )  d1  ) 
select   d2.platform,d2.experiment_name,nvl(d.ct1,0)   num_experiments from d2  ,d  where  d2.platform = d.platform(+)   
and  d2.experiment_name = d.experiment_name(+)  order by 1,3 desc ,2 desc 


Orders table:
+----------+-------------+------------+
| order_id | customer_id | order_type |
+----------+-------------+------------+
| 1        | 1           | 0          |
| 2        | 1           | 0          |
| 11       | 2           | 0          |
| 12       | 2           | 1          |
| 21       | 3           | 1          |
| 22       | 3           | 0          |
| 31       | 4           | 1          |
| 32       | 4           | 1          |
+----------+-------------+------------+

drop table Orders ;
create table Orders ( order_id int ,customer_id int ,order_type int );
insert into Orders  values ( 1,1,0);
insert into Orders  values ( 2,1,0);
insert into Orders  values ( 11,2,0);
insert into Orders  values ( 12,2,1);
insert into Orders  values ( 21,3,1);
insert into Orders  values ( 22,3,0);
insert into Orders  values ( 31,4,1);
insert into Orders  values ( 32,4,1);
commit ;


with d  as  ( select  order_id,customer_id ,order_type ,dense_rank () over ( partition by  customer_id 
order by order_type)    rnk1  from Orders) 
select order_id,customer_id ,order_type  from d  where rnk1 = 1 order by  2 desc ,1  ;

Genders table:
+---------+--------+
| user_id | gender |
+---------+--------+
| 4       | male   |
| 7       | female |
| 2       | other  |
| 5       | male   |
| 3       | female |
| 8       | male   |
| 6       | other  |
| 1       | other  |
| 9       | female |

create table Genders ( user_id int ,gender varchar2(10));
insert into Genders  values (4,'male');
insert into Genders  values (7,'female');
insert into Genders  values (2,'other');
insert into Genders  values (5,'male');
insert into Genders  values (3,'female');
insert into Genders  values (8,'male');
insert into Genders  values (6,'other');
insert into Genders  values (1,'other');
insert into Genders  values (9,'female');
commit ;

4	male
7	female
2	other
5	male
3	female
8	male
6	other
1	other
9	female


with d  as  (select     a.* ,dense_rank()  over  ( partition by gender  order by  user_id )  gd1,case when  gender = 'male' then 'C'  
when   gender = 'female'  then  'A' 
when  gender = 'other' then   'B'    end gd2 from  Genders a)
select  user_id,gender  from d order by  gd1 ,gd2
;


+------------+------------+---------------------+---------------------+
| account_id | ip_address | login               | logout              |
+------------+------------+---------------------+---------------------+
| 1          | 1          | 2021-02-01 09:00:00 | 2021-02-01 09:30:00 |
| 1          | 2          | 2021-02-01 08:00:00 | 2021-02-01 11:30:00 |
| 2          | 6          | 2021-02-01 20:30:00 | 2021-02-01 22:00:00 |
| 2          | 7          | 2021-02-02 20:30:00 | 2021-02-02 22:00:00 |
| 3          | 9          | 2021-02-01 16:00:00 | 2021-02-01 16:59:59 |
| 3          | 13         | 2021-02-01 17:00:00 | 2021-02-01 17:59:59 |
| 4          | 10         | 2021-02-01 16:00:00 | 2021-02-01 17:00:00 |
| 4          | 11         | 2021-02-01 17:00:00 | 2021-02-01 17:59:59 |
+------------+------------+---------------------+---------------------+
TO_DATE('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss')

create table LogInfo ( account_id int ,ip_address int ,login date  logout date );
insert into  LogInfo values( 1,1,to_date('2021-02-01 09:00:00','yyyy-mm-dd hh:mm:ss') ,to_date('2021-02-01 09:30:00','yyyy-mm-dd hh:mm:ss'));
insert into  LogInfo values( 1,2,to_date('2021-02-01 08:00:00','yyyy-mm-dd hh:mm:ss') ,to_date('2021-02-01 11:30:00','yyyy-mm-dd hh:mm:ss'));
insert into  LogInfo values( 2,6,to_date('2021-02-01 09:00:00','yyyy-mm-dd hh:mm:ss') ,to_date('2021-02-01 09:30:00','yyyy-mm-dd hh:mm:ss'));
insert into  LogInfo values( 1,1,to_date('2021-02-01 09:00:00','yyyy-mm-dd hh:mm:ss') ,to_date('2021-02-01 09:30:00','yyyy-mm-dd hh:mm:ss'));
insert into  LogInfo values( 1,1,to_date('2021-02-01 09:00:00','yyyy-mm-dd hh:mm:ss') ,to_date('2021-02-01 09:30:00','yyyy-mm-dd hh:mm:ss'));
insert into  LogInfo values( 1,1,to_date('2021-02-01 09:00:00','yyyy-mm-dd hh:mm:ss') ,to_date('2021-02-01 09:30:00','yyyy-mm-dd hh:mm:ss'));
insert into  LogInfo values( 1,1,to_date('2021-02-01 09:00:00','yyyy-mm-dd hh:mm:ss') ,to_date('2021-02-01 09:30:00','yyyy-mm-dd hh:mm:ss'));
insert into  LogInfo values( 1,1,to_date('2021-02-01 09:00:00','yyyy-mm-dd hh:mm:ss') ,to_date('2021-02-01 09:30:00','yyyy-mm-dd hh:mm:ss'));
insert into  LogInfo values( 1,1,to_date('2021-02-01 09:00:00','yyyy-mm-dd hh:mm:ss') ,to_date('2021-02-01 09:30:00','yyyy-mm-dd hh:mm:ss'));
----------------

Contests table:
+------------+------------+--------------+--------------+
| contest_id | gold_medal | silver_medal | bronze_medal |
+------------+------------+--------------+--------------+
| 190        | 1          | 5            | 2            |
| 191        | 2          | 3            | 5            |
| 192        | 5          | 2            | 3            |
| 193        | 1          | 3            | 5            |
| 194        | 4          | 5            | 2            |
| 195        | 4          | 2            | 1            |
| 196        | 1          | 5            | 2            |
+------------+------------+--------------+--------------+

create table Contests( contest_id int ,gold_medal int ,silver_medal int ,bronze_medal int );
insert into Contests values ( 190,1,5,2);
insert into Contests values ( 191,2,3,5);
insert into Contests values ( 192,5,2,3);
insert into Contests values ( 193,1,3,5);
insert into Contests values ( 194,4,5,2);
insert into Contests values ( 195,4,2,1);
insert into Contests values ( 196,1,5,2);
commit ;


+---------+--------------------+-------+
| user_id | mail               | name  |
+---------+--------------------+-------+
| 1       | sarah@leetcode.com | Sarah |
| 2       | bob@leetcode.com   | Bob   |
| 3       | alice@leetcode.com | Alice |
| 4       | hercy@leetcode.com | Hercy |
| 5       | quarz@leetcode.com | Quarz |
+---------+--------------------+-------+


drop table Users;
create table Users  ( user_id int ,mail varchar2(5) ,name varchar2(10));
insert into Users  values ( 1,'Sarh','Sarh');
insert into Users  values ( 2,'bob','Bob');
insert into Users  values ( 3,'alic','Alic');
insert into Users  values ( 4,'her','Hercy');
insert into Users  values ( 5,'qua','Quarz');
commit ;

with  d  as   ( select  contest_id ,gold_medal    from Contests  union all 
select  contest_id ,silver_medal    from Contests union all 
select  contest_id ,bronze_medal    from Contests) ,d1  as 
(select  d.* ,dense_rank()  over  (  partition by  gold_medal      
order by contest_id )  rnk1   from  d) ,d2  as 
(select  d1.* ,lead( contest_id ,1) over ( partition by  gold_medal  order by   rnk1)  d1   from d1  ) 
select  *  from d2
,d3  as (
select  gold_medal   from d2    where d1 - contest_id = 1  group by gold_medal having count(*) >=2 
union 
select  gold_medal   from Contests   group by gold_medal  having count(*) >=3) 
select  name,mail   from d3,users  where d3.gold_medal  = users.user_id ;

Flights table:
+-------------------+-----------------+---------------+
| departure_airport | arrival_airport | flights_count |
+-------------------+-----------------+---------------+
| 1                 | 2               | 4             |
| 2                 | 1               | 5             |
| 2                 | 4               | 5             |
+-------------------+-----------------+---------------+


create table Flights ( departure_airport int ,arrival_airport int ,flights_count int );
insert into Flights values ( 1,2,4);
insert into Flights values ( 2,1,5);
insert into Flights values ( 2,4,5);



+------------+------------+---------------------+---------------------+
| account_id | ip_address | login               | logout              |
+------------+------------+---------------------+---------------------+
| 1          | 1          | 2021-02-01 09:00:00 | 2021-02-01 09:30:00 |
| 1          | 2          | 2021-02-01 08:00:00 | 2021-02-01 11:30:00 |
| 2          | 6          | 2021-02-01 20:30:00 | 2021-02-01 22:00:00 |
| 2          | 7          | 2021-02-02 20:30:00 | 2021-02-02 22:00:00 |
| 3          | 9          | 2021-02-01 16:00:00 | 2021-02-01 16:59:59 |
| 3          | 13         | 2021-02-01 17:00:00 | 2021-02-01 17:59:59 |
| 4          | 10         | 2021-02-01 16:00:00 | 2021-02-01 17:00:00 |
| 4          | 11         | 2021-02-01 17:00:00 | 2021-02-01 17:59:59 |
+------------+------------+---------------------+---------------------+


Matches table:
+--------------+--------------+-----------------+-----------------+
| home_team_id | away_team_id | home_team_goals | away_team_goals |
+--------------+--------------+-----------------+-----------------+
| 1            | 4            | 0               | 1               |
| 1            | 6            | 3               | 3               |
| 4            | 1            | 5               | 2               |
| 6            | 1            | 0               | 0               |
+--------------+--------------+-----------------+-----------------+

create table Matches( home_team_id int ,away_team_id int ,home_team_goals ,away_team_goals );
insert into  Matches  values ( 1,4,0,1);
insert into  Matches  values ( 1,6,3,3);
insert into  Matches  values ( 4,1,5,2);
insert into  Matches  values ( 6,1,0,0);
commit ;



Teams table:
+---------+-----------+
| team_id | team_name |
+---------+-----------+
| 1       | Ajax      |
| 4       | Dortmund  |
| 6       | Arsenal   |
+---------+-----------+


create table Teams ( team_id int ,team_name varchar2(120));
insert into Teams  values ( 1,'Ajax');
insert into Teams  values ( 4,'Dortmund');
insert into Teams  values ( 6,'Arsenal');
commit ;

with d  as ( 
select  home_team_id ,away_team_goals   from  Matches   union all 
select  away_team_id ,home_team_goals  from   Matches), 
d1  as (
select   home_team_id ,sum( away_team_goals)  off_goals   from d 
group by home_team_id) ,d2  as (
select  home_team_id,home_team_goals   from Matches  union all 
select away_team_id,away_team_goals  from Matches) ,d4  as (
select  home_team_id  ,sum( home_team_goals)  on_goals , count(*)  total_games_played  from  d2
group by home_team_id) ,d5  as 
(select  home_team_id,home_team_goals,away_team_goals  from matches   union all 
select away_team_id,away_team_goals,home_team_goals   from matches) ,d6  as  (
select home_team_id ,sum( case when   home_team_goals >   away_team_goals   then 3   when 
home_team_goals =    away_team_goals then 1 else 0 end )   points  from d5 group by home_team_id) 
select  team_name ,total_games_played  matches_played,points , on_goals goal_for ,off_goals goal_against ,
on_goals-off_goals goal_diff     from  teams ,d1,d4,d6 
where teams.team_id = d1.home_team_id  and 
teams.team_id = d4.home_team_id  and 
teams.team_id = d6.home_team_id  order by 3  desc ,6 desc ,1;


CoffeeShop table:
+----+------------------+
| id | drink            |
+----+------------------+
| 9  | Mezcal Margarita |
| 6  | null             |
| 7  | null             |
| 3  | Americano        |
| 1  | Daiquiri         |
| 2  | null             |
+----+------------------+

drop table CoffeeShop;
create table CoffeeShop ( id int ,drink varchar2(100));
insert into CoffeeShop  values ( 9,'Mezcal Margarita');
insert into CoffeeShop  values ( 6,null);
insert into CoffeeShop  values ( 7,null);
insert into CoffeeShop  values ( 3,'Americano');
insert into CoffeeShop  values ( 1,'Daiquiri');
insert into CoffeeShop  values ( 2,null);
commit ;

with d  as  ( select  a.* ,rownum rn   from CoffeeShop a ) ,d1  as 
( select  drink ,rn ,( select  max( rn )  from d    where  drink is not null   and 
d.rn < d1.rn )   rn2  from d d1 ) 
select  nvl(drink ,(select  drink  from d  where rn = rn2) ) drink   from d1


Boxes table:
+--------+----------+-------------+--------------+
| box_id | chest_id | apple_count | orange_count |
+--------+----------+-------------+--------------+
| 2      | null     | 6           | 15           |
| 18     | 14       | 4           | 15           |
| 19     | 3        | 8           | 4            |
| 12     | 2        | 19          | 20           |
| 20     | 6        | 12          | 9            |
| 8      | 6        | 9           | 9            |
| 3      | 14       | 16          | 7            |
+--------+----------+-------------+--------------+

create table Boxes( box_id int ,chest_id int ,apple_count int ,orange_count int );
insert into Boxes values ( 2,null,6,15);
insert into Boxes values ( 18,14,4,15);
insert into Boxes values ( 19,3,8,4);
insert into Boxes values ( 12,2,19,20);
insert into Boxes values ( 20,6,12,9);
insert into Boxes values ( 8,6,9,9);
insert into Boxes values ( 8,6,9,9);
insert into Boxes values ( 3,14,16,7);
commit ;

Chests table:
+----------+-------------+--------------+
| chest_id | apple_count | orange_count |
+----------+-------------+--------------+
| 6        | 5           | 6            |
| 14       | 20          | 10           |
| 2        | 8           | 8            |
| 3        | 19          | 4            |
| 16       | 19          | 19           |
+----------+-------------+--------------+


create table chests ( chest_id int ,apple_count int ,orange_count);
insert into chests  values ( 6,5,6);
insert into chests  values ( 14,20,10);
insert into chests  values ( 2,8,8);
insert into chests  values ( 3,19,4);
insert into chests  values ( 16,19,19);
commit ;


select  sum( nvl(a.apple_count,0)+ nvl(b.APPLE_COUNT,0) )  apple_count,
sum( nvl(a.orange_count,0)  + nvl(b.orange_count,0))   orange_count 
from boxes a  ,chests  b 
where   a.chest_id = b.chest_id (+)
Data table:
+-----------+------------+
| first_col | second_col |
+-----------+------------+
| 4         | 2          |
| 2         | 3          |
| 3         | 1          |
| 1         | 4          |
+-----------+------------+

create table Data ( first_col int ,second_col int );
insert into Data values ( 4,2);
insert into Data values ( 2,3);
insert into Data values ( 3,1);
insert into Data values ( 1,4);
commit ;

with d  as  (  select  first_col    from data  order by  1 )  , d1  as 
( select  first_col,rownum rn     from  d) ,d3  
as (  select  second_col    from data  order by  1  desc ) ,d4  as 
( select  second_col,rownum rn     from  d3) 
select  d1.first_col ,d4.second_col second_col  from d1,d4 where  d1.rn = d4 .rn(+) ;


Transactions table:
+----------------+--------------------+--------+
| transaction_id | day                | amount |
+----------------+--------------------+--------+
| 8              | 2021-4-3 15:57:28  | 57     |
| 9              | 2021-4-28 08:47:25 | 21     |
| 1              | 2021-4-29 13:28:30 | 58     |
| 5              | 2021-4-28 16:39:59 | 40     |
| 6              | 2021-4-29 23:39:28 | 58     |
+----------------+--------------------+--------+

Transactions table:
+------------+------------+----------+--------+
| account_id | day        | type     | amount |
+------------+------------+----------+--------+
| 1          | 2021-11-07 | Deposit  | 2000   |
| 1          | 2021-11-09 | Withdraw | 1000   |
| 1          | 2021-11-11 | Deposit  | 3000   |
| 2          | 2021-12-07 | Deposit  | 7000   |
| 2          | 2021-12-12 | Withdraw | 7000   |
+------------+------------+----------+--------+
drop table Transactions;
create table Transactions( account_id int ,day varchar2(10) ,type varchar2(15),amount int );
insert into Transactions  values ( 1,'20211107','Deposit',2000);
insert into Transactions  values ( 1,'20211109','Withdraw',1000);
insert into Transactions  values ( 1,'20211111','Deposit',3000);
insert into Transactions  values ( 2,'20211207','Deposit',7000);
insert into Transactions  values ( 2,'20211212','Withdraw',7000);
commit ;

+-------------+------------+------------+
| business_id | event_type | occurences |
+-------------+------------+------------+
| 1           | reviews    | 7          |
| 3           | reviews    | 3          |
| 1           | ads        | 11         |
| 2           | ads        | 7          |
| 3           | ads        | 6          |
| 1           | page views | 3          |
| 2           | page views | 12         |
+-------------+------------+------------+



Events 
drop table Events;
create table Events (business_id int ,event_type varchar2(20) ,occurences int );
insert into Events values ( 1,'reviews',7);
insert into Events values ( 3,'reviews',3);
insert into Events values ( 1,'ads',11);
insert into Events values ( 2,'ads',7);
insert into Events values ( 3,'ads',6);
insert into Events values ( 1,'page views',3);
insert into Events values ( 2,'page views',12);
commit ;

select  *  from events ;

with d  as   ( select   a.* ,avg( occurences)  over ( partition by  event_type )  arvgt,
avg( occurences)  over ( partition by  business_id,event_type ) avgi
--count( unique event_type) over ( partition by business_id)  cnt 
from events a order by 1 ) 
select     business_id  from d   where      avgi > arvgt 
group by business_id
 having count(*) > 1

+------------+---------------+------+
| student_id | department_id | mark |
+------------+---------------+------+
| 2          | 2             | 650  |
| 8          | 2             | 650  |
| 7          | 1             | 920  |
| 1          | 1             | 610  |
| 3          | 1             | 530  |
+------------+---------------+------+

drop table Students;
create table Students  ( student_id int ,department_id int ,mark int );
insert into Students values ( 2,2,650);
insert into Students values ( 8,2,650);
insert into Students values ( 7,1,920);
insert into Students values ( 1,1,610);
insert into Students values ( 3,1,530);
commit ;

Customers table:
+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
| 1           | Alice         |
| 4           | Bob           |
| 5           | Charlie       |
+-------------+---------------+
drop table customers ;
create table customers ( customer_id int ,customer_name varchar2(10));
insert into customers  values ( 1,'Alice');
insert into customers  values ( 4,'Bob');
insert into customers  values ( 5,'Charlie');
commit ;

with d as  (select  level   "ids" from dual connect  by level <= ( select max( customer_id )     from customers)  minus
select customer_id  from customers order by 1) 
select   *  from d  where  "ids" >  ( select min(customer_id)   from customers) ;

Books table:
+---------+--------------------+----------------+
| book_id | name               | available_from |
+---------+--------------------+----------------+
| 1       | "Kalila And Demna" | 2010-01-01     |
| 2       | "28 Letters"       | 2012-05-12     |
| 3       | "The Hobbit"       | 2019-06-10     |
| 4       | "13 Reasons Why"   | 2019-06-01     |
| 5       | "The Hunger Games" | 2008-09-21     |
+---------+--------------------+----------------+
Orders table:
+----------+---------+----------+---------------+
| order_id | book_id | quantity | dispatch_date |
+----------+---------+----------+---------------+
| 1        | 1       | 2        | 2018-07-26    |
| 2        | 1       | 1        | 2018-11-05    |
| 3        | 3       | 8        | 2019-06-11    |
| 4        | 4       | 6        | 2019-06-05    |
| 5        | 4       | 5        | 2019-06-20    |
| 6        | 5       | 9        | 2009-02-02    |
| 7        | 5       | 8        | 2010-04-13    |
+----------+---------+----------+---------------+

drop table Books ;
create table Books ( book_id int ,name varchar2(100),available_from  date );
insert into Books  values ( 1,"Kalila And Demna",to_date('2010-01-01','yyyy-mm-dd'));
insert into Books  values ( 2,"28 Letters",to_date('2012-05-12','yyyy-mm-dd'));
insert into Books  values ( 3,"The Hobbit",to_date('2019-06-10','yyyy-mm-dd'));
insert into Books  values ( 1,"13 Reasons Why",to_date('2019-06-01','yyyy-mm-dd'));
insert into Books  values ( 1,"The Hunger Games",to_date('2008-09-21','yyyy-mm-dd'));
commit ;


+---------+----------+---------------+
| order_id | book_id | quantity | dispatch_date |
+----------+---------+----------+---------------+
| 1        | 1       | 2        | 2018-07-26    |
| 2        | 1       | 1        | 2018-11-05    |
| 3        | 3       | 8        | 2019-06-11    |
| 4        | 4       | 6        | 2019-06-05    |
| 5        | 4       | 5        | 2019-06-20    |
| 6        | 5       | 9        | 2009-02-02    |
| 7        | 5       | 8        | 2010-04-13    |
+----------+---------+----------+---------------+

drop table Orders;
create table Orders   ( book_id int ,quantity int,dispatch_date date  );
insert into Orders  values ( 1,2,to_date ( '2018-07-26','yyyy-mm-dd')  );
insert into Orders  values ( 1,1,to_date ( '2018-11-05','yyyy-mm-dd'));
insert into Orders  values ( 3,8,to_date ( '2019-06-11','yyyy-mm-dd'));
insert into Orders  values ( 4,6,to_date ( '2019-06-05','yyyy-mm-dd'));
insert into Orders  values ( 4,5,to_date ( '019-06-20','yyyy-mm-dd'));
insert into Orders  values ( 5,9,to_date('2009-02-02','yyyy-mm-dd'));
insert into Orders  values ( 5,8,to_date('2010-04-13','yyyy-mm-dd'));
commit ;

with d  as  ( select  book_id ,sum( quantity)  sum1  from orders 
where dispatch_date <=to_date('2019-06-23','yyyy-mm-dd') -365
group by book_id) 
select  books.book_id ,books.name   from  books ,d   where    BOOKS.BOOK_ID = d.BOOK_ID(+) 
and available_from <= to_date('2019-06-23','yyyy-mm-dd') -30  and  nvl(sum1,0) <= 10
order by  book_id 

TeamPoints table:
+---------+-------------+--------+
| team_id | name        | points |
+---------+-------------+--------+
| 3       | Algeria     | 1431   |
| 1       | Senegal     | 2132   |
| 2       | New Zealand | 1402   |
| 4       | Croatia     | 1817   |
+---------+-------------+--------+
PointsChange table:
+---------+---------------+
| team_id | points_change |
+---------+---------------+
| 3       | 399           |
| 2       | 0             |
| 4       | 13            |
| 1       | -22           |
+---------+---------------+


create table TeamPoints ( team_id int ,anme varchar2(100) ,points int );
insert into TeamPoints values ( 3,'Algeria',1431);
insert into TeamPoints values ( 1,'Senegal',2132);
insert into TeamPoints values ( 2,'New Zealand',1402);
insert into TeamPoints values ( 4,'Croatia',1817);
commit ;

create table PointsChange( team_id int ,points_change int );
insert into PointsChange values ( 3,399);
insert into PointsChange values ( 2,0);
insert into PointsChange values ( 4,13);
insert into PointsChange values ( 1,-22);
commit ;

with d  as   ( select     a.* ,dense_rank()   over (order by   points desc )   d1  from    TeamPoints  a ) 
,d1   as   (    select  sum(points)  points , team_id  from   ( select  team_id ,points   from TeamPoints  union all 
select  *  from PointsChange ) group by  team_id  ) ,d2   as 
( select    dense_rank () over  ( order by   d1.points desc ,anme ) d2  ,d.d1,anme ,d.team_id   from d1 ,d  
where  d.team_id = d1.team_id  ) 
select  team_id ,anme ,d1-d2 rank_diff  from d2 order by 1 ;

Tasks table:
+---------+-------------+-------------+
| task_id | assignee_id | submit_date |
+---------+-------------+-------------+
| 1       | 1           | 2022-06-13  |
| 2       | 6           | 2022-06-14  |
| 3       | 6           | 2022-06-15  |
| 4       | 3           | 2022-06-18  |
| 5       | 5           | 2022-06-19  |
| 6       | 7           | 2022-06-19  |
+---------+-------------+-------------+


create table Tasks (  task_id int ,assignee_id int ,submit_date date );
insert into Tasks  values (1,1,to_date('2022-06-13','yyyy-mm-dd'));
insert into Tasks  values (2,6,to_date('2022-06-13','yyyy-mm-dd'));
insert into Tasks  values (3,6,to_date('2022-06-13','yyyy-mm-dd'));
insert into Tasks  values (4,3,to_date('2022-06-13','yyyy-mm-dd'));
insert into Tasks  values (5,5,to_date('2022-06-13','yyyy-mm-dd'));
insert into Tasks  values (6,7,to_date('2022-06-13','yyyy-mm-dd'));
commit ;

+------+-----------+---------+---------+---------+
| year | Wimbledon | Fr_open | US_open | Au_open |
+------+-----------+---------+---------+---------+
| 2018 | 1         | 1       | 1       | 1       |
| 2019 | 1         | 1       | 2       | 2       |
| 2020 | 2         | 1       | 2       | 2       |
+------+-----------+---------+---------+---------+


create table Championships  (  year int ,Wimbledon int ,Fr_open int ,US_open int ,Au_open int );
insert into Championships  values ( 2018,1,1,1,1);
insert into Championships  values ( 2019,1,1,2,2);
insert into Championships  values ( 2018,2,1,2,2);
commit ;

Players table:
+-----------+-------------+
| player_id | player_name |
+-----------+-------------+
| 1         | Nadal       |
| 2         | Federer     |
| 3         | Novak       |
+-----------+-------------+


create table Players ( player_id int ,player_name varchar2(20));
insert into Players  values ( 1,'Nedal');
insert into Players  values ( 2,'Federer');
insert into Players  values ( 3,'Novak');
commit ;


with d  as  ( select  wimbledon player  from Championships union all 
select    fr_open  from Championships  union all 
select  us_open  from Championships  union all 
select  au_open  from Championships) 
select   a.player  player_id   ,player_name ,count(*)  grand_slams_count 
from d a ,players b 
where a.player  = b.player_id 
group by a.player,player_name

Transactions table:
+----------------+--------------------+--------+
| transaction_id | day                | amount |
+----------------+--------------------+--------+
| 8              | 2021-4-3 15:57:28  | 57     |
| 9              | 2021-4-28 08:47:25 | 21     |
| 1              | 2021-4-29 13:28:30 | 58     |
| 5              | 2021-4-28 16:39:59 | 40     |
| 6              | 2021-4-29 23:39:28 | 58     |
+----------------+--------------------+--------+



drop table Transactions;
create table Transactions (  transaction_id int ,day  date,amount  int );
insert into Transactions values ( 8,to_date('2021-4-3 15:57:28','yyyy-mm-dd  hh24:mi:ss') ,57);
insert into Transactions values ( 8,to_date('2021-4-28 08:47:25','yyyy-mm-dd hh24:mi:ss') ,21);
insert into Transactions values ( 8,to_date('2021-4-29 13:28:30','yyyy-mm-dd hh24:mi:ss') ,58);
insert into Transactions values ( 8,to_date('2021-4-28 16:39:59','yyyy-mm-dd  hh24:mi:ss') ,40);
insert into Transactions values ( 8,to_date('2021-4-29 23:39:28','yyyy-mm-dd hh24:mi:ss') ,58);
commit ;


drop table Transactions;
create table Transactions (  transaction_id int ,day  date,amount int  );
insert into Transactions values ( 8,to_date('2021-4-3 15:57:28','yyyy-mm-dd   hh24:mi:ss') ,57);
insert into Transactions values ( 8,to_date('2021-4-3 15:57:28','yyyy-mm-dd  hh24:mi:ss') ,57);
insert into Transactions values ( 8,to_date('2021-4-3 15:57:28','yyyy-mm-dd hh24:mi:ss') ,57);
insert into Transactions values ( 8,to_date('2021-4-3 15:57:28','yyyy-mm-dd hh24:mi:ss') ,57);
insert into Transactions values ( 8,to_date('2021-4-3 15:57:28','yyyy-mm-dd  hh24:mi:ss') ,57);
commit ;


Rides table:
+---------+-----------+--------------+
| ride_id | driver_id | passenger_id |
+---------+-----------+--------------+
| 1       | 7         | 1            |
| 2       | 7         | 2            |
| 3       | 11        | 1            |
| 4       | 11        | 7            |
| 5       | 11        | 7            |
| 6       | 11        | 3            |
+---------+-----------+--------------+


create table Rides( id int ,driver_id int ,passenger_id int );
insert into Rides  values ( 1,7,1);
insert into Rides   values ( 2,7,2);
insert into Rides  values ( 3,11,1);
insert into Rides values ( 4,11,7);
insert into Rides  values ( 5,11,7);
insert into Rides  values ( 6,11,3);
commit ;
with d  as (select  passenger_id ,count(*)   c1  from Rides group by passenger_id) 
select   driver_id ,nvl(c1,0) cnt   from d ,( select unique driver_id   from Rides) d1
where d1.driver_id  = d.passenger_id(+)  order by 1 ;


LogInfo table:
+------------+------------+---------------------+---------------------+
| account_id | ip_address | login               | logout              |
+------------+------------+---------------------+---------------------+
| 1          | 1          | 2021-02-01 09:00:00 | 2021-02-01 09:30:00 |
| 1          | 2          | 2021-02-01 08:00:00 | 2021-02-01 11:30:00 |
| 2          | 6          | 2021-02-01 20:30:00 | 2021-02-01 22:00:00 |
| 2          | 7          | 2021-02-02 20:30:00 | 2021-02-02 22:00:00 |
| 3          | 9          | 2021-02-01 16:00:00 | 2021-02-01 16:59:59 |
| 3          | 13         | 2021-02-01 17:00:00 | 2021-02-01 17:59:59 |
| 4          | 10         | 2021-02-01 16:00:00 | 2021-02-01 17:00:00 |
| 4          | 11         | 2021-02-01 17:00:00 | 2021-02-01 17:59:59 |
+------------+------------+---------------------+---------------------+

drop table LogInfo;
create table Loginfo ( account_id int ,ip_address int ,login date ,logout date );
insert into Loginfo values (1,1,to_date('2021-02-01 09:00:00','yyyy-mm-dd hh24:mi:ss') ,to_date('2021-02-01 09:30:00','yyyy-mm-dd hh24:mi:ss'));
insert into Loginfo values (1,2,to_date('2021-02-01 08:00:00','yyyy-mm-dd hh24:mi:ss') ,to_date('2021-02-01 11:30:00','yyyy-mm-dd hh24:mi:ss'));
insert into Loginfo values (2,6,to_date('2021-02-01 20:30:00','yyyy-mm-dd hh24:mi:ss') ,to_date('2021-02-01 22:00:00','yyyy-mm-dd hh24:mi:ss'));
insert into Loginfo values (2,7,to_date('2021-02-02 20:30:00','yyyy-mm-dd hh24:mi:ss') ,to_date('2021-02-02 22:00:00','yyyy-mm-dd hh24:mi:ss'));
insert into Loginfo values (3,9,to_date('2021-02-01 16:00:00','yyyy-mm-dd hh24:mi:ss') ,to_date('2021-02-01 16:59:59','yyyy-mm-dd hh24:mi:ss'));
insert into Loginfo values (3,13,to_date('2021-02-01 17:00:00','yyyy-mm-dd hh24:mi:ss') ,to_date('2021-02-01 17:59:59','yyyy-mm-dd hh24:mi:ss'));
insert into Loginfo values (4,10,to_date('2021-02-01 16:00:00','yyyy-mm-dd hh24:mi:ss') ,to_date('2021-02-01 17:00:00','yyyy-mm-dd hh24:mi:ss'));
insert into Loginfo values (4,11,to_date('2021-02-01 17:00:00','yyyy-mm-dd hh24:mi:ss') ,to_date('2021-02-01 17:59:59','yyyy-mm-dd hh24:mi:ss'));
insert into Loginfo values (14,1,to_date('2021-2-26 00:43:51','yyyy-mm-dd hh24:mi:ss') ,to_date('2021-2-26 10:29:58','yyyy-mm-dd hh24:mi:ss'));
insert into Loginfo values (14,1,to_date('2021-2-26 02:58:06','yyyy-mm-dd hh24:mi:ss') ,to_date('2021-2-26 03:16:10','yyyy-mm-dd hh24:mi:ss'));

commit ;


with d  as  ( select  a.*  ,lag ( login ,1) over  (   partition by     account_id  order by login desc   )  scnd  ,
lag ( ip_address ,1) over  (   partition by     account_id  order by login desc   )  ip_add2  ,2*ip_address    ip_add3
 from loginfo a  ) ,d1   as (
select  d.account_id,case when   sum( ip_address+ ip_add2 )  != ip_add3   then 'A'  else 'B'  end  testc
 from d   where     login  <= scnd  and  logout >= scnd   
group by d.account_id ,ip_add3) 
select  unique  account_id   from d1 where   testc = 'A' order by 1 


 14         | 1          | 2021-2-26 00:43:51 | 2021-2-26 10:29:58 |
	Line 13: | 14         | 1          | 2021-2-26 02:58:06 | 2021-2-26 03:16:10 |
	
	with d  as  ( select  d.*  ,lead ( login_date ,1) over ( partition by   id order by login_date  ) login2   from Logins d ) ,
d1  as  ( select  d.*,  case   when  login2 - login_date = 0     then  1 
else  1 end testc,
dense_rank () over (  partition by id   order by case   when  login2 - login_date = 0     then  1 
else  1 end)  tect2
  from d   where  ( login2 - login_date = 1  or login2 - login_date =  0) ) 
  select  d1.id ,name  from d1,Accounts  d2   where testc  = tect2  and d2.id = d1.id 
  group by testc,tect2  ,d1.id,name having count(*) >= 5;
  
  Relations table:
+---------+-------------+
| user_id | follower_id |
+---------+-------------+
| 1       | 3           |
| 2       | 3           |
| 7       | 3           |
| 1       | 4           |
| 2       | 4           |
| 7       | 4           |
| 1       | 5           |
| 2       | 6           |
| 7       | 5           |
+---------+-------------+

create table Relations( user_id int ,follower_id int );
insert into Relations  values ( 1,3);
insert into Relations  values ( 2,3);
insert into Relations  values ( 7,3);
insert into Relations  values ( 1,4);
insert into Relations  values ( 2,4);
insert into Relations  values ( 7,4);
insert into Relations  values ( 1,5);
insert into Relations  values ( 2,6);
insert into Relations  values ( 7,5);
commit ;


OrdersDetails table:
+----------+------------+----------+
| order_id | product_id | quantity |
+----------+------------+----------+
| 1        | 1          | 12       |
| 1        | 2          | 10       |
| 1        | 3          | 15       |
| 2        | 1          | 8        |
| 2        | 4          | 4        |
| 2        | 5          | 6        |
| 3        | 3          | 5        |
| 3        | 4          | 18       |
| 4        | 5          | 2        |
| 4        | 6          | 8        |
| 5        | 7          | 9        |
| 5        | 8          | 9        |
| 3        | 9          | 20       |
| 2        | 9          | 4        |
+----------+------------+----------+
Output: 


create table OrdersDetails(  order_id int ,product_id int ,quantity int );
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,2,10);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);
insert into OrdersDetails  values ( 1,1,12);


Logs table:
+-------------+---------------------+---------------------+
| employee_id | in_time             | out_time            |
+-------------+---------------------+---------------------+
| 1           | 2022-10-01 09:00:00 | 2022-10-01 17:00:00 |
| 1           | 2022-10-06 09:05:04 | 2022-10-06 17:09:03 |
| 1           | 2022-10-12 23:00:00 | 2022-10-13 03:00:01 |
| 2           | 2022-10-29 12:00:00 | 2022-10-29 23:58:58 |
+-------------+---------------------+---------------------+

Logs table:
+-------------+---------------------+---------------------+
| employee_id | in_time             | out_time            |
+-------------+---------------------+---------------------+
| 1           | 2022-10-01 09:00:00 | 2022-10-01 17:00:00 |
| 1           | 2022-10-06 09:05:04 | 2022-10-06 17:09:03 |
| 1           | 2022-10-12 23:00:00 | 2022-10-13 03:00:01 |
| 2           | 2022-10-29 12:00:00 | 2022-10-29 23:58:58 |
+-------------+---------------------+---------------------+

create table logs ( employee_id int ,in_time date ,out_time date );
insert into logs  values ( 1,to_date('2022-10-01 09:00:00','yyyy-mm-dd hh24:mi:ss') ,to_date('2022-10-01 17:00:00','yyyy-mm-dd hh24:mi:ss'));
insert into logs  values ( 1,to_date('2022-10-06 09:05:04','yyyy-mm-dd hh24:mi:ss') ,to_date('2022-10-06 17:09:03','yyyy-mm-dd hh24:mi:ss'));
insert into logs  values ( 1,to_date('2022-10-12 23:00:00 ','yyyy-mm-dd hh24:mi:ss') ,to_date('2022-10-13 03:00:01','yyyy-mm-dd hh24:mi:ss'));
insert into logs  values ( 2,to_date('2022-10-29 12:00:00','yyyy-mm-dd hh24:mi:ss') ,to_date('2022-10-29 23:58:58','yyyy-mm-dd hh24:mi:ss'));
commit ;

Employees table:
+-------------+--------------+
| employee_id | needed_hours |
+-------------+--------------+
| 1           | 20           |
| 2           | 12           |
| 3           | 2            |
+-------------+--------------+



drop table Employees;
create table employees ( employee_id int ,needed_hours int );
insert into employees  values (1,20);
insert into employees  values (2,12);
insert into employees  values (3,2);
commit ;

with d  as  ( select   employee_id ,sum((out_time - in_time)*24)  hrs  from logs
group by employee_id )
select  d1.employee_id   from d ,employees d1  where  d1.employee_id = d.employee_id(+)  and 
d1.needed_hours  > nvl(d.hrs,0)  order by 1 
;

Salaries table:
+------------+-------------+---------------+--------+
| company_id | employee_id | employee_name | salary |
+------------+-------------+---------------+--------+
| 1          | 1           | Tony          | 2000   |
| 1          | 2           | Pronub        | 21300  |
| 1          | 3           | Tyrrox        | 10800  |
| 2          | 1           | Pam           | 300    |
| 2          | 7           | Bassem        | 450    |
| 2          | 9           | Hermione      | 700    |
| 3          | 7           | Bocaben       | 100    |
| 3          | 2           | Ognjen        | 2200   |
| 3          | 13          | Nyancat       | 3300   |
| 3          | 15          | Morninngcat   | 7777   |
+------------+-------------+---------------+--------+


create table Salaries( company_id int ,employee_id int ,employee_name varchar2(100),salary int );
with d  as ( select  a.* ,max(salary ) over ( partition by  company_id )  maxs
from Salaries a)
select company_id ,employee_id ,employee_name ,case when  maxs > 10000
then   round(( salary   -  49 *salary/100) )    
when   maxs >= 1000  and maxs <=10000  then 
round(( salary   -  24 *salary/100) )     
else salary  end salary
from d;

Points table:
+----------+-------------+-------------+
| id       | x_value     | y_value     |
+----------+-------------+-------------+
| 1        | 2           | 7           |
| 2        | 4           | 8           |
| 3        | 2           | 10          |
+----------+-------------+-------------+

create table Points (id int ,x_values int ,y_value int );
insert into Points   values ( 1,2,7);
insert into Points values ( 2,4,8);
insert into Points values ( 3,2,10);
commit ;

Employees table:
+-------------+---------+--------+
| employee_id | name    | salary |
+-------------+---------+--------+
| 2           | Meir    | 3000   |
| 3           | Michael | 3000   |
| 7           | Addilyn | 7400   |
| 8           | Juan    | 6100   |
| 9           | Kannon  | 7400   |
+-------------+---------+--------+


create table employees( employee_id int ,name varchar2(100),salary int );
insert into employees values ( 2,'Meir',3000);
insert into employees values ( 3,'Michael',3000);
insert into employees values ( 7,'Addilyn',7400);
insert into employees values ( 8,'Juan',6100);
insert into employees values ( 9,'Kannon',7400);

with d  as  (  select d.*  ,count(salary) over  (partition by salary )   c1 from employees d) 
select  employee_id ,name,salary  ,  dense_rank() 
over  (  order by salary )  team_id
from d  where  c1>=2  order by 4,1;

Purchases table:
+-------------+---------+---------------+
| purchase_id | user_id | purchase_date |
+-------------+---------+---------------+
| 4           | 2       | 2022-03-13    |
| 1           | 5       | 2022-02-11    |
| 3           | 7       | 2022-06-19    |
| 6           | 2       | 2022-03-20    |
| 5           | 7       | 2022-06-19    |
| 2           | 2       | 2022-06-08    |
+-------------+---------+---------------+


create table Purchases( purchase_id int ,user_id int ,purchase_date  );
insert into Purchases values ( 4,2, to_date('2022-03-13','yyyy-mm-dd'));
insert into Purchases values ( 1,5, to_date('2022-02-11','yyyy-mm-dd'));
insert into Purchases values ( 3,7, to_date('2022-06-19','yyyy-mm-dd'));
insert into Purchases values ( 6,2, to_date('2022-03-20','yyyy-mm-dd'));
insert into Purchases values ( 5,7, to_date('2022-06-19','yyyy-mm-dd'));
insert into Purchases values ( 2,2, to_date('2022-06-08','yyyy-mm-dd'));
commit ;

with d  as  ( select a.*  ,lead( purchase_date,1) over ( partition by user_id  order by purchase_date )   ld  from purchases    a) 
select  unique user_id   from d where ld is not null  and  ld-purchase_date <= 7
order by 1 

---------------------

Orders table:
+----------+------------+----------+---------------+
| order_id | product_id | quantity | purchase_date |
+----------+------------+----------+---------------+
| 1        | 1          | 7        | 2020-03-16    |
| 2        | 1          | 4        | 2020-12-02    |
| 3        | 1          | 7        | 2020-05-10    |
| 4        | 1          | 6        | 2021-12-23    |
| 5        | 1          | 5        | 2021-05-21    |
| 6        | 1          | 6        | 2021-10-11    |
| 7        | 2          | 6        | 2022-10-11    |
+----------+------------+----------+---------------+


create table orders ( order_id int ,product_id int ,quantity int ,purchase_date date );
insert into orders values ( 1,1,7,to_date('2020-03-16','yyyy-mm-dd'));
insert into orders values ( 2,1,4,to_date('2020-12-02','yyyy-mm-dd'));
insert into orders values ( 3,1,7,to_date('2020-05-10','yyyy-mm-dd'));
insert into orders values ( 4,1,6,to_date('2021-12-23','yyyy-mm-dd'));
insert into orders values ( 5,1,5,to_date('2021-05-21','yyyy-mm-dd'));
insert into orders values ( 6,1,6,to_date('2021-10-11','yyyy-mm-dd'));
insert into orders values ( 7,2,6,to_date('2022-10-11','yyyy-mm-dd'));
commit ;

with d as ( 
select   product_id ,count(product_id)  c1 ,to_char( purchase_date ,'yyyy') year1
from orders group by  product_id ,to_char( purchase_date ,'yyyy') )  ,d1  as (
select a.*  ,lead( year1,1) over ( partition by  product_id  order by year1 )    year2 from d a
where c1>= 3 ) 
select    unique  product_id   from d1
 where 
 year2 is not null and  year2 -  year1  =1   order by 1 ;
 -----------
 
 Weather table:
+---------+------------+--------+
| city_id | day        | degree |
+---------+------------+--------+
| 1       | 2022-01-07 | -12    |
| 1       | 2022-03-07 | 5      |
| 1       | 2022-07-07 | 24     |
| 2       | 2022-08-07 | 37     |
| 2       | 2022-08-17 | 37     |
| 3       | 2022-02-07 | -7     |
| 3       | 2022-12-07 | -6     |
+---------+------------+--------+


create table Weather ( city_id int ,day date ,degree  int );
insert into Weather values ( 1,to_date('2022-01-07','yyyy-mm-dd'),-12);
insert into Weather values ( 1,to_date('2022-03-07','yyyy-mm-dd'),5);
insert into Weather values ( 1,to_date('2022-07-07','yyyy-mm-dd'),-12);
insert into Weather values ( 1,to_date('2022-01-07','yyyy-mm-dd'),-12);
insert into Weather values ( 1,to_date('2022-01-07','yyyy-mm-dd'),-12);
insert into Weather values ( 1,to_date('2022-01-07','yyyy-mm-dd'),-12);
insert into Weather values ( 1,to_date('2022-01-07','yyyy-mm-dd'),-12);
commit ;

Input: 
Members table:
+-----------+---------+
| member_id | name    |
+-----------+---------+
| 9         | Alice   |
| 11        | Bob     |
| 3         | Winston |
| 8         | Hercy   |
| 1         | Narihan |
+-----------+---------+
Visits table:
+----------+-----------+------------+
| visit_id | member_id | visit_date |
+----------+-----------+------------+
| 22       | 11        | 2021-10-28 |
| 16       | 11        | 2021-01-12 |
| 18       | 9         | 2021-12-10 |
| 19       | 3         | 2021-10-19 |
| 12       | 11        | 2021-03-01 |
| 17       | 8         | 2021-05-07 |
| 21       | 9         | 2021-05-12 |
+----------+-----------+------------+
Purchases table:
+----------+----------------+
| visit_id | charged_amount |
+----------+----------------+
| 12       | 2000           |
| 18       | 9000           |
| 17       | 7000           |
+----------+----------------+


create table Members(  member_id int ,name varchar2(25));
insert into Members values ( 9,'Alice');
insert into Members values ( 11,'Bob');
insert into Members values ( 3,'Winston');
insert into Members values ( 8,'Hercy');
insert into Members values ( 1,'Narihan');
commit ;


create table visits(visit_id int ,member_id ,visit_date date );
insert into visits values ( 22,11,to_date('2021-10-28','yyyy-mm-dd'));
insert into visits values ( 16,11,to_date('2021-01-12','yyyy-mm-dd'));
insert into visits values ( 18,9,to_date('2021-12-10','yyyy-mm-dd'));
insert into visits values ( 19,3,to_date('2021-10-19','yyyy-mm-dd'));
insert into visits values ( 12,11,to_date('2021-03-01','yyyy-mm-dd'));
insert into visits values ( 17,8,to_date('2021-05-07','yyyy-mm-dd'));
insert into visits values ( 21,9,to_date('2021-05-12','yyyy-mm-dd'));
commit ;

Purchases table:
+----------+----------------+
| visit_id | charged_amount |
+----------+----------------+
| 12       | 2000           |
| 18       | 9000           |
| 17       | 7000           |
+----------+----------------+



create table Purchases( view_date int ,charged_amount int );
insert into Purchases values (12,2000);
insert into Purchases values (18,9000);
insert into Purchases values (17,7000);
commit ;


with d  as   ( select      count(*) c1  ,member_id   from visits 
group by member_id   ),
d1 as( 
select  b.member_id ,count(b.member_id) p1 from visits  b  ,Purchases a
where a.visit_id  = b.visit_id   group by b.member_id ) ,
d2 as (
select   members.member_id ,name ,
case  when nvl(c1,0) = 0  then 0 
else   round((100 * nvl(p1,0))  / c1 )     end  category ,c1
  from  Members ,d ,d1 
where members.member_id = d.member_id(+)  and  members.member_id = d1.member_id(+)) 
select  member_id ,name ,case when category >= 80 then 'Diamond' 
when category >= 50  and category <80   then 'Gold' 
when  category < 50       and    nvl(c1,0) !=  0     then  'Silver'   else 
'Bronze'      end category
from d2 order by 1;

Sales table:
+---------+------------+---------+----------+
| sale_id | product_id | user_id | quantity |
+---------+------------+---------+----------+
| 1       | 1          | 101     | 10       |
| 2       | 3          | 101     | 7        |
| 3       | 1          | 102     | 9        |
| 4       | 2          | 102     | 6        |
| 5       | 3          | 102     | 10       |
| 6       | 1          | 102     | 6        |
+---------+------------+---------+----------+
Product table:
+------------+-------+
| product_id | price |
+------------+-------+
| 1          | 10    |
| 2          | 25    |
| 3          | 15    |
+------------+-------+


create table Sales( sale_id int ,product_id int ,user_id int ,quantity int );
insert into Sales values ( 1,1,101,10);
insert into Sales values ( 2,3,101,7);
insert into Sales values ( 3,1,102,9);
insert into Sales values ( 4,2,102,6);
insert into Sales values ( 5,3,102,10);
insert into Sales values ( 6,1,102,6);
commit ;


drop table Product;
create table Product ( product_id int ,price int );
insert into Product values ( 1,10);
insert into Product values ( 2,25);
insert into Product values ( 3,15);
commit ;

with d  as  (  select   sales.user_id , sales.product_id , sum( quantity*price)  ms  from Sales, Product
where Sales.PRODUCT_ID = Product.PRODUCT_ID 
group by sales.user_id , sales.product_id 
order by 2 ,3 desc )  ,d1  as (
select  d.*  ,dense_rank()  over ( partition by  user_id order by   ms desc  )  d1 from d ) 
select user_id,product_id   from d1  where d1 = 1 order by 1 ,2;

Customer table:
+-------------+--------------+--------------+-------------+
| customer_id | name         | visited_on   | amount      |
+-------------+--------------+--------------+-------------+
| 1           | Jhon         | 2019-01-01   | 100         |
| 2           | Daniel       | 2019-01-02   | 110         |
| 3           | Jade         | 2019-01-03   | 120         |
| 4           | Khaled       | 2019-01-04   | 130         |
| 5           | Winston      | 2019-01-05   | 110         | 
| 6           | Elvis        | 2019-01-06   | 140         | 
| 7           | Anna         | 2019-01-07   | 150         |
| 8           | Maria        | 2019-01-08   | 80          |
| 9           | Jaze         | 2019-01-09   | 110         | 
| 1           | Jhon         | 2019-01-10   | 130         | 
| 3           | Jade         | 2019-01-10   | 150         | 
+-------------+--------------+--------------+-------------+

drop table customer;
create table customer ( customer_id int ,visited_on date   amount int );
insert into customer values ( 1,to_date('2019-01-01','yyyy-mm-dd'),100);
insert into customer values ( 2,to_date('2019-01-02','yyyy-mm-dd'),110);
insert into customer values ( 3,to_date('2019-01-03','yyyy-mm-dd'),120);
insert into customer values ( 4,to_date('2019-01-04','yyyy-mm-dd'),130);
insert into customer values ( 5,to_date('2019-01-05','yyyy-mm-dd'),110);
insert into customer values ( 6,to_date('2019-01-06','yyyy-mm-dd'),140);
insert into customer values ( 7,to_date('2019-01-07','yyyy-mm-dd'),150);
insert into customer values ( 8,to_date('2019-01-08','yyyy-mm-dd'),80);
insert into customer values ( 9,to_date('2019-01-09','yyyy-mm-dd'),110);
insert into customer values ( 1,to_date('2019-01-10','yyyy-mm-dd'),130);
insert into customer values ( 3,to_date('2019-01-10','yyyy-mm-dd'),150);
commit ;





insert into customer values ( 1,to_date('2019-01-01','yyyy-mm-dd'),100);
insert into customer values ( 1,to_date('2019-01-01','yyyy-mm-dd'),100);
insert into customer values ( 1,to_date('2019-01-01','yyyy-mm-dd'),100);
insert into customer values ( 1,to_date('2019-01-01','yyyy-mm-dd'),100);
insert into customer values ( 1,to_date('2019-01-01','yyyy-mm-dd'),100);
insert into customer values ( 1,to_date('2019-01-01','yyyy-mm-dd'),100);

with d  as  ( select     a.*, a.visited_on -6    visit from customer a ) ,d1  as (
select  unique  visited_on,visit   from d   where  visit in ( select  visited_on  from d))
select  to_char(d1.visited_on,'yyyy-mm-dd') visited_on ,sum(  amount)   amount ,round(sum(  amount)/7 ,2) average_amount
 from d1 ,customer d2   where  d2.visited_on  <= d1.visited_on    and d2.visited_on >= d1.visit
group by to_char(d1.visited_on,'yyyy-mm-dd'),d1.visit order by 1;

Transactions table:
+-----+---------+----------+--------+------------+
| id  | country | state    | amount | trans_date |
+-----+---------+----------+--------+------------+
| 101 | US      | approved | 1000   | 2019-05-18 |
| 102 | US      | declined | 2000   | 2019-05-19 |
| 103 | US      | approved | 3000   | 2019-06-10 |
| 104 | US      | declined | 4000   | 2019-06-13 |
| 105 | US      | approved | 5000   | 2019-06-15 |
+-----+---------+----------+--------+------------+
Chargebacks table:
+----------+------------+
| trans_id | trans_date |
+----------+------------+
| 102      | 2019-05-29 |
| 101      | 2019-06-30 |
| 105      | 2019-09-18 |


drop table Transactions;

create table Transactions( id int ,country  varchar2(3),state varchar2(20) ,trans_date date );
insert into Transactions values ( 101,'US','approved',1000,to_date('2019-05-18','yyyy-mm-dd'));
insert into Transactions values ( 103,'US','declined',2000,to_date('2019-05-19','yyyy-mm-dd'));
insert into Transactions values ( 103,'US','approved',3000,to_date('2019-06-10','yyyy-mm-dd'));
insert into Transactions values ( 104,'US','declined',4000,to_date('2019-06-13','yyyy-mm-dd'));
insert into Transactions values ( 105,'US','approved',5000,to_date('2019-06-15','yyyy-mm-dd'));
commit ;

Chargebacks table:
+----------+------------+
| trans_id | trans_date |
+----------+------------+
| 102      | 2019-05-29 |
| 101      | 2019-06-30 |
| 105      | 2019-09-18 |
+----------+------------+



create table Chargebacks( trans_id int ,trans_date date );
insert into Chargebacks values (102,to_date('2019-05-29','yyyy-mm-dd'));
insert into Chargebacks values (101,to_date('2019-06-30 ','yyyy-mm-dd'));
insert into Chargebacks values (105,to_date('2019-09-18','yyyy-mm-dd'));
commit ;

with d  as  ( select        to_char(trans_date,'yyyy-mm')  month ,country ,count( decode(state,'approved',1,null))  approved_count ,
sum(decode(state,'approved',amount,0)) approved_amount
 from Transactions a   group by     to_char(trans_date,'yyyy-mm')   ,country ) ,d1  as (
 select  count(*)   chargeback_count,sum( d.amount )  chargeback_amount  ,to_char(d12.trans_date,'yyyy-mm')  month,
 d.country    from Chargebacks  d12  ,Transactions   d
 where  d12.trans_id = d.id   group by  to_char(d12.trans_date,'yyyy-mm') ,d.country)
 select      d1.month , d1.country ,nvl(approved_count,0)   approved_count  ,  nvl(approved_amount ,0) approved_amount,
 chargeback_count, chargeback_amount from d1 ,d  
 where d1.month = d.month(+) ;
 
 Project table:
+-------------+-------------+
| project_id  | employee_id |
+-------------+-------------+
| 1           | 1           |
| 1           | 2           |
| 1           | 3           |
| 2           | 1           |
| 2           | 4           |
+-------------+-------------+
Employee table:
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 3                |
| 4           | Doe    | 2                |
+-------------+--------+------------------+
Output: 
+-------------+---------------+
| project_id  | employee_id   |
+-------------+---------------+
| 1           | 1             |
| 1           | 3             |
| 2           | 1             |
+-------------+---------------+


create table Project ( project_id int ,employee_id int );
insert into Project values (1,1);
insert into Project values (1,2);
insert into Project values (1,3);
insert into Project values (2,1);
insert into Project values (2,4);
commit ;

Employee table:
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 3                |
| 4           | Doe    | 2                |
+-------------+--------+------------------+
drop table employee;
create table employee ( employee_id int ,name varchar2(20),experience_years int );
insert into employee  values (1,'Khalid',3);
insert into employee  values (2,'Ali',2);
insert into employee  values (3,'John',3);
insert into employee  values (4,'Doe',2);
commit ;

with d  as   ( select  project_id,employee. employee_id  ,experience_years    
 from   project, employee  where project.employee_id = employee.employee_id ) ,d1  as (
select dense_rank() over ( partition by  project_id order by experience_years desc ) d1  ,d.*  from d ) 
select project_id  ,employee_id from d1  where d1 = 1 order by 1 ,2 desc;

Candidates table:
+--------------+---------+--------------+--------------+
| candidate_id | name    | years_of_exp | interview_id |
+--------------+---------+--------------+--------------+
| 11           | Atticus | 1            | 101          |
| 9            | Ruben   | 6            | 104          |
| 6            | Aliza   | 10           | 109          |
| 8            | Alfredo | 0            | 107          |
+--------------+---------+--------------+--------------+
Rounds table:
+--------------+----------+-------+
| interview_id | round_id | score |
+--------------+----------+-------+
| 109          | 3        | 4     |
| 101          | 2        | 8     |
| 109          | 4        | 1     |
| 107          | 1        | 3     |
| 104          | 3        | 6     |
| 109          | 1        | 4     |
| 104          | 4        | 7     |
| 104          | 1        | 2     |
| 109          | 2        | 1     |
| 104          | 2        | 7     |
| 107          | 2        | 3     |
| 101          | 1        | 8     |
+--------------+----------+-------+
Output: 
+--------------+
| candidate_id |
+--------------+
| 9            |
+--------------+


drop table Candidates;
create table Candidates ( candidate_id int ,name varchar2(20),years_of_exp int ,interview_id int );
insert into Candidates  values ( 11,'Atticus',1,101);
insert into Candidates  values ( 9,'Ruben',6,104);
insert into Candidates  values ( 6,'Aliza',10,109);
insert into Candidates  values ( 8,'Alfredo',0,107);
commit ;

drop table Rounds;
create table Rounds( interview_id int ,round_id int ,score int );
insert into Rounds  values ( 109,3,4);
insert into Rounds  values ( 101,2,8);
insert into Rounds  values ( 109,4,1);
insert into Rounds  values ( 107,1,3);
insert into Rounds  values ( 104,3,6);
insert into Rounds  values ( 109,1,4);
insert into Rounds  values ( 104,4,7);
insert into Rounds  values ( 104,1,2);
insert into Rounds  values ( 109,2,1);
insert into Rounds  values ( 104,2,7);
insert into Rounds  values ( 107,2,3);
insert into Rounds  values ( 101,1,8);
commit ;

with d  as   ( select *  from candidates  where years_of_exp >=2 ) ,d1  as
( select    sum(score)  score ,interview_id      from    Rounds group by interview_id) 
select candidate_id   from d ,d1   where d.interview_id = d1.interview_id  and   score > 15;

Weather table:
+---------+------------+--------+
| city_id | day        | degree |
+---------+------------+--------+
| 1       | 2022-01-07 | -12    |
| 1       | 2022-03-07 | 5      |
| 1       | 2022-07-07 | 24     |
| 2       | 2022-08-07 | 37     |
| 2       | 2022-08-17 | 37     |
| 3       | 2022-02-07 | -7     |
| 3       | 2022-12-07 | -6     |
+---------+------------+--------+


drop table Weather;
create table Weather ( city_id int ,day date ,degree int );
insert into Weather  values ( 1,to_date('2022-01-07','yyyy-mm-dd'),-12);
insert into Weather  values ( 1,to_date('2022-03-07','yyyy-mm-dd'),5);
insert into Weather  values ( 1,to_date('2022-07-07','yyyy-mm-dd'),24);
insert into Weather  values ( 2,to_date('2022-08-07','yyyy-mm-dd',37);
insert into Weather  values ( 2,to_date('2022-08-17','yyyy-mm-dd',37);
insert into Weather  values ( 3,to_date('2022-02-07','yyyy-mm-dd',-7);
insert into Weather  values ( 3,to_date('2022-12-07','yyyy-mm-dd',-6);
commit ;

with d  as   (  select *  from weather ),d1  as (
select city_id,day  ,dense_rank () over  (  partition by  city_id order by degree desc,day )  d1,degree    from d )
select  city_id, to_char(day,'yyyy-mm-dd') day   ,degree   from d1  where   d1 = 1;

Orders table:
+----------+------------+-------------+------------+
| order_id | order_date | customer_id | product_id |
+----------+------------+-------------+------------+
| 1        | 2020-07-31 | 1           | 1          |
| 2        | 2020-07-30 | 2           | 2          |
| 3        | 2020-08-29 | 3           | 3          |
| 4        | 2020-07-29 | 4           | 1          |
| 5        | 2020-06-10 | 1           | 2          |
| 6        | 2020-08-01 | 2           | 1          |
| 7        | 2020-08-01 | 3           | 1          |
| 8        | 2020-08-03 | 1           | 2          |
| 9        | 2020-08-07 | 2           | 3          |
| 10       | 2020-07-15 | 1           | 2          |
+----------+------------+-------------+------------+


drop table orders ;

create table orders(  order_id int ,order_date date ,customer_id int mproduct_id int );
insert into orders  values (1,to_date('2020-07-31','yyyy-mm-dd'),1,1);
insert into orders  values (2,to_date('2020-07-30','yyyy-mm-dd'),2,2);
insert into orders  values (3,to_date('2020-08-29','yyyy-mm-dd'),3,3);
insert into orders  values (4,to_date('2020-07-29','yyyy-mm-dd'),4,1);
insert into orders  values (5,to_date('2020-06-10','yyyy-mm-dd'),1,2);
insert into orders  values (6,to_date('2020-08-01','yyyy-mm-dd'),2,1);
insert into orders  values (7,to_date('2020-08-01','yyyy-mm-dd'),3,1);
insert into orders  values (8,to_date('2020-08-03','yyyy-mm-dd'),1,2);
insert into orders  values (9,to_date('2020-08-07','yyyy-mm-dd'),2,3);
insert into orders  values (10,to_date('2020-07-15','yyyy-mm-dd'),1,2);
commit ;


with d  as  (  select  product_id ,dense_rank()  over (  partition by   product_id order by order_date  desc )    d2 , to_char(order_date,'yyyy-mm-dd')  order_date ,order_id  from orders   ) 
select   product_name ,d3.product_id,order_id ,order_date   from d ,Products  d3  where d2 = 1
and d.product_id = d3.product_id order by 1,3;

Calls table:
+---------+-------+----------+
| from_id | to_id | duration |
+---------+-------+----------+
| 1       | 2     | 59       |
| 2       | 1     | 11       |
| 1       | 3     | 20       |
| 3       | 4     | 100      |
| 3       | 4     | 200      |
| 3       | 4     | 200      |
| 4       | 3     | 499      |
+---------+-------+----------+



drop table calls ;
create table calls( from _id int ,to_int ,duration int );
insert into  calls values (1,2,59);
insert into  calls values (2,1,11);
insert into  calls values (1,3,20);
insert into  calls values (3,4,100);
insert into  calls values (3,4,200);
insert into  calls values (3,4,200);
insert into  calls values (4,3,499);
commit ;

with d  as  ( select   from_id  person1,to_id   person2,duration    from calls  union all 
select to_id,from_id,duration   from calls) 
select person1,person2,count(*)  call_count ,sum(duration)  total_duration  from d  where person1< person2 
group by person1,person2 order by 1 ;

Transactions table:
+----------------+-------------+------------------+--------+
| transaction_id | customer_id | transaction_date | amount |
+----------------+-------------+------------------+--------+
| 1              | 101         | 2023-05-01       | 100    |
| 2              | 101         | 2023-05-02       | 150    |
| 3              | 101         | 2023-05-03       | 200    |
| 4              | 102         | 2023-05-01       | 50     |
| 5              | 102         | 2023-05-03       | 100    |
| 6              | 102         | 2023-05-04       | 200    |
| 7              | 105         | 2023-05-01       | 100    |
| 8              | 105         | 2023-05-02       | 150    |
| 9              | 105         | 2023-05-03       | 200    |
+----------------+-------------+------------------+--------+


drop table Transactions ;
create table Transactions(  transaction_id int ,customer_id int ,transaction_date date ,amount int );
insert into Transactions  values (1,101,to_date('2023-05-01','yyyy-mm-dd'),100);
insert into Transactions  values (2,101,to_date('2023-05-02','yyyy-mm-dd'),150);
insert into Transactions  values (3,101,to_date('2023-05-03','yyyy-mm-dd'),200);
insert into Transactions  values (4,102,to_date('2023-05-01','yyyy-mm-dd'),50);
insert into Transactions  values (5,102,to_date('2023-05-03','yyyy-mm-dd'),100);
insert into Transactions  values (6,102,to_date('2023-05-04','yyyy-mm-dd'),200);
insert into Transactions  values (7,105,to_date('2023-05-01','yyyy-mm-dd'),100);
insert into Transactions  values (8,105,to_date('2023-05-02','yyyy-mm-dd'),150);
insert into Transactions  values (9,105,to_date('2023-05-03','yyyy-mm-dd'),200);
insert into Transactions  values (10,105,to_date('2023-05-12','yyyy-mm-dd'),250);
insert into Transactions  values (11,105,to_date('2023-05-13','yyyy-mm-dd'),260);
insert into Transactions  values (12,105,to_date('2023-05-14','yyyy-mm-dd'),270);
commit ;


Friends table:
+-------+-------+
| user1 | user2 | 
+-------+-------+
| 2     | 1     | 
| 1     | 3     | 
| 4     | 1     | 
| 1     | 5     | 
| 1     | 6     |
| 2     | 6     | 
| 7     | 2     | 
| 8     | 3     | 
| 3     | 9     |  
+-------+-------+



drop  table Friends ;
create table Friends ( user1 int ,user2 int );
insert into Friends values (2,1);
insert into Friends values (1,3);
insert into Friends values (4,1);
insert into Friends values (1,5);
insert into Friends values (1,6);
insert into Friends values (2,6);
insert into Friends values (7,2);
insert into Friends values (8,3);
insert into Friends values (3,9);
commit ;

with d  as  ( select  user1,user2 from Friends union all 
select user2,user1   from Friends) 
,d1  as  ( select  count(  unique user1 )  m from d )
select   user1,round(count( unique user2) /m*100 ,2)  percentage_popularity  from  d,d1
group by user1,m order by 1;


Orders table:
+----------+-------------+------------+-------+
| order_id | customer_id | order_date | price |
+----------+-------------+------------+-------+
| 1        | 1           | 2019-07-01 | 1100  |
| 2        | 1           | 2019-11-01 | 1200  |
| 3        | 1           | 2020-05-26 | 3000  |
| 4        | 1           | 2021-08-31 | 3100  |
| 5        | 1           | 2022-12-07 | 4700  |
| 6        | 2           | 2015-01-01 | 700   |
| 7        | 2           | 2017-11-07 | 1000  |
| 8        | 3           | 2017-01-01 | 900   |
| 9        | 3           | 2018-11-07 | 900   |
+----------+-------------+------------+-------+


drop table Orders;
create table Orders  ( order_id int ,customer_id int ,order_date date ,price int );
insert into Orders  values (1,1,to_date('2019-07-01','yyyy-mm-dd'),1100);
insert into Orders  values (2,1,to_date('2019-11-01','yyyy-mm-dd'),1200);
insert into Orders  values (3,1,to_date('2020-05-26','yyyy-mm-dd'),3000);
insert into Orders  values (4,1,to_date('2021-08-31','yyyy-mm-dd'),3100);
insert into Orders  values (5,1,to_date('2022-12-07','yyyy-mm-dd'),4700);
insert into Orders  values (6,2,to_date('2015-01-01','yyyy-mm-dd'),700);
insert into Orders  values (7,2,to_date('2017-11-07','yyyy-mm-dd'),1000);
insert into Orders  values (8,3,to_date('2017-01-01','yyyy-mm-dd'),900);
insert into Orders  values (9,3,to_date('2018-11-07','yyyy-mm-dd'),900);
insert into Orders  values (18,6,to_date('2022-03-29','yyyy-mm-dd'),7500);
insert into Orders  values (,3,to_date('2018-11-07','yyyy-mm-dd'),900);

commit ;

with d as (  select   customer_id ,to_char(order_date,'yyyy')   month1 ,sum( price)  sump 
from    orders  group by to_char(order_date,'yyyy')  ,customer_id),d1  as ( 
select     a.* ,lead(  sump,1)  over ( partition by customer_id order by month1 )  sump1 ,lead(  month1,1)  over ( partition by customer_id order by month1 )  mp1  from d   a) 
--select  *  from d1
,d2  as (
--select *  from d1
select       sum( case when  sump1 >    sump  then 1 else 0 end )  c1 ,customer_id,count(*)  c2   from d1    where sump1 is not null   and mp1 - month1  =1 
group by customer_id) 
select  customer_id  from d2   where  c1 = c2 
union all 
select customer_id  from orders   group by customer_id having count(*) = 1;


with  d  as   ( select  transaction_date   - rownum t1 ,a.*   from   Transactions  a order by 3,4),d1  as ( 
select   max(  transaction_date) over ( partition by  t1  ) mx1  ,min( transaction_date)  over ( partition by t1 )  mn1 ,  count( t1 ) over  ( partition by   t1)  c1,d.*          from  d ) 
select  unique   mn1,mx1 ,customer_id ,c1  from d1 where c1 >=3 ;

with  d  as   ( select  transaction_date   - rownum t1 ,a.*   from   Transactions  a order by 3,4),d1  as ( 
select   max(  transaction_date) over ( partition by  t1  ) mx1  ,min( transaction_date)  over ( partition by t1 )  mn1 ,
d.*   ,lead( amount ,1) over ( partition by  customer_id ,t1 order by   transaction_date) l1       from  d ) 
--,d2  as 
select  *  from d1
( select  unique   mn1,mx1 ,customer_id ,sum( case when  amount <l1  then  1 else   0  end ) over ( partition by  customer_id ,  t1 )   c1  from d1)
select customer_id, to_char(mn1,'yyyy-mm-dd')  consecutive_start,to_char(mx1,'yyyy-mm-dd')  consecutive_end  from d2  where c1 >=2 order by 1 

select *  from  Transactions  order by  2,3


with d  as  (select  orders.order_id ,orders.order_date ,orders.item_id ,orders.buyer_id ,orders.seller_id,users.favorite_brand   
,items.item_brand  from Orders ,Items  ,users 
where users.user_id = Orders.seller_id and  Orders.item_id = items.item_id) ,d1  as  (
select d.* ,dense_rank() over ( partition by seller_id  order by   order_date  )  d1  from d ) ,d2  as (
select *  from d1   where d1= 2  and   d1.favorite_brand = d1.item_brand   )
select  user_id ,decode(  seller_id ,null , 'no','yes')   "2nd_item_fav_brand"   from d2,users       where  users.user_id =   d2.seller_id(+) 
order by 1

with d  as  (select   unique  b.department_id  ,substr(   pay_date,1,6)  pay_date,avg ( amount  )    over        (    partition by   substr(   pay_date,1,6))  avr_dep,
avg ( amount  )    over        (    partition by   department_id,substr(   pay_date,1,6)) avg_com
 from  Salary   a,employee b 
where  a.employee_id  = b.employee_id   order by 1 )
select   to_char(pay_date,'yyyy-mm')  pay_date,department_id , case when  avr_dep < avg_com  then 'higher' 
when  avr_dep > avg_com then 'lower'  else 'same'  end comparison  from d order by 2,1

with  d  as   (select a.*  ,count(*)  over ( partition by   continent) ,rownum rn  from student a )
--,d1  as (
select    america,asia,europe   from d 
pivot ( max( name )  for continent  in ( 'America' as  America,'Asia'  as Asia ,'Europe'  as  Europe) )
--)
select  america,asia,europe   from d1 


with d  as   (select to_date(fail_date,'yyyymmdd')  success_date   ,'success'   comp   from succed   where  fail_date  like '2019%'  union all
select to_date(fail_date,'yyyymmdd')  success_date   ,'failed'    from failed   where  fail_date  like '2019%' 
),d1  as (
select  success_date -rownum+1 dummy_table,success_date ,comp   from  d  ) 
select comp as  period_state  ,max(success_date),min(success_date)  from d1  
group by  comp,dummy_table


with d  as  ( select  b.visit_date ,a.TRANSACTION_DATE    from visits b ,TRANSACTIONS a where  
 ( b.user_id  = a.user_id (+)    and  b.visit_date = a.TRANSACTION_DATE(+))),d1 as (
select  count(*) c ,nvl(TRANSACTION_DATE ,0)  TRANSACTION_DATE from  d group 
by  nvl(TRANSACTION_DATE,0)) ,d2  as ( 
select   c  transactions_count   , count(decode( TRANSACTION_DATE,0,null, c))  visits_count   
  from d1 group by  c ) ,d3  as(
  select   level l   from dual connect by level <= (select max(transactions_count)  from d2))
  select   * from d2 union all
  select   l,0 from  d3   where  l not in ( select transactions_count  from d2) order by  1 

with d  as  (  select to_date(fail_date,'yyyymmdd') fail_date from failed  where fail_date  like  '2019%'),
d1  as  (  select  to_date(fail_date,'yyyymmdd') succed_date    from succed  where fail_date  like  '2019%'),d2  as  ( 
select   'failed' "period_state" ,fail_date,fail_date - rownum   b1   from d  union all 
select 'succed' ,succed_date,succed_date - rownum  from d1) 
select  "period_state" ,min( fail_date ), max(  fail_date)  from d2
group by "period_state",b1  order by 2;


with d  as  ( select  a.* ,dense_rank()  over  ( partition by  username order by startdate  desc ) d1  ,count(*)  
over  ( partition by  username) c1  from UserActivity a)
select  username,activity ,to_char(startDate,'yyyy-mm-dd') startDate ,to_char(endDate ,'yyyy-mm-dd') endDate    
  from  d   where ( d1 =  2   or  ( d1 = 1   and   c1  =1));
  
  
  with d  as  ( select a.*,row_number() over  ( partition by continent  order by   name ) rn  from student a )
select America, Asia ,Europe from d pivot ( max(name) for
  continent  in ('America' as America ,'Asia' as Asia ,'Europe' as Europe)) order by 1,2,3;
  
  /* Write your PL/SQL query statement below */
with d  as   ( select  unique  *  from spending ),d1  as  (
select  d.* ,listagg(  platform,',') over ( partition by  user_id ,spend_date  ) la  from d ) ,d2 as (
select user_id ,spend_date ,la platform ,sum(amount )  total_amount ,count( unique  user_id  ) 
over ( partition by user_id ,spend_date,la ) 
total_users   from   d1 
group by spend_date ,la,user_id ) ,d3  as 
( select  unique spend_date,t.platform   from d,(select unique platform  from d2)t )
select   d3.spend_date spend_date ,decode( d3.platform,'desktop,mobile','both',d3.platform) platform ,
nvl(d2.total_amount,0  )  total_amount,nvl( d2.total_users,0) total_users
from d2,d3   where   ( d3.spend_date = d2.spend_date(+)  and   d3.platform   =  d2.platform (+)) order by 1 ,2 desc ;


with d  as   ( select  unique  *  from Spending  ),d1  as ( 
select user_id ,decode( count( unique  platform ) over  (  partition by  user_id,spend_date ),2,'both',platform )platform  ,spend_date,amount     from d ) ,d2  as (
select    sum(amount)  total_amount,platform ,spend_date ,user_id   from d1 
group by platform ,spend_date ,user_id  ) 
,d3 as (
select  d2.* ,count( unique  user_id  ) over ( partition by user_id ,spend_date,platform )total_users  from d2)
,d4  as 
( select  unique spend_date,t.platform   from d,(select unique platform  from d2)t )
select    d4.spend_date ,d4.platform ,
nvl(d3.total_amount,0  )  total_amount,nvl( d3.total_users,0) total_users
from d4,d3   where   ( d4.spend_date = d3.spend_date(+)  and   d4.platform   =  d3.platform (+)) order by 1 ,2 desc ;

-----------
https://leetcode.com/problems/total-sales-amount-by-year/
1384 : Total Sales amount by year 

with d  as  ( select d.*,  ( substr( period_end,1,4) - substr( period_start,1,4)) + 1  l  from sales d),d1   as (
select *  from d,lateral ( select level l1  from dual connect by  level <= l)),d2 as 
 (
select  product_id ,case when  l1 = 1  then  to_date(period_start,'yyyymmdd')  else   to_date(substr(period_start,1,4) +l1-1 || '0101'  ,'yyyymmdd')  end period_start ,
case when l= l1  then to_date(period_end,'yyyymmdd')  else  to_date(substr(period_start,1,4) + l1 || '0101','yyyymmdd') -1  end period_end,average_daily_sales    from  d1 ) 
select  product.product_id , product_name , substr( to_char( period_start,'yyyymmdd') ,1,4)  report_year , ( period_end+1 - period_start) * average_daily_sales   total_amount 
  from  d2,product  where d2.product_id  = product.product_id
  

----------
with d  as   (select d.*,
min( score  )  over  ( partition by  exam_id ) min,
max( score  )  over  ( partition by  exam_id ) max
from exam d   ),d1  as (
select student_id  from d   where  score = min   union all 
select student_id  from d where score = max)
select d.student_id,d2.student_name  from d,student d2  where   d.student_id = d2.student_id   minus 
select d1.student_id,d2.student_name  from d1,student d2  where   d1.student_id = d2.student_id


1635. Hopper Company Queries I

select to_date(join_date,'yyyymmdd'),join_date  from drivers  where  join_date like '2020%';

with d  as  ( select '2020' ||   lpad(level,2,'0') mth  from dual connect by level <= 12 ),d1  as  (
select to_date(mth,'yyyymm') first_day1 ,last_day( to_date(mth,'yyyymm')) last_day_mth,driver_id , to_date(join_date,'yyyymmdd') join_date   from d,drivers   
where to_date(join_date,'yyyymmdd')   <= last_day( to_date(mth,'yyyymm')) ),d2  as (
select    last_day_mth ,count(unique  driver_id ) a1   from d1
group by last_day_mth) ,d3 as (
select  count( unique driver_id) a2 , last_day(to_date(substr(requested_at,1,6),'yyyymm')) requested_at     from Rides d ,AcceptedRides  d1,d d3 
where d.ride_id  = d1.ride_id 
and to_date(requested_at,'yyyymmdd')   <= last_day( to_date(mth,'yyyymm'))  group by  last_day(to_date(substr(requested_at,1,6),'yyyymm')) )
select row_number()  over (order by last_day_mth)  month  ,nvl(a1,0) active_drivers 
,nvl(a2,0)accepted_rides   from d2,d3  where   d2.last_day_mth = d3.requested_at(+) order by last_day_mth 

----------

with d  as  ( select '2020' ||   lpad(level,2,'0') mth  from dual connect by level <= 12 ),d1  as  (
select to_date(mth,'yyyymm') first_day1 ,last_day( to_date(mth,'yyyymm')) last_day_mth,driver_id ,  join_date   from d,drivers   
where join_date   <= last_day( to_date(mth,'yyyymm')) ),d2  as (
select    last_day_mth ,count(unique  driver_id ) a1   from d1
group by last_day_mth) ,d3 as (
select  count( unique driver_id) a2 , last_day(to_date(substr(requested_at,1,6),'yyyymm')) requested_at     from Rides d ,AcceptedRides  d1,d d3 
where d.ride_id  = d1.ride_id 
and to_date(requested_at,'yyyymmdd')   <= last_day( to_date(mth,'yyyymm'))  group by  last_day(to_date(substr(requested_at,1,6),'yyyymm')) )
select row_number()  over (order by last_day_mth)  month  ,nvl(a1,0) active_drivers 
,nvl(a2,0)accepted_rides   from d2,d3  where   d2.last_day_mth = d3.requested_at(+) order by last_day_mth 
;

with d as  (select  level l   from dual   connect by  level  <= ( select max( subtasks_count)  from tasks)) 
select  task_id ,l subtask_id   from  tasks  ,d    where    l <= subtasks_count minus 
select task_id,subtask_id  from Executed order by 1,2;


with  d1  as  (
select  trim(to_char(order_date,'DAY')) DAY1 , item_category Category    ,QUANTITY from orders ,Items 
where  Items.item_id = orders.item_id(+)     ) 
select  Category,nvl(MONDAY,0) MONDAY,
nvl(TUESDAY,0) TUESDAY,
nvl(WEDNESDAY,0) WEDNESDAY,
nvl(THURSDAY,0) THURSDAY,
nvl(FRIDAY,0) FRIDAY,
nvl(SATURDAY,0) SATURDAY,
nvl(SUNDAY,0) SUNDAY
from d1
pivot ( sum( quantity)  for DAY1  in ('MONDAY' as MONDAY,'TUESDAY' as TUESDAY ,'WEDNESDAY' as WEDNESDAY,'THURSDAY' as THURSDAY
,'FRIDAY' as FRIDAY ,'SATURDAY' as SATURDAY  ,'SUNDAY'as  SUNDAY)) order by 1


https://leetcode.com/problems/first-and-last-call-on-the-same-day/

with d  as   (select count(caller_id) over  (partition by caller_id,to_char(call_time,'yyyymmdd') )  counts_caller_id  ,
count(RECIPIENT_ID) over  (partition by RECIPIENT_ID,to_char(call_time,'yyyymmdd'))  counts_RECIPIENT_ID,
CALLER_ID,RECIPIENT_ID,to_char(call_time,'yyyymmdd')  call_time
from  calls order by  5)
select  caller_id  from d  where counts_caller_id =1   and counts_RECIPIENT_ID =1  union 
RECIPIENT_ID  from d  where counts_caller_id =1   and counts_RECIPIENT_ID =1  ;

with  s2 as ( select caller_id,recipient_id ,to_char(call_time,'yyyymmdd') call_time  from calls) 
,d as   (select  greatest(caller_id,recipient_id) caller_id ,least( caller_id,recipient_id)recipient_id ,call_time  from s2),d1  as (
select  count(*) c1 ,caller_id ,recipient_id,call_time  from d  group by caller_id ,recipient_id ,call_time ),d2  as (
select  caller_id  from d1 where c1 =2  union 
select recipient_id  from d1 where c1>=2 ) ,d3 as (
select count( caller_id)  over  (partition by call_time,caller_id) c2 , count( recipient_id)  over  (partition by call_time,recipient_id) c3,caller_id,
recipient_id,call_time 
from d1 where c1 <=1 ) ,d4 as (
select  caller_id   from d3   where c2 =1  and c3 = 1 union 
select  recipient_id   from d3   where c2 =1  and c3 = 1)
select caller_id  user_id  from d2 union 
select *  from d4 order by 1
---------------
with d  as   ( select  greatest(caller_id,recipient_id) caller_id ,least( caller_id,recipient_id) recipient_id
,call_time  from calls   ) ,d1  as (
select  count(*)  c1 , caller_id ,recipient_id, call_time from d
group by  caller_id ,recipient_id, call_time    ),d2  as (
select  caller_id ,recipient_id, call_time, count(caller_id)  over ( partition by caller_id,call_time) c_caller,
count(recipient_id)  over ( partition by recipient_id,call_time) c_recipient
from d1 where c1 =1  order by 4)
select caller_id    from d2 where  c_caller =1 union 
select recipient_id   from d2   where c_recipient =1  union 
select  caller_id  from d1  where c1 =2  union 
select recipient_id from d1  where c1 =2 
order by 1 

with d as  ( select a.*    from candidates a order by 2,3),d1  as (
select d.*  ,sum(salary)  over  (partition by experience 
order by  rownum  ) sn,70000 as budget from d),d2  as  (
select d1.* ,count(*) over () accepted_candidates  ,(budget- max(sn)   over ())  left_budget 
from d1 where experience = 'Senior'  and sn < budget
),d3 as (
select d1.* ,count(*) over () accepted_candidates  ,(budget- max(sn)   over ())  left_budget 
from d1 where experience != 'Senior'  and sn <= (select  decode((select count(*)  from d2)  ,0,70000,(select unique left_budget
from d2 ))  from dual)),d4 as (
select  unique experience,accepted_candidates  from d2 union all 
select  unique experience,accepted_candidates  from d3  union all
select 'Junior',0   from dual union all
select 'Senior',0  from dual ) 
select experience,sum(accepted_candidates)  accepted_candidates from d4  
group by experience order by 1 desc 

--------------

with d as  ( select a.*    from candidates a order by 2,3),d1  as (
select d.*  ,sum(salary)  over  (partition by experience 
order by  rownum  ) sn,70000 as budget from d),d2  as  (
select d1.* ,count(*) over () accepted_candidates  ,(budget- max(sn)   over ())  left_budget 
from d1 where experience = 'Senior'  and sn < budget
),d3 as (
select d1.* ,count(*) over () accepted_candidates  ,(budget- max(sn)   over ())  left_budget 
from d1 where experience != 'Senior'  and sn <= (select  decode((select count(*)  from d2)  ,0,70000,(select unique left_budget
from d2 ))  from dual))
select employee_id  from d2 union 
select employee_id  from d3 order by 1 


with d  as  (select instr(upper(content),upper(word) ) abc ,keywords.*,posts.*  from keywords ,posts  where instr(upper(content) || ' ' ,upper(word) || ' ' ) >= 1    ),d1 as (
select  unique  post_id,topic_id   from d)
select  post_id ,listagg(topic_id,',') within group (    order by topic_id)  topic       from d1  group by post_id  union all  
select post_id,'Ambiguous!'  from posts  where post_id not in (select post_id  from d1)

with d  as  (select INVOICE_ID, a.PRODUCT_ID, QUANTITY, PRICE  from purchases a,products a1
where a.product_id  = a1.product_id ),d1  as (
select invoice_id ,sum( price*quantity )  sum1  from d
group by invoice_id),d2 as (
select d1.* ,dense_rank()  over  ( partition by  sum1 order by  sum1,invoice_id) rk1 ,max(sum1) over () m1  from d1)
select d1.product_id,quantity ,price*quantity price from d2,purchases d1,products d3  where d2.sum1 = m1 and rk1 =1
and  d2.invoice_id = d1.invoice_id and d3.product_id =d1.product_id

/* Write your PL/SQL query statement below */
with s1 as  
(select  hall_id ,to_char(start_day,'yyyy-mm-dd') start_day  ,to_char(end_day,'yyyy-mm-dd') end_day  from hallevents ),
d  as   (select a.*  ,lead( start_day,1) over ( partition by hall_id  order by start_day ) start_day1 from s1 a
order by 1,2),d1 as (
select hall_id,start_day,end_day   from d where end_day >= start_day1 union all
select  hall_id,start_day,end_day   from s1  where (hall_id,start_day) in (select hall_id ,start_day1 
from d  where end_day >= start_day1 )  ),d2 as (
select d1.*,'A' INDI from d1 union all
select d2.*,'B'  from s1 d2 where  
(hall_id,start_day,end_day)  not in (select *  from d1))
--select *  from d2 order by 1 ,2
select  hall_id ,min(start_day) start_day  ,max(end_day) end_day  from d2
group by hall_id ,INDI order by 1 ,2




HallEvents table:
+---------+------------+------------+
| hall_id | start_day  | end_day    |
+---------+------------+------------+
| 1       | 2023-01-13 | 2023-01-14 |
| 1       | 2023-01-14 | 2023-01-17 |
| 1       | 2023-01-18 | 2023-01-25 |
| 2       | 2022-12-09 | 2022-12-23 |
| 2       | 2022-12-13 | 2022-12-17 |
| 3       | 2022-12-01 | 2023-01-30 |

drop table hallevents ;
create table hallevents ( hall_id int ,start_day date ,end_day date )
insert into hallevents values ( 1,to_date('2023-01-13','yyyy-mm-dd') ,to_date('2023-01-14','yyyy-mm-dd') );
insert into hallevents values ( 1,to_date('2023-01-14','yyyy-mm-dd') ,to_date('2023-01-17','yyyy-mm-dd') );
insert into hallevents values ( 1,to_date('2023-01-18','yyyy-mm-dd') ,to_date('2023-01-25','yyyy-mm-dd') );
insert into hallevents values ( 2,to_date('2022-12-09','yyyy-mm-dd') ,to_date('2022-12-23','yyyy-mm-dd') );
insert into hallevents values ( 2,to_date('2022-12-13','yyyy-mm-dd') ,to_date('2022-12-17','yyyy-mm-dd') );
insert into hallevents values ( 3,to_date('2022-12-01','yyyy-mm-dd') ,to_date('2023-01-30','yyyy-mm-dd') );
select *  from hallevents 

with d  as  (select a.* ,decode(result,'Win',0,1) ab from matches a),d1  as 
(select d.* ,sum(ab) over  ( partition by  player_id order by match_day) ab1  from d
order by 1,2),d2 as (
select player_id,count(*) longest_streak  from d1 where Result = 'Win'
group by player_id,ab1),d4  as(
select d2.* ,max( longest_streak)  over  (partition by  player_id) lng from d2 )
select unique player_id, longest_streak from d4 where longest_streak = lng union all
select  unique player_id ,0  from matches where player_id not in (select player_id  from d4)
order by 1


with d as  (select  a.* ,lead(start_day) over ( partition by hall_id order by start_day ) start_day1
from hallevents  a),d1  as (
select hall_id,start_day,end_day ,start_day1  from d   where exists ( select *  from hallevents d1 where d.hall_id = d1.hall_id
and  d.start_day1 <= d1.end_day    and   d.start_day  != d1.start_day ) )
,d2 as (
select hallevents.*,'A' type   from hallevents where (hall_id,start_day)  in
(select hall_id,start_day  from d1 union all
select hall_id,start_day1  from d1) union all
select hallevents.*,'B' type  from hallevents where (hall_id,start_day) not  in
(select hall_id,start_day  from d1 union all
select hall_id,start_day1  from d1) )
select hall_id ,to_char(min(start_day),'yyyy-mm-dd')  start_day,to_char(max(end_day),'yyyy-mm-dd')  end_day from d2
group by hall_id ,type  order by 1,2 ;
truncate table hallevents
describe hallevents
insert into hallevents values (3 ,to_date('2023-01-13','yyyy-mm-dd'),to_date('2023-01-31','yyyy-mm-dd'));
insert into hallevents values (2 ,to_date('2023-01-04','yyyy-mm-dd'),to_date('2023-01-15','yyyy-mm-dd'));
insert into hallevents values (2 ,to_date('2023-01-20','yyyy-mm-dd'),to_date('2023-01-22','yyyy-mm-dd'));
insert into hallevents values (2 ,to_date('2022-12-08','yyyy-mm-dd'),to_date('2023-01-04','yyyy-mm-dd'));
insert into hallevents values (2 ,to_date('2022-12-13','yyyy-mm-dd'),to_date('2023-01-26','yyyy-mm-dd'));
insert into hallevents values (3 ,to_date('2022-12-14','yyyy-mm-dd'),to_date('2022-12-22','yyyy-mm-dd'));
insert into hallevents values (2 ,to_date('2022-12-09','yyyy-mm-dd'),to_date('2023-01-05','yyyy-mm-dd'));
insert into hallevents values (3 ,to_date('2023-01-05','yyyy-mm-dd'),to_date('2023-01-21','yyyy-mm-dd'));
insert into hallevents values (3 ,to_date('2022-12-10','yyyy-mm-dd'),to_date('2023-01-26','yyyy-mm-dd'));
insert into hallevents values (3 ,to_date('2022-12-04','yyyy-mm-dd'),to_date('2022-12-09','yyyy-mm-dd'));


with d  as  (select a.* ,month- 3 ref  from employee  a order by 1,2),d1  as (
select d.id,d.month,sum(employee.salary) Salary   from d,employee   where d.id = employee.id  and   employee.month > ref   and employee.month <= d.month
group by d.id,d.month
order by 1,2 desc ),d2 as (
select d1.* ,max(month)  over  ( partition by  id ) m1  from d1)
select id,month,salary  from d2 where month != m1 order by 1,2  desc



with d  as  (select a.customer_id  from Transactions a,Transactions b 
where a.customer_id = b.customer_id  and ( a.transaction_date - b.transaction_date = 1 )  or (a.transaction_date = b.transaction_date)  ),d1  as (
select customer_id,count(*) c1  from d
group by 
customer_id)
select *  from d
select customer_id  from d1  where  c1 in (select max(c1)  from d1)
order by 1 

truncate table Transactions
select   customer_id   from Transactions  order by 1
drop table TRANSCATIONS
drop  table  Transactions
create table Transactions( transaction_id int , customer_id int , transaction_date varchar2(10), amount int );

--------------

 with   d1  as  (
  select d.* ,dense_rank()  over ( partition by  player_id order by event_date )  d2, lead(event_date,1) 
  over  (partition by  player_id  order by event_date ) ld1   from activity d order by 3,1),install_counts as (
  select event_date ,count(*) installs   from d1 where d2 = 1 group by event_date),rentention_time as (
  select  event_date ,count(*) Day1_retention    from d1      where ld1 - event_date =1 
  and d2 =1    group by event_date   ) 
  select  to_char(d.event_date,'yyyy-mm-dd') install_dt ,d.installs,case when Day1_retention  is null then 0  else round(Day1_retention/installs,2)
  end  Day1_retention from install_counts  d ,rentention_time d1 
  where d.event_date = d1.event_date(+)
  
  
  with d  as   (select TRANSACTION_ID, CUSTOMER_ID,  TRANSACTION_DATE, AMOUNT  from Transactions  ),d1  as (
select d.* ,dense_rank() over  ( partition by CUSTOMER_ID  order by TRANSACTION_DATE ) d1  from d ),d3  as (
select  CUSTOMER_ID,TRANSACTION_DATE - d1 d2 ,count(*) c1  from d1
group by TRANSACTION_DATE - d1,CUSTOMER_ID)
select CUSTOMER_ID  from d3  where c1  in (select max(c1)  from d3) order by 1 

----------------

with d  as  (select d.* ,  to_date(case when   substr( TRANSACTION_DATE,5,1) != 1 then    substr( TRANSACTION_DATE,1,4)|| '0'|| substr( TRANSACTION_DATE,5,1) || 
lpad( substr( TRANSACTION_DATE,6,2),2,'0')  
end ,'yyyymmdd') TRANSACTION_DATE1 from Transactions d),d1  as (
--select *  from d 
select  d.* ,TRANSACTION_DATE1 - dense_rank()  over ( partition by customer_id order by TRANSACTION_DATE1) t1
from d ),d2  as (
select  d1.* ,count(t1) over (partition by customer_id ,t1 ) c1   from d1),d3  as (
select d2.* ,nvl(lead( amount)  over ( partition by  customer_id order by  TRANSACTION_DATE1) ,amount +10 ) t2 
from  d2  where c1  >=3 ),d4  as (
select  d3.* ,count(customer_id ) over ( partition by customer_id )  c2   from d3  where t2> amount )
select *  from d4  where c1 = c2 

with d  as  (select  ORDER_ID, CUSTOMER_ID, substr(ORDER_DATE,1,4) ORDER_DATE, PRICE  from orders ),d1  as (
select  customer_id ,sum(price)  price,ORDER_DATE from d  group by customer_id,ORDER_DATE)
select d1.*  ,max(order_date)over ( partition by  customer_id )  -min( order_date)  over ( partition by  customer_id ) from d1


--------------------20230310

with d  as  (select d.* ,count(d.TRANSACTION_DATE)  over  ( partition by  d.TRANSACTION_DATE) trans_count    from Transactions d),d1 as (
select  unique  TRANSACTION_DATE, trans_count,user_id from d ),d2  as (
select nvl(trans_count,0) transactions_count  ,count(*)visits_count    from d1 right outer join visits d on  d1.transaction_date   =   d.visit_date   and   d.user_id = d1.user_id 
group by nvl(trans_count,0)  ) ,d3 as (
select *  from d2 union all
select  level ,0  from dual connect by level <= (select  max(trans_count)-1  from   d)
)
select  transactions_count,sum(visits_count) visits_count  from  d3 group by transactions_count order by 1 

------------------

with d as  ( select    ' '|| content || ' '  content ,post_id from posts),d1  
as (select  ' ' ||  word || ' '  word  ,topic_id  from keywords),d2  as  (
select  unique post_id ,topic_id   from d,d1
where   instr(upper(content) ,upper(word)) >= 1 ),d3  as (
select    p.post_id,  
--decode( d2.topic_id,null, 'Ambiguous!',d2.topic_id)
listagg( d2.topic_id,',')  within  group (     order  by  d2.topic_id )  
 topic   from      d2 ,posts   p 
where p.post_id =    d2.post_id (+)  group by  p.post_id  order by   1) 
select  post_id ,decode( d3.topic,null, 'Ambiguous!',d3.topic) topic  from d3
;


 with s1 as (
 select unique   d.user_id user1_id ,d1.user_id  user2_id ,d.day,d.song_id   from listens d ,listens d1 
 where ( d.song_id = d1.song_id  and  d.day = d1.day  ) and d.user_id != d1.user_id 
 order by 1,2),s2 as (
select  user1_id,user2_id,day  from s1
group  by user1_id,user2_id,day having count(*) >=3 ),s3 as  (
select user1_id user_id , user2_id  recommended_id  from s2  minus 
select *  from friendship)
select *  from s3  where  (greatest(user_id,recommended_id),least(user_id,recommended_id)) not in 
 (select  greatest(user1_id,user2_id),least(user1_id,user2_id)  from  friendship)  
 
 -------------
 select *  from buses ;
select *  from passengers d ,buses   d1 
where  d.arrival_time  <= d1.arrival_time   
 order by   d.arrival_time ,bus_id ;
 
 select  *  from passengers ;
 with   d1  as  (
 select d.*  , nvl(lag(arrival_time) over  (order by   arrival_time ),arrival_time )   next_arrival   from buses d )
 select *  from passengers d ,   d1 
where  d.arrival_time  <= d1.arrival_time   
 order by   d.arrival_time ,bus_id ,passenger_id ;


with d as  (select d.* ,rank()  over (  partition by  arrival_time order by passenger_id) a  from passengers  d )
select *  from  d , buses  d1 
where  d.arrival_time  <= d1.arrival_time   
 order by   d.arrival_time ,bus_id ,passenger_id ; 
select  *  from  dual where a =1234;




 






 



















































hello
