DELETE FROM students;
DELETE FROM cars;
DELETE FROM groups;
DELETE FROM teachers;
DELETE FROM registrations;
DELETE FROM results;
DELETE FROM answers;
DELETE FROM questions;
DELETE FROM themes;
DELETE FROM exams;

INSERT INTO teachers (id, birthday, email, firstname, gender, inn, lastname, passport, patronymic, tel, photourl) VALUES
  (1, '1961-10-19', 'petrov@gmail.com', 'Nikolay', 'MALE', 34590823, 'Petrov', 'FD459865', 'Igorevich', '097-345-77-32','http://cs621222.vk.me/v621222392/16814/y4UYdX3Jn84.jpg'),
  (2, '1975-12-15', 'orlov@gmail.com', 'Oleg', 'MALE', 58702314, 'Orlov', 'AC332554', 'Sergeevich', '067-546-56-66','http://cs623717.vk.me/v623717392/2f6a5/buznf0zGKXE.jpg'),
  (3, '1967-05-21', 'kirylova@gmail.com', 'Alina', 'FEMALE', 98737164, 'Kirylova', 'HH906755', 'Vladimirovna','066-239-00-56', 'http://cs623717.vk.me/v623717392/2f6e4/STlMTziVM8s.jpg'),
  (4, '1980-01-04', 'denisov@gmail.com', 'Sergey', 'MALE', 94036472, 'Denisov', 'TR435644', 'Nikolaevich','097-560-98-55', 'http://cs623717.vk.me/v623717392/2f6ae/fYc1SRN6ruE.jpg'),
  (5, '1974-11-17', 'komarova@gmail.com', 'Inna', 'FEMALE', 94522099, 'Komarova', 'AC889078', 'Aleksandrovna','067-465-09-11', 'http://cs623717.vk.me/v623717392/2f6b7/ql8EucirrLk.jpg'),
  (6, '1969-09-24', 'shvarts@gmail.com', 'Dmitry', 'MALE', 44836109, 'Shvarts', 'GF435564', 'Gavrilovich','050-430-98-65', 'http://cs623717.vk.me/v623717392/2f6c9/WomHgmpSylc.jpg'),
  (7, '1977-09-16', 'dorognaya@gmail.com', 'Victoria', 'FEMALE', 94776333, 'Dorogaya', 'GT547786', 'Vladislavovna','050-566-78-43', 'http://cs623717.vk.me/v623717392/2f6db/pUNWLYY1HtM.jpg'),
  (8, '1980-10-16', 'boyko@gmail.com', 'Konstantin', 'MALE', 76819900, 'Boyko', 'DD098897', 'Valerievich','063-540-99-12', 'http://cs623717.vk.me/v623717392/2f693/SvEhrRadwv8.jpg'),
  (9, '1990-10-11', 'fridman@gmail.com', 'Anna', 'FEMALE', 22091655, 'Fridman', 'FD375946', 'Alekseevna','066-466-78-33', 'http://cs623717.vk.me/v623717392/2f69c/N_NzYco46hE.jpg'),
  (10, '1988-01-09', 'voropaev@gmail.com', 'Georgy', 'MALE', 34887253, 'Voropaev', 'SD475869', 'Sergeevich','097-569-76-67', 'http://cs623717.vk.me/v623717392/2f6ed/8pwTalSgq9Q.jpg');

UPDATE teachers SET description = 'Experience since 2001 experience since 2001 experience since 2001 experience since 2001 experience since 2001 experience since 2001
 experience since 2001 experience since 2001 experience since 2001 experience since 2001 experience since 2001 experience since 2001 experience since 2001 experience since 2001
  experience since 2001 experience since 2001 experience since 2001 experience since 2001 experience since 2001 experience since 2001 experience since 2001 experience since 2001
   experience since 2001 experience since 2001 experience since 2001 experience since 2001 experience since 2001 experience since 2001 experience since 2001 experience since 2001';

INSERT INTO cars (id, brand, model, horsepower, transmission, priceperhour, photourl, instructor_id) VALUES
  (1, 'Porsche', '911 GT3', 370, 'MANUAL', 170, 'http://cs621222.vk.me/v621222392/1653a/VKn6sCVrUX8.jpg', 1),
  (2, 'BMV', 'M3', 270, 'MANUAL', 95, 'http://cs621222.vk.me/v621222392/16521/wCwSkD9YaeI.jpg', 3),
  (3, 'Lamborghini', 'Aventador', 835, 'MANUAL', 250, 'http://cs621222.vk.me/v621222392/16543/fjGBpQ_AarM.jpg', 4),
  (4, 'Audi', 'R8', 325, 'AUTO', 100, 'http://cs621222.vk.me/v621222392/1654c/CbkK4Whte48.jpg', 8),
  (5, 'Ferrari', '458 Italia Spider', 457, 'AUTO', 190, 'http://cs621222.vk.me/v621222392/16826/2evXSBDLhpM.jpg', 9);

