USE drogaytsev_motors;
INSERT INTO client VALUES ('Акимов', 'Максим', 'Сергеевич', '6309 883838', 'г. Санкт-Петербург, ул. Невский проспект, д. 1', '+7 999 888 7766');
INSERT INTO client VALUES ('Рудской', 'Андрей', 'Викторович', '6307 543210', 'г. Саратов, ул. Политехническая, д. 76, кв. 103', '+7 987 654 3210');
INSERT INTO client VALUES ('Земскова', 'Анна', 'Михайловна', '6312 747372', 'г. Энгельс, ул. Волоха, д. 7, кв. 6 ', '+7 921 333 2258');
INSERT INTO client VALUES ('Мерило', 'Петр', 'Станиславович', '6303 123456', 'г. Саратов, ул. Б. Садовая, д. 258, кв. 51', '+7 921 921 9211');
INSERT INTO client VALUES ('Лаврентьева', 'Оксана', 'Владленовна', '6318 986532', 'г. Сочи, ул. Орджоникидзе, д. 111, кв. 2 ', '+7 901 888 8888');
INSERT INTO client VALUES ('Симонян', 'Арут', 'Игоревич', '6311 346790', 'г. Маркс, ул. Ленина, д. 15А', '+7 917 333 4445');
INSERT INTO client VALUES ('Гармонь', 'Семен', 'Семенович', '6319 654321', 'г. Балаково, ул. 1-я Линия, д. 2', '+7 934 654 3233');
INSERT INTO client VALUES ('Яшина', 'Александра', 'Павловна', '6309 552139', 'г. Саратов, ул. Лысогорская, д. 89', '+7 999 876 9876');
INSERT INTO client VALUES ('Молодцов', 'Владимир', 'Владимирович', '6318 558507', 'г. Саратов, ул. Пушкина, д. 1, кв. 25', '+7 917 321 4444');
INSERT INTO client VALUES ('Корсакова', 'Вера', 'Вячеславовна', '6320 113331', 'г. Энгельс, ул. Бульвар роз, д. 66', '+7 999 777 3210');

INSERT INTO seller VALUES ('Карри', 'Стефен', 'Уорделл', '+7 900 111 2289');
INSERT INTO seller VALUES ('Джеймс', 'Леброн', 'Рэймон', '+7 901 222 3391');
INSERT INTO seller VALUES ('Тарантино', 'Квентин', 'Джером', '+7 902 333 4434');
INSERT INTO seller(surname, firstname, phone) VALUES ('Челентано', 'Адриано', '+7 903 444 1986');
INSERT INTO seller VALUES ('Безымянная', 'Инна', 'Олеговна', '+7 904 555 2678');
INSERT INTO seller VALUES ('Алешин', 'Антон', 'Владимирович', '+7 905 666 8754');
INSERT INTO seller VALUES ('Попова', 'Анастасия', 'Николаевна', '+7 906 777 3240');
INSERT INTO seller VALUES ('Боровиков', 'Борис', 'Анатольевич', '+7 907 888 1465');
INSERT INTO seller VALUES ('Рыхлов', 'Денис', 'Сергеевич', '+7 908 999 2367');
INSERT INTO seller VALUES ('Карманов', 'Дмитрий', 'Александрович', '+7 909 000 1234');

INSERT INTO mark VALUES ('Audi');
INSERT INTO mark VALUES ('Lada');
INSERT INTO mark VALUES ('Tesla');
INSERT INTO mark VALUES ('Mercedes');
INSERT INTO mark VALUES ('Toyota');

INSERT INTO model VALUES ('Q7', 1);
INSERT INTO model VALUES ('R8', 1);
INSERT INTO model VALUES ('Vesta', 2);
INSERT INTO model VALUES ('X-Ray', 2);
INSERT INTO model VALUES ('Model S', 3);
INSERT INTO model VALUES ('Model X', 3);
INSERT INTO model VALUES ('C63', 4);
INSERT INTO model VALUES ('E53', 4);
INSERT INTO model VALUES ('RAV-4', 5);
INSERT INTO model VALUES ('Camry', 5);

