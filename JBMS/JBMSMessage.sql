CREATE TABLE [dbo].[JBMSMessage]
(
	[TSWMessageID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [MessageID] VARCHAR(50) NOT NULL, 
    [CustomerReference] VARCHAR(MAX) NOT NULL, 
    [DocumentID] VARCHAR(50) NOT NULL, 
    [Mailbox] VARCHAR(MAX) NOT NULL, 
    [MessageName] VARCHAR(MAX) NOT NULL, 
    [PartnerID] VARCHAR(50) NULL, 
    [ReceivedDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    [Status] VARCHAR(50) NOT NULL, 
    [LastUpdatedDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    [ErrorCount] INT NOT NULL DEFAULT 0, 
    [Submitter] VARCHAR(50) NOT NULL 
)
