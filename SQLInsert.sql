USE LawFirm
GO

insert into Employee values
('94728937856','Ali','Bali'),
('32789681873','Ece','Salu'),
('32948719873','Kara','Demir'),
('12394879087','Mehmet','yakut'),
('43980728109','Fatih','Balci'),
('23147987839','Sude','uygur'),
('14087320089','Eda','kuzgun'),
('08304781987','Osman','sanik'),
('13287409714','Nura','resit'),
('19237840983','Burak','kusur'),
('19673987413','Mahmut','hantau'),
('91438765198','Muhammed','sajnsar'),
('08329048432','Musa','malibu'),
('23498617346','Can','kasab'),
('90127340987','Ece','sanci'),
('12364098143','Sude','norcu'),
('09712245981','Mehmet','koru'),
('14075908374','Toru','sevastapol'),
('87632418623','Sanri','nanavut'),
('12341454365','Kilic','Bulut'),
('53456345546','Kosvu','Kosova'),
('23452667986','Dean','McShou'),
('56374534524','saun','Devoe'),
('21341246534','David','Bacon'),
('21341243048','Feia','Muller'),
('53497539938','Falcom','Handy'),
('10489578745','Harley','Strew'),
('65407830532','Sanders','Coln'),
('43565474315','Drucken','Marlew'),
('21346546346','saun','davidson'),
('65245623354','Matthew','Patrick')

insert into EmployeeEmailContact values
(1,'94728937856', '947@mail.com'),
(2,'32789681873', '327@mail.com'),
(3,'32948719873', '329@mail.com'),
(4,'12394879087', '123@mail.com'),
(5,'43980728109', '439@mail.com'),
(6,'23147987839', '231@mail.com'),
(7,'14087320089', '140@mail.com'),
(8,'08304781987', '083@mail.com'),
(9,'13287409714', '132@mail.com'),
(10,'19237840983', '192@mail.com'),
(11,'19673987413', '196@mail.com'),
(12,'91438765198', '914@mail.com'),
(13,'08329048432', '0831@mail.com'),
(14,'23498617346', '234123@mail.com'),
(15,'90127340987', '9011123@mail.com'),
(16,'12364098143', '12343"@mail.com'),
(17,'09712245981', '09147@mail.com'),
(18,'14075908374', '1412340@mail.com'),
(19,'87632418623', '874126@mail.com'),
(20,'12341454365', '12413@mail.com'),
(21,'53456345546', '53544@mail.com'),
(22,'23452667986', '237454@mail.com'),
(23,'56374534524', '56243@mail.com'),
(24,'21341246534', '21312@mail.com'),
(25,'21341243048', '21234@mail.com');

insert into EmployeePhoneContact values 
(1,'94728937856', '+901558075757'),
(2,'32789681873', '+905959484387'),
(3,'32948719873', '+908888170308'),
(4,'12394879087', '+909382539203'),
(5,'43980728109', '+909469673434'),
(6,'23147987839', '+904699862336'),
(7,'14087320089', '+902959537894'),
(8,'08304781987', '+903715166243'),
(9,'13287409714', '+909494254223'),
(10,'19237840983', '+907826651231'),
(11,'19673987413', '+902953396388'),
(12,'91438765198', '+903434883333'),
(13,'08329048432', '+903132200234'),
(14,'23498617346', '+908956509890'),
(15,'90127340987', '+904593728846'),
(16,'12364098143', '+905403460695'),
(17,'09712245981', '+908785189717'),
(18,'14075908374', '+908851381844'),
(19,'87632418623', '+908589759890'),
(20,'12341454365', '+909303025189'),
(21,'53456345546', '+908859552684'),
(22,'23452667986', '+908555764515'),
(23,'56374534524', '+900781381297'),
(24,'21341246534', '+901407271987'),
(25,'21341243048', '+909536226589');

