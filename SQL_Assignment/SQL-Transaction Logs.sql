CREATE TABLE Transactions2(
							Sender_ID int not null,
							Receiver_ID int not null,
							Amount int not null,
							Transaction_Date date not null
						);
INSERT INTO Transactions2 (Sender_ID, Receiver_ID, Amount, Transaction_Date) VALUES (55, 22, 500, '2021/05/18');
INSERT INTO Transactions2 (Sender_ID, Receiver_ID, Amount, Transaction_Date) VALUES (11, 33, 350, '2021/05/19');
INSERT INTO Transactions2 (Sender_ID, Receiver_ID, Amount, Transaction_Date) VALUES (22, 11, 650, '2021/05/19');
INSERT INTO Transactions2 (Sender_ID, Receiver_ID, Amount, Transaction_Date) VALUES (22, 33, 900, '2021/05/20');
INSERT INTO Transactions2 (Sender_ID, Receiver_ID, Amount, Transaction_Date) VALUES (33, 11, 500, '2021/05/21');
INSERT INTO Transactions2 (Sender_ID, Receiver_ID, Amount, Transaction_Date) VALUES (33, 22, 750, '2021/05/21');
INSERT INTO Transactions2 (Sender_ID, Receiver_ID, Amount, Transaction_Date) VALUES (11, 44, 300, '2021/05/22');


SELECT 
	 COALESCE(S.Sender_ID, R.Receiver_Id) AS Acount_ID ,
	 (COALESCE(R.Receiver_Amount,0)-COALESCE(S.Sender_Amount,0)) AS Net_Change

FROM (SELECT Receiver_ID, SUM(Amount) AS Receiver_Amount 
		FROM Transactions2
		GROUP BY Receiver_ID) AS R
FULL OUTER JOIN (SELECT Sender_ID, SUM(Amount) AS Sender_Amount
				FROM Transactions2
				GROUP BY Sender_ID) AS S
ON R.Receiver_ID = S.Sender_ID
