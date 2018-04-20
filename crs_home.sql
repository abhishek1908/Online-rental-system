declare
	NL constant varchar2(1):=CHR(9);
begin
	dbms_output.put_line(NL);
	if :loggedin=0 then
		dbms_output.put_line(NL||'Welcome to the Online Car Rental SYSTEM');
		dbms_output.put_line(NL||'*********************************************************************');
		dbms_output.put_line(NL);
		dbms_output.put_line(NL||'Your current options are :-');
		dbms_output.put_line(NL||NL||'@view_cars: '||NL||'View Car n Rates');
		dbms_output.put_line(NL||NL||'@login : '||NL||'Log in');
		dbms_output.put_line(NL||NL||'@signup : '||NL||'Sign up');

	elsif :currentstatus=2 then
		dbms_output.put_line(NL||'Welcome User');
		dbms_output.put_line(NL||'*********************************************************************');
		dbms_output.put_line(NL);
		dbms_output.put_line(NL||'Your current options are :-');
		dbms_output.put_line(NL);
		dbms_output.put_line(NL||NL||'@view_info: '||NL||'View Personal Information');
		dbms_output.put_line(NL||NL||'@edit_profile: '||NL||'Edit User Profile');
		dbms_output.put_line(NL||NL||'@change_password: '||NL||'Change Password');
		dbms_output.put_line(NL||NL||'@view_cars: '||NL||'View Car n Rates');
		dbms_output.put_line(NL||NL||'@book_cars: '||NL||'Book Car for rent');
		dbms_output.put_line(NL||NL||'@add_licence'||NL||'Add Licence');
		dbms_output.put_line(NL||NL||'@return_cars: '||NL||'Return Car');
		dbms_output.put_line(NL||NL||'@bill_details: '||NL||'Bill Receipt');
		dbms_output.put_line(NL||NL||'@logout: '||NL||'Log out');

	elsif :currentstatus = 1 then
		dbms_output.put_line(NL||'Welcome Admin');
		dbms_output.put_line(NL||'*********************************************************************');
		dbms_output.put_line(NL);
		dbms_output.put_line(NL||'Your current options are :-');
		dbms_output.put_line(NL);
		dbms_output.put_line(NL||NL||'@view_info: '||NL||'View Personal Information');
		dbms_output.put_line(NL||NL||'@change_password: '||NL||'Change Password');
		dbms_output.put_line(NL||NL||'@view_cars: '||NL||'View Car n Rates');
		dbms_output.put_line(NL||NL||'@add_cars: '||NL||'Add cars and rates');
		dbms_output.put_line(NL||NL||'@addemployee: '||NL||'Add Employee');
		dbms_output.put_line(NL||NL||'@view_employee: '||NL||'Display Employee');
		dbms_output.put_line(NL||NL||'@delete_cars: '||NL||'Remove Car details');
		dbms_output.put_line(NL||NL||'@delete_employee: '||NL||'Remove Employee details');
		dbms_output.put_line(NL||NL||'@logout: '||NL||'Log out');	
	end if;	
end;
/