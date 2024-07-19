insert into Roles values(1,'Employee'),(2,'Manager'),(3,'Admin');
insert into Users(EmpId,RoleId,[First Name],[Last Name],TeamId) 
values
('12dbed78-9649-41e3-b08c-a55e78b291c1',1,'Jayesh','Bhushan',1),
('32804a8e-8d4c-4ff8-a5a0-fb577b9ff93f',2,'Sudhir','Guleriya',1),
('bb3b9a91-fa44-45b6-b067-d4bf1493fa13',2,'Vaibhav','Sonar',2),
('bb3b9a91-fa44-45b6-b067-d4bf1493fa14',1,'Biresh','Das',2),
('bb3b9a91-fa44-45b6-b067-d4bf1493fa15',1,'Gemma','Woods',3)
insert into Teams values ('.Net'), ('.Java')
insert into TaskStatus values('Open'),('In Progress'),('In Testing'),('Done')
insert into Tasks values(
'Bug-1','Resolve bug',1,'2024-07-16','2024-07-30',null,
'12dbed78-9649-41e3-b08c-a55e78b291c1'),
(
'DEV-1','Implement Dev',2,'2024-07-16','2024-07-30',null,
'12dbed78-9649-41e3-b08c-a55e78b291c1');
insert into TaskComments values('please do ASAP','32804a8e-8d4c-4ff8-a5a0-fb577b9ff93f',
GETDATE(),1)