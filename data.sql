/* ------------------------------------------------------------------
   SAMPLE DATA  •  MIN. 20 ROWS PER TABLE  •  FOR 22‑TABLE AIRBNB MART
-------------------------------------------------------------------*/
USE airbnb;              -- ← change if your schema name differs
SET FOREIGN_KEY_CHECKS = 0;

/* 1. user_profiles (30 users) */
INSERT INTO user_profiles
(user_id, first_name, last_name, email, phone, created_at, user_role) VALUES
(1 , 'Juan'      , 'Pérez'   , 'juan.perez@demo.com'     , '1000000001', NOW(), 'guest'),
(2 , 'Beatriz'   , 'Sánchez' , 'beatriz.sanchez@demo.com', '1000000002', NOW(), 'guest'),
(3 , 'Carlos'    , 'Díaz'    , 'carlos.diaz@demo.com'    , '1000000003', NOW(), 'guest'),
(4 , 'Diego'     , 'Romero'  , 'diego.romero@demo.com'   , '1000000004', NOW(), 'guest'),
(5 , 'Elena'     , 'García'  , 'elena.garcia@demo.com'   , '1000000005', NOW(), 'guest'),
(6 , 'Francisco' , 'Martín'  , 'francisco.martin@demo.com','1000000006', NOW(), 'host' ),
(7 , 'Gabriela'  , 'López'   , 'gabriela.lopez@demo.com' , '1000000007', NOW(), 'host' ),
(8 , 'Hugo'      , 'Muñoz'   , 'hugo.munoz@demo.com'     , '1000000008', NOW(), 'host' ),
(9 , 'Inés'      , 'Costa'   , 'ines.costa@demo.com'     , '1000000009', NOW(), 'host' ),
(10, 'Jorge'     , 'Nolasco' , 'jorge.nolasco@demo.com'  , '1000000010', NOW(), 'host' ),
(11, 'Karla'     , 'Yáñez'   , 'karla.yanez@demo.com'    , '1000000011', NOW(), 'guest'),
(12, 'Luis'      , 'Figueroa', 'luis.figueroa@demo.com'  , '1000000012', NOW(), 'guest'),
(13, 'María'     , 'Salinas' , 'maria.salinas@demo.com'  , '1000000013', NOW(), 'guest'),
(14, 'Nicolás'   , 'Gómez'   , 'nicolas.gomez@demo.com'  , '1000000014', NOW(), 'guest'),
(15, 'Olivia'    , 'Chávez'  , 'olivia.chavez@demo.com'  , '1000000015', NOW(), 'guest'),
(16, 'Pablo'     , 'Silva'   , 'pablo.silva@demo.com'    , '1000000016', NOW(), 'guest'),
(17, 'Raquel'    , 'Grau'    , 'raquel.grau@demo.com'    , '1000000017', NOW(), 'guest'),
(18, 'Rodrigo'   , 'Cano'    , 'rodrigo.cano@demo.com'   , '1000000018', NOW(), 'guest'),
(19, 'Sara'      , 'López'   , 'sara.lopez@demo.com'     , '1000000019', NOW(), 'guest'),
(20, 'Tomás'     , 'Bravo'   , 'tomas.bravo@demo.com'    , '1000000020', NOW(), 'guest'),
(21, 'Úrsula'    , 'Soto'    , 'ursula.soto@demo.com'    , '1000000021', NOW(), 'guest'),
(22, 'Víctor'    , 'Navarro' , 'victor.navarro@demo.com' , '1000000022', NOW(), 'guest'),
(23, 'Walter'    , 'Huesca'  , 'walter.huesca@demo.com'  , '1000000023', NOW(), 'guest'),
(24, 'Ximena'    , 'Ibáñez'  , 'ximena.ibanez@demo.com'  , '1000000024', NOW(), 'guest'),
(25, 'Yago'      , 'Pascual' , 'yago.pascual@demo.com'   , '1000000025', NOW(), 'guest'),
(26, 'Zacarías'  , 'Ibarra'  , 'zacarias.ibarra@demo.com', '1000000026', NOW(), 'admin'),
(27, 'Ana'       , 'Ruiz'    , 'ana.ruiz@demo.com'       , '1000000027', NOW(), 'admin'),
(28, 'Bruno'     , 'Segovia' , 'bruno.segovia@demo.com'  , '1000000028', NOW(), 'admin'),
(29, 'Carmen'    , 'Luna'    , 'carmen.luna@demo.com'    , '1000000029', NOW(), 'admin'),
(30, 'Daniel'    , 'Olmedo'  , 'daniel.olmedo@demo.com'  , '1000000030', NOW(), 'admin')


