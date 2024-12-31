# Input is Calendar Date
# output is one of the Quarters (Q1,Q2,Q3,Q4)

CREATE DEFINER=`root`@`localhost` FUNCTION `get_fiscal_quarter`(
	calendar_date DATE) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE fiscal_quarter CHAR(2);
    DECLARE M TINYINT;
    SET M = MONTH(calendar_date);
	CASE 
		WHEN M IN (9,10,11) THEN SET fiscal_quarter= 'Q1';
		WHEN M IN (12,1,2) THEN SET fiscal_quarter= 'Q2';
        WHEN M IN (3,4,5) THEN SET fiscal_quarter= 'Q3';
        WHEN M IN (6,7,8) THEN SET fiscal_quarter= 'Q4';
        END CASE;
RETURN fiscal_quarter ;
END