INSERT INTO groups (id, name, description, startdate, finishdate, teacher_id) VALUES
  (1, 'E5-03-2015', '�� �� 17:30-19:45', '2015-01-24', '2015-03-05', 2),
  (2, 'M7-03-2015', '�� �� 18:00-20:15', '2015-03-19', '2015-05-20', 5),
  (3, 'D11-05-2015', '�� �� 19:00-21:15', '2015-04-11', '2015-06-12', 6),
  (4, 'E19-07-2015', '�� �� 18:30-20:45', '2015-07-09', '2015-09-20', 7),
  (5, 'D24-08-2015', '�� �� 17:00-19:15', '2015-08-20', '2015-10-25', 10),
  (6, 'D32-10-2015', '�� �� 17:15-19:30', '2015-10-20', '2015-12-25', 2);

INSERT INTO students (id, birthday, email, firstname, gender, inn, lastname, passport, patronymic, tel, login, password, ridenumber, group_id, instructor_id) VALUES
  (1, '1988-03-19', 'govorov@mail.ru', 'Sergey', 'MALE', 37430098, 'Govorov', 'DR477865', 'Fedorovich', '093-678-09-54','govorov', 'govorov', 10, 1, 1),
  (2, '1989-11-23', 'dobrynin@mail.ru', 'Andrey', 'MALE', 34534534, 'Dobrynin', 'DR477865', 'Dmitrievich', '095-365-66-34', 'dobrynin', 'dobrynin', 20, 1, 8),
  (3, '1985-09-12', 'valuev@mail.ru', 'Vadim', 'MALE', 67576564, 'Valuev', 'DR477865', 'Timurovich', '066-465-67-34', 'valuev', 'valuev', 10, 1, 3),
  (4, '1984-05-08', 'geludev@mail.ru', 'Yury', 'MALE', 34647978, 'Geludev', 'DR477865', 'Evgenyevich', '050-254-65-34', 'geludev', 'geludev', 10, 1, 4),
  (5, '1978-04-05', 'topoleva@mail.ru', 'Anna', 'FEMALE', 56734523, 'Topoleva', 'DR477865', 'Dmitrievna', '095-657-55-45', 'topoleva', 'topoleva', 20, 1, 4),
  (6, '1990-09-23', 'basina@mail.ru', 'Lilia', 'FEMALE', 97056345, 'Basina', 'DR477865', 'Aleksandrovna', '095-254-65-34', 'basina', 'basina', 20, 1, 1),
  (7, '1984-02-27', 'gavriluk@mail.ru', 'Olga', 'FEMALE', 56243567, 'Gavriluk', 'DR477865', 'Georgievna', '050-334-65-88', 'gavriluk', 'gavriluk', 10, 1, 3),
  (8, '1989-11-03', 'fedorenko@mail.ru', 'Marina', 'FEMALE', 36574565, 'Fedorenko', 'DR477865', 'Sergeevna', '067-276-56-45', 'fedorenko', 'fedorenko', 20, 1, 9),
  (9, '1987-03-12', 'rokov@mail.ru', 'Sergey', 'MALE', 56347655, 'Rokov', 'DD477865', 'Pavlovich', '093-564-56-45', 'rokov', 'rokov', 10, 2, 3),
  (10, '1983-05-23', 'drobotenko@mail.ru', 'Oleg', 'MALE', 25847365, 'Drobotenko', 'RT344523', 'Dmitrievich', '099-657-34-73', 'drobotenko', 'drobotenko', 10, 2, 4),
  (11, '1986-06-05', 'pugachev@mail.ru', 'Denis', 'MALE', 39561056, 'Pugachev', 'HG907866', 'Denisovich', '050-334-57-62', 'pugachev', 'pugachev', 10, 2, 9),
  (12, '1995-08-03', 'pavlov@mail.ru', 'Aleksey', 'MALE', 44038563, 'Pavlov', 'HJ453342', 'Vladimirovich', '050-988-45-98', 'pavlov', 'pavlov', 10, 2, 4),
  (13, '1993-03-08', 'borisenko@mail.ru', 'Ekaterina', 'FEMALE', 37726634, 'Borisenko', 'HH654533', 'Arturovna', '066-566-45-76', 'borisenko', 'borisenko', 10, 2, 1),
  (14, '1965-08-02', 'nekrasova@mail.ru', 'Inna', 'FEMALE', 44957483, 'Nekrasova', 'GH452213', 'Stanislavovna', '099-467-23-76', 'nekrasova', 'nekrasova', 10, 2, 3),
  (15, '1974-05-07', 'malysheva@mail.ru', 'Ksenia', 'FEMALE', 33098564, 'Malysheva', 'FG657445', 'Valerievna', '063-836-05-34', 'malysheva', 'malysheva', 10, 2, 8),
  (16, '1979-08-05', 'moskalenko@mail.ru', 'Elena', 'FEMALE', 33756455, 'Moskalenko', 'GG763342', 'Danilovna', '093-095-76-98', 'moskalenko', 'moskalenko', 10, 2, 9),
  (17, '1973-05-12', 'fedorovsky@mail.ru', 'Dmitry', 'MALE', 46543756, 'Fedorovsky', 'WE455365', 'Romanovich', '095-465-76-45', 'fedorovsky', 'fedorovsky', 10, 3, 3),
  (18, '1970-05-25', 'chernetsov@mail.ru', 'Evgeny', 'MALE', 48577239, 'Chernetsov', 'RR488675', 'Petrovich', '099-774-66-23', 'chernetsov', 'chernetsov', 10, 3, 4),
  (19, '1991-04-30', 'barabash@mail.ru', 'Mihail', 'MALE', 12009835, 'Barabash', 'GF687456', 'Denisovich', '097-243-54-77', 'barabash', 'barabash', 10, 3, 4),
  (20, '1992-07-20', 'labinsky@mail.ru', 'Yakov', 'MALE', 37761432, 'Labinsky', 'HG775634', 'Igorevich', '098-134-27-83', 'labinsky', 'labinsky', 10, 3, 1),
  (21, '1989-05-25', 'zolotaryeva@mail.ru', 'Elena', 'FEMALE', 09887354, 'Zolotaryeva', 'DF658567', 'Nikolaevna', '066-895-38-93', 'zolotaryeva', 'zolotaryeva', 10, 3, 3),
  (22, '1983-12-25', 'dolinnaya@mail.ru', 'Alina', 'FEMALE', 28876354, 'Dolinnaya', 'XC905674', 'Vasilyevna', '093-733-34-74', 'dolinnaya', 'dolinnaya', 10, 3, 8),
  (23, '1981-12-15', 'smaliy@mail.ru', 'Antonina', 'FEMALE', 15534209, 'Smaliy', 'DS086545', 'Glebovna', '050-557-16-77', 'smaliy', 'smaliy', 10, 3, 9),
  (24, '1988-07-15', 'severina@mail.ru', 'Rimma', 'FEMALE', 25446342, 'Severina', 'FD675564', 'Tarasovna', '095-906-75-36', 'severina', 'severina', 10, 3, 8),
  (25, '1988-04-21', 'derevayanko@mail.ru', 'Taras', 'MALE', 46534879, 'Derevayanko', 'GF678443', 'Georgievich', '050-456-64-65', 'derevayanko', 'derevayanko', 10, 4, 9),
  (26, '1987-09-25', 'pavlenko@mail.ru', 'Anatoly', 'MALE', 35471423, 'Pavlenko', 'SR557563', 'Vasilyevich', '066-663-74-54', 'pavlenko', 'pavlenko', 10, 4, 2),
  (27, '1986-06-14', 'karavaev@mail.ru', 'Konstantin', 'MALE', 98057354, 'Karavaev', 'GF894578', 'Petrovich', '099-856-76-66', 'karavaev', 'karavaev', 10, 4, 9),
  (28, '1984-07-24', 'glazunov@mail.ru', 'Aleksandr', 'MALE', 39674926, 'Glazunov', 'HG563348', 'Alekseevich', '067-967-64-67', 'glazunov', 'glazunov', 10, 4, 1),
  (29, '1980-10-05', 'tropinina@mail.ru', 'Raisa', 'FEMALE', 38564773, 'Tropinina', 'JH896578', 'Ivanovna', '093-678-67-45', 'tropinina', 'tropinina', 10, 4, 8),
  (30, '1990-11-15', 'talkova@mail.ru', 'Valentina', 'FEMALE', 19904534, 'Talkova', 'DF054675', 'Semyonovna', '063-375-87-56', 'talkova', 'talkova', 10, 4, 8),
  (31, '1996-11-18', 'grishina@mail.ru', 'Aleksandra', 'FEMALE', 27566453, 'Grishina', 'FG658231', 'Mihailovna', '093-845-87-45', 'grishina', 'grishina', 10, 4, 3),
  (32, '1994-12-01', 'lomonosova@mail.ru', 'Maria', 'FEMALE', 44534409, 'Lomonosova', 'HH329054', 'Lvovna','097-536-65-76', 'lomonosova', 'lomonosova', 10, 4, 1),
  (33, '1984-01-05', 'vlasenko@mail.ru', 'Georgy', 'MALE', 19987332, 'Vlasenko', 'JH665498', 'Dmitrievich','095-867-65-45', 'vlasenko', 'vlasenko', 10, 5, 3),
  (34, '1983-01-15', 'zavadsky@mail.ru', 'Petr', 'MALE', 10096453, 'Zavadsky', 'DF547834', 'Kirillovich','098-534-56-67', 'zavadsky', 'zavadsky', 10, 5, 3),
  (35, '1981-04-11', 'litvinenko@mail.ru', 'Maksim', 'MALE', 20990845, 'Litvinenko', 'DD658790', 'Danilovich','068-956-56-66', 'litvinenko', 'litvinenko', 10, 5, 1),
  (36, '1980-08-12', 'vinogradov@mail.ru', 'Evgeny', 'MALE', 20954633, 'Vinogradov', 'KJ985644', 'Olegovich','050-045-66-44', 'vinogradov', 'vinogradov', 10, 5, 2),
  (37, '1985-04-13', 'tsybulenko@mail.ru', 'Elvira', 'FEMALE', 13340998, 'Tsybulenko', 'HJ566745', 'Nikolaevna','098-945-99-88', 'tsybulenko', 'tsybulenko', 10, 5, 2),
  (38, '1984-05-23', 'grigoryeva@mail.ru', 'Olga', 'FEMALE', 22775645, 'Grigoryeva', 'HH657756', 'Vitalyevna','067-745-67-76', 'grigoryeva', 'grigoryeva', 10, 5, 9),
  (39, '1983-08-27', 'vakulenko@mail.ru', 'Nina', 'FEMALE', 22988453, 'Vakulenko', 'DD769877', 'Vladimirovna','067-856-56-54', 'vakulenko', 'vakulenko', 10, 5, 8),
  (40, '1987-09-01', 'friske@mail.ru', 'Janna', 'FEMALE', 20099838, 'Friske', 'SD675563', 'Vyacheslavovna','097-945-55-09', 'friske', 'friske', 10, 5, 1);