/* 2. hosts (10) – users 6‑15 */
INSERT INTO hosts (host_id, user_id, host_rating, verification_status) VALUES
(1 ,  6 , 85.00 , 1),
(2 ,  7 , 90.00 , 1),
(3 ,  8 , 78.00 , 0),
(4 ,  9 , 88.00 , 1),
(5 , 10 , 95.00 , 1),
(6 , 11 , 80.00 , 0),
(7 , 12 , 87.00 , 1),
(8 , 13 , 92.00 , 1),
(9 , 14 , 83.00 , 1),
(10, 15 , 89.00 , 1);


/* 3. guests (20)  – users 1‑5 and 16‑30 */
INSERT INTO guests (guest_id,user_id) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,16),(7,17),(8,18),(9,19),(10,20),
(11,21),(12,22),(13,23),(14,24),(15,25),
(16,26),(17,27),(18,28),(19,29),(20,30);

/* 4. admin_users (20) – admins supervise each other */
INSERT INTO admin_users
(admin_id,user_id,admin_level,privileges,reports_to) VALUES
(1,26,2,'all',NULL),
(2,27,1,'moderate',1),(3,28,1,'finance',1),(4,29,1,'support',1),(5,30,1,'ops',1),
(6,6,1,'limited',2),(7,7,1,'limited',2),(8,8,1,'limited',3),(9,9,1,'limited',3),
(10,10,1,'limited',4),(11,11,1,'limited',4),(12,12,1,'limited',5),(13,13,1,'limited',5),
(14,14,1,'limited',6),(15,15,1,'limited',6),(16,16,1,'limited',7),(17,17,1,'limited',7),
(18,18,1,'limited',8),(19,19,1,'limited',9),(20,20,1,'limited',10);

/* 5. cancellation_policies (20) */
INSERT INTO cancellation_policies (policy_id,policy_name,description,refund_percentage) VALUES
(1,'Flex','Full refund 1 day before',100),(2,'Mod','50 % up to 5 days',50),
(3,'Strict','No refund after booking',0),(4,'Long Trip','75 % 14 days before',75),
(5,'Super Flex','Full until check‑in',100),(6,'Early Bird','90 % 30 days',90),
(7,'Saver','40 % any time',40),(8,'Weekend','No refund on Fri‑Sun',0),
(9,'Holiday','20 % during holidays',20),(10,'Partial','60 %',60),
(11,'Corporate','Flexible for corp',100),(12,'Snow','75 % winter',75),
(13,'Summer','30 % peak',30),(14,'Conference','50 %',50),(15,'C‑19','Full if sick',100),
(16,'Family','80 % families',80),(17,'Event','Non‑ref',0),(18,'Promo','No refund',0),
(19,'Test','Test policy',10),(20,'Last Minute','0 %',0);

/* 6. property_listings (20) */
/* 6. property_listings – 20 real addresses in Spain */
INSERT INTO property_listings
(property_id, host_id, title, description,
 property_type, room_type,
 address,        city,          state,        country, zipcode, created_at)
VALUES
(1 , 1 ,'Listing 1' ,'Desc 1','Apartment','Entire',
 'Calle Mayor 10',              'Madrid',          'Madrid',        'Spain','28013',NOW()),
(2 , 2 ,'Listing 2' ,'Desc 2','Apartment','Entire',
 'Carrer de Balmes 45',         'Barcelona',       'Barcelona',     'Spain','08007',NOW()),
(3 , 3 ,'Listing 3' ,'Desc 3','Apartment','Private',
 'Avenida del Puerto 12',       'Valencia',        'Valencia',      'Spain','46023',NOW()),
(4 , 4 ,'Listing 4' ,'Desc 4','House','Entire',
 'Calle Sierpes 22',            'Sevilla',         'Sevilla',       'Spain','41004',NOW()),
(5 , 5 ,'Listing 5' ,'Desc 5','House','Entire',
 'Gran Vía 8',                  'Bilbao',          'Bizkaia',       'Spain','48011',NOW()),
(6 , 6 ,'Listing 6' ,'Desc 6','Loft','Entire',
 'Paseo Independencia 16',      'Zaragoza',        'Zaragoza',      'Spain','50001',NOW()),
