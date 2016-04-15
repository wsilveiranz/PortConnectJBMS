CREATE PROCEDURE [dbo].[sp_PollingJBMS]
	@Submitter varchar(50)
AS

	declare @JBMSPollingID int
	declare @JBMSStatus varchar(50)
	select	@JBMSPollingID = JBMSPollingID,
		    @JBMSStatus = [Status] 
	from	JBMSPolling
	where	Submitter = @Submitter

	if @JBMSPollingID is null
	begin
		insert into JBMSPolling
			(Submitter, [Status], LastUpdatedDateTime)
		values
			(@Submitter, 'InProgress', getdate())
		set @JBMSPollingID = @@IDENTITY
	end
	else
	begin
		if(@JBMSStatus) = 'InProgress'
		begin
			set @JBMSPollingID = 0
		end
		else
		begin
			update	JBMSPolling
			set		[Status] = 'InProgress'
			where	Submitter = @Submitter
		end
	end

	select	JBMSPollingID,
			Submitter,
			EntryID,
			SenderReference,
			isnull(MessageID, '0') as MessageID,
			[Status],
			LastUpdatedDateTime,
			getdate() as CurrentDateTime
	from	JBMSPolling
	where	JBMSPollingID = @JBMSPollingID

	RETURN @JBMSPollingID
