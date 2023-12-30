-- STORED PROCEDURES

--1
-- Returns table with clients phone number of lawyer.
--Lawyers Id is taken as paramerter
CREATE OR ALTER PROCEDURE GetClientsOfLawyer
	(@LawyerId int)
	AS
	BEGIN
	
	SELECT ac.CustomerNo, cp.PhoneNumber
	FROM AssosiatedLawyer al
	inner join AssosiatedCustomer ac ON al.CaseNo = ac.CaseNo
	inner join ClientPhoneContact cp ON cp.CustomerNo = ac.CustomerNo 
	WHERE al.LawyerNo = @LawyerId

	END

exec GetClientsOfLawyer 22

--2
CREATE OR ALTER PROCEDURE GetCasesOfLawyer
	(@LawyerId int)
	AS
	BEGIN
	
	SELECT c.CaseNo
	FROM [Case] c
	inner join AssosiatedLawyer al on c.CaseNo = al.CaseNo
	WHERE 	al.LawyerNo = @LawyerId
	
	END
exec GetCasesOfLawyer 22

--3
/* check later*/ 
CREATE OR ALTER PROCEDURE RemainingDebt
	(@CustomerId int)
	AS
	DECLARE
	@isCustomerFound bit = 0,
	@isResolved bit,
	@LastDate date,
	@Debt int = 0
	BEGIN
	
	SELECT @isResolved = p.IsResolved, @LastDate = p.LastDateOfPayment, @Debt = p.LeftAmountOfDebt, @isCustomerFound = 1
	FROM Payment p
	WHERE p.SenderNo = @CustomerId

	if(@isCustomerFound = 0)
		print 'This customer has no payment records'

	if(@isResolved = 1)
		print 'You have paid all your debts'
	else
		if(DATEDIFF(MONTH,GETDATE(),@LastDate) < 0)
			print 'You have not paid your debt in time, please check your debt:' +  CAST(@Debt AS varchar(10))
		else 
			print 'You have ' + CAST(DATEDIFF(MONTH,GETDATE(),@LastDate) AS varchar(5)) + ' months left to pay. Your debt:' +  CAST(@Debt AS varchar(10))
	END

exec RemainingDebt 1001


--4
CREATE OR ALTER PROCEDURE spChangeLawyerAtCase
	(@OldLawyerId int, @NewLawyerId int, @CaseId int)
	AS
	DECLARE
	@isOldLawyerAssociated bit = 0,
	@isNewLawyerAssociated bit = 0
	BEGIN
		SELECT @isOldLawyerAssociated = 1
		FROM AssosiatedLawyer al
		WHERE al.LawyerNo = @OldLawyerId and al.CaseNo = @CaseId
		
		SELECT @isNewLawyerAssociated = 1
		FROM AssosiatedLawyer al
		WHERE al.LawyerNo = @NewLawyerId and al.CaseNo = @CaseId
	
	if(@isNewLawyerAssociated = 1)
	BEGIN
		print 'This lawyer already in this case'
		return -1
	END

	if(@isOldLawyerAssociated = 0)
		BEGIN
			print 'There is no lawyer in this case, with ID' + CAST(@OldLawyerId AS varchar(10))
			insert into AssosiatedLawyer (LawyerNo, CaseNo) values
			(@NewLawyerId, @CaseId)
			print 'Lawyer is assigned to the case. Lawyer ID' + CAST(@NewLawyerId AS varchar(10))
		END
	else
		UPDATE AssosiatedLawyer 
		SET LawyerNo = @NewLawyerId
		WHERE @OldLawyerId = LawyerNo
		print 'Lawyers are changed'
	END

exec ChangeLawyerAtCase 13, 10, 1050

--5
/*manager can check his lawyers and no of cases they are working on*/
CREATE OR ALTER PROCEDURE sp_GetManagedLawyers
	(@ManagerNo INT)
	AS
	BEGIN
		SELECT l.LawyerNo, e.[Name], e.LastName , COUNT(al.CaseNo) AS 'Number Of Cases' 
		FROM Lawyer l
		inner join AssosiatedLawyer al on l.LawyerNo = al.LawyerNo
		inner join Employee e on e.Ssn = l.Ssn
		WHERE l.ManagerNo = @ManagerNo
		GROUP BY l.LawyerNo, e.[Name], e.LastName
		ORDER BY COUNT(al.CaseNo) DESC
	END