insert into dbo.Manager values
('94728937856'),
('32789681873'),
('32948719873'),
('12394879087')

insert into Account values
(100, '9123476578364453214525839658', 'AlBank'),
(110, '9640706668443152634451366047', 'AlBank'),
(120, '5193827064560296703924404416', 'KrediKBS'),
(130, '6151199903693856371680156096', 'KrediKBS'),
(140, '1649847551486165967285756244', 'KrediKBS'),
(150, '6511806040831199183049147125', 'DeutBank'),
(160, '3291837834383350318538506561', 'DeutBank'),
(170, '7765296916940026306768163699', 'AlBank'),
(180, '9060045760422297403778233139', 'DeutBank'),
(240, '5362531400887158616326389132', 'KrediKBS'),
(245, '8323877478991461449445205232', 'AlBank'),
(250, '0626642487768928229387464561', 'KrediKBS'),
(255, '8602791628841879919438527512', 'AlBank'),
(260, '2091277751787112744880644753', 'AlBank'),
(265, '5774501046794270096824638792', 'DeutBank'),
(270, '1123361549100423436011530799', 'DeutBank'),
(275, '1741384203885119957339347854', 'AlBank'),
(280, '9678858858288114660569980637', 'AlBank'),
(285, '7355085811789142519793192394', 'KrediKBS'),
(290, '6708163445547679288736861021', 'AlBank'),
(295, '5476156072246973014183368723', 'DeutBank'),
(311, '7486215428893995429045136387', 'KrediKBS'),
(312, '6214267431339633506709792261', 'KrediKBS'),
(313, '1784248401901968789233668481', 'DeutBank'),
(314, '1319651694104510297698262694', 'KrediKBS');

insert into dbo.Lawyer values
('94728937856',100,null),
('32789681873',110,null),
('32948719873',120,null),
('12394879087',130,null),
('43980728109',140,500),
('23147987839',150,500),
('14087320089',160,500),
('08304781987',170,500),
('13287409714',180,500),
('19237840983',240,505),
('19673987413',245,505),
('91438765198',250,505),
('08329048432',255,505),
('23498617346',260,505),
('90127340987',265,505),
('12364098143',270,505),
('09712245981',275,505),
('14075908374',280,505),
('87632418623',285,510),
('12341454365',290,510),
('53456345546',295,510),
('23452667986',311,510),
('56374534524',312,515),
('21341246534',313,515),
('21341243048',314,515);

insert into Representative values
('19237840983'),
('19673987413'),
('12364098143'),
('09712245981'),
('12341454365'),
('21341243048'),
('14087320089'),
('08304781987'),
('13287409714')

insert into Client values
(1000),
(1001),
(1002),
(1003),
(1004),

(1005),
(1006),
(1007),
(1008),
(1009),

(1010),
(1011),
(1012),
(1013),
(1014),

(1015),
(1016),
(1017),
(1018),
(1019),

(2010),
(2020),
(2030),
(2040),
(2050),

(5560),
(5660),
(5670),
(5809),
(5810),
(5811),
(5812),
(5990),
(5991),
(5992),

(6560),
(6660),
(6670),
(6809),
(6810),
(6811),
(6812),
(6990),
(6991),
(6992),

(7560),
(7660),
(7670),
(7809),
(7810)

insert into Payment values
(1, 1, 1000, 10000, 10000, '2023/05/01'),
(2, 2, 1001, 20000, 20000, '2023/06/01'),
(3, 3, 1002, 20000, 20000, '2023/07/01'),
(4, 4, 1003, 25000, 25000, '2023/07/01'),
(5, 5, 1004, 30000, 30000, '2023/08/01'),

(6, 6, 1005, 20000, 20000, '2022/03/01'),
(7, 7, 1006, 15000, 15000, '2022/03/01'),
(8, 8, 1007, 15000, 15000, '2022/04/01'),
(9, 9, 1008, 10000, 10000, '2022/04/01'),
(10, 10, 1009, 20000, 20000, '2022/04/01'),

