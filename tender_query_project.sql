create database tender;
select * from tender;
commit;

use tender;

create table notice(id int(3) not null auto_increment, title varchar(35),info varchar(300), primary key(id));

alter table notice AUTO_INCREMENT = 1;


create table vendor(vid varchar(15) primary key,password varchar(20),vname varchar(30),vmob varchar(12),
		vemail varchar(40),company varchar(15),address varchar(100));


create table tender(tid varchar(15) primary key,tname varchar(40),ttype varchar(20),tprice int,
		    tdesc varchar(300),tdeadline date,tloc varchar(70));

create table bidder (bid varchar(15) primary key,vid varchar(15) references vendor(vid),tid varchar(15) references tender(tid),
		bidamount int,deadline date,status varchar(10));


create table tenderstatus(tid varchar(15) primary key references tender(tid),bid varchar(15) references bidder(bid),
		status varchar(15) not null,vid varchar(15) references vendor(vid));

INSERT INTO tender VALUES ('T20190725022124','Gandhi Setu Highway','maintainence',50000,'lkjhgfd','2019-07-19','Patna, Bihar'),('T20190725022416','MEGA CITY CONNECTING ROAD CONTRUCTION','construction',100000,'mega city road contruction','2019-09-14','Delhi'),('T20190725022601','Delhi-Ncr Connection','construction',5000000,'bridge contruction from Delhi to Ncr','2019-07-28','DELHI-NCR'),('T20190725101239','Game Development','software',150000,'We are going to start a project on game development using GPS specification. Interested condidates are required to bid as soon as possible','2019-07-19','Banglore, India'),('T20190725101322','Game Development','software',150000,'We are going to start a project on game development using GPS specification. Interested condidates are required to bid as soon as possible','2019-07-19','Banglore, India');


INSERT INTO notice VALUES (2,'Gandhi Setu Repairing','Repairing work is going to be started tommorow'),(3,'DELHI-NCR BRIDGE CONTRUCTION','ASSINGNED ENGINEER NEED TO REPORT AT THE CONSTRUCTION SITE BY TOMMOROW');

INSERT INTO vendor VALUES ('V20190725020951','nishu','Nishu Kumari','XXXX611263','nishujsr2257@gmail.com','IGDTUW','IGDTUW,James church road,New Delhi'),('V20190725022813','gunjan','Gunjan Sharma','12345679','gunjangnsharma@gmail.com','Infosys','Bhadra ,Rajeshthan'),('V20190725023446','poornima','Poornima Yadav','XXXXX54321','poornima@gmail.com','Genpact','Noida, Uttar Pradesh'),('V20190725100730','shashank','Shashank Jha','XXXXX67689','shashankshekharam@gmail.com','Reliance-Jio','Saket, Delhi');

INSERT INTO bidder VALUES ('B20190725022953','V20190725022813','T20190725022124',51000,'2019-07-19','Pending'),('B20190725023010','V20190725022813','T20190725022124',52000,'2019-07-19','Accepted'),('B20190725023248','V20190725022813','T20190725022416',100001,'2019-09-14','Rejected'),('B20190725023512','V20190725023446','T20190725022416',200000,'2019-09-14','Accepted'),('B20190725024125','V20190725023446','T20190725022601',5000001,'2019-07-28','Rejected'),('B20190725024243','V20190725022813','T20190725022601',6000000,'2019-07-28','Accepted'),('B20190725101444','V20190725100730','T20190725101322',1500000,'2019-07-19','Rejected'),('B20190725101519','V20190725023446','T20190725101239',150005,'2019-07-19','Rejected'),('B20190725101525','V20190725023446','T20190725101239',150050,'2019-07-19','Rejected'),('B20190725101554','V20190725022813','T20190725101322',160000,'2019-07-19','Accepted');

INSERT INTO tenderstatus VALUES ('T20190725022124','B20190725023010','Assigned','V20190725022813'),('T20190725022416','B20190725023512','Assigned','V20190725023446'),('T20190725022601','B20190725024243','Assigned','V20190725022813'),('T20190725101322','B20190725101554','Assigned','V20190725022813');

commit;