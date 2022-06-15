  Richard To
 SQL : , SQL Tuning : The Past, Present and Future

SQL Tuning : The Past, Present and Future
· Some past manual SQL tuning techniques for the old rule based SQL optimizer · Basic concept of cost based SQL optimizer and its limitations · Oracle12C newly enhanced SQL optimizer · Highlight some current useful manual SQL tuning tips · What are today's SQL tuning tools doing · Future computer-aided SQL tuning trend

Some Old Tuning Techniques for Old Rule-Based SQL optimizer

Select * from A,B Where A.key=B.key
Select * from B,A Where A.key=B.key

Select * from A Where A.key in (select
B.key from B)

Select * from A order by A.key

Select * from A Where A.key<9999999999999 order by A.key

Select * from A Where exists (select `x' from B
where A.key=B.key)
Select * from A Where A.key<12345 Select * from A Where A.key<12345
and A.key<12345

How does Oracle handle SQL?
Server received SQL
Quest is a highly innovatPivaerse company focused on helping companies simplifyRaDnBMdSrSeQdL uopctiemizer
determine the execution path
the cost of managing IT
Bind
Execute

The limitations of database internal SQL optimizer

Complex SQL rewrite limitation
SQL

SQL Rewrite
1+
Generate
multiple execution
plans

Plan 1
2Plan 2
Plan 3

Big plan space may be trim down It cannot generate all possible plans
Cost Estimation

3 Plan 1 cost=1000
Plan 2 cost=3000 Plan 3 cost= 500

How accurate is the cost estimation ?
Execution

Can Tianhe-II() solve this problem?
If DBMS Optimizer will consider which join path is the best :
Select * from A,B,C,D... /* 25 tables join together */ Where ...
Which one is best ? Permutation = 25! = 25x24x23x22x21x ...
= 15511210043330985984000000
Rpeak= 54,902.4TFLOPS per second 54,902.4
Assume each permutation use only one computer calculation
Processing time = 215 years

What is SQL tuning?
Same result

SQL

Plans Maze

Some special techniques 1

Hide the hardcoded literals
SELECT * FROM employee E, department D, emp_salary_history H WHERE D.department_id = 'HR' AND E.emp_department_id = D.department_id AND E.emp_id < 10 AND H.sal_department_id = E.emp_department_id AND H.sal_emp_id = E.emp_id

SQL

SQL Rewrite +
G e ne r a te
multiple e x e cuti o n
plans

Plan 1 Plan 2 Plan 3

Cost Estimation

Plan 1 cost=1000
3Plan 2 cost=3000
Plan 3 cost= 500

Ex e cuti o n

SELECT * FROM employee E, department D, emp_salary_history H WHERE D.department_id ='HsRu'bstr(UID,1,0)||'HR' AND E.emp_department_id = D.department_id AND E.emp_id < 10 AND H.sal_department_id = E.emp_department_id AND H.sal_emp_id = E.emp_id

SELECT * FROM employee E, department D, emp_salary_history H WHERE D.department_id ='sHuRb'str(UID,1,0)||'HR' AND E.emp_department_id = D.department_id AND E.emp_id < 10 +uid*0 AND H.sal_department_id = E.emp_department_id AND H.sal_emp_id = E.emp_id

Some special techniques 2

Control join path for subquery
SELECT * FROM department
Where dpt_id in (select emp_dept from employee
where emp_name < 'B') and dpt_name < 'D'
Rewrite to :

SQL

1SQL Rewrite + G e ne r a te
multiple e x e cuti o n
plans

Plan 1 Plan 2 Plan 3

Cost Estimation

Plan 1 cost=1000 Plan 2 cost=3000 Plan 3 cost= 500

Ex e cuti o n

SELECT *
FROM department Where dpt_id in (select emp_dept||''
from employee where emp_name < 'B')
and dpt_name < 'D'

SELECT department.* FROM department,employee
Where dpt_id = emp_dept||'' and emp_name < 'B' and dpt_name < 'D'

select min(emp_salary) from employee

Some special techniques 3

select min(emp_salary), max(emp_salary), count(*)
from employee
with t1(a) as (select min(emp_salary) from employee), t2(b) as (select max(emp_salary) from employee), t3(c ) as (select count(*) from employee)
select a, b, c from t1, t2, t3

Bind sensitive & adaptive cursor sharing

SQL

Parse

SQL Reoptimize

RDBMS SQL optimizer determine the execution paths

Cardinality feedback

Execute

Bind Sensitive
Bind
Adaptive Cursor Sharing

What is SQL Reoptimization in Oracle12c

SQL-A

First

Collect actual

Execution

statistics

Feedback

SQL-A

Second Execution

New Query Plan

If there is a problem you can add a hint to stop re-optimize your SQL with : /*+ NO_AUTO_REOPTIMIZE */

What is Adaptive Plans in Oracle12c

What are today's SQL tuning tools doing
Category 1
Visualize Explain Plan function to help users to discover any potential problems with preliminary recommendations Such as : Dell Toad, Oracle OEM, DB Optimizer and etc...
Category 2
Use sophisticated AI SQL rewrite technology Such as : Dell Toad, Dell SQL Optimizer

The evolving database SQL optimizer

SQL

Parse

SQL Reoptimize

RDBMS SQL optimizer determine the execution paths

Bind Sensitive Bind
Adaptive Cursor Sharing

Cardinality feedback

Execute

Adaptive Plans

Switch between Hash Join & Nested Loop

The past database SQL optimizer

SQL

Plan Space

Quest is a highlPyarse i nnovati ve company focused on helping companieRsDBsMiSmSpQLl iofpytimizer and reddetuercmeineththee ecxeocsuttion paths of managing IT
Execute

The present database SQL optimizer

SQL

Plan Space

Quest is a highlPyarse i nnovati ve company focused on helping companieRsDBsMiSmSpQLl iofpytimizer and reddetuercmeineththee ecxeocsuttion paths of managing IT
Execute

The future database SQL optimizer

SQL

Plan Space

Quest is a highlPyarse i nnovati ve company focused on helping companieRsDBsMiSmSpQLl iofpytimizer and reddetuercmeineththee ecxeocsuttion paths of managing IT
Execute

The future database SQL optimizer

Configuration sensitive

Resource sensitive

Data sensitive

Future Computer-aided SQL Tuning
·It is hard to predict which execution plan it will use during execution ·Manual tuning will become more difficult ·Discover potential problematic SQL is important ·Computer-aided SQL tuning tools will be popular

Plan

SQL

Space

Parse

Bind Sensitive Adaptive Cursor Sharing

Bind

SQL Reoptimize

RDBMS SQL optimizer

determine the execution paths

Cardinality feedback

Execute

 


ORA



Oracle

z3 ­ SQL

zData ­ 

BayMax

 

Q & A