(11, 11, 1010, 100000, 100000, '2022/04/01'),
(12, 12, 1011, 50000, 50000, '2022/04/01'),
(13, 13, 1012, 60000, 60000, '2022/04/01'),
(14, 14, 1013, 30000, 30000, '2022/05/01'),
(15, 15, 1014, 40000, 40000, '2022/05/01'),

(16, 16, 1015, 30000, 30000, '2022/05/01'),
(17, 17, 1016, 34000, 34000, '2022/05/01'),
(18, 18, 1017, 34000, 34000, '2022/06/01'),
(19, 19, 1018, 32000, 32000, '2022/06/01'),
(20, 20, 1019, 89000, 89000, '2022/06/01'),

(21, 21, 2010, 87000, 87000, '2022/06/01'),
(22, 22, 2020, 90000, 90000, '2022/08/01'),
(23, 23, 2030, 100000, 100000, '2022/08/01'),
(24, 24, 2040, 110000, 110000, '2022/08/01'),
(25, 25, 2050, 50000, 50000, '2022/05/01'),

(26, 1, 5560, 200000, 200000, '2022/01/01'),
(27, 1, 5660, 250000, 250000, '2022/01/01'),
(28, 1, 5670, 250000, 250000, '2022/01/01'),
(29, 2, 5809, 270000, 270000, '2022/01/01'),
(30, 1, 5810, 300000, 300000, '2022/05/01'),

(31, 2, 5811, 310000, 310000, '2022/05/01'),
(32, 1, 5812, 210000, 210000, '2022/05/01'),
(33, 3, 5990, 150000, 150000, '2022/05/01'),
(34, 2, 5991, 170000, 170000, '2022/05/01'),
(35, 2, 5992, 180000, 180000, '2022/05/01'),

(36, 3, 6560, 130000, 130000, '2022/06/01'),
(37, 2, 6660, 120000, 120000, '2022/06/01'),
(38, 2, 6670, 190000, 190000, '2022/06/01'),
(39, 1, 6809, 130000, 130000, '2022/06/01'),
(40, 3, 6810, 120000, 120000, '2022/07/01'),

(41, 1, 6811, 230000, 230000, '2022/07/01'),
(42, 3, 6812, 230000, 230000, '2022/07/01'),
(43, 3, 6990, 320000, 320000, '2022/08/01'),
(44, 3, 6991, 300000, 300000, '2022/08/01'),
(45, 2, 6992, 200000, 200000, '2022/08/01'),

(46, 3, 7560, 420000, 420000, '2023/12/25'),
(47, 3, 7660, 120000, 120000, '2023/12/25'),
(48, 1, 7670, 120000, 120000, '2023/12/26'),
(49, 2, 7809, 230000, 230000, '2023/12/28'),
(50, 1, 7810, 120000, 120000, '2023/12/29')

--Create  t_InsertTransaction trigger first
insert into [dbo].[Transaction] values
(5000, 1, 1000),
(20000, 2, 1001),
(20000, 3, 1002),
(20000, 4, 1003),
(10000, 5, 1004),
(20000, 6, 1005),
(15000, 7, 1006),
(15000, 8, 1007),
(10000, 9, 1008),
(20000, 10, 1009),
(30000, 11, 1010),
(50000, 12, 1011),
(60000, 13, 1012),
(30000, 14, 1013),
(10000, 15, 1014),
(30000, 16, 1015),
(34000, 17, 1016),
(34000, 18, 1017),
(32000, 19, 1018),
(89000, 20, 1019),
(87000, 21, 2010),
(90000, 22, 2020),
(100000, 23, 2030),
(110000, 24, 2040),
(50000, 25, 2050),
(200000, 26, 5560),
(250000, 27, 5660),
(250000, 28, 5670),
(270000, 29, 5809),
(100000, 30, 5810),
(310000, 31, 5811),
(210000, 32, 5812),
(50000, 33, 5990),
(170000, 34, 5991),
(180000, 35, 5992),
(130000, 36, 6560),
(120000, 37, 6660),
(190000, 38, 6670),
(130000, 39, 6809),
(120000, 40, 6810),
(230000, 41, 6811),
(230000, 42, 6812),
(60000, 43, 6990),
(300000, 44, 6991),
(200000, 45, 6992),
(100000, 46, 7560),
(120000, 47, 7660),
(120000, 48, 7670),
(130000, 49, 7809),
(120000, 50, 7810)

