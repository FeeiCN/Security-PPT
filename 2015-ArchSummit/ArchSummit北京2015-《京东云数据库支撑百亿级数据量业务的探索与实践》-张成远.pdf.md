ArchSummit 2015
 
 @NEU_


1. 2. 3. 4.






1./DBA 2. 3./ 4. 5.DML 6.DDL 7./ 8./

-



JProxy





JProxy
1., 2.+ 3.LRU+, ,IO

JProxy

JProxy I/O 

Redis I/O 

Ningx I/O 

JTransfer

JTransfer

----

----SQL
select * from student

----SQL
select * from student where student_id=5

----join
select * from student, subject_score where student.student_id=subject_score.student_id

----join
select * from student, subject_score where student.student_id=subject_score.student_id and student.student_id=5

----join
select * from student, subject_score, subject where student.student_id=subject_score.student_id and subject_score.subject_id=subject.subject_id

----join
(1) select * from student, subject_score where student.student_id=subject_score.student_id and student.student_id=1 and student_score.subject_id='001'
(2) select * from subject where subject.subject_id='001'

----

----+

----

-
1.  2.  3. 

-
1. sql 2.  3.   4. 

-
1.  2.  3.   4. 

 @NEU_

