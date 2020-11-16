CREATE VIEW markModelView AS 
	SELECT TOP 50 model_name Модель_автомобиля, mk_name Марка_автомобиля 
	FROM model 
	JOIN mark ON mark=id_mk 
	ORDER BY mk_name;
GO
CREATE VIEW sumOfPurchasesBySellerView AS 
	SELECT DISTINCT id_seller Код_сотрудника, SUM(sale_price) Сумма_продаж 
	FROM purchase 
	RIGHT JOIN seller ON id_seller = seller 
	GROUP BY ROLLUP(id_seller);
GO
CREATE VIEW bodyTypeSoldByYearView AS 
	SELECT DISTINCT body_type Тип_кузова, [2016], [2017], [2018], [2019], [2020] 
	FROM 
		(SELECT body_type, model, issue_year 
		FROM modification) 
		AS md_select
	PIVOT (COUNT(model) 
	FOR issue_year 
	IN ([2016], [2017], [2018], [2019], [2020])) 
	AS bt_pivot;
GO
CREATE VIEW clientPurchasesView AS 
	SELECT DISTINCT TOP 500 surname Фамилия_клиента, firstname Имя_клиента, phone Телефон_клиента, 
	COUNT(client) OVER(PARTITION BY surname) Количество_покупок, 
	SUM(sale_price) OVER (PARTITION BY surname) Сумма_покупок 
	FROM client 
	JOIN purchase ON id_client = client 
	GROUP BY surname, firstname, phone, sale_price, client
	ORDER BY Сумма_покупок DESC;
GO
CREATE VIEW averageCostOfNewCarsView AS WITH MyCTE(price)
	AS (SELECT price 
		FROM product 
		WHERE YEAR(date_storage) > 2018)
	SELECT AVG(price) Средняя_стоимость_автомобилей_выпущенных_после_2018_года
	FROM MyCTE;
