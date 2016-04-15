CREATE PROCEDURE [dbo].[Sp_GetNextEmail]
	@Submitter varchar(50)
AS
BEGIN
	set nocount on

	declare	@busyMessageID int
	SELECT  @busyMessageID = min (TSWMessageID)
	from	JBMSMessage
	where	[Status] = 'InProgress'
	and		Submitter = @Submitter

	if (not @busyMessageID is null)
	Begin
		update	JBMSMessage
		set		[Status] = 'Processed'
		where	TSWMessageID = @busyMessageID
	End

	declare @nextMessageID int
	SELECT  @nextMessageID = min (TSWMessageID)
	from	JBMSMessage
	where	[Status] = 'New'
	and		Submitter = @Submitter

	if (@NextMessageID is null)
		begin
			RETURN	0
		end
	else
		begin
			update  JBMSMessage 
			set		[Status] = 'InProgress'
			where	TSWMessageID = @nextMessageID

			select	*
			from	JBMSMessage M
			left join JBMSAttachment A on A.TSWMessageID = M.TSWMessageID
			where	M.TSWMessageID = @nextMessageID

			RETURN	@nextMessageID
		end
	
	RETURN 0

END