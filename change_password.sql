declare
	cursor c1 is select * from user_credential where username = :currentuser;
	row1 c1%rowtype;
	uid user_credential.userid%type;
	pwd user_credential.password%type;
begin
	if :loggedin = 1 then
		if :currentstatus = 2 then
			open c1;
			fetch c1 into row1; 
			pwd := '&password';
			uid := row1.userid;
			update_password(uid,pwd);
			close c1;
		end if;
	end if;		
end;
/