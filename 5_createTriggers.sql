CREATE TRIGGER checkPurchaseDate ON purchase FOR INSERT
AS 
	BEGIN
	IF ((SELECT sale_date FROM INSERTED) > CAST(GETDATE() AS DATE)) 
	PRINT '������ ��� �������� ���� �������! ��� �� ����� ���� ������, ��� ������� ����'
	ROLLBACK
	END
GO
INSERT INTO purchase VALUES(5, 4, 3, 35000, '2020-02-15', '��������');
GO
CREATE TRIGGER insertedCarToHistory ON car AFTER INSERT
AS
	INSERT INTO history(car_id, operation)
	SELECT id_car, '�������� ���������� � VIN ' + vin + ', ������ - ' + CAST(mileage AS NVARCHAR) +', ���� - ' + color
	FROM INSERTED
GO
CREATE TRIGGER deletedCarToHistory ON car AFTER DELETE
AS
	INSERT INTO history (car_id, operation)
	SELECT id_car, '������ ���������� � VIN ' + vin + ', ������ - ' + CAST(mileage AS NVARCHAR) +', ���� - ' + color
	FROM DELETED
GO
CREATE TRIGGER updatedCarToHistory ON car AFTER UPDATE
AS
	INSERT INTO history (car_id, operation)
	SELECT id_car, '�������� ���������� � VIN ' + vin + ', ������ - ' + CAST(mileage AS NVARCHAR) +', ���� - ' + color
	FROM INSERTED
GO
INSERT INTO car VALUES ('ASDFGHJKL123456', 10, 3, '�����');
UPDATE car SET color = '������' WHERE  vin = 'ASDFGHJKL123456';
DELETE FROM car WHERE vin = 'ASDFGHJKL123456';
GO