use g2ssid
go

--Step1
EXECUTE [ETL].[PullDataToDatawarehouse] @table = 'Employee';
EXECUTE [ETL].[PullDataToDatawarehouse] @table = 'Project';
EXECUTE [ETL].[PullDataToDatawarehouse] @table = 'Department';
EXECUTE [ETL].[PullDataToDatawarehouse] @table = 'Accident';
EXECUTE [ETL].[PullDataToDatawarehouse] @table = 'Accidents';
GO
--Step2
use DWg2ssid
go

EXECUTE [ETL].[DW_MergeProject];
EXECUTE [ETL].[DW_MergeAccident];
EXECUTE [ETL].[DW_MergeDepartment];
EXECUTE [ETL].[DW_MergeEmployee];
EXECUTE [ETL].[DW_MergeAccidents];
go
--Step3

TRUNCATE TABLE [ETL].[Project];
TRUNCATE TABLE [ETL].[Department];
TRUNCATE TABLE [ETL].[Employee];
TRUNCATE TABLE [ETL].[Accident];
TRUNCATE TABLE [ETL].[Accidents];

GO