insert into [dbo].[Transaction] values
(20000, 11, 1010),
(100000, 30, 5810),
(50000, 33, 5990),
(60000, 43, 6990),
(120000, 46, 7560)

insert into [dbo].[Transaction] values
(50000, 11, 1010),
(100000, 30, 5810),
(120000, 43, 6990),
(100000, 46, 7560)

insert into ClientEmailContact values
(26, '5560@mail.com',5560),
(27, '5660@mail.com',5660),
(28, '5670@mail.com',5670),
(29, '5809@mail.com',5809),
(30, '5810@mail.com',5810),
(31, '5811@mail.com',5811),
(32, '5812@mail.com',5812),
(33, '5990@mail.com',5990),
(34, '5991@mail.com',5991),
(35, '5992@mail.com',5992),

(36, '6560@mail.com',6560),
(37, '6660@mail.com',6660),
(38, '6670@mail.com',6670),
(39, '6809@mail.com',6809),
(40, '6810@mail.com',6810),
(41, '6811"@mail.com,',6811),
(42, '6812@mail.com',6812),
(43, '6990@mail.com',6990),
(44, '6991@mail.com',6991),
(45, '6992@mail.com',6992),
(46, '7560@mail.com',7560),
(47, '7660@mail.com',7660),
(48, '7670@mail.com',7670),
(49, '7809@mail.com',7809),
(50, '7810@mail.com',7810),
(51, '7670_2@mail.com',7670),
(52, '7809_2@mail.com',7809),
(53, '7810_2@mail.com',7810),
(54, '1000_0001@mail.com',1000),
(55, '100_55@mail.com',1005),

(1, '1000@mail.com',1000),
(2, '1001@mail.com',1001),
(3, '1002@mail.com',1002),
(4, '1003@mail.com',1003),
(5, '1004@mail.com',1004),
(6, '1005@mail.com',1005),
(7, '1006@mail.com',1006),
(8, '1007@mail.com',1007),
(9, '1008@mail.com',1008),
(10, '1009@mail.com',1009),
(11, '1010@mail.com',1010),
(12, '1011@mail.com',1011),
(13, '1012@mail.com',1012),
(14, '1013@mail.com',1013),
(15, '1014@mail.com',1014),
(16, '1015"@mail.com',1015),
(17, '1016@mail.com',1016),
(18, '1017@mail.com',1017),
(19, '1018@mail.com',1018),
(20, '1019@mail.com',1019),
(21, '2010@mail.com',2010),
(22, '2020@mail.com',2020),
(23, '2030@mail.com',2030),
(24, '2040@mail.com',2040),
(25, '2050@mail.com',2050);

insert into ClientPhoneContact values
(26, '+909607154619',5560),
(27, '+901617881483',5660),
(28, '+903888604971',5670),
(29, '+909811840956',5809),
(30, '+906797579355',5810),
(31, '+904963203903',5811),
(32, '+902463349547',5812),
(33, '+903427206670',5990),
(34, '+904428048291',5991),
(35, '+907011347360',5992),

