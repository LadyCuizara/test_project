IF  NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'g2ssid')
	CREATE DATABASE [g2ssid];
GO

USE [g2ssid]
GO

IF OBJECT_ID(N'[dbo].[FK_departmentPosition_department]')  IS NOT NULL
	ALTER TABLE department_position DROP CONSTRAINT FK_departmentPosition_department;
IF OBJECT_ID(N'[dbo].[FK_departmentPosition_position]')  IS NOT NULL
	ALTER TABLE department_position DROP CONSTRAINT FK_departmentPosition_position;
IF OBJECT_ID(N'[dbo].[FK_departmentProject_department]')  IS NOT NULL
	ALTER TABLE project_department DROP CONSTRAINT FK_projectDepartment_department;
IF OBJECT_ID(N'[dbo].[FK_departmentProjet_ct_project]')  IS NOT NULL
	ALTER TABLE project_department DROP CONSTRAINT FK_projectDepartment_project;

IF OBJECT_ID('dbo.', 'U') IS NOT NULL
  DROP TABLE dbo.contract;

IF OBJECT_ID('dbo.department_position', 'U') IS NOT NULL
  DROP TABLE dbo.department_position;
IF OBJECT_ID('dbo.project_department', 'U') IS NOT NULL
  DROP TABLE dbo.project_department;
IF OBJECT_ID('dbo.contract', 'U') IS NOT NULL
  DROP TABLE dbo.contract;
IF OBJECT_ID('dbo.position', 'U') IS NOT NULL
  DROP TABLE dbo.position;

IF OBJECT_ID('dbo.project', 'U') IS NOT NULL
  DROP TABLE dbo.project;
IF OBJECT_ID('dbo.accident', 'U') IS NOT NULL
  DROP TABLE dbo.accident;
IF OBJECT_ID('department', 'U') IS NOT NULL
  DROP TABLE dbo.department;

IF OBJECT_ID('dbo.equipment_incomplete', 'U') IS NOT NULL
  DROP TABLE dbo.equipment_incomplete;

IF OBJECT_ID('dbo.equipment_control_daily', 'U') IS NOT NULL
  DROP TABLE dbo.equipment_control_daily;

IF OBJECT_ID('dbo.equipment_assignment', 'U') IS NOT NULL
  DROP TABLE dbo.equipment_assignment;

IF OBJECT_ID('dbo.employee', 'U') IS NOT NULL
  DROP TABLE dbo.employee;

IF OBJECT_ID('dbo.equipment', 'U') IS NOT NULL
  DROP TABLE dbo.equipment;

IF OBJECT_ID('dbo.equipment_category_characteristic', 'U') IS NOT NULL
  DROP TABLE dbo.equipment_category_characteristic;

IF OBJECT_ID('dbo.equipment_category_protect_to', 'U') IS NOT NULL
  DROP TABLE dbo.equipment_category_protect_to;

IF OBJECT_ID('dbo.equipment_category_resistant_to', 'U') IS NOT NULL
  DROP TABLE dbo.equipment_category_resistant_to;


IF OBJECT_ID('dbo.equipment_category', 'U') IS NOT NULL
  DROP TABLE dbo.equipment_category;

IF OBJECT_ID('dbo.user_role', 'U') IS NOT NULL
  DROP TABLE dbo.user_role;
IF OBJECT_ID('dbo.users', 'U') IS NOT NULL
  DROP TABLE dbo.users;
IF OBJECT_ID('dbo.role', 'U') IS NOT NULL
  DROP TABLE dbo.role;

/********************************************************************************************************
**  Table Name:		employee
**  Primary Key:	ID
**  Foreign Keys:	-
*********************************************************************************************************/
--TABLE employee
--** Adding Rowversion at table employee      By: Terrazas Mercado Michel

PRINT 'Creating the Employee table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[employee]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE employee (id bigint IDENTITY CONSTRAINT PK_cliente PRIMARY KEY,
					  created_at datetime DEFAULT NULL,
					  created_by varchar(20) DEFAULT NULL,
					  updated_at datetime DEFAULT NULL,
					  updated_by varchar(20) DEFAULT NULL,
					  address varchar(255) DEFAULT NULL,
					  birth_date datetime NOT NULL,
					  ci int NOT NULL,
					  email varchar(255) DEFAULT NULL,
					  first_name varchar(255) NOT NULL,
					  gender varchar(8) DEFAULT NULL,
					  last_name varchar(255) NOT NULL,
					  phone_number int DEFAULT NULL,
					  picture varbinary(max),
					  Rowversion timestamp NOT NULL,
					  )
PRINT 'Table employee created!';
	END
 ELSE
	BEGIN
		PRINT 'Table Employee already exists into the database';
	END
