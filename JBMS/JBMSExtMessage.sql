CREATE TABLE [dbo].[JBMSExtMessage]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [customerReference] VARCHAR(MAX) NOT NULL, 
    [docId] VARCHAR(50) NULL, 
	[documentSize] VARCHAR(50),
    [mailbox] VARCHAR(50) NOT NULL, 
	[mailboxMsgId] VARCHAR(50) NOT NULL, 
    [messageName] VARCHAR(50) NOT NULL, 
    [partner] VARCHAR(50) NULL, 
    [receivedDate] DATETIME NOT NULL DEFAULT getdate(), 
    [Status] VARCHAR(50)  NOT NULL DEFAULT 'New', 
    [href] VARCHAR(150) NULL, 
    [value] NVARCHAR(MAX) NULL, 
)