(7 , 7 ,'Listing 7' ,'Desc 7','Loft','Private',
 'Calle Larios 5',              'Málaga',          'Málaga',        'Spain','29005',NOW()),
(8 , 8 ,'Listing 8' ,'Desc 8','Villa','Entire',
 'Calle Reyes Católicos 9',     'Granada',         'Granada',       'Spain','18010',NOW()),
(9 , 9 ,'Listing 9' ,'Desc 9','Villa','Entire',
 'Calle de San Fernando 3',     'Alicante',        'Alicante',      'Spain','03002',NOW()),
(10,10,'Listing 10','Desc 10','Cabin','Entire',
 'Calle Mayor 1',               'San Sebastián',   'Gipuzkoa',      'Spain','20003',NOW()),
(11,1 ,'Listing 11','Desc 11','Cabin','Entire',
 'Calle Compañía 18',           'Salamanca',       'Salamanca',     'Spain','37002',NOW()),
(12,2 ,'Listing 12','Desc 12','Flat','Entire',
 'Calleja de las Flores 2',     'Córdoba',         'Córdoba',       'Spain','14003',NOW()),
(13,3 ,'Listing 13','Desc 13','Flat','Private',
 'Rúa do Franco 40',            'Santiago de Compostela','A Coruña','Spain','15702',NOW()),
(14,4 ,'Listing 14','Desc 14','Studio','Entire',
 'Calle Hernán Cortés 15',      'Santander',       'Cantabria',     'Spain','39003',NOW()),
(15,5 ,'Listing 15','Desc 15','Studio','Entire',
 'Carrer de la Missió 1',       'Palma',           'Illes Balears', 'Spain','07001',NOW()),
(16,6 ,'Listing 16','Desc 16','BnB','Entire',
 'Gran Vía Escultor Salzillo 10','Murcia',         'Murcia',        'Spain','30004',NOW()),
(17,7 ,'Listing 17','Desc 17','BnB','Private',
 'Calle Uría 25',               'Oviedo',          'Asturias',      'Spain','33003',NOW()),
(18,8 ,'Listing 18','Desc 18','Resort','Entire',
 'Rúa do Príncipe 22',          'Vigo',            'Pontevedra',    'Spain','36202',NOW()),
(19,9 ,'Listing 19','Desc 19','Resort','Entire',
 'Calle Ancha 12',              'Cádiz',           'Cádiz',         'Spain','11001',NOW()),
(20,10,'Listing 20','Desc 20','Resort','Entire',
 'Calle Comercio 7',            'Toledo',          'Toledo',        'Spain','45001',NOW());


/* 7. reservations (20) */
INSERT INTO reservations
(reservation_id,property_id,guest_id,check_in,check_out,status,booked_at)
VALUES
(1,1,1,'2025-01-05','2025-01-10','confirmed',NOW()),
(2,2,2,'2025-01-08','2025-01-11','confirmed',NOW()),
(3,3,3,'2025-01-12','2025-01-14','pending',NOW()),
(4,4,4,'2025-01-15','2025-01-18','confirmed',NOW()),
(5,5,5,'2025-01-20','2025-01-25','confirmed',NOW()),
(6,6,6,'2025-01-10','2025-01-12','cancelled',NOW()),
(7,7,7,'2025-01-22','2025-01-24','confirmed',NOW()),
(8,8,8,'2025-01-28','2025-02-02','confirmed',NOW()),
(9,9,9,'2025-02-03','2025-02-07','pending',NOW()),
(10,10,10,'2025-02-05','2025-02-06','confirmed',NOW()),
(11,11,11,'2025-02-08','2025-02-10','confirmed',NOW()),
(12,12,12,'2025-02-11','2025-02-14','confirmed',NOW()),
(13,13,13,'2025-02-15','2025-02-17','confirmed',NOW()),
(14,14,14,'2025-02-18','2025-02-22','cancelled',NOW()),
(15,15,15,'2025-02-24','2025-02-26','confirmed',NOW()),
(16,16,16,'2025-03-01','2025-03-04','pending',NOW()),
(17,17,17,'2025-03-05','2025-03-08','confirmed',NOW()),
(18,18,18,'2025-03-10','2025-03-12','confirmed',NOW()),
(19,19,19,'2025-03-14','2025-03-18','confirmed',NOW()),
(20,20,20,'2025-03-20','2025-03-23','confirmed',NOW());

