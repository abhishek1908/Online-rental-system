set serveroutput on;

declare 
	cursor emp_cur is select * from employee;
	row_emp emp_cur%rowtype;
	NL constant varchar2(1):=CHR(9);
begin
	open emp_cur;
	dbms_output.put_line(rpad('Name',10,' ')||NL||rpad('Address',10,' ')||NL
		||rpad('Phone no',10,' ')||NL||rpad('Dateofbirth',10,' ')||NL||rpad('Hiredate',10,' ')||NL
		||rpad('Status',10,' '));
	dbms_output.put_line('***************************************************************************************');
	loop
	fetch emp_cur into row_emp;
	exit when emp_cur%NOTFOUND;
	dbms_output.put_line(rpad(row_emp.name,10,' ')||NL||rpad(row_emp.address,10,' ')||NL
		||rpad(row_emp.phone,10,' ')||NL||rpad(row_emp.dob,10,' ')||NL||rpad(row_emp.hiredate,10,' ')||NL
		||rpad(row_emp.status,10,' '));
	end loop;
	close emp_cur;
end;
/