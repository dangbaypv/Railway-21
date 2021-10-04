DROP DATABASE IF EXISTS Testing_System_Assignment_2;
CREATE DATABASE Testing_System_Assignment_2;
USE Testing_System_Assignment_2;


-- create table : Department
DROP TABLE IF EXISTS `Department`;
CREATE TABLE `Department`(
	DepartmentID	INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	DepartmentName 	NVARCHAR (50)	NOT NULL
);

-- create table : Position
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
	PositionID 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	PositionName 	NVARCHAR (50)	NOT NULL
);

-- create table : Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Email 			NVARCHAR (150)	UNIQUE KEY,
	Username 		NVARCHAR (50)	UNIQUE KEY,
	FullName 		NVARCHAR (100)	NOT NULL,
	DepartmentID 	INT UNSIGNED	NOT NULL,
	PositionID 		INT UNSIGNED	NOT NULL,
	CreateDate 		DATETIME 		DEFAULT NOW(),
	FOREIGN KEY (DepartmentID)	REFERENCES `Department`(DepartmentID),
	FOREIGN KEY (PositionID)	REFERENCES `Position`(PositionID)
);

-- create table : Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	GroupName 		NVARCHAR (100)	NOT NUll,
	CreatorID 		INT UNSIGNED	NOT NULL,
	CreateDate 		DATETIME
);

-- create table : GroupAccount
DROP TABLE IF EXISTS `GroupAccount`;
CREATE TABLE `GroupAccount`(
	GroupID 		INT UNSIGNED,
	AccountID 		INT UNSIGNED,
	JoinDate 		DATETIME		NOT NULL,
	PRIMARY KEY (GroupID,AccountID),
	FOREIGN KEY (GroupID)		REFERENCES `Group`(GroupID),
	FOREIGN KEY (AccountID)		REFERENCES `Account`(AccountID)
);

-- create table : TypeQuestion
DROP TABLE IF EXISTS `TypeQuestion`;
CREATE TABLE `TypeQuestion`(
	TypeID 			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	TypeName 		NVARCHAR (50)	NOT NULL
);

-- create table : CategoryQuestion
DROP TABLE IF EXISTS `CategoryQuestion`;
CREATE TABLE `CategoryQuestion`(
	CategoryID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	CategoryName	NVARCHAR (50)	NOT NULL
);

-- create table : Question
DROP TABLE IF EXISTS `Question`;
CREATE TABLE `Question`(
	QuestionID 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content			NVARCHAR (150),
	CategoryID		INT UNSIGNED	NOT NULL,
	TypeID			INT UNSIGNED	NOT NULL,
	CreatorID		INT UNSIGNED	NOT NULL,
	CreateDate		DATETIME,
	FOREIGN KEY (CategoryID)	REFERENCES `CategoryQuestion`(CategoryID),
	FOREIGN KEY (TypeID)		REFERENCES `TypeQuestion`(TypeID)
);

-- create table : Answer
DROP TABLE IF EXISTS `Answer`;
CREATE TABLE `Answer`(
	AnswerID		INT AUTO_INCREMENT PRIMARY KEY,
	Content			NVARCHAR (150)	NOT NULL,
	QuestionID		INT UNSIGNED	NOT NULL,
	isCorrect		BIT				NOT NULL,
	FOREIGN KEY (QuestionID) 	REFERENCES `Question`(QuestionID)
);

-- create table : Exam
DROP TABLE IF EXISTS `Exam`;
CREATE TABLE `Exam`(
	ExamID			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Code			NVARCHAR (100)	NOT NULL,
	Title			NVARCHAR (150)	NOT NULL,
	CategoryID		INT UNSIGNED 	NOT NULL,
	Duration		INT UNSIGNED	NOT NULL,
	CreatorID		INT UNSIGNED	NOT NULL,
	CreateDate		DATETIME 		DEFAULT NOW(),
	FOREIGN KEY (CategoryID)	REFERENCES `CategoryQuestion`(CategoryID)
);

-- create table : ExamQuestion
DROP TABLE IF EXISTS `ExamQuestion`;
CREATE TABLE `ExamQuestion`(
	ExamID			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	QuestionID		INT UNSIGNED	NOT NULL,
	FOREIGN KEY (ExamID)		REFERENCES `Exam`(ExamID),
	FOREIGN KEY (QuestionID)	REFERENCES `Question`(QuestionID)
);