exec sp_GetManagedLawyers 1


/* lawyer's unpaid amount, by clients, resolved case*/ 
/* assolaw->case, case period, case->assoclient,(assoclient->client, for name),
assoclient->payment, payment.recno=lawyer.no, sum(leftdebts)*/
/*TODO*/
CREATE OR ALTER PROCEDURE sp_GetUnpaidAmount
	(@LawyerNo INT)
	AS
	BEGIN
		SELECT al.LawyerNo, ac.CustomerNo, ac.CaseNo, p.TotalDebt
		FROM AssosiatedLawyer al
		inner join [Case] c on c.CaseNo = al.CaseNo
		inner join AssosiatedCustomer ac on ac.CaseNo = c.CaseNo
		inner join Payment p on p.SenderNo = ac.CustomerNo,
		Client cl
		WHERE (al.LawyerNo = @LawyerNo)
			AND (cl.CustomerNo = ac.CustomerNo)
			AND (p.ReceiverNo = @LawyerNo)
	END

--6
/*TODO: CHANGE FirstDateOfPayment to LastDateOfPayment*/
CREATE OR ALTER PROCEDURE sp_GetCustomersInDebt
	(@LawyerNo INT, @LastDate DATE)
	AS
	BEGIN
		SELECT p.LeftAmountOfDebt, p.LastDateOfPayment, c.CustomerNo, cp.PhoneNumber, ce.Email, p.FirstDateOfPayment
		FROM Payment p 
		inner join Client c on c.CustomerNo = p.SenderNo
		inner join ClientEmailContact ce on ce.CustomerNo = c.CustomerNo
		inner join ClientPhoneContact cp on cp.CustomerNo = c.CustomerNo
		WHERE (p.ReceiverNo = @LawyerNo)
			AND p.FirstDateOfPayment < @LastDate
		ORDER BY p.FirstDateOfPayment DESC
	END

exec sp_GetCustomersInDebt 1, '2025-01-30'

--7
-- Returns list of case types and how man clients company have in this case type.
CREATE OR ALTER PROCEDURE sp_GetCaseAndClientTypes
	AS
	BEGIN
		SELECT c.CaseType, CAST(COUNT(pc.Ssn) as nvarchar(4)) + ' Person' AS 'Number Of Clients'
		FROM [Case] c 
		inner join AssosiatedCustomer ac on ac.CaseNo = c.CaseNo
		inner join PersonClient pc on pc.CustomerNo = ac.CustomerNo
		GROUP BY c.CaseType
		UNION 
		SELECT c.CaseType, CAST(COUNT(cc.CompanyName) as nvarchar(4)) + ' Company'
		FROM [Case] c 
		inner join AssosiatedCustomer ac on ac.CaseNo = c.CaseNo
		inner join CompanyClient cc on cc.CustomerNo = ac.CustomerNo
		GROUP BY c.CaseType
	END

exec sp_GetCaseAndClientTypes

-- 8
-- Returns list of other lawyers in same case with the lawyer.
--LawyerId is taken as parameter.
CREATE OR ALTER PROCEDURE sp_GetColleaguesInCase
	(@LawyerID INT)
	AS
	BEGIN
		SELECT e.Name + ' ' + e.LastName AS 'Full Name', ep.PhoneNumber, al1.CaseNo
		FROM AssosiatedLawyer al1
		inner join AssosiatedLawyer al2 on al1.CaseNo = al2.CaseNo
		inner join Lawyer l on l.LawyerNo = al2.LawyerNo
		inner join Employee e on e.Ssn = l.Ssn
		inner join EmployeePhoneContact ep on ep.SSN = e.Ssn
		WHERE al1.LawyerNo != al2.LawyerNo
			AND al1.LawyerNo = @LawyerID
	END

exec sp_GetColleaguesInCase 2
 
