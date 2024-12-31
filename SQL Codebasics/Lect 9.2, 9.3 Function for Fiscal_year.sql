CREATE DEFINER=`root`@`localhost` FUNCTION `get_fiscal_year`(
	calendar_date DATE) RETURNS int
    DETERMINISTIC
BEGIN
	declare fiscal_year int;
	set fiscal_year = year(adddate(calendar_date,interval 4 month));
	RETURN fiscal_year ;
END