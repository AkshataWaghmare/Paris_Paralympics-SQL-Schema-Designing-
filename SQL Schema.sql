CREATE DATABASE Paris_Paralympics;
drop table if exists disciplines;
CREATE TABLE Paris_Paralympics.Disciplines (
		Discipline_id INT AUTO_INCREMENT PRIMARY KEY,
		Discipline_name VARCHAR(100) NOT NULL
);

INSERT INTO Paris_Paralympics.Disciplines (Discipline_id, Discipline_name) VALUES
(1, "Athletics"),
(2, "Shooting"),
(3, "Badminton"),
(4, "Table Tennis"),
(5, "Archery"),
(6, "Judo"),
(7, "Rowing");

CREATE TABLE Paris_Paralympics.Athletes (
		Athlete_id INT AUTO_INCREMENT PRIMARY KEY,
        Athlete_name VARCHAR(100) NOT NULL,
        Gender ENUM('Male','Female') NOT NULL,
        Classification VARCHAR(10),
        Noc CHAR(3) DEFAULT 'IND',
        Discipline_id INT,
        FOREIGN KEY (Discipline_id) REFERENCES Disciplines(Discipline_id)
);

INSERT INTO Paris_Paralympics.Athletes (Athlete_id, Athlete_name, Gender, Classification, Noc, Discipline_id) VALUES
(01, "Avani Lekhara", "Female", "SH1", "IND", 2),
(02, "Mona Agarwal", "Female", "SH1", "IND", 2),
(03, "Preethi Pal", "Female", "T35", "IND", 1),
(04, "Manish Narwal", "Male", "SH1", "IND", 2),
(05, "Rubina Francis", "Female", "SH1", "IND", 2),
(06, "Nishad Kumar", "Male", "T47", "IND", 1),
(07, "Yogesh Kathuniya", "Male", "F56", "IND", 1),
(08, "Nitesh Kumar", "Male", "SL3", "IND", 3),
(09, "Thulasimathi Murugesan", "Female", "SU5", "IND", 3),
(10, "Manisha Ramadass", "Female", "SU5", "IND", 3),
(11, "Suhas Yathiraj", "Male", "SL4", "IND", 3),
(12, "Rakesh Kumar", "Male", "0", "IND", 5),
(13, "Sheetal Devi", "Female", "0", "IND", 5),
(14, "Sumit Antil", "Male", "F64", "IND", 1),
(15, "Nithya Sre Sivan", "Female", "SH6", "IND", 3),
(16, "Deepthi Jeevanji", "Female", "T20", "IND", 1),
(17, "Mariyappan Thangavelu", "Male", "T63", "IND", 1),
(18, "Sharad Kumar", "Male", "T63", "IND", 1),
(19, "Ajeet Singh", "Male", "F46", "IND", 1),
(20, "Sundar Singh Gurjar", "Male", "F46", "IND", 1),
(21, "Sachin Khilari", "Male", "F46", "IND", 1),
(22, "Harvinder Singh", "Male", "0", "IND", 5),
(23, "Dharambir", "Male", "F51", "IND", 1),
(24, "Parnav Soorma", "Male", "F51", "IND", 1),
(25, "Kapil Parmar", "Male", "J1", "IND", 6),
(26, "Praveen Kumar", "Male", "T64", "IND", 1),
(27, "Hokato Hotozhe Sema", "Male", "F57", "IND", 1),
(28, "Simran", "Female", "T12", "IND", 1),
(29, "Navdeep Singh", "Male", "F41", "IND", 1);


CREATE TABLE Paris_Paralympics.Events (
		Event_id INT AUTO_INCREMENT PRIMARY KEY,
        Event_name VARCHAR(100) NOT NULL,
        Classification VARCHAR(10),
        Discipline_id INT,
        FOREIGN KEY (Discipline_id) REFERENCES Disciplines(Discipline_id)
);

INSERT INTO Paris_Paralympics.Events (Event_id, Event_name, Classification, Discipline_id) VALUES
("01", "Women’s 10m air rifle standing", "SH1", 2),
("02", "Women’s 100m", "T35", 1),
("03", "Men’s 10m air pistol", "SH1", 2),
("04", "Women’s 10m Air Pistol", "SH1", 2),
("05", "Women’s 200m", "T35", 1),
("06", "Men’s high jump", "T47", 1),
("07", "Men’s discus throw", "F56", 1),
("08", "Men’s singles", "SL3", 3),
("09", "Women’s singles", "SU5", 3),
("010", "Men’s singles", "SL4", 3),
("011", "Mixed team compound open", "0", 5),
("012", "Men's javelin throw", "F64", 1),
("013", "Women’s singles", "SH6", 3),
("014", "Women’s 400m", "T20", 1),
("015", "Men’s high jump", "T63", 1),
("016", "Men’s javelin throw", "F46", 1),
("017", "Men’s shot put", "F46", 1),
("018", "Men’s individual recurve open", "0", 5),
("019", "Men’s club throw", "F51", 1),
("020", "Men’s 60kg", "J1", 6),
("021", "Men’s high jump", "T64", 1),
("022", "Men’s shot put", "F57", 1),
("023", "Women’s 200m", "T12", 1),
("024", "Men’s javelin throw", "F41", 1);


