delete from students;
delete from cars;
delete from groups;
delete from teachers;

insert into teachers(id,birthday,email,firstname,gender,inn,lastname,passport,patronymic,tel,description) values
(1,'19-10-1961','petrov@gmail.com','Nikolay','MALE',34590823,'Petrov','FD459865','Igorevich','097-345-77-32','Experience from 1995'),
(2,'15-12-1975','orlov@gmail.com','Oleg','MALE',58702314,'Orlov','AC332554','Sergeevich','067-546-56-66','Experience from 2000'),
(3,'21-05-1967','Krylov@gmail.com','Anatoly','MALE',98737164,'Krylov','HH906755','Vladimirovich','066-239-00-56','Experience from 2011'),
(4,'04-01-1980','denisov@gmail.com','Sergey','MALE',94036472,'Denisov','TR435644','Nikolaevich','097-560-98-55','Experience from 2013'),
(5,'17-11-1974','komarova@gmail.com','Tamara','FEMALE',94522099,'Komarova','AC889078','Aleksandrovna','067-465-09-11','Experience from 2006'),
(6,'24-09-1969','shvarts@gmail.com','Dmitry','MALE',44836109,'Shvarts','GF435564','Gavrilovich','050-430-98-65','Experience from 2009'),
(7,'07-06-1977','dorogny@gmail.com','Vasily','MALE',94776333,'Dorogny','GT547786','Vladislavovich','050-566-78-43','Experience from 2007'),
(8,'16-03-1980','boyko@gmail.com','Konstantin','MALE',76819900,'Boyko','DD098897','Valerievich','063-540-99-12','Experience from 2005'),
(9,'11-10-1990','fridman@gmail.com','Eduard','MALE',22091655,'Fridman','FD375946','Alekseevich','066-466-78-33','Experience from 2003'),
(10,'01-09-1988','voropaev@gmail.com','Georgy','MALE',34887253,'Voropaev','SD475869','Sergeevich','097-569-76-67','Experience from 2005');

insert into cars(id, brand, enginesize, model, priceperhour, transmission, instructor_id) values
(1,'Porsche',3.5,'911',150,'AUTO',1),
(2,'BMV',4.1,'M3',100,'MANUAL',3),
(3,'Lamborghini',8.2,'Aventador',250,'MANUAL',4),
(4,'Audi',7.3,'R8',150,'AUTO',8),
(5,'Ford',9,'GT',120,'MANUAL',9);

insert into groups(id,finishdate,name,startdate,teacher_id) values
(1,'06-05-2015','E5-03-2015','05-03-2015',2),
(2,'08-05-2015','M7-03-2015','07-03-2015',5),
(3,'12-05-2015','D11-03-2015','11-03-2015',6),
(4,'20-05-2015','E19-03-2015','19-03-2015',7),
(5,'25-05-2015','D24-03-2015','24-03-2015',10);

