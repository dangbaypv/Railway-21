DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;


-- create table : Department
DROP TABLE IF EXISTS `Department`;
CREATE TABLE `Department`(
	DepartmentID 	INT,
	DepartmentName 	VARCHAR (50)
);

-- create table : Position
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
	PositionID 		INT,
	PositionName 	VARCHAR (50)
);

-- create table : Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID 		INT,
	Email 			VARCHAR (150),
	Username 		VARCHAR (100),
	FullName 		VARCHAR (100),
	DepartmentID 	INT,
	PositionID 		INT,
	CreateDate 		DATE
);

-- create table : Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID 		INT,
	GroupName 		VARCHAR (100),
	CreatorID 		INT,
	CreateDate 		DATE
);

-- create table : GroupAccount
DROP TABLE IF EXISTS `GroupAccount`;
CREATE TABLE `GroupAccount`(
	GroupID 		INT,
	AccountID 		INT,
	JoinDate 		DATE
);

-- create table : TypeQuestion
DROP TABLE IF EXISTS `TypeQuestion`;
CREATE TABLE `TypeQuestion`(
	TypeID 			INT,
	TypeName 		VARCHAR (50)
);

-- create table : CategoryQuestion
DROP TABLE IF EXISTS `CategoryQuestion`;
CREATE TABLE `CategoryQuestion`(
	CategoryID		INT,
	CategoryName	VARCHAR (50)
);

-- create table : Question
DROP TABLE IF EXISTS `Question`;
CREATE TABLE `Question`(
	QuestionID 		INT,
	Content			VARCHAR (150),
	CategoryID		INT,
	TypeID			INT,
	CreatorID		INT,
	CreateDate		DATE
);

-- create table : Answer
DROP TABLE IF EXISTS `Answer`;
CREATE TABLE `Answer`(
	AnswerID		INT,
	Content			VARCHAR (150),
	QuestionID		INT,
	isCorrect		VARCHAR (10)
);

-- create table : Exam
DROP TABLE IF EXISTS `Exam`;
CREATE TABLE `Exam`(
	ExamID			INT,
	Code			VARCHAR (100),
	Title			VARCHAR (150),
	CategoryID		INT,
	Duration		INT,
	CreatorID		INT,
	CreateDate		DATE
);

-- create table : ExamQuestion
DROP TABLE IF EXISTS `ExamQuestion`;
CREATE TABLE `ExamQuestion`(
	ExamID			INT,
	QuestionID		INT
);