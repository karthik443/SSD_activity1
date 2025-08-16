# SSD_activity1
ssd activity 1 aboud sql cursors and stored procedures. 

gihub repo link : https://github.com/karthik443/SSD_activity1

prerequisite:
             We need to have three tables with schema definition below to Use/execute these procedures. And recommended to        prepopulate some data inside these tables

      
    1.  CREATE TABLE Shows (
            ShowID INT PRIMARY KEY,
            Title VARCHAR(100),
            Genre VARCHAR(50),
            ReleaseYear INT
        );
    2.  CREATE TABLE Subscribers (
            SubscriberID INT PRIMARY KEY,
            SubscriberName VARCHAR(100),
            SubscriptionDate DATE
        );
    3.  CREATE TABLE WatchHistory (
            HistoryID INT PRIMARY KEY,
            ShowID INT,
            SubscriberID INT,
            WatchTime INT, -- Duration in minutes
            FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
            FOREIGN KEY (SubscriberID) REFERENCES
            Subscribers(SubscriberID)
        );


Q1 --------------------------------------------->    
    problem statement : Print names of all subscribers present. 
    Process : 
        1. used a cursor to traverse all rows in the table. 
        2. stored each name in a temp table.
        3. printed that temp table after traversing all rows.
    command to execute : 
        call ListAllSubscribers()




Q2 --------------------------------------------->    
    problem statement : Print watch history of given subscriber Id.. 
    Process : 
        0. Took subId from input of procedure.
        1. Performed a left join on subscriber and WatchHistory , Shows. 
        2. using watchhistory I mapped the showname, subscriber name, subscriber id, watch time using abouve joins.
        3. At the end I used where clause to filter out the required subscriber id detail.
        3. printed the result.
    command to execute : 
        call GetWatchHistoryBySubscriber(1);

Q3 --------------------------------------------->    
    problem statement : Add a new subscriber if the same name doesn't exist;
    Process : 
        0. Took subName from input of procedure.
        1. checked if the person already exisits. 
        2. If not,  I declared a variable new_id to store the current count of table +1; 
        3. inserted newId , subName , curr_date() as new tuple into table;
        
    command to execute : 
        call AddSubscriberIfNotExists('Rakesh');

Q4 --------------------------------------------->    
    problem statement : show watch history of subscribers if his/her watch history exists.
    Process : 
        0. used a cursor to iterate through subscribers.
        1. checked if subscriber id exists in watchhistory collection.
        2. If yes,  then i called "call GetWatchHistoryBySubscriber(subId);"
        3. after iterating through all subscribers I ended the loop.
        
    command to execute : 
        call SendWatchTimeReport()

Q5 --------------------------------------------->   
    problem statement : show watch history of all subscribers 
    Process : 
        0. used a cursor to iterate through subscribers.
        1. then i called "call GetWatchHistoryBySubscriber(subId);"
        2. If watchhistory exists It will print the data.
        3. If a persons's watchhistory doesn't exsit it will print subscriber name and shows null in watchtime , showTitle column.
        
    command to execute : 
         call  SendWatchTimeReport2()
