DELIMITER //
create procedure GetWatchHistoryBySubscriber(IN sub_id INT )
begin 
	
		SELECT Subscribers.SubscriberName ,Shows.Title , WatchHistory.WatchTime 
		from Subscribers left join WatchHistory on
		Subscribers.SubscriberID = WatchHistory.SubscriberID
		left join Shows on 
		WatchHistory.ShowID = Shows.ShowID 
		where Subscribers.SubscriberID = sub_id;
	

end //
DELIMITER ;

-- call GetWatchHistoryBySubscriber(1);