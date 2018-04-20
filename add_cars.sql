declare
	mid carmodel.model_id%type;
	cbrand carmodel.brand%type;
	cspeed carmodel.speed%type;
	csc_types carmodel.sc_types%type;
	rentcharge carmodel.price_km%type;
	cid car.car_id%type;
	cregno car.car_regno%type;
	ccolor car.color%type;
	status car.status%type;
begin
mid := '&modelid';
cbrand := '&cbrand';
cspeed := '&cspeed';
csc_types :='&seatingcapacity';
rentcharge := '&rentcharge/perday';
cid := '&car_id';
cregno := '&cregno';
ccolor := '&ccolor';
status :='&status';
add_cardetails(mid,cbrand,cspeed,csc_types,rentcharge,cid,cregno,ccolor,status);
end;
/