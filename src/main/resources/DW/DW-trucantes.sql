

  TRUNCATE TABLE [DWg2ssid].[ETL].[Project]
  TRUNCATE TABLE [DWg2ssid].[ETL].[Employee]
  TRUNCATE TABLE [DWg2ssid].[ETL].[Accident]
  TRUNCATE TABLE [DWg2ssid].[ETL].[Accidents]
  TRUNCATE TABLE [DWg2ssid].[ETL].[Department]

  select * from [DWg2ssid].[ETL].[Project]
  select * from [DWg2ssid].[ETL].[Employee]
  select * from [DWg2ssid].[ETL].[Accident]
  select * from [DWg2ssid].[ETL].[Accidents]
  select * from [DWg2ssid].[ETL].[Department]

  select * FROM [DWg2ssid].[dbo].[DimEmployee];
  select * FROM [DWg2ssid].[dbo].[DimDepartment];
  select * FROM [DWg2ssid].[dbo].[DimProject];
  select * FROM [DWg2ssid].[dbo].[DimAccident];
  select * FROM [DWg2ssid].[dbo].[FactAccidents];