GO
/********************************************************************************************************
**  Table Name:		position
**  Primary Key:	id
**  Foreign Keys:	 -

*********************************************************************************************************/
--TABLE position
--** Adding Rowversion at table position      By: Terrazas Mercado Michel

CREATE TABLE position (id bigint IDENTITY CONSTRAINT PK_position PRIMARY KEY,
  created_at datetime DEFAULT NULL,
  created_by varchar(20) DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  updated_by varchar(20) DEFAULT NULL,
  description varchar(255) DEFAULT NULL,
  name varchar(255) DEFAULT NULL,
  Rowversion timestamp NOT NULL,
)
GO
 /********************************************************************************************************
**  Table Name:	project
**  Primary Key:	id
**  Foreign Keys:	 -
*********************************************************************************************************/
--** Adding Rowversion at table project     By: Terrazas Mercado Michel

CREATE TABLE project (id BIGINT IDENTITY CONSTRAINT PK_project PRIMARY KEY,
  created_at datetime DEFAULT NULL,
  created_by varchar(20) DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  updated_by varchar(20) DEFAULT NULL,
  description varchar(255) NOT NULL,
  name varchar(255) NOT NULL,
  place varchar(255) NOT NULL,
  status_project varchar(16) DEFAULT NULL
  ,Rowversion timestamp NOT NULL
)
GO
/********************************************************************************************************
**  Table Name:		contract
**  Primary Key:	id
**  Foreign Keys:	 employee_id, position_id
*********************************************************************************************************/
--** Adding Rowversion at table contract      By: Terrazas Mercado Michel

CREATE TABLE contract (
  id BIGINT IDENTITY CONSTRAINT PK_contract PRIMARY KEY,
  created_at datetime DEFAULT NULL,
  created_by varchar(20) DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  updated_by varchar(20) DEFAULT NULL,
  employee_type varchar(15) DEFAULT NULL,
  end_date datetime DEFAULT NULL,
  init_date datetime NOT NULL,
  salary decimal DEFAULT NULL,
  employee_id BIGINT CONSTRAINT FK_employee FOREIGN KEY
			REFERENCES dbo.employee(id) ON DELETE CASCADE,
  position_id BIGINT CONSTRAINT FK_position FOREIGN KEY
			REFERENCES dbo.position(id) ON DELETE CASCADE
  ,project_id BIGINT CONSTRAINT FK_project_C FOREIGN KEY
			REFERENCES dbo.project ON DELETE CASCADE	
	,Rowversion timestamp NOT NULL
)
/********************************************************************************************************
**  Table Name:		dbo.accident
**  Primary Key:	id
**  Foreign Keys:	 employee_id
*********************************************************************************************************/
--** Adding Rowversion at table accident_form      By: Terrazas Mercado Michel

CREATE TABLE dbo.accident (id BIGINT IDENTITY CONSTRAINT PK_accident PRIMARY KEY,
  created_at datetime DEFAULT NULL,
  created_by varchar(20) DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  updated_by varchar(20) DEFAULT NULL,
  accident_type varchar(15) DEFAULT NULL,
  assigned varchar(8) DEFAULT NULL,
  body varchar(15) DEFAULT NULL,
  cause varchar(255) NOT NULL,
  date_init datetime NOT NULL,
  day_debited varchar(255) NOT NULL,
  day_lost varchar(255) NOT NULL,
  end_lost_time datetime NOT NULL,
  factor varchar(15) DEFAULT NULL,
  frecuency varchar(8) DEFAULT NULL,
  kind varchar(15) DEFAULT NULL,
  medication varchar(8) DEFAULT NULL,
  receive varchar(15) DEFAULT NULL,
  severity varchar(15) DEFAULT NULL,
  start_lost_time datetime NOT NULL,
  turn varchar(15) DEFAULT NULL,
  way varchar(15) DEFAULT NULL,
  employee_id BIGINT CONSTRAINT FK_employee_3 FOREIGN KEY
  REFERENCES dbo.employee(id) ON DELETE CASCADE,
  Rowversion timestamp NOT NULL,
  )
/********************************************************************************************************
**  Table Name:		department
**  Primary Key:	id
**  Foreign Keys:	 -
*********************************************************************************************************/
--** Adding Rowversion at table departament      By: Terrazas Mercado Michel

CREATE TABLE dbo.department (id bigint IDENTITY CONSTRAINT PK_department PRIMARY KEY,
  created_at datetime DEFAULT NULL,
  created_by varchar(20) DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  updated_by varchar(20) DEFAULT NULL,
  description varchar(255) NOT NULL,
  name varchar(255) NOT NULL,
  Rowversion timestamp NOT NULL,
)
GO
/********************************************************************************************************
**  Table Name:		department_position
**  Primary Key:	id
**  Foreign Keys:	 department_id, position_id
**  Descriptiption: -
*********************************************************************************************************/