(36, '+905497420496',6560),
(37, '+904796181766',6660),
(38, '+901226553529',6670),
(39, '+905618653752',6809),
(40, '+908186921253',6810),
(41, '+909306784665',6811),
(42, '+904116525172',6812),
(43, '+902827334059',6990),
(44, '+908840430938',6991),
(45, '+903239347384',6992),
(46, '+907770057632',7560),
(47, '+905763994928',7660),
(48, '+904901660435',7670),
(49, '+909149838420',7809),
(50, '+907283828363',7810),

(1, '+905508761252',1000),
(2, '+907715423884',1001),
(3, '+904007381293',1002),
(4, '+902278148171',1003),
(5, '+902592409678',1004),
(6, '+905954278799',1005),
(7, '+900853687885',1006),
(8, '+905554652324',1007),
(9, '+900410328983',1008),
(10, '+909648427665',1009),
(11, '+908385838108',1010),
(12, '+908534467740',1011),
(13, '+909806809478',1012),
(14, '+905867962103',1013),
(15, '+901459021987',1014),
(16, '+900020133303',1015),
(17, '+906242173108',1016),
(18, '+900194633637',1017),
(19, '+901641944438',1018),
(20, '+900786509712',1019),
(21, '+904220742326',2010),
(22, '+904073128904',2020),
(23, '+905796417272',2030),
(24, '+909129570583',2040),
(25, '+909431699308',2050);

insert into PersonClient values
('74001312086', 'Mehmet', 'Ali', 1000),
('10789181120', 'Veli', 'surdam', 1001),
('46379637085', 'Sudan', 'Demirci', 1002),
('23323036525', 'Jordan', 'Ahu', 1003),
('30899268270', 'Jaden', 'Barku', 1004),

('35194982875', 'Muhammod', 'Sordan', 1005),
('01127623889', 'Michael', 'Mudus', 1006),
('09631467855', 'Efe', 'Karahanli', 1007),
('22263123623', 'Kuzey', 'Servill', 1008),
('55270235651', 'Sonnia', 'Tottl', 1009),

('72175265087', 'Strudel', 'pasta', 2010),
('63757143498', 'Luis', 'cross', 2020),
('11937577771', 'Benjamin', 'franklin', 2030),
('39680170263', 'Lowey', 'Lee', 2040),
('84705999071', 'Claudie', 'Frolicker', 2050),

('18241993805', 'Matthenson', 'Mcjohanson', 1010),
('28331738260', 'Josemite', 'jackal', 1011),
('52308196272', 'John', 'johanson', 1012),
('90762207146', 'McKidnee', 'Stuf', 1013),
('68053275491', 'Nancy', 'Neor', 1014),

('08954550295', 'Noir', 'LeFranc', 1015),
('11295190548', 'Names', 'Are', 1016),
('59507759119', 'Hard', 'Tow', 1017),
('92966811698', 'Thinko', 'Abou', 1018),
('52242925668', 'Teew', 'Nanol', 1019)

insert into CompanyClient values 
('Ookla',5560),
('Logi',5660),
('Besler',5670),
('Zonda',5809),
('Fiat',5810),
('MTSB',5811),
('SonarTc',5812),
('DOPF',5990),
('Schindler',5991),
('STAM',5992),

('Speedster',6560),
('LGNsm',6660),
('Smasnug',6670),
('VWM',6809),
('DERPY',6810),
('Mitsu',6811),
('Zetatech',6812),
('Tesla',6990),
('Appel',6991),
('StoriTeller',6992),

('SpeakerSys',7560),
('SysHelper',7660),
('Besteller',7670),
('Zukunft',7809),
('Font',7810)

insert into CompanyAddress values
('Tatlisu','IST','Istanbul','34100','Ookla'),
('Ataturk','IST','Istanbul','34200','Logi'),
('Ataturk','IST','Istanbul','34200','Besler'),
('Tatlisu','IST','Istanbul','34110','Zonda'),
('Mens','IST','Istanbul','34200','Fiat'),
('Akarya','IST','Istanbul','34650','MTSB'),
('Acisu','IST','Istanbul','34700','SonarTc'),
('Su','IST','Istanbul','34800','DOPF'),
('Acisu','IST','Istanbul','34700','Schindler'),
('Acisu','IST','Istanbul','34700','STAM'),

