USE drogaytsev_motors;
GO
CREATE ROLE bm_seller
GO
CREATE ROLE bm_moderator
GO
GRANT INSERT ON dbo.client TO bm_seller
GO
GRANT INSERT ON dbo.purchase TO bm_seller
GO
GRANT UPDATE ON dbo.purchase (sale_price, sale_date, type_of_payment) TO bm_seller
GO
GRANT SELECT ON dbo.mark TO bm_seller
GO
GRANT SELECT ON dbo.model TO bm_seller
GO
GRANT SELECT ON dbo.modification TO bm_seller
GO
GRANT SELECT ON dbo.seller TO bm_seller
GO
GRANT SELECT ON dbo.product TO bm_seller
GO
GRANT SELECT ON dbo.purchase TO bm_seller
GO
GRANT SELECT ON dbo.car TO bm_seller
GO
GRANT SELECT ON dbo.client (id_client, surname, firstname, patronymic, phone) TO bm_seller
GO
GRANT SELECT ON dbo.averageCostOfNewCarsView TO bm_seller
GO
GRANT SELECT ON dbo.markModelView TO bm_seller
GO
GRANT SELECT ON dbo.bodyTypeSoldByYearView TO bm_seller
GO
GRANT EXECUTE ON dbo.createClientWithShowingId TO bm_seller
GO
GRANT EXECUTE ON dbo.getAvgPriceOfProduct TO bm_seller
GO
GRANT SELECT, UPDATE, DELETE, INSERT ON dbo.car TO bm_moderator
GO
GRANT SELECT, UPDATE, DELETE, INSERT ON dbo.client TO bm_moderator
GO
GRANT SELECT, UPDATE, DELETE, INSERT ON dbo.mark TO bm_moderator
GO
GRANT SELECT, UPDATE, DELETE, INSERT ON dbo.model TO bm_moderator
GO
GRANT SELECT, UPDATE, DELETE, INSERT ON dbo.modification TO bm_moderator
GO
GRANT SELECT, UPDATE, DELETE, INSERT ON dbo.product TO bm_moderator
GO
GRANT SELECT, UPDATE, DELETE, INSERT ON dbo.purchase TO bm_moderator
GO
GRANT SELECT, UPDATE, DELETE, INSERT ON dbo.seller TO bm_moderator
GO
GRANT SELECT ON dbo.averageCostOfNewCarsView TO bm_moderator
GO
GRANT SELECT ON dbo.bodyTypeSoldByYearView TO bm_moderator
GO
GRANT SELECT ON dbo.clientPurchasesView TO bm_moderator
GO
GRANT SELECT ON dbo.markModelView TO bm_moderator
GO
GRANT SELECT ON dbo.sumOfPurchasesBySellerView TO bm_moderator
GO
GRANT EXECUTE ON dbo.createClientWithShowingId TO bm_moderator
GO
GRANT EXECUTE ON dbo.createSeller TO bm_moderator
GO
GRANT EXECUTE ON dbo.deleteModel TO bm_moderator
GO
GRANT EXECUTE ON dbo.getAvgPriceOfProduct TO bm_moderator
GO
GRANT EXECUTE ON dbo.setDiscount TO bm_moderator
GO
GRANT CREATE VIEW TO bm_moderator WITH GRANT OPTION
GO
EXEC master.sys.xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'LoginMode', REG_DWORD, 2
GO
CREATE USER sashka2 FOR LOGIN [acer\sashka2] WITH DEFAULT_SCHEMA = db_ddladmin
CREATE LOGIN Vasily WITH PASSWORD = N'VuarchakaMaka2136^s#l1mshAd7y' MUST_CHANGE, DEFAULT_DATABASE = drogaytsev_motors, CHECK_EXPIRATION = ON, CHECK_POLICY = ON
CREATE USER Vasily WITH DEFAULT_SCHEMA = db_public
CREATE LOGIN Lebron WITH PASSWORD = N'VuarchakaMaka2136^s#l1mshAd7y' MUST_CHANGE, DEFAULT_DATABASE = drogaytsev_motors, CHECK_EXPIRATION = ON, CHECK_POLICY = ON
CREATE USER Lebron WITH DEFAULT_SCHEMA = db_public
CREATE LOGIN Kventin WITH PASSWORD = N'VuarchakaMaka2136^s#l1mshAd7y' MUST_CHANGE, DEFAULT_DATABASE = drogaytsev_motors, CHECK_EXPIRATION = ON, CHECK_POLICY = ON
CREATE USER Kventin WITH DEFAULT_SCHEMA = db_public
GO
ALTER ROLE bm_seller ADD MEMBER Lebron;
ALTER ROLE bm_seller ADD MEMBER Kventin;
ALTER ROLE bm_moderator ADD MEMBER Vasily;
ALTER ROLE db_ddladmin ADD MEMBER sashka2;
GO  

	





   