/* 8. transactions (20) */
INSERT INTO transactions
(transaction_id,reservation_id,transaction_date,amount,payment_method,status)
VALUES
(1,1,NOW(),500.00,'card','paid'),
(2,2,NOW(),450.00,'card','paid'),
(3,3,NOW(),300.00,'paypal','pending'),
(4,4,NOW(),700.00,'card','paid'),
(5,5,NOW(),600.00,'card','paid'),
(6,6,NOW(),250.00,'paypal','refunded'),
(7,7,NOW(),350.00,'card','paid'),
(8,8,NOW(),800.00,'card','paid'),
(9,9,NOW(),400.00,'paypal','pending'),
(10,10,NOW(),120.00,'card','paid'),
(11,11,NOW(),260.00,'card','paid'),
(12,12,NOW(),300.00,'paypal','paid'),
(13,13,NOW(),220.00,'card','paid'),
(14,14,NOW(),480.00,'card','refunded'),
(15,15,NOW(),330.00,'paypal','paid'),
(16,16,NOW(),450.00,'card','pending'),
(17,17,NOW(),390.00,'card','paid'),
(18,18,NOW(),520.00,'paypal','paid'),
(19,19,NOW(),460.00,'card','paid'),
(20,20,NOW(),500.00,'card','paid');

/* 9. amenities (20) */
INSERT INTO amenities (amenity_id,amenity_name,description) VALUES
(1,'WiFi','High‑speed internet'),(2,'Kitchen','Full kitchen'),(3,'Washer','Laundry'),
(4,'Dryer','Clothes dryer'),(5,'AC','Air conditioning'),(6,'Heating','Central heat'),
(7,'TV','Smart TV'),(8,'Parking','Free parking'),(9,'Gym','Gym access'),
(10,'Pool','Swimming pool'),(11,'Hot tub','Spa hot tub'),(12,'Fireplace','Indoor'),
(13,'Workspace','Desk'),(14,'Balcony','Private balcony'),(15,'Breakfast','Breakfast included'),
(16,'Pets','Pet‑friendly'),(17,'Smoking','Smoking allowed'),(18,'BBQ','Barbecue grill'),
(19,'Beach','Beach access'),(20,'Essentials','Towels & linens');

/* 10. listing_amenities (40 links) */
INSERT INTO listing_amenities (property_id,amenity_id) VALUES
(1,1),(1,2),(2,1),(2,5),(3,1),(3,3),(4,1),(4,10),
(5,1),(5,4),(6,1),(6,8),(7,1),(7,9),(8,1),(8,11),
(9,1),(9,12),(10,1),(10,13),(11,1),(11,14),(12,1),(12,15),
(13,1),(13,16),(14,1),(14,17),(15,1),(15,18),(16,1),(16,19),
(17,1),(17,20),(18,1),(18,6),(19,1),(19,7),(20,1),(20,5);

/* 11. property_images (20) */
INSERT INTO property_images (image_id,property_id,image_url,caption,uploaded_at) VALUES
(1,1,'/img/1.jpg','Image 1',NOW()),(2,2,'/img/2.jpg','Image 2',NOW()),
(3,3,'/img/3.jpg','Image 3',NOW()),(4,4,'/img/4.jpg','Image 4',NOW()),
(5,5,'/img/5.jpg','Image 5',NOW()),(6,6,'/img/6.jpg','Image 6',NOW()),
(7,7,'/img/7.jpg','Image 7',NOW()),(8,8,'/img/8.jpg','Image 8',NOW()),
(9,9,'/img/9.jpg','Image 9',NOW()),(10,10,'/img/10.jpg','Image 10',NOW()),
(11,11,'/img/11.jpg','Image 11',NOW()),(12,12,'/img/12.jpg','Image 12',NOW()),
(13,13,'/img/13.jpg','Image 13',NOW()),(14,14,'/img/14.jpg','Image 14',NOW()),
(15,15,'/img/15.jpg','Image 15',NOW()),(16,16,'/img/16.jpg','Image 16',NOW()),
(17,17,'/img/17.jpg','Image 17',NOW()),(18,18,'/img/18.jpg','Image 18',NOW()),
(19,19,'/img/19.jpg','Image 19',NOW()),(20,20,'/img/20.jpg','Image 20',NOW());

