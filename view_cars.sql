set serveroutput on;
declare
	cursor c1 is select * from carmodel natural join car;
	res1 c1%rowtype;
	NL constant varchar2(1):=CHR(5); 
begin
	if :loggedin = 0 then
		dbms_output.put_line(rpad('CarBrand',10,' ')||NL||rpad('Carcolor',10,' ')||NL
			||rpad('CarType',10,' ')||NL||rpad('Speed',10,' ')||NL||rpad('CarRent(Price/day)',20,' '));
		dbms_output.put_line('**************************************************************************');
		for res1 in c1
		loop
			dbms_output.put_line(rpad(res1.brand,10,' ')||NL||rpad(res1.color,10,' ')||NL||
				rpad(res1.sc_types,10,' ')||NL||rpad(res1.speed,10,' ')||NL||rpad(res1.price_km,10,' '));
    	end loop;
    else
        if :currentstatus = 2 then
        		dbms_output.put_line(rpad('CarID',10,' ')||NL||rpad('CarBrand',10,' ')||NL||rpad('Carcolor',10,' ')||NL
					||rpad('CarType',10,' ')||NL||rpad('Speed',10,' ')||NL||rpad('CarRent(Price/day)',20,' '));
				dbms_output.put_line('**************************************************************************');
				for res1 in c1
				loop
					if res1.status = 1 then 
						dbms_output.put_line(rpad(res1.car_id,10,' ')||NL||rpad(res1.brand,10,' ')||NL||rpad(res1.color,10,' ')||NL||
						rpad(res1.sc_types,10,' ')||NL||rpad(res1.speed,10,' ')||NL||rpad(res1.price_km,10,' '));
    	            end if;
    	        end loop;
    	elsif :currentstatus = 1 then
    		dbms_output.put_line(rpad('CarID',10,' ')||NL||rpad('CarBrand',10,' ')||NL||rpad('Carcolor',10,' ')||NL
			||rpad('CarType',10,' ')||NL||rpad('Speed',10,' ')||NL||rpad('Status',10,' ')
			||NL||rpad('CarRent(Price/day)',20,' '));
			dbms_output.put_line('****************************************************************************');
			for res1 in c1
			loop
				dbms_output.put_line(rpad(res1.car_id,10,' ')||NL||rpad(res1.brand,10,' ')||NL||rpad(res1.color,10,' ')||NL||
					rpad(res1.sc_types,10,' ')||NL||rpad(res1.speed,10,' ')||NL||rpad(res1.status,10,' ')
					||NL||rpad(res1.price_km,10,' '));
    		end loop;
        end if;        
    end if;
end;
/