CREATE PROCEDURE [dbo].[sp_SaveJBMSMessage]
	@MessageID VARCHAR(50), 
    @CustomerReference VARCHAR(MAX), 
    @DocumentID VARCHAR(50), 
    @Mailbox VARCHAR(MAX), 
    @MessageName VARCHAR(MAX), 
    @PartnerID VARCHAR(50), 
    @ReceivedDateTime VARCHAR(50),
	@Submitter VARCHAR(50),
	@href VARCHAR(50),
	@AttachmentDocument NVARCHAR(MAX)
AS

	declare @TSWMessageID int

	INSERT into JBMSMessage
	(	
		MessageID, 
		CustomerReference, 
		DocumentID, 
		Mailbox, 
		MessageName, 
		PartnerID,
		ReceivedDateTime,
		[Status], 
		LastUpdatedDateTime,
		ErrorCount,
		Submitter
	)
	values
	(	
		@MessageID, 
		@CustomerReference, 
		@DocumentID, 
		@Mailbox, 
		@MessageName, 
		@PartnerID,
		@ReceivedDateTime,
		'New',  
		getdate(),
		0,
		@Submitter
	)

	set @TSWMessageID = @@IDENTITY

	insert into JBMSAttachment
	(TSWMessageID, href, AttachmentDocument)
	values
	(@TSWMessageID, @href, @AttachmentDocument)

RETURN 0
