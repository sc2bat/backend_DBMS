SELECT * FROM scott.memberlist;

SELECT STR_TO_DATE(birth,'%Y%m%d') AS birth FROM scott.memberlist WHERE num=1;
SELECT STR_TO_DATE(birth,'%Y%m%d') AS birth ,name FROM scott.memberlist WHERE num=1;
SELECT DATE_FORMAT(NOW(),'%Y%m%d') AS birth ,name FROM scott.memberlist WHERE num=1;