/* 12. property_rules (20) */
INSERT INTO property_rules (rule_id,property_id,rule_description) VALUES
(1,1,'No smoking'),(2,2,'No pets'),(3,3,'Quiet after 22:00'),(4,4,'No parties'),
(5,5,'Take trash out'),(6,6,'Turn off lights'),(7,7,'No shoes inside'),
(8,8,'Max 4 guests'),(9,9,'No loud music'),(10,10,'ID required'),
(11,11,'Pool hours 9‑19'),(12,12,'Recycle'),(13,13,'Keep windows closed'),
(14,14,'No extra visitors'),(15,15,'Check‑in 15:00'),(16,16,'Check‑out 11:00'),
(17,17,'Park only in slot'),(18,18,'Report damages'),(19,19,'No candles'),
(20,20,'Close gates');

/* 13. calendar_availability (60) – 3 days each for first 20 listings */
INSERT INTO calendar_availability (property_id,available_date,is_available,price) VALUES
(1,'2025-01-01',1,120),(1,'2025-01-02',0,120),(1,'2025-01-03',1,120),
(2,'2025-01-01',1,110),(2,'2025-01-02',1,110),(2,'2025-01-03',0,110),
(3,'2025-01-01',1,90),(3,'2025-01-02',1,90),(3,'2025-01-03',1,90),
(4,'2025-01-01',0,200),(4,'2025-01-02',1,200),(4,'2025-01-03',1,200),
(5,'2025-01-01',1,140),(5,'2025-01-02',1,140),(5,'2025-01-03',0,140),
(6,'2025-01-01',1,110),(6,'2025-01-02',1,110),(6,'2025-01-03',1,110),
(7,'2025-01-01',1,115),(7,'2025-01-02',0,115),(7,'2025-01-03',1,115),
(8,'2025-01-01',1,175),(8,'2025-01-02',1,175),(8,'2025-01-03',1,175),
(9,'2025-01-01',0,160),(9,'2025-01-02',1,160),(9,'2025-01-03',1,160),
(10,'2025-01-01',1,135),(10,'2025-01-02',1,135),(10,'2025-01-03',1,135),
(11,'2025-01-01',1,125),(11,'2025-01-02',1,125),(11,'2025-01-03',0,125),
(12,'2025-01-01',1,105),(12,'2025-01-02',1,105),(12,'2025-01-03',1,105),
(13,'2025-01-01',1,95),(13,'2025-01-02',1,95),(13,'2025-01-03',0,95),
(14,'2025-01-01',1,100),(14,'2025-01-02',1,100),(14,'2025-01-03',1,100),
(15,'2025-01-01',1,110),(15,'2025-01-02',0,110),(15,'2025-01-03',1,110),
(16,'2025-01-01',1,250),(16,'2025-01-02',1,250),(16,'2025-01-03',1,250);

/* 14. pricing_history (20) */
INSERT INTO pricing_history (pricing_id,property_id,price,start_date,end_date) VALUES
(1,1,100,'2024-01-01','2024-06-30'),(2,1,120,'2024-07-01','2024-12-31'),
(3,2,90,'2024-01-01','2024-06-30'),(4,2,110,'2024-07-01','2024-12-31'),
(5,3,80,'2024-01-01','2024-06-30'),(6,3,90,'2024-07-01','2024-12-31'),
(7,4,180,'2024-01-01','2024-06-30'),(8,4,200,'2024-07-01','2024-12-31'),
(9,5,120,'2024-01-01','2024-06-30'),(10,5,140,'2024-07-01','2024-12-31'),
(11,6,90,'2024-01-01','2024-06-30'),(12,6,110,'2024-07-01','2024-12-31'),
(13,7,95,'2024-01-01','2024-06-30'),(14,7,115,'2024-07-01','2024-12-31'),
(15,8,150,'2024-01-01','2024-06-30'),(16,8,175,'2024-07-01','2024-12-31'),
(17,9,140,'2024-01-01','2024-06-30'),(18,9,160,'2024-07-01','2024-12-31'),
(19,10,120,'2024-01-01','2024-06-30'),(20,10,135,'2024-07-01','2024-12-31');