('31st','NYC','New York','11200','Speedster'),
('31st','NYC','New York','11210','LGNsm'),
('31st','NYC','New York','11222','Smasnug'),
('32nd','NYC','New York','11221','VWM'),
('32nd','NYC','New York','11232','DERPY'),
('32nd','NYC','New York','11234','Mitsu'),
('33rd','NYC','New York','11232','Zetatech'),
('33rd','NYC','New York','11235','Tesla'),
('35th','NYC','New York','11275','Appel'),
('36th','NYC','New York','11272','StoriTeller'),

('Koppenhauberweg','BRLN','Berlin','700','SpeakerSys'),
('himmelsdorf','BRLN','Berlin','790','SysHelper'),
('unterschideneweg','BRLN','Berlin','776','Besteller'),
('unterschideneweg','BRLN','Berlin','775','Zukunft'),
('zuruckkommenweg','BRLN','Berlin','750','Font')

insert into [dbo].[Case] (CaseNo, CaseType, Alias) values
(1010, 'Family', NULL),
(1020, 'Divorce', NULL),
(1030, 'Civil', NULL),
(1040, 'Divorce', NULL),
(1050, 'Family', NULL),
(1060, 'Civil', NULL),
(1070, 'Criminal', NULL),
(1080, 'Criminal','Mehmet Karahanli Suikasti'),
(1090, 'Civil', NULL),
(1100, 'Criminal', NULL),
(1110, 'Civil', NULL),
(1120, 'Criminal','Kasikci Suikasti'),
(1130, 'Family', NULL),
(1140, 'Family', NULL),
(1150, 'Civil', NULL),

(1190, 'Criminal','Susurluk Kazasi'),
(1200, 'Family', NULL),
(1210, 'Family', NULL),
(1220, 'Civil', NULL),

(2000, 'Property Dispute', NULL),
(2001, 'Bankruptcy', NULL),
(2002, 'Property Dispute', NULL),
(2003, 'Contract Dispute', NULL),
(2004, 'Contract Dispute', NULL),
(2005, 'Contract Dispute', NULL),
(2006, 'Contract Dispute', NULL),
(2009, 'Property Dispute', NULL),
(2010, 'Contract Dispute', NULL),
(2012, 'Bankruptcy', NULL),
(2013, 'Contract Dispute', NULL),
(2014, 'Property Dispute', NULL),
(2015, 'Contract Dispute','Demiroren Ziraat Kredisi'),
(2016, 'Bankruptcy', NULL),
(2017, 'Property Dispute', NULL),

(90120, 'Class Action', NULL),
(90250, 'Class Action', NULL),
(90380, 'Class Action', NULL)

insert into [dbo].[Case] values
(1160, 'Civil', NULL, 1),
(1170, 'Criminal','Hrant Dink Suikasti',1),
(1180, 'Civil', NULL, 1),
(2007, 'Bankruptcy', NULL, 1),
(2008, 'Property Dispute', NULL, 1),
(2011, 'Bankruptcy','Ciftlikbank',1),
(2018, 'Property Dispute', NULL, 1)

insert into AssosiatedCustomer values
(1000, 1010),
(1001,1020),
(1002,1030),
(1003,1040),
(1004,1050),
(1005,1060),
(1006,1070),
(1007,1080),
(1008,1090),
(1009,1100),
(1010,1110),
(1011,1120),
(1012,1130),
(1013,1140),

(1014,1150),
(1014,1150),

(1015,1160),
(1016,1170),
(1017,1180),
(1018,1190),
(1019,1200),

(2010,1210),
(2030,1210),

(2020,1220),
(2040,1220),
(2050,1220),


(5560, 2000),