INSERT INTO registrations (id, firstname, lastname, patronymic, tel, email, car_id) VALUES
  (1, 'Sergey', 'Govorov', 'Fedorovich','093-678-09-54','dovoddv@mail.ru', 1);

insert into themes (id, name) values (1, '�������� �����������'), (2, '�������� ����������');
insert into exams (id, name, questionperticketquantity, ticketquantity) VALUES
(1, '���-2014-�������-B', 5, 5),
(2, '���-2015-�������-A', 10, 10);
insert into tickets (id, number, exam_id) values
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);
INSERT INTO questions (id, number, question, theme_id, ticket_id, description) VALUES
(1, 1, '����� �� ��������� ��������', 1, 1, '�������� �����������, �.�. �������������� ������ ����������� �.4.44'),
(2, 2, '����� �������� �� ������� ����', 1, 1, '������ �� ������� ���� ��������, �.2.13'),
(3, 3, '��������� �� ���������� ��������:', 1, 1, '��������� �� ���������� ���������� �����������, �.1.2'),
(4, 4, '����� �� ��������� ��������', 1, 1, '�������� �����������, �.�. �������������� ������ ����������� �.4.44'),
(5, 5, '����� �������� �� ������� ����', 1, 1, '������ �� ������� ���� ��������, �.2.13'),
(6, 1, '��������� �� ���������� ��������:', 1, 2, '��������� �� ���������� ���������� �����������, �.1.2'),
(7, 2, '����� �� ��������� ��������', 1, 2, '�������� �����������, �.�. �������������� ������ ����������� �.4.44'),
(8, 3, '����� �������� �� ������� ����', 1, 2, '������ �� ������� ���� ��������, �.2.13'),
(9, 4, '��������� �� ���������� ��������:', 1, 2, '��������� �� ���������� ���������� �����������, �.1.2'),
(10, 5, '����� �� ��������� ��������', 1, 2, '�������� �����������, �.�. �������������� ������ ����������� �.4.44'),
(11, 1, '����� �������� �� ������� ����', 1, 3, '������ �� ������� ���� ��������, �.2.13'),
(12, 2, '��������� �� ���������� ��������:', 1, 3, '��������� �� ���������� ���������� �����������, �.1.2'),
(13, 3, '����� �� ��������� ��������', 1, 3, '�������� �����������, �.�. �������������� ������ ����������� �.4.44'),
(14, 4, '����� �������� �� ������� ����', 1, 3, '������ �� ������� ���� ��������, �.2.13'),
(15, 5, '��������� �� ���������� ��������:', 1, 3, '��������� �� ���������� ���������� �����������, �.1.2'),
(16, 1, '����� �� ��������� ��������', 1, 4, '�������� �����������, �.�. �������������� ������ ����������� �.4.44'),
(17, 2, '����� �������� �� ������� ����', 1, 4, '������ �� ������� ���� ��������, �.2.13'),
(18, 3, '��������� �� ���������� ��������:', 1, 4, '��������� �� ���������� ���������� �����������, �.1.2'),
(19, 4, '����� �� ��������� ��������', 1, 4, '�������� �����������, �.�. �������������� ������ ����������� �.4.44'),
(20, 5, '����� �������� �� ������� ����', 1, 4, '������ �� ������� ���� ��������, �.2.13'),
(21, 1, '����� �� ��������� ��������', 1, 5, '�������� �����������, �.�. �������������� ������ ����������� �.4.44'),
(22, 2, '����� �������� �� ������� ����', 1, 5, '������ �� ������� ���� ��������, �.2.13'),
(23, 3, '��������� �� ���������� ��������:', 1, 5, '��������� �� ���������� ���������� �����������, �.1.2'),
(24, 4, '����� �� ��������� ��������', 1, 5, '�������� �����������, �.�. �������������� ������ ����������� �.4.44'),
(25, 5, '����� �������� �� ������� ����', 1, 5, '������ �� ������� ���� ��������, �.2.13');