CREATE TABLE Paris_Paralympics.Teams (
		Team_id INT AUTO_INCREMENT PRIMARY KEY,
        Team_name VARCHAR(70) NOT NULL,
        Discipline_id INT,
        FOREIGN KEY (Discipline_id) REFERENCES Disciplines(Discipline_id)
);

INSERT INTO Paris_Paralympics.Teams (Team_id, Team_name, Discipline_id) VALUES
("001", "Mixed team compound open", 5),
("002", "Para badminton doubles team", 3),
("003", "mixed double sculls", 7);

CREATE TABLE Paris_Paralympics.Athlete_team (
		Athlete_id INT,
        Team_id INT,
        PRIMARY KEY (Athlete_id, Team_id),
		FOREIGN KEY (Athlete_id) REFERENCES Athletes(Athlete_id),
        FOREIGN KEY (Team_id) REFERENCES Teams(Team_id)
);

INSERT INTO Paris_Paralympics.Athlete_team (Athlete_id, Team_id) VALUES
(12, "001"), (13, "001"), (11, "002"), (15,"002");

CREATE TABLE Paris_Paralympics.Coaches (
		Coach_id INT AUTO_INCREMENT PRIMARY KEY,
        Coach_name VARCHAR(50) NOT NULL,
        Discipline_id INT,
        FOREIGN KEY (Discipline_id) REFERENCES Disciplines(Discipline_id)
);

INSERT INTO Paris_Paralympics.Coaches (Coach_id, Coach_name, Discipline_id) VALUES
("1", "Suma Shirur", 2),
("2", "Gaurav Khanna/ Rajendra", 3),
("3", "Lalan Doshi", 4),
("4", "Kuldeep Vedwan", 5),
("5", "Arun Kumar", 1),
("6", "Rahul Balkrishna", 1),
("7", "Munawar Anzar", 6);

DROP TABLE IF EXISTS Paris_Paralympics.Medals;

CREATE TABLE Paris_Paralympics.Medals (
		Medal_No INT AUTO_INCREMENT PRIMARY KEY,
        Medal_type ENUM('Gold', 'Silver', 'Bronze') NOT NULL,
        Event_id INT,
        Athlete_id INT,
        Team_id INT,
        FOREIGN KEY (Event_id) REFERENCES Events(Event_id),
        FOREIGN KEY (Athlete_id) REFERENCES Athletes(Athlete_id),
        FOREIGN KEY (Team_id) REFERENCES Teams(Team_id)
);

INSERT INTO Paris_Paralympics.Medals (Medal_No, Medal_type, Event_id, Athlete_id, Team_id) VALUES
(1, "Gold", 01, 01,NULL),
(2, "Bronze", 01, 02,NULL),
(3, "Bronze", 02, 03,NULL),
(4, "Silver", 03, 04,NULL),
(5, "Bronze", 04, 05,NULL),
(6, "Bronze", 05, 03,NULL),
(7, "Silver", 06, 06,NULL),
(8, "Silver", 07, 07,NULL),
(9, "Gold", 08, 08,NULL),
(10, "Silver", 09, 09,NULL),
(11, "Bronze", 09, 10,NULL),
(12, "Silver", 010, 11,NULL),
(13, "Bronze", 011, 12, 001),
(14, "Bronze", 011, 13, 001),
(15, "Gold", 012, 14,NULL),
(16, "Bronze", 013, 15,NULL),
(17, "Bronze", 014, 16,NULL),
(18, "Bronze", 015, 17,NULL),
(19, "Silver", 015, 18,NULL),
(20, "Silver", 016, 19,NULL),
(21, "Bronze", 016, 20,NULL),
(22, "Silver", 017, 21,NULL),
(23, "Gold", 018, 22,NULL),
(24, "Gold", 019, 23,NULL),
(25, "Silver", 019, 24,NULL),
(26, "Bronze", 020, 25,NULL),
(27, "Gold", 021, 26,NULL),
(28, "Bronze", 022, 27,NULL),
(29, "Bronze", 023, 28,NULL),
(30, "Gold", 024, 29,NULL);

SELECT * FROM Disciplines;
SELECT * FROM Athletes;
SELECT * FROM Events;
SELECT * FROM Teams;
SELECT * FROM Athlete_team;
SELECT * FROM Coaches;
SELECT * FROM Medals;


-- Add a new discipline

INSERT INTO Paris_Paralympics.Disciplines (Discipline_id, Discipline_name) VALUES
(8, "Swimming"); 

-- Show all coaches with discipline names

SELECT C.Coach_name, D.Discipline_name 
FROM Coaches C
JOIN Disciplines D ON C.Discipline_id = D.Discipline_id;

-- Update team 002 name

UPDATE Teams 
SET Team_name = "Badminton Doubles Mixed" 
WHERE Team_id = 002;

-- Remove coach with id=5

DELETE FROM Coaches WHERE Coach_id = 5;

-- END

