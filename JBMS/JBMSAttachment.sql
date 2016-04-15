CREATE TABLE [dbo].[JBMSAttachment] 
(
    [TWSAttachmentID]    INT            IDENTITY (1, 1) NOT NULL,
    [TSWMessageID]       INT            NOT NULL,
    [href]               VARCHAR(50)  NOT NULL,
    [AttachmentDocument] NVARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([TWSAttachmentID] ASC), 
    CONSTRAINT [FK_JBMSAttachment_JBMSMessage] FOREIGN KEY ([TSWMessageID]) REFERENCES [JBMSMessage]([TSWMessageID])
)
