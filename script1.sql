set serveroutput on;
var loggedin number;
var currentuser varchar2(10);
var currentstatus number;
exec :loggedin := 0;
exec :currentuser := '';
exec :currentstatus := -1;