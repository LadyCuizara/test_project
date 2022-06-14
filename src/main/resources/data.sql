USE [g2ssid];

/******************************************************************************
** Initialize data
**
**  Author: Nicol Dayana Balderrama Guzman
**
**  Date: 30/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        -------------------------------------------------
*******************************************************************************/

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN TRANSACTION;
BEGIN TRY

-- Make sure IDENTITY_INSERT is set to OFF
SET IDENTITY_INSERT [dbo].[employee] OFF
SET IDENTITY_INSERT [dbo].[equipment_category] OFF
SET IDENTITY_INSERT [dbo].[equipment] OFF
SET IDENTITY_INSERT [dbo].[project] OFF
SET IDENTITY_INSERT [dbo].[department] OFF
SET IDENTITY_INSERT [dbo].[position] OFF
SET IDENTITY_INSERT [dbo].[equipment_assignment] OFF
SET IDENTITY_INSERT [dbo].[accident] OFF

-- -- employee items
PRINT 'Insert data into the Employee table...';

SET IDENTITY_INSERT [dbo].[employee] ON
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (1, CAST(N'2018-06-28 00:00:00.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:00.0000000' AS DateTime2), N'import.sql', N'av. America oeste y juan de la rosa', CAST(N'1963-03-02 00:00:00.0000000' AS DateTime2), 295847284, N'NULL', N'Ken', N'MALE', N'Sßnchez', 4061455, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (2, CAST(N'2018-06-28 00:00:01.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:01.0000000' AS DateTime2), N'import.sql', N'simeon roncal #120', CAST(N'1965-09-01 00:00:00.0000000' AS DateTime2), 245797967, N'NULL', N'Terri', N'FEMALE', N'Duffy', 4051808, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (3, CAST(N'2018-06-28 00:00:02.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:02.0000000' AS DateTime2), N'import.sql', N'Av. Beijing y blanco galindo', CAST(N'1968-12-13 00:00:00.0000000' AS DateTime2), 509647174, N'NULL', N'Roberto', N'MALE', N'Tamburello', 4353581, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (4, CAST(N'2018-06-28 00:00:03.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:03.0000000' AS DateTime2), N'import.sql', N'Av. Villazon km 4 acera norte', CAST(N'1969-01-23 00:00:00.0000000' AS DateTime2), 112457891, N'NULL', N'Rob', N'MALE', N'Walters', 4224800, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (5, CAST(N'2018-06-28 00:00:04.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:04.0000000' AS DateTime2), N'import.sql', N'calle demetrio canelas y beijing', CAST(N'1946-10-29 00:00:00.0000000' AS DateTime2), 695256908, N'NULL', N'Gail', N'FEMALE', N'Erickson', 4153122, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (6, CAST(N'2018-06-28 00:00:05.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:05.0000000' AS DateTime2), N'import.sql', N'simon lopez y centenario #80', CAST(N'1953-04-11 00:00:00.0000000' AS DateTime2), 998320692, N'NULL', N'Jossef', N'MALE', N'Goldberg', 4058241, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (7, CAST(N'2018-06-28 00:00:06.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:06.0000000' AS DateTime2), N'import.sql', N'Av. Blanco galindo km 12', CAST(N'1981-03-27 00:00:00.0000000' AS DateTime2), 134969118, N'NULL', N'Dylan', N'MALE', N'Miller', 4087262, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (8, CAST(N'2018-06-28 00:00:08.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:08.0000000' AS DateTime2), N'import.sql', N'Av. Medinacelli y dorbigni', CAST(N'1973-02-21 00:00:00.0000000' AS DateTime2), 658797903, N'NULL', N'Gigi', N'FEMALE', N'Matthew', 4049406, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (9, CAST(N'2018-06-28 00:00:09.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:09.0000000' AS DateTime2), N'import.sql', N'Av. Petrolera km 6', CAST(N'1979-01-01 00:00:00.0000000' AS DateTime2), 879342154, N'NULL', N'Michael', N'MALE', N'Raheem', 4256792, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (10, CAST(N'2018-06-28 00:00:10.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:10.0000000' AS DateTime2), N'import.sql', N'av. America oeste y juan de la rosa', CAST(N'1972-02-18 00:00:00.0000000' AS DateTime2), 974026903, N'NULL', N'Ovidiu', N'MALE', N'Cracium', 4094648, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (11, CAST(N'2018-06-28 00:00:11.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:11.0000000' AS DateTime2), N'import.sql', N'simeon roncal #120', CAST(N'1953-08-29 00:00:00.0000000' AS DateTime2), 480168528, N'NULL', N'Thierry', N'MALE', N'D''Hers', 4201201, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (12, CAST(N'2018-06-28 00:00:12.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:12.0000000' AS DateTime2), N'import.sql', N'Av. Beijing y blanco galindo', CAST(N'1983-06-29 00:00:00.0000000' AS DateTime2), 486228782, N'NULL', N'Janice', N'FEMALE', N'Galvin', 4136783, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (13, CAST(N'2018-06-28 00:00:13.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:13.0000000' AS DateTime2), N'import.sql', N'Av. Villazon km 4 acera norte', CAST(N'1973-07-17 00:00:00.0000000' AS DateTime2), 42487730, N'NULL', N'Michael', N'MALE', N'Sullivan', 4355624, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (14, CAST(N'2018-06-28 00:00:14.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:14.0000000' AS DateTime2), N'import.sql', N'calle demetrio canelas y beijing', CAST(N'1955-06-03 00:00:00.0000000' AS DateTime2), 56920285, N'NULL', N'Sharon', N'FEMALE', N'Salavaria', 4250426, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (15, CAST(N'2018-06-28 00:00:15.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:15.0000000' AS DateTime2), N'import.sql', N'simon lopez y centenario #80', CAST(N'1969-04-19 00:00:00.0000000' AS DateTime2), 24756624, N'NULL', N'David', N'MALE', N'Bradley', 4078157, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (16, CAST(N'2018-06-28 00:00:16.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:16.0000000' AS DateTime2), N'import.sql', N'Av. Blanco galindo km 12', CAST(N'1981-06-03 00:00:00.0000000' AS DateTime2), 253022876, N'NULL', N'Kevin', N'MALE', N'Brown', 4166231, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (17, CAST(N'2018-06-28 00:00:18.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:18.0000000' AS DateTime2), N'import.sql', N'Av. Medinacelli y dorbigni', CAST(N'1972-03-01 00:00:00.0000000' AS DateTime2), 52541318, N'NULL', N'Mary', N'FEMALE', N'Dempsey', 4189957, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (18, CAST(N'2018-06-28 00:00:19.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:19.0000000' AS DateTime2), N'import.sql', N'Av. Petrolera km 6', CAST(N'1969-04-17 00:00:00.0000000' AS DateTime2), 323403273, N'NULL', N'Wanida', N'FEMALE', N'Benshoof', 4421642, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (19, CAST(N'2018-06-28 00:00:20.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:20.0000000' AS DateTime2), N'import.sql', N'av. America oeste y juan de la rosa', CAST(N'1980-03-07 00:00:00.0000000' AS DateTime2), 243322160, N'NULL', N'Terry', N'MALE', N'Eminhizer', 4414605, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (20, CAST(N'2018-06-28 00:00:21.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:21.0000000' AS DateTime2), N'import.sql', N'simeon roncal #120', CAST(N'1981-06-21 00:00:00.0000000' AS DateTime2), 95958330, N'NULL', N'Sariya', N'MALE', N'Harnpadoungsataya', 4289999, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (21,CAST(N'2018-06-28 00:00:22.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:22.0000000' AS DateTime2), N'import.sql', N'Av. Beijing y blanco galindo', CAST(N'1956-10-14 00:00:00.0000000' AS DateTime2), 767955365, N'NULL', N'Mary', N'FEMALE', N'Gibson', 4280131, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (22, CAST(N'2018-06-28 00:00:23.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:23.0000000' AS DateTime2), N'import.sql', N'Av. Villazon km 4 acera norte', CAST(N'1973-07-19 00:00:00.0000000' AS DateTime2), 72636981, N'NULL', N'Jill', N'FEMALE', N'Williams', 4300055, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (23, CAST(N'2018-06-28 00:00:24.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:24.0000000' AS DateTime2), N'import.sql', N'calle demetrio canelas y beijing', CAST(N'1977-02-07 00:00:00.0000000' AS DateTime2), 519899904, N'NULL', N'James', N'MALE', N'Hamilton', 4244186, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (24, CAST(N'2018-06-28 00:00:25.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:25.0000000' AS DateTime2), N'import.sql', N'simon lopez y centenario #80', CAST(N'1976-12-04 00:00:00.0000000' AS DateTime2), 277173473, N'NULL', N'Peter', N'MALE', N'Krebs', 4420676, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (25, CAST(N'2018-06-28 00:00:26.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:26.0000000' AS DateTime2), N'import.sql', N'Av. Blanco galindo km 12', CAST(N'1950-11-09 00:00:00.0000000' AS DateTime2), 446466105, N'NULL', N'Jo', N'FEMALE', N'Brown', 4124788, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (26, CAST(N'2018-06-28 00:00:28.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:28.0000000' AS DateTime2), N'import.sql', N'Av. Medinacelli y dorbigni', CAST(N'1973-10-26 00:00:00.0000000' AS DateTime2), 948320468, N'NULL', N'Mark', N'MALE', N'McArthur', 4330454, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (27, CAST(N'2018-06-28 00:00:29.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:29.0000000' AS DateTime2), N'import.sql', N'Av. Petrolera km 6', CAST(N'1983-10-30 00:00:00.0000000' AS DateTime2), 410742000, N'NULL', N'Britta', N'FEMALE', N'Simon', 4265515, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (28, CAST(N'2018-06-28 00:00:30.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:30.0000000' AS DateTime2), N'import.sql', N'av. America oeste y juan de la rosa', CAST(N'1980-06-20 00:00:00.0000000' AS DateTime2), 750246141, N'NULL', N'Margie', N'FEMALE', N'Shoop', 4371017, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (29, CAST(N'2018-06-28 00:00:31.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:31.0000000' AS DateTime2), N'import.sql', N'simeon roncal #120', CAST(N'1971-08-11 00:00:00.0000000' AS DateTime2), 330211482, N'NULL', N'Rebecca', N'FEMALE', N'Laszlo', 4100359, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (30, CAST(N'2018-06-28 00:00:32.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:32.0000000' AS DateTime2), N'import.sql', N'Av. Beijing y blanco galindo', CAST(N'1971-01-27 00:00:00.0000000' AS DateTime2), 801758002, N'NULL', N'Annik', N'MALE', N'Stahl', 4294753, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (31, CAST(N'2018-06-28 00:00:33.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:33.0000000' AS DateTime2), N'import.sql', N'Av. Villazon km 4 acera norte', CAST(N'1981-07-11 00:00:00.0000000' AS DateTime2), 754372876, N'NULL', N'Suchitra', N'FEMALE', N'Mohan', 4008033, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (32, CAST(N'2018-06-28 00:00:34.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:34.0000000' AS DateTime2), N'import.sql', N'calle demetrio canelas y beijing', CAST(N'1971-02-11 00:00:00.0000000' AS DateTime2), 999440576, N'NULL', N'Brandon', N'MALE', N'Heidepriem', 4030986, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (33, CAST(N'2018-06-28 00:00:35.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:35.0000000' AS DateTime2), N'import.sql', N'simon lopez y centenario #80', CAST(N'1978-09-01 00:00:00.0000000' AS DateTime2), 788456780, N'NULL', N'Jose', N'MALE', N'Lugo', 4253570, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (34, CAST(N'2018-06-28 00:00:36.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:36.0000000' AS DateTime2), N'import.sql', N'Av. Blanco galindo km 12', CAST(N'1980-09-07 00:00:00.0000000' AS DateTime2), 442121106, N'NULL', N'Chris', N'MALE', N'Okelberry', 4135416, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (35, CAST(N'2018-06-28 00:00:38.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:38.0000000' AS DateTime2), N'import.sql', N'Av. Medinacelli y dorbigni', CAST(N'1965-10-12 00:00:00.0000000' AS DateTime2), 461786517, N'NULL', N'Ed', N'MALE', N'Dudenhoefer', 4217190, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (36, CAST(N'2018-06-28 00:00:39.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:39.0000000' AS DateTime2), N'import.sql', N'Av. Petrolera km 6', CAST(N'1950-02-16 00:00:00.0000000' AS DateTime2), 309738752, N'NULL', N'JoLynn', N'FEMALE', N'Dobney', 4342562, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (37, CAST(N'2018-06-28 00:00:40.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:40.0000000' AS DateTime2), N'import.sql', N'av. America oeste y juan de la rosa', CAST(N'1967-09-28 00:00:00.0000000' AS DateTime2), 458159238, N'NULL', N'Bryan', N'MALE', N'Baker', 4206643, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (38, CAST(N'2018-06-28 00:00:41.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:41.0000000' AS DateTime2), N'import.sql', N'simeon roncal #120', CAST(N'1978-08-26 00:00:00.0000000' AS DateTime2), 339712426, N'NULL', N'James', N'MALE', N'Kramer', 4406200, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (39, CAST(N'2018-06-28 00:00:42.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:42.0000000' AS DateTime2), N'import.sql', N'Av. Beijing y blanco galindo', CAST(N'1982-12-21 00:00:00.0000000' AS DateTime2), 693325305, N'NULL', N'Nancy', N'FEMALE', N'Anderson', 4269989, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (40, CAST(N'2018-06-28 00:00:43.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:43.0000000' AS DateTime2), N'import.sql', N'Av. Villazon km 4 acera norte', CAST(N'1984-06-17 00:00:00.0000000' AS DateTime2), 276751903, N'NULL', N'Simon', N'MALE', N'Rapier', 4268170, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (41, CAST(N'2018-06-28 00:00:44.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:44.0000000' AS DateTime2), N'import.sql', N'calle demetrio canelas y beijing', CAST(N'1980-02-11 00:00:00.0000000' AS DateTime2), 500412746, N'NULL', N'Thomas', N'MALE', N'Michaels', 4212348, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (42, CAST(N'2018-06-28 00:00:45.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:45.0000000' AS DateTime2), N'import.sql', N'simon lopez y centenario #80', CAST(N'1970-03-13 00:00:00.0000000' AS DateTime2), 66073987, N'NULL', N'Eugene', N'MALE', N'Kogan', 4141293, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (43, CAST(N'2018-06-28 00:00:46.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:46.0000000' AS DateTime2), N'import.sql', N'Av. Blanco galindo km 12', CAST(N'1982-10-08 00:00:00.0000000' AS DateTime2), 33237992, N'NULL', N'Andrew', N'MALE', N'Hill', 4255946, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (44, CAST(N'2018-06-28 00:00:48.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:48.0000000' AS DateTime2), N'import.sql', N'Av. Medinacelli y dorbigni', CAST(N'1950-04-27 00:00:00.0000000' AS DateTime2), 912265825, N'NULL', N'Barry', N'MALE', N'Johnson', 4020008, 0xAA)
INSERT [dbo].[employee] ([id], [created_at], [created_by], [updated_at], [updated_by], [address], [birth_date], [ci], [email], [first_name], [gender], [last_name], [phone_number], [picture]) VALUES (45, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'import.sql', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'import.sql', N'Av. Petrolera km 6', CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), 844973625, N'NULL', N'Sidney', N'MALE', N'Higa', 4053740, 0xAA)
SET IDENTITY_INSERT [dbo].[employee] OFF

PRINT 'Employee table done...';
--

-- -- equipment categories items
PRINT 'Insert data into the Equipment_Category table...';

SET IDENTITY_INSERT [dbo].[equipment_category] ON
INSERT [dbo].[equipment_category](id, name, description, equipment_type, image_path, created_at, created_by, updated_at, updated_by) values(1, N'casco', N'Prenda protectora usada en la cabeza y hecha generalmente de metal o de algun otro material resistente, tipicamente para la proteccion de la cabeza contra objetos que caen', N'SAFETY', N'/assets/images/helmet.jpg', CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment_category](id, name, description, equipment_type, image_path, created_at, created_by, updated_at, updated_by) values(2, N'guantes', N'Prenda protectora usada en las manos puede ser de varios tipos lates, goma, caucho, etc. su finalidad es proteger a las manos de golpes, rayones, calor extremo o sustancias dañinas', N'SAFETY', N'/assets/images/gloves.jpg', CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment_category](id, name, description, equipment_type, image_path, created_at, created_by, updated_at, updated_by) values(3, N'audicion', N'disposito protector usado en los oidos, tipicamente usado para la proteccion del canal auditivo contra sonidos o ruidos extemadamente fuertes', N'SAFETY', N'/assets/images/audio2.jpg', CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment_category](id, name, description, equipment_type, image_path, created_at, created_by, updated_at, updated_by) values(4, N'gafas', N'disposito protector usado en los ojos, tipicamente usado para la proteccion de los ojos contra golpes, luz extrema, y susstancias dañinas', N'SAFETY', N'/assets/images/glasses.jpg', CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment_category](id, name, description, equipment_type, image_path, created_at, created_by, updated_at, updated_by) values(5, N'botas', N'disposito protector usado en los pies, tipicamente usado para la proteccion de los pies contra golpes, objetos que caen, calor extremo y sustancias dañinas', N'SAFETY', N'/assets/images/boots.jpg', CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment_category](id, name, description, equipment_type, image_path, created_at, created_by, updated_at, updated_by) values(6, N'mask', N'disposito protector usado en la cara practicamente en el sector de la boca y la nariz, tipicamente usado para la proteccion de los pulmones contra gases toxicos', N'SAFETY', N'/assets/images/mask.jpg', CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment_category](id, name, description, equipment_type, image_path, created_at, created_by, updated_at, updated_by) values(7, N'mezcladoras', N'Es una maquina para elaborar concreto y hormigón, facilitando y agilizando el trabajo del obrero en la mezcla', N'OPERATIONAL', N'/assets/images/mezcla.jpg', CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment_category](id, name, description, equipment_type, image_path, created_at, created_by, updated_at, updated_by) values(8, N'estructuras', N'Son los equipos que generalmente se usan para llegar a partes altas en la construccion, estos pueden ser andamios, escaleras, elevadores, etc.', N'OPERATIONAL', N'/assets/images/estructuras.jpg', CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment_category](id, name, description, equipment_type, image_path, created_at, created_by, updated_at, updated_by) values(9, N'herramientas', N'Son los distintos tipos de herramientas usados en la obra, como ser martillos, carretillas, etc.', N'OPERATIONAL', N'/assets/images/tools.jpg', CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
SET IDENTITY_INSERT [dbo].[equipment_category] OFF

PRINT 'Equipment_Category table done...';
--

-- -- equipment_category_characteristic
PRINT 'Insert data into the Equipment_Category_Characteristic table...';

INSERT [dbo].[equipment_category_characteristic] (equipment_category_id, characteristic) values(1, N'Hecha de polietileno de alta densidad y fibra sintética');
INSERT [dbo].[equipment_category_characteristic] (equipment_category_id, characteristic) values(1, N'Cuenta con una Visera que cubre el area de los ojos');
INSERT [dbo].[equipment_category_characteristic] (equipment_category_id, characteristic) values(1, N'Cuenta con un arnés para sujetar el casco de un material flexible');
INSERT [dbo].[equipment_category_characteristic] (equipment_category_id, characteristic) values(1, N'Cuenta con un Barboquejo que se acopla bajo la barbilla');
INSERT [dbo].[equipment_category_characteristic] (equipment_category_id, characteristic) values(1, N'Cuenta con ranura para linterna');
INSERT [dbo].[equipment_category_characteristic] (equipment_category_id, characteristic) values(7, N'Mezcladora fijas al suelo');
INSERT [dbo].[equipment_category_characteristic] (equipment_category_id, characteristic) values(7, N'Mezcladoras moviles y portatiles con ruedas');
INSERT [dbo].[equipment_category_characteristic] (equipment_category_id, characteristic) values(7, N'Electricas y a gasolina');

PRINT 'Equipment_Category_Characteristic table done...';
--

-- -- equipment_category_protect_to
PRINT 'Insert data into the Equipment_Category_Protect_To table...';

INSERT [dbo].[equipment_category_protect_to] (equipment_category_id, protect_to) values(1, N'cabeza');
INSERT [dbo].[equipment_category_protect_to] (equipment_category_id, protect_to) values(1, N'ojos');
INSERT [dbo].[equipment_category_protect_to] (equipment_category_id, protect_to) values(1, N'orejas');
INSERT [dbo].[equipment_category_protect_to] (equipment_category_id, protect_to) values(1, N'rostro');

PRINT 'Equipment_Category_Protect_To table done...';
--

-- -- equipment_category_resistant_to
PRINT 'Insert data into the Equipment_Category_Resistant_To table...';

INSERT [dbo].[equipment_category_resistant_to] (equipment_category_id, resistant_to) values(1, N'Calor');
INSERT [dbo].[equipment_category_resistant_to] (equipment_category_id, resistant_to) values(1, N'Golpes Fuertes');
INSERT [dbo].[equipment_category_resistant_to] (equipment_category_id, resistant_to) values(1, N'Descargas Electricas');
INSERT [dbo].[equipment_category_resistant_to] (equipment_category_id, resistant_to) values(7, N'Altos voltajes');
INSERT [dbo].[equipment_category_resistant_to] (equipment_category_id, resistant_to) values(7, N'Golpes Fuertes');

PRINT 'Equipment_Category_Resistant_To table done...';
--

-- -- equipments items
PRINT 'Insert data into the Equipment table...';

SET IDENTITY_INSERT [dbo].[equipment] ON
INSERT [dbo].[equipment](id, code, state,available, acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(1, N'casco1', N'nuevo',1, '2017-03-20', 1, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment](id, code, state,available, acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(2, N'casco2', N'usado',1, '2018-03-20', 1, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment](id, code, state,available ,acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(3, N'guantes amarillos', N'nuevo',1, '2017-11-10', 2, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment](id, code, state,available ,acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(4, N'audifonos x', N'usado',1, '2018-04-20', 3, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment](id, code, state,available ,acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(5, N'botas de caucho', N'nuevo',1, '2017-12-05', 5, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
--
INSERT [dbo].[equipment](id, code, state,available ,acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(6, N'botas de caucho', N'nuevo',1, '2017-12-05', 5, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment](id, code, state,available ,acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(7, N'Lentes de proteccion', N'nuevo',1, '2017-12-05', 4, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment](id, code, state,available ,acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(8, N'Casco', N'nuevo',1, '2017-12-05', 1, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment](id, code, state,available ,acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(9, N'Guantes', N'nuevo',1, '2017-12-05', 2, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
--
INSERT [dbo].[equipment](id, code, state,available ,acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(10, N'botas de caucho', N'nuevo',1, '2017-12-05', 5, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment](id, code, state,available ,acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(11, N'Lentes de proteccion', N'nuevo',1, '2017-12-05', 4, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment](id, code, state,available ,acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(12, N'Casco', N'nuevo',1, '2017-12-05', 1, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment](id, code, state,available ,acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(13, N'Guantes', N'nuevo',1, '2017-12-05', 2, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
--
INSERT [dbo].[equipment](id, code, state,available, acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(14, N'Mezcladora electrica', N'nuevo',1, '2018-01-20', 7, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment](id, code, state,available, acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(15, N'Mezcladora de gasolina', N'usado',1, '2017-03-20', 7, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment](id, code, state,available ,acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(16, N'Andamio portatil', N'nuevo',1, '2017-11-10', 8, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment](id, code, state,available ,acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(17, N'Elevador electrico', N'usado',1, '2018-02-11', 8, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment](id, code, state,available ,acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(18, N'Carretilla', N'nuevo',1, '2016-09-10', 9, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment](id, code, state,available ,acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(19, N'Pala', N'usado',1, '2018-03-05', 9, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[equipment](id, code, state,available ,acquisition_date, category_id, created_at, created_by, updated_at, updated_by) values(20, N'Martillo', N'nuevo',1, '2015-03-05', 9, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
--
SET IDENTITY_INSERT [dbo].[equipment] OFF

PRINT 'Equipment table done...';
--

-- -- project items
PRINT 'Insert data into the Project table...';

SET IDENTITY_INSERT [dbo].[project] ON
INSERT [dbo].[project] ([id], [created_at], [created_by], [updated_at], [updated_by], [description], [name], [place], [status_project]) VALUES (1, NULL, NULL, CAST(N'2018-06-29 17:13:08.2659893' AS DateTime2), NULL, N'Obra requerida para la odesur', N'Coliseo Squash', N'Ubicado en la melchor perez de olguin y lincon', N'STARTED')
INSERT [dbo].[project] ([id], [created_at], [created_by], [updated_at], [updated_by], [description], [name], [place], [status_project]) VALUES (2, NULL, NULL, CAST(N'2018-06-29 17:14:05.1150543' AS DateTime2), NULL, N'Requerimiento de la odesur', N'Piscina olimpica', N'Parque mariscal santa cruz', N'COMPLETED')
INSERT [dbo].[project] ([id], [created_at], [created_by], [updated_at], [updated_by], [description], [name], [place], [status_project]) VALUES (3, NULL, NULL, CAST(N'2018-06-29 17:15:25.9937469' AS DateTime2), NULL, N'Mejoras en el coliseo jose villazon', N'Adaptacion para coliseo de judo', N'costanera coliseo de voleibol', N'COMPLETED')
INSERT [dbo].[project] ([id], [created_at], [created_by], [updated_at], [updated_by], [description], [name], [place], [status_project]) VALUES (4, NULL, NULL, CAST(N'2018-06-29 17:16:13.4035595' AS DateTime2), NULL, N'Cambio de piso y banios', N'Mejora coliseo de Basket', N'costanera, cercado', N'STARTED')
INSERT [dbo].[project] ([id], [created_at], [created_by], [updated_at], [updated_by], [description], [name], [place], [status_project]) VALUES (5, NULL, NULL, CAST(N'2018-06-29 17:17:06.4718213' AS DateTime2), NULL, N'Obra de 4 pisos para mercado de abarrotes', N'Mercado modelo del sud', N'zona sud', N'CANCELLED')
INSERT [dbo].[project] ([id], [created_at], [created_by], [updated_at], [updated_by], [description], [name], [place], [status_project]) VALUES (6, NULL, NULL, CAST(N'2018-06-29 17:17:45.6553125' AS DateTime2), NULL, N'Colegio domingo sabio', N'Tinglado de colegio', N'zona sud', N'CANCELLED')
SET IDENTITY_INSERT [dbo].[project] OFF

PRINT 'Project table done...';
--

-- -- departments items
PRINT 'Insert data into the Department table...';

SET IDENTITY_INSERT [dbo].[department] ON
INSERT [dbo].[department](id, name, description, created_at, created_by, updated_at, updated_by) values(1, N'Plantel de Obra Gruesa', N'Encargado de la obra gruesa. Cimientos, Estructura, Paredes', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[department](id, name, description, created_at, created_by, updated_at, updated_by) values(2, N'Plantel de Obra Fina', N'Encargado de la obra fina de la construccion. Cubierta de techos, cielos rasos, revoques', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[department](id, name, description, created_at, created_by, updated_at, updated_by) values(3, N'Plantel de encogrado', N'Encargado de la estructura metalica', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[department](id, name, description, created_at, created_by, updated_at, updated_by) values(4, N'Plantel de Pintura', N'Encargado de pintura', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[department](id, name, description, created_at, created_by, updated_at, updated_by) values(5, N'Instalaciones Electricas', N'Cableado Electrico', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[department](id, name, description, created_at, created_by, updated_at, updated_by) values(6, N'Instalaciones Sanitarias', N'Instalaciones desagues', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null, null);
SET IDENTITY_INSERT [dbo].[department] OFF

PRINT 'Department table done...';
--

-- -- project department
INSERT [dbo].[project_department](project_id, department_id) values (1, 1);
INSERT [dbo].[project_department](project_id, department_id) values (1, 2);
INSERT [dbo].[project_department](project_id, department_id) values (1, 3);
INSERT [dbo].[project_department](project_id, department_id) values (1, 4);
INSERT [dbo].[project_department](project_id, department_id) values (1, 5);
INSERT [dbo].[project_department](project_id, department_id) values (1, 6);

INSERT [dbo].[project_department](project_id, department_id) values (2, 1);
INSERT [dbo].[project_department](project_id, department_id) values (2, 2);
INSERT [dbo].[project_department](project_id, department_id) values (2, 3);
INSERT [dbo].[project_department](project_id, department_id) values (2, 4);
INSERT [dbo].[project_department](project_id, department_id) values (2, 5);
INSERT [dbo].[project_department](project_id, department_id) values (2, 6);

INSERT [dbo].[project_department](project_id, department_id) values (3, 1);
INSERT [dbo].[project_department](project_id, department_id) values (3, 2);
INSERT [dbo].[project_department](project_id, department_id) values (3, 3);
INSERT [dbo].[project_department](project_id, department_id) values (3, 4);
INSERT [dbo].[project_department](project_id, department_id) values (3, 5);
INSERT [dbo].[project_department](project_id, department_id) values (3, 6);

INSERT [dbo].[project_department](project_id, department_id) values (4, 1);
INSERT [dbo].[project_department](project_id, department_id) values (4, 2);
INSERT [dbo].[project_department](project_id, department_id) values (4, 3);
INSERT [dbo].[project_department](project_id, department_id) values (4, 4);
INSERT [dbo].[project_department](project_id, department_id) values (4, 5);
INSERT [dbo].[project_department](project_id, department_id) values (4, 6);

INSERT [dbo].[project_department](project_id, department_id) values (5, 1);
INSERT [dbo].[project_department](project_id, department_id) values (5, 2);
INSERT [dbo].[project_department](project_id, department_id) values (5, 3);
INSERT [dbo].[project_department](project_id, department_id) values (5, 4);
INSERT [dbo].[project_department](project_id, department_id) values (5, 5);
INSERT [dbo].[project_department](project_id, department_id) values (5, 6);

INSERT [dbo].[project_department](project_id, department_id) values (6, 1);
INSERT [dbo].[project_department](project_id, department_id) values (6, 2);
INSERT [dbo].[project_department](project_id, department_id) values (6, 3);
INSERT [dbo].[project_department](project_id, department_id) values (6, 4);
INSERT [dbo].[project_department](project_id, department_id) values (6, 5);
INSERT [dbo].[project_department](project_id, department_id) values (6, 6);

-- -- position items
PRINT 'Insert data into the Position table...';

SET IDENTITY_INSERT [dbo].[position] ON
INSERT [dbo].[position](id, name, description, created_at, created_by, updated_at, updated_by) values(1, N'Pintor ayudante', N'Pintado de las obras', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[position](id, name, description, created_at, created_by, updated_at, updated_by) values(2, N'Pintor Maestro', N'Pintado de las obras', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[position](id, name, description, created_at, created_by, updated_at, updated_by) values(3, N'Ing. Contruccion civil', N'Realiza el diseño, y calculo estructural', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[position](id, name, description, created_at, created_by, updated_at, updated_by) values(4, N'Albañil maestro', N'Realiza la contruccion de la obra gruesa de la obra', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[position](id, name, description, created_at, created_by, updated_at, updated_by) values(5, N'Albañil ayudante', N'Realiza la construccion con supervicion en la obra gruesa y obra fina del proyecto asignado', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[position](id, name, description, created_at, created_by, updated_at, updated_by) values(6, N'Plomeria', N'Realiza el diseño, la instalacion y mantenimiento del alcantarillado y tuberias de agua', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[position](id, name, description, created_at, created_by, updated_at, updated_by) values(7, N'Tecnico Electricista', N'Realia la instalacion electrica de la obra.', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[position](id, name, description, created_at, created_by, updated_at, updated_by) values(8, N'Ing Electrico', N'Realiza el diseño, y los calculos de carga del sistemas electrico en la obra', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null, null);

SET IDENTITY_INSERT [dbo].[position] OFF

PRINT 'Position table done...';
--


-- -- department position
INSERT [dbo].[department_position](department_id, position_id) values (4, 1);
INSERT [dbo].[department_position](department_id, position_id) values (4, 2);

INSERT [dbo].[department_position](department_id, position_id) values (1, 3);
INSERT [dbo].[department_position](department_id, position_id) values (1, 4);
INSERT [dbo].[department_position](department_id, position_id) values (1, 5);

INSERT [dbo].[department_position](department_id, position_id) values (5, 7);
INSERT [dbo].[department_position](department_id, position_id) values (5, 8);

INSERT [dbo].[department_position](department_id, position_id) values (6, 6);
--

-- -- security
PRINT 'Insert data into the Role table...';

SET IDENTITY_INSERT [dbo].[role] ON
INSERT INTO [dbo].[role] (id, role_name, description, created_at, created_by, updated_at, updated_by) VALUES (1, N'STANDARD_USER', N'Standard User - Has no admin rights', CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT INTO [dbo].[role] (id, role_name, description, created_at, created_by, updated_at, updated_by) VALUES (2, N'ADMIN_USER', N'Admin User - Has permission to perform admin tasks', CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
SET IDENTITY_INSERT [dbo].[role] OFF

PRINT 'Role table done...';
--

-- -- USER
-- -- non-encrypted password: jwtpass
PRINT 'Insert data into the Users table...';

SET IDENTITY_INSERT [dbo].[users] ON
INSERT INTO [dbo].[users] (id, first_name, last_name, email, password, username, created_at, created_by, updated_at, updated_by) VALUES (1, N'user1', N'user1', N'email@gmail.com', N'821f498d827d4edad2ed0960408a98edceb661d9f34287ceda2962417881231a', N'john.doe', CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT INTO [dbo].[users] (id, first_name, last_name, email, password, username, created_at, created_by, updated_at, updated_by) VALUES (2, N'Admin', N'Admin', N'email@gmail.com', N'821f498d827d4edad2ed0960408a98edceb661d9f34287ceda2962417881231a', N'admin.admin', CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
SET IDENTITY_INSERT [dbo].[users] OFF

PRINT 'Users table done...';
--

-- -- USER ROLE
PRINT 'Insert data into the User_Role table...';

INSERT INTO user_role(user_id, role_id) VALUES(1,1);
INSERT INTO user_role(user_id, role_id) VALUES(2,1);
INSERT INTO user_role(user_id, role_id) VALUES(2,2);

PRINT 'User_Role table done...';
--

-- -- assign equipments
PRINT 'Insert data into the Equipment_Assignment table...';

SET IDENTITY_INSERT [dbo].[equipment_assignment] ON
INSERT INTO [dbo].[equipment_assignment] (id, employee_id, equipment_id, active, init_date, end_date, created_at, created_by, updated_at, updated_by) VALUES (1, 1, 6, 1, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2) , CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT INTO [dbo].[equipment_assignment] (id, employee_id, equipment_id, active, init_date, end_date, created_at, created_by, updated_at, updated_by) VALUES (2, 1, 7, 1, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2) , CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT INTO [dbo].[equipment_assignment] (id, employee_id, equipment_id, active, init_date, end_date, created_at, created_by, updated_at, updated_by) VALUES (3, 1, 8, 1, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2) , CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT INTO [dbo].[equipment_assignment] (id, employee_id, equipment_id, active, init_date, end_date, created_at, created_by, updated_at, updated_by) VALUES (4, 1, 9, 1, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2) , CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
--
INSERT INTO [dbo].[equipment_assignment] (id, employee_id, equipment_id, active, init_date, end_date, created_at, created_by, updated_at, updated_by) VALUES (5, 2, 1, 1, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2) , CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT INTO [dbo].[equipment_assignment] (id, employee_id, equipment_id, active, init_date, end_date, created_at, created_by, updated_at, updated_by) VALUES (6, 2, 3, 1, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2) , CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
--
INSERT INTO [dbo].[equipment_assignment] (id, employee_id, equipment_id, active, init_date, end_date, created_at, created_by, updated_at, updated_by) VALUES (7, 3, 10, 1, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2) , CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT INTO [dbo].[equipment_assignment] (id, employee_id, equipment_id, active, init_date, end_date, created_at, created_by, updated_at, updated_by) VALUES (8, 3, 11, 1, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2) , CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT INTO [dbo].[equipment_assignment] (id, employee_id, equipment_id, active, init_date, end_date, created_at, created_by, updated_at, updated_by) VALUES (9, 3, 12, 1, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2) , CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT INTO [dbo].[equipment_assignment] (id, employee_id, equipment_id, active, init_date, end_date, created_at, created_by, updated_at, updated_by) VALUES (10, 3, 13, 1, CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2) , CAST(N'1950-10-01 00:00:00.0000000' AS DateTime2), N'importfile.sql', null, null);
SET IDENTITY_INSERT [dbo].[equipment_assignment] OFF

PRINT 'Equipment_Assignment table done...';
--

-- -- contract items
PRINT 'Insert data into the Contract table...';

SET IDENTITY_INSERT [dbo].[contract] ON

INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(1, 1, 1, 1, N'FULLTIME', 2000, N'2017-03-20', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(2, 2, 1, 2, N'HALFTIME', 2500, N'2015-01-10', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(3, 3, 1, 3, N'PARTTIME', 3140.67, N'2018-03-20', N'2018-12-20', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(4, 4, 1, 4, N'PARTTIME', 2450.15, N'2018-01-01', N'2019-01-01', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(5, 5, 1, 5, N'FULLTIME', 2000, N'2017-03-20', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(6, 6, 1, 6, N'HALFTIME', 2500, N'2015-01-10', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(7, 7, 1, 7, N'PARTTIME', 3140.67, N'2018-03-20', N'2018-12-20', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(8, 8, 2, 8, N'PARTTIME', 2450.15, N'2018-01-01', N'2019-01-01', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(9, 9, 2, 1, N'FULLTIME', 2000, N'2017-03-20', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(10, 10, 2, 2, N'HALFTIME', 2500, N'2015-01-10', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(11, 11, 2, 3, N'PARTTIME', 3140.67, N'2018-03-20', N'2018-12-20', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(12, 12, 2, 4, N'PARTTIME', 2450.15, N'2018-01-01', N'2019-01-01', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(13, 13, 2, 5, N'FULLTIME', 2000, N'2017-03-20', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(14, 14, 2, 6, N'HALFTIME', 2500, N'2015-01-10', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(15, 15, 2, 7, N'PARTTIME', 3140.67, N'2018-03-20', N'2018-12-20', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(16, 16, 2, 8, N'PARTTIME', 2450.15, N'2018-01-01', N'2019-01-01', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(17, 17, 2, 1, N'FULLTIME', 2000, N'2017-03-20', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(18, 18, 3, 2, N'HALFTIME', 2500, N'2015-01-10', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(19, 19, 3, 3, N'PARTTIME', 3140.67, N'2018-03-20', N'2018-12-20', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(20, 20, 3, 4, N'PARTTIME', 2450.15, N'2018-01-01', N'2019-01-01', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(21, 21, 3, 5, N'FULLTIME', 2000, N'2017-03-20', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(22, 22, 3, 6, N'HALFTIME', 2500, N'2015-01-10', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(23, 23, 3, 7, N'PARTTIME', 3140.67, N'2018-03-20', N'2018-12-20', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(24, 24, 3, 8, N'PARTTIME', 2450.15, N'2018-01-01', N'2019-01-01', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(25, 25, 3, 1, N'FULLTIME', 2000, N'2017-03-20', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(26, 26, 3, 2, N'HALFTIME', 2500, N'2015-01-10', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(27, 27, 3, 3, N'PARTTIME', 3140.67, N'2018-03-20', N'2018-12-20', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(28, 28, 3, 4, N'PARTTIME', 2450.15, N'2018-01-01', N'2019-01-01', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(29, 29, 3, 5, N'FULLTIME', 2000, N'2017-03-20', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(30, 30, 3, 6, N'HALFTIME', 2500, N'2015-01-10', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(31, 31, 3, 7, N'PARTTIME', 3140.67, N'2018-03-20', N'2018-12-20', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(32, 32, 4, 8, N'PARTTIME', 2450.15, N'2018-01-01', N'2019-01-01', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(33, 33, 4, 1, N'FULLTIME', 2000, N'2017-03-20', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(34, 34, 4, 2, N'HALFTIME', 2500, N'2015-01-10', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(35, 35, 4, 3, N'PARTTIME', 3140.67, N'2018-03-20', N'2018-12-20', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(36, 36, 4, 4, N'PARTTIME', 2450.15, N'2018-01-01', N'2019-01-01', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(37, 37, 4, 5, N'FULLTIME', 2000, N'2017-03-20', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(38, 38, 4, 6, N'HALFTIME', 2500, N'2015-01-10', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(39, 39, 4, 7, N'PARTTIME', 3140.67, N'2018-03-20', N'2018-12-20', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(40, 40, 4, 8, N'PARTTIME', 2450.15, N'2018-01-01', N'2019-01-01', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(41, 41, 4, 1, N'FULLTIME', 2000, N'2017-03-20', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(42, 42, 4, 2, N'HALFTIME', 2500, N'2015-01-10', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(43, 43, 4, 3, N'PARTTIME', 3140.67, N'2018-03-20', N'2018-12-20', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(44, 44, 4, 4, N'PARTTIME', 2450.15, N'2018-01-01', N'2019-01-01', CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);
INSERT [dbo].[contract](id, employee_id, project_id, position_id, employee_type, salary, init_date, end_date, created_at, created_by, updated_at, updated_by) values(45, 45, 4, 5, N'FULLTIME', 2000, N'2017-03-20', null, CAST(N'2018-06-28 00:00:49.0000000' AS DateTime2), N'importfile.sql', null, null);

SET IDENTITY_INSERT [dbo].[contract] OFF

PRINT 'Contract table done...';
--

-- -- accidentes items
PRINT 'Insert data into the Accident table...';

SET IDENTITY_INSERT [dbo].[accident] ON
--2018
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (1, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2018-05-26'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 1)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (2, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2018-05-26'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 2)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (3, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2018-05-26'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 3)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (4, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2018-05-27'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 4)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (5, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2018-05-28'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 5)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (6, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2018-06-28'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 6)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (7, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2018-06-29'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 7)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (8, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2018-06-29'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 8)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (9, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2018-06-29'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 9)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (10, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2018-06-29'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 10)
--2017
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (11, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2017-01-10'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 11)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (12, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2017-01-10'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 12)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (13, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2017-02-11'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 13)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (14, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2017-02-11'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 14)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (15, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2017-03-12'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 15)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (16, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2017-03-12'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 16)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (17, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2017-04-13'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 17)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (18, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2017-04-13'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 18)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (19, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2017-05-13'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 19)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (20, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2017-05-14'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 20)
--2016
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (21, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2016-01-10'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 21)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (22, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2016-01-10'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 22)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (23, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2016-02-11'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 23)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (24, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2016-02-11'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 24)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (25, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2016-03-12'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 25)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (26, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2016-03-12'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 26)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (27, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2016-04-13'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 27)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (28, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2016-04-13'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 28)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (29, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2016-05-13'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 29)
INSERT [dbo].[accident](id, created_at, created_by, updated_at, updated_by, accident_type, assigned, body, cause, date_init, day_debited, day_lost, end_lost_time, factor, frecuency, kind, medication, receive, severity, start_lost_time, turn, way, employee_id) Values (30, CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'importfile.sql', null , null, N'PERSONAL', N'NOT', N'CRANIUM', 'Descrip', CAST(N'2016-05-14'AS DateTime2), '5', '4', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'WALL', N'YES', N'STINGIN', N'WITH', N'FIRSTAID', N'SEVERE', CAST(N'2018-06-29 17:17:45.6553125'AS DateTime2), N'MORNING', N'HIGHT', 30)


SET IDENTITY_INSERT [dbo].[accident] OFF

PRINT 'Accident table done...';
--

COMMIT TRANSACTION;

END TRY
BEGIN CATCH
ROLLBACK TRANSACTION
SELECT 'An error occurred while trying to insert the data, The transaction is rolled back.' as Message, ERROR_MESSAGE() AS DetailError
END CATCH