PRINT 'Creating the department_position table....';
CREATE TABLE department_position ( department_id BIGINT, position_id BIGINT CONSTRAINT [PK_depatmentPosition] PRIMARY KEY CLUSTERED(
			 department_id ASC,
			 position_id  ASC
			 ));

-- Define the relationship between department_position and deparment.

ALTER TABLE [dbo].[department_position]  WITH CHECK ADD
   CONSTRAINT [FK_departmentPosition_department] FOREIGN KEY([department_id])
REFERENCES [dbo].[department](id)

ALTER TABLE [dbo].[department_position] CHECK
   CONSTRAINT [FK_departmentPosition_department]

-- Define the relationship between department_position and position.
ALTER TABLE [dbo].[department_position]  WITH CHECK ADD
   CONSTRAINT [FK_departmentPosition_position] FOREIGN KEY([position_id])
REFERENCES [dbo].[position](id)
GO
ALTER TABLE [dbo].[department_position] CHECK
   CONSTRAINT [FK_departmentPosition_position]
GO
/********************************************************************************************************
**  Table Name:		equipment_category
**  Primary Key:	id
**  Foreign Keys:	 -
*********************************************************************************************************/
--** Adding Rowversion at table equipment_category      By: Terrazas Mercado Michel

CREATE TABLE equipment_category (id BIGINT IDENTITY CONSTRAINT PK_equipment_category PRIMARY KEY,
  created_at datetime DEFAULT NULL,
  created_by varchar(20) DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  updated_by varchar(20) DEFAULT NULL,
  description varchar(255) DEFAULT NULL,
  equipment_type varchar(15) DEFAULT NULL,
  image_path varchar(255) DEFAULT NULL,
  name varchar(255) DEFAULT NULL,
  Rowversion timestamp NOT NULL,
)

GO

create table equipment_category_characteristic (
	equipment_category_id BIGINT not null
	,characteristic varchar(255))

GO

create table equipment_category_protect_to (
	equipment_category_id BIGINT not null,
	protect_to varchar(255))
GO
create table equipment_category_resistant_to (
	equipment_category_id BIGINT not null,
	resistant_to varchar(255))
GO
 alter table equipment_category_characteristic add
	constraint FK_equipment_category_characteristic foreign key (equipment_category_id) references equipment_category
 GO
 alter table equipment_category_protect_to add
	constraint FK_equipment_category_protect_to foreign key (equipment_category_id)
references equipment_category
GO
 alter table equipment_category_resistant_to add
	constraint FK_equipment_category_resistant_to foreign key (equipment_category_id)
 references equipment_category
 GO

/********************************************************************************************************
**  Table Name:		equipment
**  Primary Key:	id
**  Foreign Keys:	 category_id
*********************************************************************************************************/
--** Adding Rowversion at table equipment     By: Terrazas Mercado Michel

CREATE TABLE equipment (id BIGINT IDENTITY CONSTRAINT PK_equipment PRIMARY KEY,
  created_at datetime DEFAULT NULL,
  created_by varchar(20) DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  updated_by varchar(20) DEFAULT NULL,
  acquisition_date datetime DEFAULT NULL,
  available bit DEFAULT 1,
  code varchar(255) DEFAULT NULL,
  state varchar(255) DEFAULT NULL,
  category_id BIGINT CONSTRAINT FK_equipment_category FOREIGN KEY
			REFERENCES dbo.equipment_category(id) ON DELETE CASCADE
	,Rowversion timestamp NOT NULL
)
/********************************************************************************************************
**  Table Name:	equipment_assignment
**  Primary Key:	id
**  Foreign Keys:	 employee_id, equipment_id
*********************************************************************************************************/
--** Adding Rowversion at table equipment_category      By: Terrazas Mercado Michel

CREATE TABLE equipment_assignment (id BIGINT IDENTITY CONSTRAINT PK_equipment_assignment PRIMARY KEY,
  created_at datetime DEFAULT NULL,
  created_by varchar(20) DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  updated_by varchar(20) DEFAULT NULL,
  active bit NOT NULL,
  end_date datetime DEFAULT NULL,
  init_date datetime NOT NULL,
  observation varchar(255) DEFAULT NULL,
  employee_id BIGINT CONSTRAINT FK_employee_1 FOREIGN KEY
  REFERENCES dbo.employee(id) ON DELETE CASCADE,
  equipment_id BIGINT CONSTRAINT FK_equipment FOREIGN KEY
  REFERENCES dbo.equipment(id) ON DELETE CASCADE,
  Rowversion timestamp NOT NULL,
  )
  /********************************************************************************************************
**  Table Name:	equipment_control_daily
**  Primary Key:	id
**  Foreign Keys:	 employee_id
*********************************************************************************************************/
--** Adding Rowversion at table equipment_control_daily     By: Terrazas Mercado Michel

  CREATE TABLE equipment_control_daily (id BIGINT IDENTITY CONSTRAINT PK_equipment_control_daily PRIMARY KEY,
  created_at datetime DEFAULT NULL,
  created_by varchar(20) DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  updated_by varchar(20) DEFAULT NULL,
  complete_equipments bit NOT NULL,
  date_day datetime NOT NULL,
  employee_id BIGINT CONSTRAINT FK_employee_2 FOREIGN KEY
  REFERENCES dbo.employee(id) ON DELETE CASCADE
  ,Rowversion timestamp NOT NULL
)
 /********************************************************************************************************
**  Table Name:	equipment_incomplete
**  Primary Key:	id
**  Foreign Keys:	 equipment_id, equipment_control_daily_id
*********************************************************************************************************/
--** Adding Rowversion at table equipment_incomplete     By: Terrazas Mercado Michel

