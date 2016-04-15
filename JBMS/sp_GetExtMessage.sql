CREATE PROCEDURE [dbo].[sp_GetExtMessage]
	@PrevMessageID varchar(50) = null
AS
BEGIN
	SET NOCOUNT ON;

	declare @MessageID int
	if (@PrevMessageID is NULL)
	begin
		select @MessageID = min(mailboxMsgId) from JBMSExtMessage
	end
	else
	begin
		select @MessageID = min(mailboxMsgId) from JBMSExtMessage where mailboxMsgId > @PrevMessageID
	end

	select * from JBMSExtMessage where mailboxMsgId = @MessageID

	return @MessageID
END
