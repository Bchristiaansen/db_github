CREATE DATABASE IF NOT EXISTS lab_database;
USE lab_database;
   
   DROP TABLE IF EXISTS `trainings`;
   CREATE TABLE trainings (
      trainings_id INT(9) AUTO_INCREMENT NOT NULL,
      Subject VARCHAR(255) default NULL,
      duration INT(4) default NULL,
      PRIMARY KEY (trainings_id)
   );
   
   INSERT INTO trainings (Subject, duration) VALUES 
      ("databases", 100),
      ("CGA", 40),
      ("Linking the flame", 50),
      ("Playing solitaire",2500),
      ("Managing your steam library", 4000),
      ("acrobatic training", 300),
      ("Walking on water", 400),
      ("Archeology", 2000),
      ("Interdimensional travel", 550)
      
   ;
   
   DROP TABLE IF EXISTS `lab_members`;
   CREATE TABLE lab_members (
      member_id INT(9) AUTO_INCREMENT NOT NULL,
      name VARCHAR(45) NOT NULL,
      lastname VARCHAR(45) NOT NULL,
      birth_date DATE NOT NULL,
      PRIMARY KEY (member_id)
   );
   INSERT INTO lab_members (name, lastname, birth_date) VALUES 
       
      ("Bart", "Christiaansen", '1994-04-29'),
      ("Jesus", "Christ", '0000-12-25'),
      ("Booker", "Dewitt", '1874-04-19'),
      ("Lara", "Croft", '1967-02-14'),
      ("Altaïr", "Ibn-La Ahad", '1165-01-11'),
      ("Cloud", "Strife", '1986-08-19'),
      ("Gwyn", "Lord of Cinder", '1111-11-11'),
      ("Jack", "Handsome", '2500-05-05'),
      ("Master", "Chief", '2511-03-07')
      
   ;
   
   DROP TABLE IF EXISTS `lab_members_training`;
   CREATE TABLE lab_members_training (
      id INT(9) AUTO_INCREMENT NOT NULL,
      lab_member INT(9) NOT NULL,
      training INT(9) NOT NULL,
      PRIMARY KEY (id),
      FOREIGN KEY(lab_member)
      REFERENCES lab_members(member_id),
      FOREIGN KEY(training)
      REFERENCES trainings(trainings_id)
   );
   /*NOTE: FOREIGN KEY's should have the same constraints as the primary key's they reference to. So if a foreign key references to a primary key that has the constraint NOT NULL the foreign key should also have the NOT NULL constraint*/
   INSERT INTO lab_members_training (lab_member, training) VALUES
   
      (1,1),(1,2),(1,4),(1,5),
      (2,7),(2,8),
      (3,4),(3,6),(3,9),
      (4,8),(4,4),(4,7),
      (5,6),(5,7),
      (6,1),(6,5),(6,6),
      (7,3),(7,4),(7,5),(7,9),
      (8,1),(8,2),(8,3),(8,8),(8,9),
      (9,1),(9,6),(9,8),(9,9)
      
   ;
      
      
   
   DROP TABLE IF EXISTS `equipment`;  
   CREATE TABLE equipment (
      equipment_id INT(9) AUTO_INCREMENT NOT NULL,
      name VARCHAR (255) NOT NULL,
      manufacturer VARCHAR (255) NOT NULL,
      purchase_date DATE NOT NULL,
      PRIMARY KEY (equipment_id)  
   );
   INSERT INTO equipment (name, manufacturer, purchase_date) VALUES 
       
      ("MALDITOF", "Bruker", '2012-04-29'),
      ("Vault Key", "Hyperion", '2300-12-25'),
      ("Plasmids", "Rapture", '1850-04-19'),
      ("Dual Pistols", "Croft", '1980-02-14'),
      ("Hidden blade", "The Brotherhood", '1000-01-11'),
      ("Lightning bolt", "Soul Magic",'0000-01-01')
      
      
   ;
   DROP TABLE IF EXISTS `experiments`;
   CREATE TABLE experiments (
      experiment_id INT(9) AUTO_INCREMENT NOT NULL,
      name VARCHAR (255) NOT NULL,
      date experiment_date NOT NULL,
      PRIMARY KEY (experiment_id) 
   );
   /*The name of a column can not be a keyword. So you can for example not say date date but you can say for example date experiment_date*/
   INSERT INTO experiments (name, date) VALUES
   
      ("Throwing lightning bolts", '0000-01-02'),
      ("Bacterial identification", '2015-02-03'),
      ("Finding hidden artifacts", '1999-03-03'),
      ("Freerunning", '1000-03-28')
   ;
            
      
   DROP TABLE IF EXISTS `results`;
   CREATE TABLE results (
      result_id INT(9) AUTO_INCREMENT NOT NULL,
      directory VARCHAR (255) NOT NULL, 
      experiment INT(9) NOT NULL,
      status ENUM('Completed','In Process', 'Failed'), 
      PRIMARY KEY (result_id),
      FOREIGN KEY (experiment)
      REFERENCES experiments(experiment_id)
   );
   INSERT INTO results (directory, experiment, status) VALUES
      ("home/guest/results1/", '1', 'Failed'),
      ("home/guest/results2/", '2', 'Completed'),
      ("home/guest/results3/", '3', 'In Process'),
      ("home/guest/results4/", '4', 'Completed')
   ;
   
   CREATE TABLE members_equipment_experiments (
      id INT(9) AUTO_INCREMENT NOT NULL,
      lab_member INT (9) NOT NULL,
      equipment INT(9) NOT NULL,
      experiment INT(9) NOT NULL,
      PRIMARY KEY (id),
      FOREIGN KEY (equipment)
      REFERENCES equipment(equipment_id),
      FOREIGN KEY (experiment)
      REFERENCES experiments(experiment_id),
      FOREIGN KEY (lab_member)
      REFERENCES lab_members(member_id)
   );
   
   /* This cross reference table is too complicated */
   
   INSERT INTO members_equipment_experiments (lab_member, equipment, experiment) VALUES
      (1,1,1),(1,1,2),(1,2,2),
      (2,2,2),(2,2,3),(2,3,3),
      (3,3,3),(3,3,4),(3,4,4),
      (4,4,4),(4,4,2),(4,5,2),
      (5,5,2),(5,2,2),(5,2,3),
      (6,6,2),(6,6,1),(6,6,2),
      (7,1,1),(7,5,4),(7,4,3),
      (8,2,3),(8,1,4),(8,3,3),
      (9,2,1),(9,3,3),(9,5,4)
   ;
   
   
   

   
