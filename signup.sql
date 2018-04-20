declare
	uname user_credential.username%type;
	pwd user_credential.password%type;
	cpwd user_credential.password%type;
	ustatus user_credential.user_status%type;
	null_not_allowed EXCEPTION;
	PRAGMA EXCEPTION_INIT(null_not_allowed, -01400);
begin
	uname :='&username';
	pwd:='&password';
	cpwd:='&ConfirmPassword';
	ustatus := 2;
	if pwd = cpwd then
		signup_user(uname,pwd,ustatus);
	else
	    dbms_output.put_line('Password donot match');
	end if;    	
	exception
		when null_not_allowed then
			dbms_output.put_line('*********************************************************************');
			dbms_output.put_line('Null values not allowed...');
end;
/