INSERT INTO modification VALUES ('седан', 4, 5, 'бензиновый', 1.8, 'автомат', 'передний', 2019, 3);  
INSERT INTO modification VALUES ('кроссовер', 4, 5, 'электрический', 2.5, 'автомат', 'полный', 2020, 6);  
INSERT INTO modification VALUES ('седан', 4, 5, 'бензиновый', 3.5, 'автомат', 'передний', 2018, 10);  
INSERT INTO modification VALUES ('кроссовер', 5, 5, 'дизельный', 2.0, 'механический', 'полный', 2018, 1);  
INSERT INTO modification VALUES ('купе', 3, 5, 'бензиновый', 3.9, 'автомат', 'полный', 2016, 7);  
INSERT INTO modification VALUES ('хэтчбек', 5, 5, 'электрический', 3.3, 'вариатор', 'полный', 2016, 5);  
INSERT INTO modification VALUES ('кроссовер', 5, 5, 'бензиновый', 2.5, 'автомат', 'полный', 2017, 9);  
INSERT INTO modification VALUES ('кроссовер', 5, 5, 'бензиновый', 1.8, 'автомат', 'полный', 2020, 4);  

INSERT INTO product VALUES (1, '2020-01-25', 30000);
INSERT INTO product VALUES (6, '2016-08-13', 150000);
INSERT INTO product VALUES (6, '2019-04-20', 150000);
INSERT INTO product VALUES (8, '2020-02-02', 35000);
INSERT INTO product VALUES (5, '2017-09-01', 190000);
INSERT INTO product VALUES (3, '2018-12-04', 80000);
INSERT INTO product VALUES (4, '2019-06-30', 100000);
INSERT INTO product VALUES (7, '2017-01-29', 80000);
INSERT INTO product VALUES (5, '2017-11-12', 200000);
INSERT INTO product VALUES (2, '2020-01-01', 200000);

INSERT INTO car VALUES('XTA12345HKS8FC5', 1, 15, 'белый');
INSERT INTO car(vin, product, color) VALUES('XTA67890SHDOFC5', 2, 'черный');
INSERT INTO car VALUES('XTA54321HKS8FC5', 3, 5, 'серый');
INSERT INTO car VALUES('XTA12345HKRDTCP', 4, 23, 'синий');
INSERT INTO car VALUES('XTA12IO6F3L8FC5', 5, 1, 'белый');
INSERT INTO car(vin, product, color) VALUES('XTAARMCC21S8FC9', 6, 'красный');
INSERT INTO car(vin, product, color) VALUES('XTA12345H564NP0', 7, 'желтый');
INSERT INTO car(vin, product, color) VALUES('XTA16125HKS8GLC', 8, 'черный');
INSERT INTO car(vin, product, color) VALUES('XTA12PKFH338MV1', 9, 'черный');
INSERT INTO car VALUES('XTAHGJKCM2139CH', 10, 300, 'серый');

INSERT INTO purchase VALUES(3, 2, 3, 150000, '2016-10-24', 'наличный');
INSERT INTO purchase VALUES(8, 5, 4, 187000, '2017-09-16', 'безналичный');
INSERT INTO purchase VALUES(8, 10, 2, 200000, '2018-03-07', 'безналичный');
INSERT INTO purchase VALUES(1, 9, 2, 195000, '2018-11-04', 'наличный');
INSERT INTO purchase VALUES(1, 3, 5, 150000, '2019-06-01', 'наличный');
INSERT INTO purchase VALUES(2, 6, 7, 80000, '2019-12-07', 'безналичный');
INSERT INTO purchase VALUES(7, 1, 1, 30000, '2020-01-30', 'смешанный');
INSERT INTO purchase VALUES(10, 8, 9, 80000, '2020-02-01', 'наличный');
INSERT INTO purchase VALUES(5, 4, 3, 35000, '2020-02-02', 'наличный');



