drop database FancyBBS;
create database FancyBBS;
use FancyBBS;
create table BBSUser(
BUID int unique not null primary key,
BUPassword varchar(20) unique not null,
BUNickname varchar(20) not null,
BUEmail varchar(50),
BUPhoto text,
BUSex char(2),
BUGrade int not null,
BURegistrationdate date not null,
BUPoint int,
BUBlank1 text,
BUBlank2 text
);
create table BBSSession(
BSId int unique not null primary key,
BSName varchar(50) not null,
BSMasterId int not null,
foreign key(BSMasterId) references BBSUser(BUID), 
BSProfile varchar(50) not null,
BSTopicCount int,
BSClickCoount int,
BSBlank1 text,
BSBlank2 text
);
create table BBSTopic(
BTId int unique not null primary key,
BTSId int not null,
foreign key(BTSId) references BBSSession(BSId),
BTUId int not null,
foreign key(BTUId) references BBSUser(BUID),
BTReplyCount int,
BTTopic varchar(50) not null,
BTContents text not null,
BTTime datetime not null,
BTFlag int,
BTClickCount int,
BTLastReplyUseID int,
foreign key(BTLastReplyUseID) references BBSUser(BUID), 
BTLastReplayTime datetime,
BTBlank1 text,
BTBlank2 text 
);
create table BBSReply(
BRId int unique not null primary key,
BRTId int not null,
foreign key(BRTId) references BBSUser(BUID),
BRUId int not null,
foreign key(BRUId) references BBSUser(BUID),
BRContent text not null,
BRTime datetime not null,
BRBlank1 text,
BRBlank2 text 
)