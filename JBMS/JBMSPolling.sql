CREATE TABLE [dbo].[JBMSPolling]
(
	[JBMSPollingID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Submitter] VARCHAR(50) NOT NULL, 
    [EntryID] VARCHAR(50) NULL , 
    [SenderReference] VARCHAR(50) NULL, 
	[MessageID] varchar(50) NULL,
    [Status] VARCHAR(50) NOT NULL, 
    [LastUpdatedDateTime] DATETIME NOT NULL DEFAULT getdate() 
)