insert into answers (id, answer, correct, question_id) values
(1, '��', true, 1),
(2, '���', FALSE , 1),
(3, '��� ������ ������ �����', FALSE , 1),

(4, '��', FALSE , 2),
(5, '���', TRUE , 2),

(6, '��', true, 3),
(7, '���', FALSE , 3),

(8, '��� ������ ������ �����', FALSE , 4),
(9, '��', FALSE , 4),
(10, '���', TRUE , 4),

(11, '��', true, 5),
(12, '���', FALSE , 5),
(13, '��� ������ ������ �����', FALSE , 5),

(14, '��', FALSE , 6),
(15, '���', TRUE , 6),

(16, '��', true, 7),
(17, '���', FALSE , 7),
(18, '��� ������ ������ �����', FALSE , 7),

(19, '��', FALSE , 8),
(20, '���', TRUE , 8),

(21, '��', true, 9),
(22, '���', FALSE , 9),

(23, '��� ������ ������ �����', FALSE , 10),
(24, '��', FALSE , 10),
(25, '���', TRUE , 10),

(26, '��', true, 11),
(27, '���', FALSE , 11),

(28, '��� ������ ������ �����', FALSE , 12),
(29, '��', FALSE , 12),
(30, '���', TRUE , 12),

(31, '��', true, 13),
(32, '���', FALSE , 13),

(33, '��� ������ ������ �����', FALSE , 14),
(34, '��', FALSE , 14),
(35, '���', TRUE , 14),

(36, '��', true, 15),
(37, '���', FALSE , 15),

(38, '��� ������ ������ �����', FALSE , 16),
(39, '��', FALSE , 16),
(40, '���', TRUE , 16),

(41, '��', true, 17),
(42, '���', FALSE , 17),

(43, '��� ������ ������ �����', FALSE , 18),
(44, '��', FALSE , 18),
(45, '���', TRUE , 18),

(46, '�����, ���� �� �������� ������ ������', FALSE , 19),
(47, '�����������', TRUE , 19),

(48, '�� �����������', FALSE , 20),
(49, '�����������', TRUE , 20),

(50, '�� �����������', FALSE , 21),
(51, '�����������', TRUE , 21),

(52, '�� �����������', FALSE , 22),
(53, '�����������', TRUE , 22),

(54, '�� �����������', FALSE , 23),
(55, '�����������', TRUE , 23),

(56, '�� �����������', FALSE , 24),
(57, '�����������', TRUE , 24),

(58, '�� �����������', FALSE , 25),
(59, '�����������', TRUE , 25);

ALTER SEQUENCE hibernate_sequence RESTART WITH 175;