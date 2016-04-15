CREATE PROCEDURE sp_UpdatePolling
	@EntryID varchar(50),
	@SenderReference varchar(50),
	@MessageID varchar(50),
	@Status varchar(50),
	@JBMSPollingID int
AS
BEGIN
	Update	Polling
	set		EntryID = @EntryID,
			SenderReference = @SenderReference,
			MessageID = @MessageID,
			[Status] = @Status,
			LastUpdatedDateTime = getdate()
	where	JBMSPollingID = @JBMSPollingID

	RETURN 0
END
GO
