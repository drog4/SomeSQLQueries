CREATE PROCEDURE createSeller (@surname VARCHAR(30), @firstname VARCHAR(30), @patronymic VARCHAR(30), @phone VARCHAR(15)) 
AS
INSERT INTO seller VALUES (@surname, @firstname, @patronymic, @phone)
GO
EXECUTE createSeller 'Процедурин', 'Альберт', 'Русланович', '+7 987 635 4210'
GO
CREATE PROCEDURE setDiscount (@old_price MONEY, @new_price MONEY)
AS
	UPDATE product SET price = @new_price 
	WHERE price > @old_price
GO
EXECUTE setDiscount 191000, 195000 
GO
CREATE PROCEDURE deleteModel (@model_name VARCHAR(25))
AS
DELETE FROM model WHERE model_name LIKE '%'+ @model_name +'%'
GO
EXEC deleteModel 'Camr'
GO
CREATE PROCEDURE createClientWithShowingId
    @surname VARCHAR(30),
    @firstname VARCHAR(30),
    @patronymic VARCHAR(30),
    @passport VARCHAR(15),
	@address VARCHAR(255),
	@phone VARCHAR(30),
    @id INT OUTPUT
AS
    INSERT INTO client(surname, firstname, patronymic, passport, address, phone)
    VALUES(@surname, @firstname, @patronymic, @passport, @address, @phone)
    SET @id = @@IDENTITY
GO
DECLARE @id INT
	EXEC createClientWithShowingId 'Хранимов', 'Процедур', 'Процедурович', '6305 225544', 'г. Процедуринск', '+7 900 9019023', @id OUTPUT
	PRINT @id
GO
CREATE PROCEDURE getAvgPriceOfProduct AS
	DECLARE @avgPrice MONEY
	SELECT @avgPrice = AVG(price)
	FROM product
	RETURN @avgPrice;
GO
DECLARE @result MONEY
	EXEC @result = getAvgPriceOfProduct
PRINT @result
