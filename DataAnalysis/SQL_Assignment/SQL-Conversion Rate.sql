CREATE TABLE conversation_rate(
						Visitor_ID int not null,
						Adv_type VARCHAR(50),
						Action_ VARCHAR(50)
						);
INSERT INTO conversation_rate (Visitor_ID, Adv_type, Action_) VALUES (1, 'A', 'LEFT')
INSERT INTO conversation_rate (Visitor_ID, Adv_type, Action_) VALUES (2,'A', 'ORDER');
INSERT INTO conversation_rate (Visitor_ID, Adv_type, Action_) VALUES (3, 'B', 'LEFT');
INSERT INTO conversation_rate (Visitor_ID, Adv_type, Action_) VALUES (4, 'A', 'ORDER');
INSERT INTO conversation_rate (Visitor_ID, Adv_type, Action_) VALUES (5, 'A', 'LEFT');
INSERT INTO conversation_rate (Visitor_ID, Adv_type, Action_) VALUES (6, 'A', 'REWIEV');
INSERT INTO conversation_rate (Visitor_ID, Adv_type, Action_) VALUES (7, 'B', 'LEFT');
INSERT INTO conversation_rate (Visitor_ID, Adv_type, Action_) VALUES (8, 'B', 'ORDER');
INSERT INTO conversation_rate (Visitor_ID, Adv_type, Action_) VALUES (9, 'B', 'REWIEV');
INSERT INTO conversation_rate (Visitor_ID, Adv_type, Action_) VALUES (10, 'A', 'REWIEV');

--Retrieve count of total Actions, and Orders for each Advertisement Type,

CREATE VIEW KEREM2 AS 
					SELECT COUNT(Visitor_ID) AS Order_num, Adv_type
					FROM conversation_rate
					WHERE Action_ = 'ORDER' AND Adv_type = 'A'
					GROUP BY Adv_type 
					UNION
					SELECT COUNT(Visitor_ID) AS Order_num, Adv_type
					FROM conversation_rate
					WHERE Action_ = 'ORDER' AND Adv_type = 'B'
					GROUP BY Adv_type;

SELECT *
FROM KEREM2

--Calculate Orders (Conversion) rates for each Advertisement Type by dividing by total count of actions casting == 10 as float by multiplying by 1.0.

SELECT KEREM2.Adv_type, 100/(Action_num/Order_num)*0.01 AS Conversion_Rate
FROM KEREM2, (SELECT COUNT(Visitor_ID) AS Action_num, Adv_type
					FROM conversation_rate
					GROUP BY Adv_type) AS NUT
WHERE KEREM2.Adv_type = NUT.Adv_type