CREATE TABLE equipment_incomplete (id BIGINT IDENTITY CONSTRAINT PK_equipment_incomplete PRIMARY KEY,
  created_at datetime DEFAULT NULL,
  created_by varchar(20) DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  updated_by varchar(20) DEFAULT NULL,
  register_date datetime DEFAULT NULL,
  equipment_id BIGINT CONSTRAINT FK_equipment_2 FOREIGN KEY
  REFERENCES dbo.equipment(id) ON DELETE CASCADE,
  equipment_control_daily_id BIGINT CONSTRAINT FK_equipment_control_daily FOREIGN KEY
  REFERENCES dbo.equipment_control_daily(id) ON DELETE CASCADE
  ,Rowversion timestamp NOT NULL
)

/********************************************************************************************************
**  Table Name:	users
**  Primary Key:	id
**  Foreign Keys:	 -
*********************************************************************************************************/
--** Adding Rowversion at table users     By: Terrazas Mercado Michel

CREATE TABLE users (id BIGINT IDENTITY CONSTRAINT PK_users PRIMARY KEY,
  created_at datetime DEFAULT NULL,
  created_by varchar(20) DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  updated_by varchar(20) DEFAULT NULL,
  email varchar(255) NOT NULL,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  username varchar(255) DEFAULT NULL
  ,Rowversion timestamp NOT NULL
)
 /********************************************************************************************************
**  Table Name:	role
**  Primary Key:	id
**  Foreign Keys:	 equipment_id, equipment_control_daily_id
*********************************************************************************************************/
--** Adding Rowversion at table role     By: Terrazas Mercado Michel

CREATE TABLE role (id BIGINT IDENTITY CONSTRAINT PK_role PRIMARY KEY,
  created_at datetime DEFAULT NULL,
  created_by varchar(20) DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  updated_by varchar(20) DEFAULT NULL,

  description varchar(255) DEFAULT NULL,
  role_name varchar(255) DEFAULT NULL
  ,Rowversion timestamp NOT NULL
)
 /********************************************************************************************************
**  Table Name:	user_role
**  Primary Key:	id
**  Foreign Keys:	 user_id, role_id
*********************************************************************************************************/

CREATE TABLE user_role ( user_id BIGINT, role_id BIGINT CONSTRAINT [PK_user_role] PRIMARY KEY CLUSTERED(
			 user_id ASC,
			 role_id   ASC
		));
-- Define the relationship between user_role and user.
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD
   CONSTRAINT [FK_userRole_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users](id)

ALTER TABLE [dbo].[user_role] CHECK
   CONSTRAINT [FK_userRole_user]

-- Define the relationship between user_role and role.
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD
   CONSTRAINT [FK_userRole_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[role](id)

ALTER TABLE [dbo].[user_role] CHECK
   CONSTRAINT [FK_userRole_role]


 /********************************************************************************************************
**  Table Name:	project_department
**  Primary Key:	id
**  Foreign Keys:	 department_id, project_id
*********************************************************************************************************/

CREATE TABLE project_department ( department_id BIGINT, project_id  BIGINT CONSTRAINT [PK_depatmentProject] PRIMARY KEY CLUSTERED(
			 department_id ASC,
			 project_id   ASC
		));

-- Define the relationship between department_position and deparment.

ALTER TABLE [dbo].[project_department]  WITH CHECK ADD
   CONSTRAINT [FK_projectDepartment_department] FOREIGN KEY([department_id])
REFERENCES [dbo].[department](id)

ALTER TABLE [dbo].[project_department] CHECK
   CONSTRAINT [FK_projectDepartment_department]

-- Define the relationship between department_position and position.
ALTER TABLE [dbo].[project_department]  WITH CHECK ADD
   CONSTRAINT [FK_projectDepartment_project] FOREIGN KEY([project_id])
REFERENCES [dbo].[project](id)
GO
ALTER TABLE [dbo].[project_department] CHECK
   CONSTRAINT [FK_projectDepartment_project]
GO