(5660, 2001),
(5670, 2001),
(5809, 2001),

(5810, 2002),

(5811, 2003),
(5812, 2003),
(5990, 2003),

(5991, 2004),
(5992, 2005),

(6560, 2006),
(6660, 2006),

(6670, 2007),
(6809, 2007),

(6810, 2008),
(6811, 2009),
(6812, 2010),
(6990, 2011),
(6991, 2012),
(6992, 2013),
(7560, 2014),
(7660, 2015),
(7670, 2016),
(7809, 2017),
(7810, 2018),

(1000, 90120),
(1017, 90120),
(1016, 90120),
(1013, 90120),
(1004, 90120),

(1012, 90250),
(1011, 90250),
(1018, 90250),
(1007, 90250),
(1009, 90250),
(1010, 90250),

(1000, 90380),
(1005, 90380),
(1019, 90380),
(1014, 90380)

insert into AssosiatedLawyer values
(22, 1010),
(10, 1010),

(23,1020),
(14,1020),

(24,1030),
(20,1030),

(25,1040),
(15,1040),


(23,1050),
(13,1050),


(10,1060),
(11,1070),
(12,1080),
(13,1090),
(14,1100),
(15,1110),
(16,1120),
(17,1130),
(18,1140),
(19,1150),
(20,1160),
(21,1170),
(18,1180),
(17,1190),
(14,1200),
(12,1210),
(20,1220),


(4, 2000),
(5, 2001),
(6, 2002),
(7, 2003),
(8, 2004),
(9, 2005),
(4, 2006),
(4, 2007),
(8, 2008),
(9, 2009),
(6, 2010),
(5, 2011),
(6, 2012),
(1, 2013),
(2, 2014),
(3, 2015),
(7, 2016),
(8, 2017),
(8, 2018),


(1, 90120),
(2, 90120),
(3, 90120),

(2, 90250),
(3, 90380)

insert into RelevancyPeriod values
('2023/06/10',null, 1010),
('2023/06/12',null, 1020),
('2023/06/15',null, 1030),
('2023/06/12',null, 1040),
('2023/06/16',null, 1050),
('2023/07/12',null, 1060),
('2023/07/09',null, 1070),
('2023/07/06',null, 1080),
('2023/07/03',null, 1090),
('2023/07/07',null, 1100),
('2023/08/23',null, 1110),
('2023/08/25',null, 1120),
('2023/08/29',null, 1130),
('2023/08/24',null, 1140),
('2023/04/28',null, 1150),
('2023/04/12','2023/08/22', 1160),
('2022/04/12','2023/08/22', 1170),
('2023/04/11','2023/08/22', 1180),
('2023/04/10',null, 1190),
('2023/04/10',null, 1200),
('2023/09/17',null, 1210),
('2023/09/14',null, 1220),

('2023/06/01',null,  2000),
('2023/06/01',null,  2001),
('2023/06/02',null,  2002),
('2023/06/05',null,  2003),
('2023/06/05',null,  2004),
('2023/07/20',null,  2006),
('2021/07/01','2023/07/22',  2007),
('2022/10/12','2023/07/22',  2008),
('2023/07/25',null,  2009),
('2023/07/27',null,  2010),
('2020/07/28','2022/10/20',  2011),
('2023/03/08',null,  2012),
('2023/03/09',null,  2013),
('2023/03/09',null,  2014),
('2022/09/10',null,  2015),
('2022/09/10',null,  2016),
('2022/09/11',null,  2017),
('2022/06/23',null,  2018),
('2022/08/21',null,  90120),
('2022/08/29',null,  90250),
('2022/06/21',null,  90380)

insert into Trial (TrialNo,TrialType,TrialDate) values
(1, 'Normal', '2022/01/10'),
(2, 'Normal', '2023/02/10'),
(3, 'Normal', '2023/02/10'),
(4, 'Normal', '2023/01/10'),
(5, 'Normal', '2024/01/10'),

