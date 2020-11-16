CREATE VIEW markModelView AS 
	SELECT TOP 50 model_name ������_����������, mk_name �����_���������� 
	FROM model 
	JOIN mark ON mark=id_mk 
	ORDER BY mk_name;
GO
CREATE VIEW sumOfPurchasesBySellerView AS 
	SELECT DISTINCT id_seller ���_����������, SUM(sale_price) �����_������ 
	FROM purchase 
	RIGHT JOIN seller ON id_seller = seller 
	GROUP BY ROLLUP(id_seller);
GO
CREATE VIEW bodyTypeSoldByYearView AS 
	SELECT DISTINCT body_type ���_������, [2016], [2017], [2018], [2019], [2020] 
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
	SELECT DISTINCT TOP 500 surname �������_�������, firstname ���_�������, phone �������_�������, 
	COUNT(client) OVER(PARTITION BY surname) ����������_�������, 
	SUM(sale_price) OVER (PARTITION BY surname) �����_������� 
	FROM client 
	JOIN purchase ON id_client = client 
	GROUP BY surname, firstname, phone, sale_price, client
	ORDER BY �����_������� DESC;
GO
CREATE VIEW averageCostOfNewCarsView AS WITH MyCTE(price)
	AS (SELECT price 
		FROM product 
		WHERE YEAR(date_storage) > 2018)
	SELECT AVG(price) �������_���������_�����������_����������_�����_2018_����
	FROM MyCTE;
