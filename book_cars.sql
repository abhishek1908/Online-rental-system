declare
	uid user_credential.userid%type;
	cid car.car_id%type;
	no_days bookcars.no_of_days%type;
	deposit bookcars.deposit%type;
begin
	if :loggedin = 1 then
		select userid into uid from user_credential where username = :currentuser;
		dbms_output.put_line(uid);
		cid:='&carid';
		no_days:='&no_of_days';
		deposit:='&Deposit_amt';
		bookcar(cid,uid,no_days,deposit);
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