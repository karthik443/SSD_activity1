delimiter //
create procedure AddSubscriberIfNotExists(IN subName VARCHAR(100)) 
begin 
	declare newId int;
	if ( not exists (select 1 from Subscribers where Subscribers.SubscriberName = subName) ) then
		 select count(*)+1 into newId from Subscribers ;
         insert into Subscribers  values ( newId,subName,current_date());
		
    end if;
end //
delimiter ; 

-- call AddSubscriberIfNotExists('Rakesh');
