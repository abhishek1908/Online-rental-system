begin
	if :loggedin=1 then
		:loggedin:=0;
		:currentuser:='';
		:currentstatus:=-1;
		dbms_output.put_line('******************************');
		dbms_output.put_line('You have logged out...');
	else
		dbms_output.put_line('******************************');
		dbms_output.put_line('You are currently not logged in...');
	end if;
end;
/
