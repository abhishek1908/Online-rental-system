declare
	uname user_credential.username%type;
	pwd user_credential.password%type;
	temp user_credential%rowtype;
	ustatus varchar(20);
	null_not_allowed EXCEPTION;
	PRAGMA EXCEPTION_INIT(null_not_allowed, -01400);
begin
	uname:='&UserName';
	pwd:='&Password';	
	if :loggedin=0 then
		select * into temp from user_credential where username=uname and password=pwd;
			
		if temp.user_status=2 then
			ustatus := 'Register User';
		elsif temp.user_status=1 then
			ustatus := 'ADMIN';	
		end if;
		:loggedin := 1;
		:currentuser := uname;
		:currentstatus := temp.user_status;
		dbms_output.put_line('*********************************************************************');
		dbms_output.put_line('Welcome '|| uname|| '(' ||ustatus|| ')' );
	else
		dbms_output.put_line('*********************************************************************');
		dbms_output.put_line('You are already logged in...');
	end if;
	exception
		when no_data_found then
			:loggedin := 0;
			:currentuser := ' ';
			:currentstatus := -1;
			dbms_output.put_line('*********************************************************************');
			dbms_output.put_line('Invalid username/password entered...');
		when null_not_allowed then
			dbms_output.put_line('*********************************************************************');
			dbms_output.put_line('Null values not allowed...');
		end;
/