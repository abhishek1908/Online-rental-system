declare
	uid user_credential.userid%type;
	
begin
	if :loggedin = 1 then
		select userid into uid from user_credential where username = :currentuser;
		billdetails(uid);
    else
        dbms_output.put_line('You cannot book!!');
        dbms_output.put_line('Please login via @login');
    end if;     
	exception
		when no_data_found then
		    dbms_output.put_line('No data is persent!!');
		    dbms_output.put_line('Move to edit profile : @editprofile');
end;
/