/* 15. messages (20) */
INSERT INTO messages
(message_id, reservation_id, sender_id, receiver_id, content, sent_at) VALUES
(1 , 1 , 1 , 6 , '¡Hola! Espero que la casa no venga con fantasmas, ¿verdad?',                   NOW()),
(2 , 1 , 6 , 1 , 'Tranqui, los fantasmas ya pagan alquiler.',                                   NOW()),
(3 , 2 , 2 , 7 , '¿Podemos hacer check‑in antes? Mi suegra trae veinte maletas.',               NOW()),
(4 , 2 , 7 , 2 , 'Si trae tortilla, le abrimos la puerta a las 7 am sin problema.',             NOW()),
(5 , 3 , 3 , 8 , '¿Hay parking o aparco en Mordor?',                                            NOW()),
(6 , 3 , 8 , 3 , 'Gratis delante: solo esquiva al abuelo con la boina.',                        NOW()),
(7 , 4 , 4 , 9 , '¿Algún bar cerca que sirva café decente?',                                    NOW()),
(8 , 5 , 5 ,10 , '¿Aceptas perros? El mío solo ladra cuando ve políticos.',                     NOW()),
(9 , 5 ,10 , 5 , 'Lo siento, solo aceptamos gatos que paguen depósito.',                        NOW()),
(10, 6 , 6 ,11 , 'Tengo que cancelar: la cabra del punto 5 se ha comido mi coche.',             NOW()),
(11, 7 , 7 ,12 , '¿Qué tal llega el wifi? Necesito ver memes en 4K.',                           NOW()),
(12, 8 , 8 ,13 , '¡Con ganas de llegar! Espero que el piso huela a churros.',                   NOW()),
(13, 9 , 9 ,14 , '¿Se oye mucho ruido o solo los vecinos cantan flamenco?',                     NOW()),
(14,10 ,10 ,15 , '¿Puedes dejar toallas extra? Planeo llorar en la ducha.',                     NOW()),
(15,11 ,11 , 1 , '¿La piscina está abierta o es un PowerPoint?',                                NOW()),
(16,12 ,12 , 2 , '¿Funciona la calefacción o me llevo brasero?',                                NOW()),
(17,13 ,13 , 3 , 'He dejado las llaves dentro junto a mi dignidad.',                            NOW()),
(18,14 ,14 , 4 , '¿Puedo checkout tarde? Necesito dormir la siesta oficial.',                   NOW()),
(19,15 ,15 , 5 , 'Gran anfitrión: solo faltó reggaetón de bienvenida.',                         NOW()),
(20,16 ,16 , 6 , '¡Gracias por hospedarte! Prometo limpiar donde la cabra no llegó.',           NOW())



/* 16. property_reviews (20) */

INSERT INTO property_reviews
(review_id, property_id, guest_id, rating, comment, review_date) VALUES
(1 , 1 , 1 , 5 , 'Five stars! Even the ghosts were polite and wore slippers.'                       , '2025-01-12'),
(2 , 2 , 2 , 5 , 'Great place—only complaint is the shower sings Despacito at 7 a.m.'               , '2025-01-15'),
(3 , 3 , 3 , 4 , 'Good stay. Fridge contained exactly one olive and a mysterious glow.'             , '2025-01-16'),
(4 , 4 , 4 , 5 , 'Loved it. Towels so fluffy I thought they were small clouds.'                     , '2025-01-20'),
(5 , 5 , 5 , 4 , 'Nice pool. Lifeguard is a rubber duck but he takes the job seriously.'            , '2025-01-22'),
(6 , 6 , 6 , 4 , 'Okay, but the sofa tried to eat my phone twice.'                                  , '2025-01-25'),
(7 , 7 , 7 , 5 , 'Fantastic loft—came with free echo to boost my self‑confidence.'                  , '2025-01-28'),
(8 , 8 , 8 , 5 , 'Beach wow. Sand got everywhere, including inside this review.'                    , '2025-02-02'),
(9 , 9 , 9 , 4 , 'Rooms tiny; if you sneeze, you change the channel on the TV.'                     , '2025-02-05'),
(10,10,10, 5 , 'Convenient: elevator music matches the décor—both from the 80s.'                   , '2025-02-07'),
(11,11,11, 5 , 'Super clean. Could perform open‑heart surgery on the kitchen floor.'                , '2025-02-10'),
(12,12,12, 4 , 'Good price; comes with complimentary existential dread at checkout.'                , '2025-02-12'),
(13,13,13, 4 , 'Cozy cabin; fireplace told better stories than my uncle.'                           , '2025-02-15'),
(14,14,14, 5 , 'Perfect stay—wifi fast enough to download my worries.'                              , '2025-02-18'),
(15,15,15, 4 , 'Basic but honest. Bed creaks in Morse code: “send coffee”.'                         , '2025-02-20'),
(16,16,16, 5 , 'Amazing view; I waved at birds and they filed a privacy complaint.'                 , '2025-02-24'),
(17,17,17, 5 , 'Will return. Left my dignity in the hot tub, please keep it warm.'                  , '2025-02-28'),
(18,18,18, 3 , 'Could improve: toaster only browns one side, like my vacation tan.'                 , '2025-03-01'),
(19,19,19, 4 , 'Nice decor—felt like sleeping inside an Instagram filter.'                          , '2025-03-04'),
(20,20,20, 5 , 'Best stay ever! Even the alarm clock had a snooze button for Mondays.'              , '2025-03-06')



