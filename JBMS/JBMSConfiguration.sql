CREATE TABLE [dbo].[JBMSConfiguration]
(
	[JBMSConfigurationID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ConfigurationName] VARCHAR(50) NOT NULL, 
    [ConfigurationValue] VARCHAR(MAX) NOT NULL
)