insert into students(id,birthday,email,firstname,gender,inn,lastname,passport,patronymic,tel,login,password,ridenumber,group_id,instructor_id) values
(1,'19-03-1988','govorov@mail.ru','Sergey','MALE',37430098,'Govorov','DR477865','Fedorovich','093-678-09-54','govorov','govorov',10,1,1),
(2,'23-11-1989','dobrynin@mail.ru','Andrey','MALE',34534534,'Dobrynin','DR477865','Dmitrievich','095-365-66-34','dobrynin','dobrynin',20,1,8),
(3,'12-09-1985','valuev@mail.ru','Vadim','MALE',67576564,'Valuev','DR477865','Timurovich','066-465-67-34','valuev','valuev',10,1,3),
(4,'08-05-1984','geludev@mail.ru','Yury','MALE',34647978,'Geludev','DR477865','Evgenyevich','050-254-65-34','geludev','geludev',10,1,4),
(5,'05-04-1978','topoleva@mail.ru','Anna','FEMALE',56734523,'Topoleva','DR477865','Dmitrievna','095-657-55-45','topoleva','topoleva',20,1,4),
(6,'23-09-1990','basina@mail.ru','Lilia','FEMALE',97056345,'Basina','DR477865','Aleksandrovna','095-254-65-34','basina','basina',20,1,1),
(7,'27-02-1984','gavriluk@mail.ru','Olga','FEMALE',56243567,'Gavriluk','DR477865','Georgievna','050-334-65-88','gavriluk','gavriluk',10,1,3),
(8,'03-11-1989','fedorenko@mail.ru','Marina','FEMALE',36574565,'Fedorenko','DR477865','Sergeevna','067-276-56-45','fedorenko','fedorenko',20,1,9),
(9,'12-03-1987','rokov@mail.ru','Sergey','MALE',56347655,'Rokov','DD477865','Pavlovich','093-564-56-45','rokov','rokov',10,2,3),
(10,'23-05-1983','drobotenko@mail.ru','Oleg','MALE',25847365,'Drobotenko','RT344523','Dmitrievich','099-657-34-73','drobotenko','drobotenko',10,2,4),
(11,'05-06-1986','pugachev@mail.ru','Denis','MALE',39561056,'Pugachev','HG907866','Denisovich','050-334-57-62','pugachev','pugachev',10,2,9),
(12,'08-03-1995','pavlov@mail.ru','Aleksey','MALE',44038563,'Pavlov','HJ453342','Vladimirovich','050-988-45-98','pavlov','pavlov',10,2,4),
(13,'03-09-1993','borisenko@mail.ru','Ekaterina','FEMALE',37726634,'Borisenko','HH654533','Arturovna','066-566-45-76','borisenko','borisenko',10,2,1),
(14,'15-05-1965','nekrasova@mail.ru','Inna','FEMALE',44957483,'Nekrasova','GH452213','Stanislavovna','099-467-23-76','nekrasova','nekrasova',10,2,3),
(15,'26-06-1974','malysheva@mail.ru','Ksenia','FEMALE',33098564,'Malysheva','FG657445','Valerievna','063-836-05-34','malysheva','malysheva',10,2,8),
(16,'21-04-1979','moskalenko@mail.ru','Elena','FEMALE',33756455,'Moskalenko','GG763342','Danilovna','093-095-76-98','moskalenko','moskalenko',10,2,9),
(17,'14-11-1973','fedorovsky@mail.ru','Dmitry','MALE',46543756,'Fedorovsky','WE455365','Romanovich','095-465-76-45','fedorovsky','fedorovsky',10,3,3),
(18,'07-09-1970','chernetsov@mail.ru','Evgeny','MALE',48577239,'Chernetsov','RR488675','Petrovich','099-774-66-23','chernetsov','chernetsov',10,3,4),
(19,'05-05-1991','barabash@mail.ru','Mihail','MALE',12009835,'Barabash','GF687456','Denisovich','097-243-54-77','barabash','barabash',10,3,4),
(20,'17-03-1992','labinsky@mail.ru','Yakov','MALE',37761432,'Labinsky','HG775634','Igorevich','098-134-27-83','labinsky','labinsky',10,3,1),
(21,'04-04-1989','zolotaryeva@mail.ru','Elena','FEMALE',09887354,'Zolotaryeva','DF658567','Nikolaevna','066-895-38-93','zolotaryeva','zolotaryeva',10,3,3),
(22,'03-02-1983','dolinnaya@mail.ru','Alina','FEMALE',28876354,'Dolinnaya','XC905674','Vasilyevna','093-733-34-74','dolinnaya','dolinnaya',10,3,8),
(23,'09-11-1981','smaliy@mail.ru','Antonina','FEMALE',15534209,'Smaliy','DS086545','Glebovna','050-557-16-77','smaliy','smaliy',10,3,9),
(24,'11-06-1988','severina@mail.ru','Rimma','FEMALE',25446342,'Severina','FD675564','Tarasovna','095-906-75-36','severina','severina',10,3,8),
(25,'09-09-1988','derevayanko@mail.ru','Taras','MALE',46534879,'Derevayanko','GF678443','Georgievich','050-456-64-65','derevayanko','derevayanko',10,4,9),
(26,'16-05-1987','pavlenko@mail.ru','Anatoly','MALE',35471423,'Pavlenko','SR557563','Vasilyevich','066-663-74-54','pavlenko','pavlenko',10,4,2),
(27,'14-11-1986','karavaev@mail.ru','Konstantin','MALE',98057354,'Karavaev','GF894578','Petrovich','099-856-76-66','karavaev','karavaev',10,4,9),
(28,'09-10-1984','glazunov@mail.ru','Aleksandr','MALE',39674926,'Glazunov','HG563348','Alekseevich','067-967-64-67','glazunov','glazunov',10,4,1),
(29,'24-05-1980','tropinina@mail.ru','Raisa','FEMALE',38564773,'Tropinina','JH896578','Ivanovna','093-678-67-45','tropinina','tropinina',10,4,8),
(30,'20-03-1990','talkova@mail.ru','Valentina','FEMALE',19904534,'Talkova','DF054675','Semyonovna','063-375-87-56','talkova','talkova',10,4,8),
(31,'23-08-1996','grishina@mail.ru','Aleksandra','FEMALE',27566453,'Grishina','FG658231','Mihailovna','093-845-87-45','grishina','grishina',10,4,3),
(32,'01-05-1994','lomonosova@mail.ru','Maria','FEMALE',44534409,'Lomonosova','HH329054','Lvovna','097-536-65-76','lomonosova','lomonosova',10,4,1),
(33,'08-03-1984','vlasenko@mail.ru','Georgy','MALE',19987332,'Vlasenko','JH665498','Dmitrievich','095-867-65-45','vlasenko','vlasenko',10,5,3),
(34,'05-04-1983','zavadsky@mail.ru','Petr','MALE',10096453,'Zavadsky','DF547834','Kirillovich','098-534-56-67','zavadsky','zavadsky',10,5,3),
(35,'28-06-1981','litvinenko@mail.ru','Maksim','MALE',20990845,'Litvinenko','DD658790','Danilovich','068-956-56-66','litvinenko','litvinenko',10,5,1),
(36,'16-07-1980','vinogradov@mail.ru','Evgeny','MALE',20954633,'Vinogradov','KJ985644','Olegovich','050-045-66-44','vinogradov','vinogradov',10,5,2),
(37,'17-03-1985','tsybulenko@mail.ru','Elvira','FEMALE',13340998,'Tsybulenko','HJ566745','Nikolaevna','098-945-99-88','tsybulenko','tsybulenko',10,5,2),
(38,'13-08-1984','grigoryeva@mail.ru','Olga','FEMALE',22775645,'Grigoryeva','HH657756','Vitalyevna','067-745-67-76','grigoryeva','grigoryeva',10,5,9),
(39,'15-05-1983','vakulenko@mail.ru','Nina','FEMALE',22988453,'Vakulenko','DD769877','Vladimirovna','067-856-56-54','vakulenko','vakulenko',10,5,8),
(40,'11-11-1987','friske@mail.ru','Janna','FEMALE',20099838,'Friske','SD675563','Vyacheslavovna','097-945-55-09','friske','friske',10,5,1);

ALTER SEQUENCE hibernate_sequence RESTART WITH 175;
