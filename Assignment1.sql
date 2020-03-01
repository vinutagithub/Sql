#Dislplay location_id, City and Country_id by ordering cities in asc and countries in Desc order.
		use hr;

		select l.location_id, l.city, c.country_id
		from locations as l, countries as c
		where c.country_id= l.country_id
		order by 
		l.city asc,
		c.country_name desc;

# Employee who is an IT programmer and who has more than 5 year of experiance

		select hire_date,current_date(),timestampdiff(year,hire_date,current_date()) from employees
		where timestampdiff(year,hire_date,current_date()) > 30;
		;

# Employee who is an IT programmer and who has more than 5 year of experiance [ if i am using job_history and employee table]

		select * from employees
		where job_id='IT_PROG'
		and employee_id =
		(select j.employee_id from job_history as j where timestampdiff(year,end_date,start_date) > 5 );

#Employee whose salary i>5000 and who are sales rep's or employees who belong to dept -60

		select * from employees
		where job_id='SA_REP' or department_id=60;
        
#Select first_name,dept_name,dept_id, salary from employees table and department table based on all commom column

		
		select e.first_name,d.department_name,d.department_id,e.salary 
        from employees as e, departments as d
		where e.department_id = d.department_id and e.manager_id=d.manager_id;
        
#Write a query to Select first_name, dept name, deptid,salary  from employees table and departments table  based on dept id

		select e.first_name,d.department_name,e.salary 
        from employees as e, departments as d
		where e.department_id = d.department_id;

#Write a query to Select  city, firstname, deptname  for an employee


		Select e.first_name,d.department_name,l.city
		from employees as e, departments as d, locations as l
		where e.department_id=d.department_id and l.location_id=d.location_id;

#Write a query to fetch  empname, deptname and deptid  of all the departments with and without employees.





#query to find min sal under each job category in specific  department.

		Select d.department_id,d.department_name,min(e.salary)
		from departments as d, employees as e
		where d.department_id=e.department_id
		group by d.department_id
		order by d.department_id;

#write a query to find location_ids common to department and location table

		select distinct location_id 
		from departments
		where location_id in (select location_id from locations);

#write a query to fetch employee firstname and street adress (use emp table and locations table and departments table)

#used distinct as firstname with same address was repeated

		Select distinct e.first_name, l.street_address
		from employees as e, departments as d, locations as l
		where e.department_id=d.department_id and l.location_id=d.location_id
		order by l.street_address,e.first_name;
