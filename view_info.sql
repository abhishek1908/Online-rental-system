declare
	cursor cur_user is select * from user_credential where username = :currentuser;
	row_user cur_user%rowtype;
	row2 user_details%rowtype;
	NL constant varchar2(1):=CHR(7);
	null_not_allowed EXCEPTION;
	PRAGMA EXCEPTION_INIT(null_not_allowed, -01400);
begin
if :loggedin = 1 then
	if :currentstatus=2 then
		open cur_user;
		fetch cur_user into row_user;
		select * into row2 from user_details where userid = row_user.userid;
		dbms_output.put_line(rpad('FirstName',13,' ')||NL||rpad('LastName',13,' ')||NL
		||rpad('Address',13,' ')||NL||rpad('Phoneno',13,' ')||NL||rpad('DOB',13,' ')||NL
		||rpad('Age',13,' '));
		dbms_output.put_line('****************************************************************************');
		dbms_output.put_line(rpad(row2.firstname,13,' ')||NL||rpad(row2.lastname,13,' ')||NL
		||rpad(row2.address,13,' ')||NL||rpad(row2.phoneno,13,' ')||NL||rpad(row2.dob,13,' ')||NL
		||rpad(row2.age,13,' '));
		close cur_user;
	elsif :currentstatus = 1 then
		open cur_user;
		fetch cur_user into row_user;
		dbms_output.put_line(rpad('UserName',13,' ')||NL||rpad('Password',13,' ')||NL
		||rpad('Status',13,' '));
		dbms_output.put_line('******************************************************');
		dbms_output.put_line(rpad(row_user.username,13,' ')||NL||rpad(row_user.password,13,' ')||NL
		||rpad('ADMIN',13,' '));
		close cur_user;
	end if;
end if;	
	exception
		when no_data_found then
		    dbms_output.put_line('No data is persent!!');
		    dbms_output.put_line('Move to edit profile : @editprofile');

end;
/