/* 17. host_reviews (20) */
INSERT INTO host_reviews
(review_id,host_id,guest_id,rating,comment,review_date) VALUES
(1,1,1,93,'Great host','2025-01-12'),
(2,2,2,90,'Helpful','2025-01-15'),
(3,3,3,78,'Prompt replies','2025-01-16'),
(4,4,4,95,'Friendly','2025-01-20'),
(5,5,5,88,'Good tips','2025-01-22'),
(6,6,6,80,'Nice','2025-01-25'),
(7,7,7,92,'Fantastic','2025-01-28'),
(8,8,8,96,'Superb','2025-02-02'),
(9,9,9,75,'Okay','2025-02-05'),
(10,10,10,89,'Good comms','2025-02-07'),
(11,1,11,94,'Helpful host','2025-02-10'),
(12,2,12,86,'Kind','2025-02-12'),
(13,3,13,88,'Thoughtful','2025-02-15'),
(14,4,14,97,'Awesome','2025-02-18'),
(15,5,15,79,'Average','2025-02-20'),
(16,6,16,92,'Great stay','2025-02-24'),
(17,7,17,98,'Super host','2025-02-28'),
(18,8,18,70,'Slow reply','2025-03-01'),
(19,9,19,87,'Helpful','2025-03-04'),
(20,10,20,99,'Perfect','2025-03-06');

/* 18. support_tickets (20) */
INSERT INTO support_tickets
(ticket_id,user_id,subject,description,status,created_at,resolved_at) VALUES
(1,1,'Login issue','Cannot log in','open',NOW(),NULL),
(2,2,'Payment failed','Card declined','open',NOW(),NULL),
(3,3,'Refund','Need refund','resolved',NOW(),NOW()),
(4,4,'Listing edit','Cannot edit','open',NOW(),NULL),
(5,5,'Calendar bug','Dates wrong','resolved',NOW(),NOW()),
(6,6,'Host verification','Docs stuck','open',NOW(),NULL),
(7,7,'Spam','Got spam msg','resolved',NOW(),NOW()),
(8,8,'Review removal','Unfair review','open',NOW(),NULL),
(9,9,'Discount issue','Code not working','open',NOW(),NULL),
(10,10,'Payout delay','Money late','open',NOW(),NULL),
(11,11,'UX feedback','Suggestion','open',NOW(),NULL),
(12,12,'Bug','Mobile crash','open',NOW(),NULL),
(13,13,'Security','Suspicious login','resolved',NOW(),NOW()),
(14,14,'Policy','Question','open',NOW(),NULL),
(15,15,'Invoice','Need invoice','resolved',NOW(),NOW()),
(16,16,'GDPR','Delete data','open',NOW(),NULL),
(17,17,'Feature','Add filter','open',NOW(),NULL),
(18,18,'Localization','Translation wrong','open',NOW(),NULL),
(19,19,'Image upload','Fails','open',NOW(),NULL),
(20,20,'Host help','New host tips','resolved',NOW(),NOW());

/* 19. user_activity_logs (20) */
INSERT INTO user_activity_logs
(log_id,user_id,activity_type,activity_timestamp,description) VALUES
(1,1,'login',NOW(),'User logged in'),
(2,2,'search',NOW(),'Search Paris'),
(3,3,'booking',NOW(),'Made booking'),
(4,4,'review',NOW(),'Left review'),
(5,5,'logout',NOW(),'Logout'),
(6,6,'update',NOW(),'Updated listing'),
(7,7,'message',NOW(),'Sent message'),
(8,8,'upload',NOW(),'Uploaded image'),
(9,9,'cancel',NOW(),'Cancelled booking'),
(10,10,'login',NOW(),'Login'),
(11,11,'wishlist',NOW(),'Added to wishlist'),
(12,12,'refund',NOW(),'Requested refund'),
(13,13,'login',NOW(),'Login'),
(14,14,'support',NOW(),'Opened ticket'),
(15,15,'review',NOW(),'Left review'),
(16,16,'login',NOW(),'Login'),
(17,17,'booking',NOW(),'Made booking'),
(18,18,'update',NOW(),'Changed photo'),
(19,19,'logout',NOW(),'Logout'),
(20,20,'message',NOW(),'Sent message');

