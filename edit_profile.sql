declare
	cursor c1 is select * from user_credential where username = :currentuser;
	row1 c1%rowtype;
	uid user_details.userid%type;
	uname user_details.username%type;
	fname user_details.firstname%type;
	lname user_details.lastname%type;
	addr user_details.address%type;
	phno user_details.phoneno%type;
	dob user_details.DOB%type;
	age user_details.age%type;
	null_not_allowed EXCEPTION;
	PRAGMA EXCEPTION_INIT(null_not_allowed, -01400);
begin
if :loggedin = 1 then
	if :currentstatus = 2 then
		open c1;
		fetch c1 into row1;
		uid:=row1.userid;
		uname:=row1.username;
		fname:='&fisrtname';
		lname:='&lastname';
		addr:='&address';
		phno:='&phoneno';
		dob:='&dateofbirth';
		age:='&age';
		close c1;
		--dbms_output.put_line('hey');
		add_userdetails(uid,uname,fname,lname,addr,phno,dob,age);
	end if;
end if;		
end;
/