-- 9
-- Returns list of all lawyers' income, ordered by their income,
--and if they are above mean income
CREATE OR ALTER PROCEDURE sp_LawyersIncome
	AS
	BEGIN
		SELECT e.[Name] + ' ' + e.LastName AS 'Full Name', FORMAT(SUM(p.TotalDebt - p.LeftAmountOfDebt), 'N2') AS 'Total Income',
		IIF(SUM(p.TotalDebt - p.LeftAmountOfDebt) < (SELECT AVG(TotalDebtLeftAmountDifference) 
													 FROM (SELECT
														  	 SUM(p.TotalDebt - p.LeftAmountOfDebt) AS TotalDebtLeftAmountDifference
														  FROM
															 Lawyer l
															 inner join Payment p ON p.ReceiverNo = l.LawyerNo
														  GROUP BY l.LawyerNo
														  ) AS LawyerTotals
													 ),
				'Below Average Income', 'Above Average Income'
			) AS 'Lawyers'' Total'

		FROM Lawyer l
		inner join Payment p on p.ReceiverNo = l.LawyerNo,
		Employee e
		WHERE e.Ssn = l.Ssn
		GROUP BY e.[Name] + ' ' + e.LastName
		ORDER BY SUM(p.TotalDebt - p.LeftAmountOfDebt) DESC
	END

exec sp_LawyersIncome

-- 10
-- Make transaction
CREATE OR ALTER PROCEDURE sp_MakeTransaction 
	(@IBAN varchar(30), @TransactionAmount decimal, @ClientNo int)
	AS
	DECLARE
	@PaymentId int,
	@LeftAmountOfDebt decimal
	BEGIN
		SET @PaymentId = (SELECT p.PaymentId FROM Payment p 
						  WHERE p.SenderNo = @ClientNo
						  AND p.ReceiverNo = (SELECT l.LawyerNo
						   					  FROM Account a inner join Lawyer l on a.AccountId = l.AccountId
											  WHERE a.IBAN = @IBAN))
		IF(@PaymentId IS NULL)
		BEGIN
			print 'There is no payment between this client and lawyer, please check IBAN'
			return -1
		END
		
		SET @LeftAmountOfDebt = (SELECT p.LeftAmountOfDebt FROM Payment p WHERE p.PaymentId = @PaymentId) - @TransactionAmount
		IF(@LeftAmountOfDebt < 0)
		BEGIN
			print 'Transaction amount is more than client''s debt. Please inform client	' + CAST(@ClientNo AS varchar(6)) 
				   + ' and return surplus amount: ' + CAST(FORMAT(ABS(@LeftAmountOfDebt), 'N2') AS nvarchar(10))
			
			SET @TransactionAmount = @TransactionAmount - ABS(@LeftAmountOfDebt)
		END

		INSERT INTO [Transaction] VALUES
		(@TransactionAmount, @PaymentId, @ClientNo)

		print 'Transaction is done'

		IF(@LeftAmountOfDebt <= 0)
			print 'Client ' + CAST(@ClientNo AS varchar(6)) + ' paid all his debt'
		ELSE
			print 'Client ' + CAST(@ClientNo AS varchar(6)) + ' has ' + CAST(FORMAT (@LeftAmountOfDebt, 'N2') AS nvarchar(10)) + ' dollars remaining debt'

	END

exec sp_MakeTransaction 5193827064560296703924404416, 5000, 6990

-- 11 
-- Manager can appoint trial to their own lawyers
CREATE OR ALTER PROCEDURE sp_AppointTrial
	(@ManagerNo int, @LawyerToAppoint int, @TrialNo int)
	AS
	BEGIN
		IF(@ManagerNo != (SELECT l.ManagerNo FROM Lawyer l))
		BEGIN
			print 'You are not the manager of this lawyer. You can only appoint lawyers you are manager of.'
			return -1
		END
	
	-- TODO: Add more checks like if trail is already resolved or outdated.

	INSERT INTO LawyerAtCourt VALUES 
	(@LawyerToAppoint, @TrialNo)
		
	END



/*cases with at least @num trials*/

/*
client.no,person.name as name
case join client 
company
person
where if(client.no = company.clientno) @name = company.name
		if(client.no = person.clientno) @name = person.name

person.name or
*/
/*
select c.CustomerNo, p.FirstName as Name
from Client c
inner join PersonClient p on  p.CustomerNo = c.CustomerNo
UNION
select c.CustomerNo, cc.CompanyName as Name
from Client c
inner join CompanyClient cc on  cc.CustomerNo = c.CustomerNo
*/

 /*c.name + ' ' + c.surname as full name */