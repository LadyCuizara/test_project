use g2ssid
go

/**
* Get all employees.
*/
IF OBJECT_ID('get_all_employees', 'P') IS NOT NULL
	DROP PROCEDURE get_all_employees
GO

CREATE PROCEDURE get_all_employees
AS
BEGIN
	Select * From employee
END
GO

/**
* Get employee.
*/
IF OBJECT_ID('SP_get_employee', 'P') IS NOT NULL
	DROP PROCEDURE SP_get_employee
GO

CREATE PROCEDURE SP_get_employee @id int
AS
BEGIN
	Select * From employee where id = @id;
END
GO

/**
* Get employee.
*/
IF OBJECT_ID('SP_DeleteEmployee', 'P') IS NOT NULL
	DROP PROCEDURE SP_DeleteEmployee
GO

CREATE PROCEDURE SP_DeleteEmployee @id int
AS
BEGIN
  	delete From contract where employee_id = @id;
	delete from equipment_assignment where employee_id = @id;
	delete From employee where id = @id;
END
GO

/**
* Get project.
*/
IF OBJECT_ID('SP_get_project', 'P') IS NOT NULL
DROP PROCEDURE SP_get_project
GO

CREATE PROCEDURE SP_get_project @id int
AS
BEGIN
	Select * From project where id = @id;
END
GO


/**
* Get Contract
*/
IF OBJECT_ID('SP_GetContract', 'P') IS NOT NULL
DROP PROCEDURE SP_GetContract
GO

CREATE PROCEDURE SP_GetContract @id int
AS
BEGIN
	Select * From dbo.contract where id = @id;
END
GO

/**
* Get position.
*/
IF OBJECT_ID('SP_get_position', 'P') IS NOT NULL
DROP PROCEDURE SP_get_position
GO

CREATE PROCEDURE SP_get_position @id int
AS
BEGIN
	Select * From position where id = @id;
END
GO


/**
* Delete position.
*/
IF OBJECT_ID('SP_DeletePosition', 'P') IS NOT NULL
	DROP PROCEDURE SP_DeletePosition
GO

CREATE PROCEDURE SP_DeletePosition @id int
AS
BEGIN
	delete From contract where position_id = @id;
	delete From position where id = @id;
END
GO

/**
* Get accident.
*/
IF OBJECT_ID('SP_get_accident', 'P') IS NOT NULL
DROP PROCEDURE SP_get_accident
GO

CREATE PROCEDURE SP_get_accident @id int
AS
BEGIN
  Select * From accident where id = @id;
END
GO

/**
* Delete accident.
*/
IF OBJECT_ID('SP_DeleteAccident', 'P') IS NOT NULL
  DROP PROCEDURE SP_DeleteAccident
GO

CREATE PROCEDURE SP_DeleteAccident @id int
AS
BEGIN  
  delete From accident where id = @id;
END
GO