/* 20. referral_programs (20) */
INSERT INTO referral_programs
(referral_id,referrer_user_id,referred_user_id,referral_code,created_at,status) VALUES
(1,1,21,'REF1',NOW(),'pending'),
(2,2,22,'REF2',NOW(),'completed'),
(3,3,23,'REF3',NOW(),'completed'),
(4,4,24,'REF4',NOW(),'rewarded'),
(5,5,25,'REF5',NOW(),'pending'),
(6,6,26,'REF6',NOW(),'completed'),
(7,7,27,'REF7',NOW(),'rewarded'),
(8,8,28,'REF8',NOW(),'completed'),
(9,9,29,'REF9',NOW(),'pending'),
(10,10,30,'REF10',NOW(),'completed'),
(11,11,1,'REF11',NOW(),'pending'),
(12,12,2,'REF12',NOW(),'completed'),
(13,13,3,'REF13',NOW(),'rewarded'),
(14,14,4,'REF14',NOW(),'pending'),
(15,15,5,'REF15',NOW(),'completed'),
(16,16,6,'REF16',NOW(),'rewarded'),
(17,17,7,'REF17',NOW(),'pending'),
(18,18,8,'REF18',NOW(),'rewarded'),
(19,19,9,'REF19',NOW(),'completed'),
(20,20,10,'REF20',NOW(),'pending');

/* 21. dispute_resolution (20) */
INSERT INTO dispute_resolution
(resolution_id,ticket_id,admin_id,reservation_id,resolution_date,resolution_details) VALUES
(1,3,1,1,NOW(),'Refund approved'),
(2,5,2,2,NOW(),'Bug fixed'),
(3,7,3,3,NOW(),'Spam removed'),
(4,10,4,4,NOW(),'Payout expedited'),
(5,13,5,5,NOW(),'Account secured'),
(6,15,6,6,NOW(),'Invoice sent'),
(7,20,7,7,NOW(),'Provided tips'),
(8,2,8,8,NOW(),'Payment re‑tried'),
(9,4,9,9,NOW(),'Listing edited'),
(10,6,10,10,NOW(),'Docs received'),
(11,8,11,11,NOW(),'Review kept'),
(12,9,12,12,NOW(),'Discount code issued'),
(13,11,13,13,NOW(),'Feedback noted'),
(14,12,14,14,NOW(),'Bug logged'),
(15,14,15,15,NOW(),'Answered policy'),
(16,16,16,16,NOW(),'Data deletion in process'),
(17,17,17,17,NOW(),'Feature planned'),
(18,18,18,18,NOW(),'Translation fixed'),
(19,19,19,19,NOW(),'Upload debugged'),
(20,1,20,20,NOW(),'Login reset');

/* 22. referral_rewards (20) */
INSERT INTO referral_rewards
(reward_id,referral_id,transaction_id,admin_id,reward_amount,reward_date) VALUES
(1,2,2,2,25.00,NOW()),
(2,3,3,3,25.00,NOW()),
(3,4,4,4,25.00,NOW()),
(4,6,6,6,25.00,NOW()),
(5,7,7,7,25.00,NOW()),
(6,8,8,8,25.00,NOW()),
(7,10,10,10,25.00,NOW()),
(8,12,12,12,25.00,NOW()),
(9,13,13,13,25.00,NOW()),
(10,15,15,15,25.00,NOW()),
(11,16,16,16,25.00,NOW()),
(12,18,18,18,25.00,NOW()),
(13,19,19,19,25.00,NOW()),
(14,1,1,1,25.00,NOW()),
(15,5,5,5,25.00,NOW()),
(16,9,9,9,25.00,NOW()),
(17,11,11,11,25.00,NOW()),
(18,14,14,14,25.00,NOW()),
(19,17,17,17,25.00,NOW()),
(20,20,20,20,25.00,NOW());

SET FOREIGN_KEY_CHECKS = 1;
