set serveroutput on;
declare 
	ename employee.name%type;
	addr employee.address%type;
	phno employee.phone%type;
	dob employee.dob%type;
	hdate employee.hiredate%type;
	nullnotallowed exception;
begin
	
	ename := '&name';
	addr := '&address';
	phno := '&phoneno';
	dob := '&date_of_birth';
	hdate := '&hiredate';
	if ename is NULL or addr is NULL or phno is NULL or dob is NULL or hdate is NULL
	then
	  raise nullnotallowed;
	end if;  
	add_employee(ename,addr,phno,dob,hdate);
	exception
		when nullnotallowed then
			dbms_output.put_line('------------------------');
			dbms_output.put_line('Null value not allowed!!');
			dbms_output.put_line('------------------------'); 
end;
/