(6, 'Normal', '2024/03/10'),



(8, 'Normal', '2023/03/10'),
(9, 'Normal', '2023/03/10'),
(10, 'Normal', '2024/04/10'),

(11, 'Normal', '2024/04/10'),
(12, 'Normal', '2024/05/10'),
(13, 'Normal', '2023/06/10'),

(14, 'Normal', '2022/04/10'),

(16, 'Normal', '2023/05/10'),
(18, 'Normal', '2023/06/10'),
(19, 'Normal', '2023/06/10'),
(20, 'Normal', '2023/06/10'),

(21, 'Normal', '2023/07/10'),
(22, 'Normal', '2023/07/10'),
(23, 'Class Action', '2023/07/10'),
(24, 'Class Action', '2023/07/10'),
(25, 'Class Action', '2023/08/10'),

(26, 'Normal', '2023/07/10'),
(27, 'Normal', '2023/09/15'),

(28, 'Normal', '2023/01/20'),
(29, 'Normal', '2024/06/17'),

(30, 'Normal', '2023/03/12'),
(31, 'Normal', '2023/06/12'),
(32, 'Normal', '2023/09/06')

insert into Trial values
(7, 'Normal', '2023/08/22',1),
(15, 'Normal', '2023/07/22',1),
(17, 'Normal', '2022/10/20', 1),
(33, 'Normal', '2023/12/20', 1)

insert into AssociatedCase values
(1, 1010),
(1, 1020),
(1, 1030),
(2, 1040),
(2, 1050),
(3, 1060),
(3, 1070),
(4, 1080),
(4, 1090),
(4, 1100),
(5, 1110),
(5, 1120),
(5, 1130),
(6, 1140),
(6, 1150),

(7, 1160),
(7, 1170),
(7, 1180),

(8, 1190),
(8, 1200),
(9, 1210),
(10, 1220),

(11, 2000),
(12, 2001),
(13, 2002),
(13, 2003),
(13, 2004),
(14, 2005),

(14, 2007),
(15, 2007),
(15, 2008),

(16, 2009),
(16, 2010),

(17, 2011),

(18, 2012),
(18, 2013),
(19, 2014),
(19, 2015),
(20, 2016),

(21, 90120),
(22, 90120),
(24, 90120),

(21, 90250),
(23, 90250),
(25, 90250),

(22, 90380),
(25, 90380),

(26, 1010),
(27, 1010),

(28, 2017),
(29, 2017),

(30, 2018),
(31, 2018),
(32, 2018),
(33, 2018)

insert into RepresentativeAtCourt values 
(201, 1),
(202, 2),
(203, 3),
(204, 4),
(205, 5),
(206, 6),
(207, 7),
(208, 8),
(200, 9),
(201, 10),

(202, 11),
(201, 12),
(203, 13),
(202, 14),
(201, 15),

(201, 16),
(206, 16),

(202, 17),
(207, 17),

(203, 18),
(208, 18),

(204, 19),
(200, 19),

(205, 20),
(200, 20),


(201, 21),
(202, 22),
(203, 23),
(204, 24),
(205, 25),

(202, 26),
(203, 26),
(204, 26),

(205, 27),
(205, 28),
(205, 29),

(202, 31),
(201, 32),
(203, 33),

(202, 30),
(201, 30)

select * from Employee
select * from Account
select * from Manager
select * from Lawyer
select * from Representative
select * from Client
select * from PersonClient
select * from CompanyClient
select * from CompanyAddress
select * from [Case] Order by CaseType
select * from AssosiatedCustomer
select * from AssosiatedLawyer
select * from RelevancyPeriod
select * from EmployeeEmailContact
select * from EmployeePhoneContact
select * from ClientEmailContact
select * from ClientPhoneContact
select * from Payment
select * from [dbo].[Transaction]
select * from Trial
select * from AssociatedCase