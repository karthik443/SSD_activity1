DELIMITER //
CREATE PROCEDURE SendWatchTimeReport2()
BEGIN
	declare subId int;
	declare done int default 0;
    declare sub_cursor cursor for select subscriberID from Subscribers;
    declare continue handler for not found set done = 1;
    open sub_cursor;
    my_loop: LOOP 
		fetch sub_cursor into subId;
        if done then 
			leave my_loop ; 
		end if;
        
		call GetWatchHistoryBySubscriber(subId);
		
	end loop my_loop;
    close sub_cursor;
END //
DELIMITER ;