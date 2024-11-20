create database companydb ;
use companydb ;

create table workers_9 (
worker_id int primary key,
firstname char (25),
lastname char (25),
salary int ,
joiningdate datetime,
department char (25)
);

insert into  workers_9 (worker_id,firstname,lastname,salary,joiningdate,department) values
(1,'john','doe',50000,'2024-01-01 10:00:00','hr'),
(2,'jane','smith',60000,'2023-06-15 09:00:00','finance'),
(3,'sam','brown',55000,'2022-09-10 08:30:00','it');

delimiter $$
create procedure addworkers_9(in  p_worker_id int ,
in p_firstname char(25),
in p_lastname char(25),
in p_salary int,
in p_joiningdate datetime,
in p_department char(25)
)
begin
insert into workers_9(worker_id,firstname,lastname,salary,joiningdate,department)
values(p_worker_id, p_firstname, p_lastname, p_salary, p_joiningdate, p_department) ;
end $$
delimiter ;

call addworkers_9(4, 'alice','rose',45000,'2023-07-01 10:00:00','manager') ;

delimiter $$
create procedure getsalary 
(in p_worker_id int,
out p_salary int )
begin
select salary into p_salary from workers_9
where worker_id = p_worker_id ;
end $$
delimiter ;

call getsalary (1,@salary) ;
select @salary ;

delimiter $$
create procedure updatedepartment( in p_worker_id int, in p_department char(25)
)
begin
update workers_9
set department = p_department
where worker_id = p_worker_id ;
end $$
delimiter ;

call updatedepartment (1, 'finance') ;

delimiter $$
create procedure countworkersbydepartment(
in p_department char (25),
out p_workercount int
)
begin
select count(*) into p_workercount
from workers_9
where department = p_department ;
end $$
delimiter ;

call countworkersbydepartment ('hr',@workercount) ;
select @workercount ;

delimiter $$
CREATE PROCEDURE AvgSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_AvgSalary DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary
    FROM Workers_9
    WHERE Department = p_Department;
    end $$
    delimiter ;
    
    CALL AvgSalaryByDepartment('finance', @AvgSalary);
SELECT @AvgSalary; 



































