DROP PROCEDURE IF EXISTS ListAllSubscribers;
DELIMITER //

CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE subscriber_Name VARCHAR(40);
    DECLARE done INT DEFAULT 0;
	
    DECLARE sub_cursor CURSOR FOR 
        SELECT SubscriberName FROM Subscribers;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    create temporary table if not exists temp_sub(sub_name varchar(40));
    truncate table temp_sub;

    OPEN sub_cursor;

    my_loop: LOOP
        FETCH sub_cursor INTO subscriber_Name;

        IF done THEN 
            LEAVE my_loop;
        END IF;

        -- Print subscriber name
        INSERT INTO temp_sub VALUES (subscriber_Name);
       -- SELECT subscriber_Name;
    END LOOP;
	select * from temp_sub;
    CLOSE sub_cursor;
END //

DELIMITER ;

CALL ListAllSubscribers();
