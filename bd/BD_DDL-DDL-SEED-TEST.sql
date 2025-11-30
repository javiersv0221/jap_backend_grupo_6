SET FOREIGN_KEY_CHECKS = 0;

-- 1. LIMPIEZA
TRUNCATE TABLE Products_Relates;
TRUNCATE TABLE Comments;
TRUNCATE TABLE Purchases_Products;
TRUNCATE TABLE Purchases;
TRUNCATE TABLE Carts_Items;
TRUNCATE TABLE Products_Images;
TRUNCATE TABLE Products;
TRUNCATE TABLE Categories;
TRUNCATE TABLE Users;
TRUNCATE TABLE Images;

ALTER TABLE Comments MODIFY score TINYINT NOT NULL CHECK (score BETWEEN 1 AND 10);

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO Images (id_image, url) VALUES
-- --- AVATARES (1-10) ---
(1, 'https://images.unsplash.com/photo-1560250097-0b93528c311a?auto=format&fit=crop&w=300'), -- Admin
(2, 'https://images.unsplash.com/photo-1573496359-7013ac2bebb9?auto=format&fit=crop&w=300'), -- Cliente
(3, 'https://images.unsplash.com/photo-1580489944761-15a19d654956?auto=format&fit=crop&w=300'), -- Tech Woman
(4, 'https://images.unsplash.com/photo-1566492031773-4f4e44671857?auto=format&fit=crop&w=300'), -- Gamer
(5, 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=300'), -- Ana
(6, 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=300'), -- Carlos
(7, 'https://images.unsplash.com/photo-1598550832205-d57f32721352?auto=format&fit=crop&w=300'), -- Sofia
(8, 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=300'), -- Roberto
(9, 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=300'), -- Lucia
(10, 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?auto=format&fit=crop&w=300'), -- Martin

-- --- CATEGORÍAS (11-17) ---
(11, 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=800'), -- Laptops
(12, 'https://images.unsplash.com/photo-1556656793-02715d8dd660?auto=format&fit=crop&w=800'), -- Phones
(13, 'https://images.unsplash.com/photo-1546435770-a3e426bf472b?auto=format&fit=crop&w=800'), -- Audio
(14, 'https://images.unsplash.com/photo-1595225476474-87563907a212?auto=format&fit=crop&w=800'), -- Perifericos
(15, 'https://images.unsplash.com/photo-1547119957-632f856dd459?auto=format&fit=crop&w=800'), -- Monitores
(16, 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&w=800'), -- Vehículos
(17, 'https://images.unsplash.com/photo-1558060370-d644479cb673?auto=format&fit=crop&w=800'), -- Juguetes

-- --- PRODUCTOS ---

-- P1: MacBook Air (Silver/Grey)
(100, 'https://images.unsplash.com/photo-1611186871348-d1fa296fa261?auto=format&fit=crop&w=600'), -- Front
(101, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca4?auto=format&fit=crop&w=600'), -- Desk
(102, 'https://images.unsplash.com/photo-1541807084-5c639225c358?auto=format&fit=crop&w=600'), -- Side
-- P2: Dell XPS (Windows Laptop)
(103, 'https://images.unsplash.com/photo-1593642632823-8f78536788c6?auto=format&fit=crop&w=600'), -- Front
(104, 'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?auto=format&fit=crop&w=600'), -- Keyboard
(105, 'https://images.unsplash.com/photo-1603302576837-37561b2e2302?auto=format&fit=crop&w=600'), -- Screen
-- P3: ThinkPad (Business)
(106, 'https://images.unsplash.com/photo-1585247226801-bc613c441316?auto=format&fit=crop&w=600'), -- Closed/Logo
(107, 'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?auto=format&fit=crop&w=600'), -- Open
(108, 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=600'), -- Context
-- P4: Asus Gamer (RGB)
(109, 'https://images.unsplash.com/photo-1603302576837-37561b2e2302?auto=format&fit=crop&w=600'), -- RGB
(110, 'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?auto=format&fit=crop&w=600'), -- Setup
(111, 'https://images.unsplash.com/photo-1589241062272-c0a000072dfa?auto=format&fit=crop&w=600'), -- Keyboard
-- P5: iPhone 15 Pro
(112, 'https://images.unsplash.com/photo-1696446701796-da61225697cc?auto=format&fit=crop&w=600'), -- Titanium
(113, 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?auto=format&fit=crop&w=600'), -- Hand
(114, 'https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?auto=format&fit=crop&w=600'), -- Table
-- P6: Samsung S24
(115, 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?auto=format&fit=crop&w=600'), -- Back
(116, 'https://images.unsplash.com/photo-1610945265078-3858a0828671?auto=format&fit=crop&w=600'), -- Front
(117, 'https://images.unsplash.com/photo-1583573636246-18cb22418f3e?auto=format&fit=crop&w=600'), -- Pen/Stylus
-- P7: Pixel 8
(118, 'https://images.unsplash.com/photo-1598327105657-60daf4c43c48?auto=format&fit=crop&w=600'), -- Back
(119, 'https://images.unsplash.com/photo-1616348436168-de43ad0db179?auto=format&fit=crop&w=600'), -- Detail
(120, 'https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?auto=format&fit=crop&w=600'), -- Phone
-- P8: Sony Headphones
(121, 'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?auto=format&fit=crop&w=600'), -- Stand
(122, 'https://images.unsplash.com/photo-1546435770-a3e426bf472b?auto=format&fit=crop&w=600'), -- Wearing
(123, 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=600'), -- Product
-- P9: JBL Flip
(124, 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?auto=format&fit=crop&w=600'), -- Speaker
(125, 'https://images.unsplash.com/photo-1589256469067-ea99122bb568?auto=format&fit=crop&w=600'), -- Outdoor
(126, 'https://images.unsplash.com/photo-1543512214-318c77a799bf?auto=format&fit=crop&w=600'), -- Detail
-- P10: AirPods
(127, 'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?auto=format&fit=crop&w=600'), -- Case
(128, 'https://images.unsplash.com/photo-1588423771073-b8903fbb85b5?auto=format&fit=crop&w=600'), -- Earbuds
(129, 'https://images.unsplash.com/photo-1572569028738-411a39a74cc3?auto=format&fit=crop&w=600'), -- Life
-- P11: MX Master Mouse
(130, 'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?auto=format&fit=crop&w=600'), -- Top
(131, 'https://images.unsplash.com/photo-1615663245857-ac93bb7c39e7?auto=format&fit=crop&w=600'), -- Side
(132, 'https://images.unsplash.com/photo-1586348943529-beaae6c28db9?auto=format&fit=crop&w=600'), -- Desk
-- P12: Keychron
(133, 'https://images.unsplash.com/photo-1587829741301-dc798b91a603?auto=format&fit=crop&w=600'), -- Keyboard
(134, 'https://images.unsplash.com/photo-1595225476474-87563907a212?auto=format&fit=crop&w=600'), -- RGB
(135, 'https://images.unsplash.com/photo-1563191911-e65f8655ebf9?auto=format&fit=crop&w=600'), -- Keycaps
-- P13: Razer Mouse
(136, 'https://images.unsplash.com/photo-1615663245857-ac93bb7c39e7?auto=format&fit=crop&w=600'), -- Mouse
(137, 'https://images.unsplash.com/photo-1629429408209-1f912961dbd8?auto=format&fit=crop&w=600'), -- Gaming
(138, 'https://images.unsplash.com/photo-1527814050087-3793815479db?auto=format&fit=crop&w=600'), -- Pad
-- P14: LG Monitor
(139, 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&w=600'), -- Monitor
(140, 'https://images.unsplash.com/photo-1547119957-632f856dd459?auto=format&fit=crop&w=600'), -- Screen
(141, 'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?auto=format&fit=crop&w=600'), -- Setup
-- P15: Odyssey G9
(142, 'https://images.unsplash.com/photo-1574315042633-899eb7d9f783?auto=format&fit=crop&w=600'), -- Ultrawide
(143, 'https://images.unsplash.com/photo-1551650975-87deedd944c3?auto=format&fit=crop&w=600'), -- Desk
(144, 'https://images.unsplash.com/photo-1616763355614-4c6192937811?auto=format&fit=crop&w=600'), -- Code
-- P16: Dell Monitor
(145, 'https://images.unsplash.com/photo-1585792180666-f7347f490ee2?auto=format&fit=crop&w=600'), -- Monitor
(146, 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=600'), -- Office
(147, 'https://images.unsplash.com/photo-1593642532744-d377ab507dc8?auto=format&fit=crop&w=600'), -- Work
-- P17: iPad
(148, 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?auto=format&fit=crop&w=600'), -- iPad
(149, 'https://images.unsplash.com/photo-1561154464-82e9adf32764?auto=format&fit=crop&w=600'), -- Pencil
(150, 'https://images.unsplash.com/photo-1555421689-491a97ff2040?auto=format&fit=crop&w=600'), -- Hand
-- P18: Kindle
(151, 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&w=600'), -- Book
(152, 'https://images.unsplash.com/photo-1594980596870-8aa52a78d8cd?auto=format&fit=crop&w=600'), -- Reader
(153, 'https://images.unsplash.com/photo-1541963463532-d68292c34b19?auto=format&fit=crop&w=600'), -- Library
-- P19: Webcam
(154, 'https://images.unsplash.com/photo-1626218174397-31969732f317?auto=format&fit=crop&w=600'), -- Webcam
(155, 'https://images.unsplash.com/photo-1605647540924-852290f6b0d5?auto=format&fit=crop&w=600'), -- Setup
(156, 'https://images.unsplash.com/photo-1516387938699-a93567ec168e?auto=format&fit=crop&w=600'), -- Laptop
-- P20: Blue Yeti
(157, 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?auto=format&fit=crop&w=600'), -- Mic
(158, 'https://images.unsplash.com/photo-1588693951525-6379cb39d338?auto=format&fit=crop&w=600'), -- Studio
(159, 'https://images.unsplash.com/photo-1557318041-1ce374d55ebf?auto=format&fit=crop&w=600'), -- Recording

-- VEHICULOS
-- P21: Toyota Corolla
(160, 'https://images.unsplash.com/photo-1590362835106-13cea9908da0?auto=format&fit=crop&w=600'), -- White Car
(161, 'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?auto=format&fit=crop&w=600'), -- Front
(162, 'https://images.unsplash.com/photo-1560958089-b8a1929cea89?auto=format&fit=crop&w=600'), -- Interior
-- P22: Tesla Model 3
(163, 'https://images.unsplash.com/photo-1536700503339-1e4b06520771?auto=format&fit=crop&w=600'), -- Red Tesla
(164, 'https://images.unsplash.com/photo-1560958089-b8a1929cea89?auto=format&fit=crop&w=600'), -- Charging
(165, 'https://images.unsplash.com/photo-1592198084033-aade902d1aae?auto=format&fit=crop&w=600'), -- Wheel
-- P23: BMW
(166, 'https://images.unsplash.com/photo-1555215695-3004980adade?auto=format&fit=crop&w=600'), -- BMW
(167, 'https://images.unsplash.com/photo-1617788138017-80ad40651399?auto=format&fit=crop&w=600'), -- Front
(168, 'https://images.unsplash.com/photo-1549399542-7e3f8b79c341?auto=format&fit=crop&w=600'), -- Road
-- P24: Ford Truck
(169, 'https://images.unsplash.com/photo-1558981806-ec527fa84c39?auto=format&fit=crop&w=600'), -- Truck
(170, 'https://images.unsplash.com/photo-1605893478810-0863c3d92188?auto=format&fit=crop&w=600'), -- Mud
(171, 'https://images.unsplash.com/photo-1609521263047-28b99900e136?auto=format&fit=crop&w=600'), -- Side
-- P25: Nissan
(172, 'https://images.unsplash.com/photo-1617788138017-80ad40651399?auto=format&fit=crop&w=600'), -- Sedan
(173, 'https://images.unsplash.com/photo-1542282088-fe8426682b8f?auto=format&fit=crop&w=600'), -- Silver
(174, 'https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?auto=format&fit=crop&w=600'), -- Drive
-- P26: Tucson (SUV)
(175, 'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?auto=format&fit=crop&w=600'), -- SUV
(176, 'https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?auto=format&fit=crop&w=600'), -- Family
(177, 'https://images.unsplash.com/photo-1502877338535-766e1452684a?auto=format&fit=crop&w=600'), -- Trip
-- P27: Yamaha (Moto)
(178, 'https://images.unsplash.com/photo-1558981403-c5f9899a28bc?auto=format&fit=crop&w=600'), -- Moto
(179, 'https://images.unsplash.com/photo-1571127236794-81c0bbfe1ce3?auto=format&fit=crop&w=600'), -- Sport
(180, 'https://images.unsplash.com/photo-1568772585407-9361f9bf3a87?auto=format&fit=crop&w=600'), -- Rider
-- P28: Scooter
(181, 'https://images.unsplash.com/photo-1596727147705-54a9d0cb7d17?auto=format&fit=crop&w=600'), -- Scooter
(182, 'https://images.unsplash.com/photo-1621972660772-4a064126c94f?auto=format&fit=crop&w=600'), -- Electric
(183, 'https://images.unsplash.com/photo-1591635566278-10dca0ca76ee?auto=format&fit=crop&w=600'), -- Street
-- P29: Casco
(184, 'https://images.unsplash.com/photo-1583267746897-2a4540e12c64?auto=format&fit=crop&w=600'), -- Helmet
(185, 'https://images.unsplash.com/photo-1558980395-be1a578c75dd?auto=format&fit=crop&w=600'), -- Visor
(186, 'https://images.unsplash.com/photo-1521405230973-1f2c27b0c74f?auto=format&fit=crop&w=600'), -- Safety
-- P30: Dashcam
(187, 'https://images.unsplash.com/photo-1611365892117-03290e9f2f8f?auto=format&fit=crop&w=600'), -- Dashcam
(188, 'https://images.unsplash.com/photo-1618483569427-4c07d3b07049?auto=format&fit=crop&w=600'), -- Road
(189, 'https://images.unsplash.com/photo-1485291571150-772bcfc10da5?auto=format&fit=crop&w=600'), -- View

-- JUGUETES
-- P31: Lego
(190, 'https://images.unsplash.com/photo-1585366119957-e9730b6d0f60?auto=format&fit=crop&w=600'), -- Star Wars
(191, 'https://images.unsplash.com/photo-1560961911-293685e19746?auto=format&fit=crop&w=600'), -- Pieces
(192, 'https://images.unsplash.com/photo-1589254065878-42c9da997008?auto=format&fit=crop&w=600'), -- Robot
-- P32: Barbie (Doll)
(193, 'https://images.unsplash.com/photo-1596461404969-9ae70f2830c1?auto=format&fit=crop&w=600'), -- Doll
(194, 'https://images.unsplash.com/photo-1534330207526-9e81f5245811?auto=format&fit=crop&w=600'), -- Girl
(195, 'https://images.unsplash.com/photo-1549880181-56a44cf4a9a1?auto=format&fit=crop&w=600'), -- Toys
-- P33: Funko
(196, 'https://images.unsplash.com/photo-1607853202273-797f1c22a38e?auto=format&fit=crop&w=600'), -- Marvel
(197, 'https://images.unsplash.com/photo-1615828470438-2321855c589e?auto=format&fit=crop&w=600'), -- Box
(198, 'https://images.unsplash.com/photo-1581833971358-2c8b550f87b3?auto=format&fit=crop&w=600'), -- Shelf
-- P34: Catan
(199, 'https://images.unsplash.com/photo-1613771404721-1f92d799e49f?auto=format&fit=crop&w=600'), -- Board
(200, 'https://images.unsplash.com/photo-1632527393278-8316dfc643b1?auto=format&fit=crop&w=600'), -- Dice
(201, 'https://images.unsplash.com/photo-1610890716171-6b1c9f20ad82?auto=format&fit=crop&w=600'), -- Game
-- P35: Hot Wheels
(202, 'https://images.unsplash.com/photo-1566576912321-d58ddd7a6088?auto=format&fit=crop&w=600'), -- Car
(203, 'https://images.unsplash.com/photo-1596568359553-a56de6970068?auto=format&fit=crop&w=600'), -- Track
(204, 'https://images.unsplash.com/photo-1555661623-e18987b1c318?auto=format&fit=crop&w=600'), -- Race
-- P36: Nerf
(205, 'https://images.unsplash.com/photo-1558060370-d644479cb673?auto=format&fit=crop&w=600'), -- Gun
(206, 'https://images.unsplash.com/photo-1596727147705-54a9d0cb7d17?auto=format&fit=crop&w=600'), -- Play
(207, 'https://images.unsplash.com/photo-1599580434757-3f8c85856417?auto=format&fit=crop&w=600'), -- Plastic
-- P37: Oso
(208, 'https://images.unsplash.com/photo-1500995617113-cf789362a3e1?auto=format&fit=crop&w=600'), -- Bear
(209, 'https://images.unsplash.com/photo-1559454403-b8fb87521bc7?auto=format&fit=crop&w=600'), -- Cute
(210, 'https://images.unsplash.com/photo-1582236355887-8dfc0a22c608?auto=format&fit=crop&w=600'), -- Soft
-- P38: Pelota
(211, 'https://images.unsplash.com/photo-1515488042361-ee00e0ddd4e4?auto=format&fit=crop&w=600'), -- Ball
(212, 'https://images.unsplash.com/photo-1614632537190-23e4146777db?auto=format&fit=crop&w=600'), -- Adidas
(213, 'https://images.unsplash.com/photo-1575361204480-aadea25e6e68?auto=format&fit=crop&w=600'), -- Field
-- P39: Dron
(214, 'https://images.unsplash.com/photo-1536532184021-da4210054a22?auto=format&fit=crop&w=600'), -- Drone
(215, 'https://images.unsplash.com/photo-1506947411487-a56738267384?auto=format&fit=crop&w=600'), -- Flying
(216, 'https://images.unsplash.com/photo-1579829366248-204fe8413f39?auto=format&fit=crop&w=600'), -- Camera
-- P40: Play-Doh
(217, 'https://images.unsplash.com/photo-1631106246840-b5f14627723e?auto=format&fit=crop&w=600'), -- Cans
(218, 'https://images.unsplash.com/photo-1631106256557-0136657053e1?auto=format&fit=crop&w=600'), -- Play
(219, 'https://images.unsplash.com/photo-1631106248161-0819777174db?auto=format&fit=crop&w=600'), -- Colors
-- P41: Puzzle
(220, 'https://images.unsplash.com/photo-1599623560574-39d485900c95?auto=format&fit=crop&w=600'), -- Puzzle
(221, 'https://images.unsplash.com/photo-1587652990173-fed15e5c8088?auto=format&fit=crop&w=600'), -- Pieces
(222, 'https://images.unsplash.com/photo-1610444569762-b4c6e11894a4?auto=format&fit=crop&w=600'), -- Game
-- P42: Goku
(223, 'https://images.unsplash.com/photo-1533234427049-9e9bb09e5df2?auto=format&fit=crop&w=600'), -- Figure
(224, 'https://images.unsplash.com/photo-1608889175123-8ee362201f81?auto=format&fit=crop&w=600'), -- Anime
(225, 'https://images.unsplash.com/photo-1593085512500-bfd11932f812?auto=format&fit=crop&w=600'), -- Toy
-- P43: RC Car
(226, 'https://images.unsplash.com/photo-1575364289437-fb1479d52732?auto=format&fit=crop&w=600'), -- Car
(227, 'https://images.unsplash.com/photo-1594787318286-3d835c1d207f?auto=format&fit=crop&w=600'), -- Remote
(228, 'https://images.unsplash.com/photo-1614856053757-5e60824901f6?auto=format&fit=crop&w=600'), -- Offroad
-- P44: Magia
(229, 'https://images.unsplash.com/photo-1530325553241-4afda8736137?auto=format&fit=crop&w=600'), -- Cards
(230, 'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?auto=format&fit=crop&w=600'), -- Hat
(231, 'https://images.unsplash.com/photo-1551551351-8f55760822b3?auto=format&fit=crop&w=600'), -- Trick
-- P45: Playa
(232, 'https://images.unsplash.com/photo-1532330384845-262571982795?auto=format&fit=crop&w=600'), -- Bucket
(233, 'https://images.unsplash.com/photo-1506953823976-52e1fdc0149a?auto=format&fit=crop&w=600'), -- Sand
(234, 'https://images.unsplash.com/photo-1596711910793-78d145f4d115?auto=format&fit=crop&w=600'), -- Castle
-- P46: Pokemon
(235, 'https://images.unsplash.com/photo-1606002830606-2e8160225093?auto=format&fit=crop&w=600'), -- Card
(236, 'https://images.unsplash.com/photo-1613771404784-3a5686aa2be3?auto=format&fit=crop&w=600'), -- Collection
(237, 'https://images.unsplash.com/photo-1620251860082-9ae8a4db77c6?auto=format&fit=crop&w=600'), -- Game
-- P47: Cocina
(238, 'https://images.unsplash.com/photo-1581557991964-125469da3b8a?auto=format&fit=crop&w=600'), -- Kitchen
(239, 'https://images.unsplash.com/photo-1596464716127-f9a8759d2dc3?auto=format&fit=crop&w=600'), -- Food
(240, 'https://images.unsplash.com/photo-1556912172-45b7abe8d7e1?auto=format&fit=crop&w=600'), -- Wooden
-- P48: Triciclo
(241, 'https://images.unsplash.com/photo-1518826778770-a729fb53327c?auto=format&fit=crop&w=600'), -- Bike
(242, 'https://images.unsplash.com/photo-1595183422615-5668e07977a4?auto=format&fit=crop&w=600'), -- Ride
(243, 'https://images.unsplash.com/photo-1623942001159-d698188179b9?auto=format&fit=crop&w=600'); -- Wheel

INSERT INTO Users (id_user, username, name, last_name, email, password, id_image) VALUES
(1, 'admin_javier', 'Javier', 'Salvatierra', 'javier@admin.com', 'pass123', 1),
(2, 'cliente_juan', 'Juan', 'Perez', 'juan.perez@email.com', 'secret1', 2),
(3, 'tech_maria', 'Maria', 'Gomez', 'maria.g@email.com', 'securePass', 3),
(4, 'gamer_luis', 'Luis', 'Rodriguez', 'luis.rod@email.com', 'luis1234', 6),
(5, 'ana_compras', 'Ana', 'Martinez', 'ana.m@email.com', 'ana2024', 4),
(6, 'carlos_dev', 'Carlos', 'Lopez', 'carlos.dev@email.com', 'devpass', 7),
(7, 'sofia_ux', 'Sofia', 'Hernandez', 'sofia.ux@email.com', 'design1', 5),
(8, 'roberto_qa', 'Roberto', 'Diaz', 'roberto.qa@email.com', 'bughunter', 8),
(9, 'lucia_pm', 'Lucia', 'Silva', 'lucia.silva@email.com', 'pmpass', 9),
(10, 'martin_ops', 'Martin', 'Torres', 'martin.ops@email.com', 'devops1', 10),
(11, 'laura_teacher', 'Laura', 'Borges', 'laura.b@email.com', 'teach456', 2),
(12, 'pedro_mec', 'Pedro', 'Mendez', 'pedro.m@email.com', 'carlover', 6),
(13, 'carla_mom', 'Carla', 'Viera', 'carla.v@email.com', 'momlife', 3),
(14, 'diego_student', 'Diego', 'Ferreira', 'diego.f@email.com', 'studyhard', 7),
(15, 'valentina_art', 'Valentina', 'Sosa', 'vale.art@email.com', 'paint99', 5),
(16, 'andres_runner', 'Andres', 'Rios', 'andres.r@email.com', 'runrun', 8),
(17, 'gabriela_doc', 'Gabriela', 'Castro', 'gaby.c@email.com', 'docpass', 4),
(18, 'fernando_chef', 'Fernando', 'Iglesias', 'fer.chef@email.com', 'cook123', 1),
(19, 'patricia_law', 'Patricia', 'Nuñez', 'patry.n@email.com', 'lawyer55', 9),
(20, 'bruno_musician', 'Bruno', 'Acosta', 'bruno.a@email.com', 'guitarhero', 10);

INSERT INTO Categories (id_category, name, description, id_image) VALUES
(1, 'Laptops', 'Portátiles de alto rendimiento y oficina', 11),
(2, 'Smartphones', 'Teléfonos móviles Android y iOS', 12),
(3, 'Audio', 'Auriculares, parlantes y micrófonos', 13),
(4, 'Periféricos', 'Teclados, ratones y accesorios', 14),
(5, 'Monitores', 'Pantallas Full HD, 4K y Ultrawide', 15),
(6, 'Vehículos', 'Autos, camionetas, motos y accesorios', 16),
(7, 'Juguetes y Hobby', 'Juegos de mesa, figuras, aire libre y coleccionables', 17);

INSERT INTO Products (id_product, name, description, cost, currency, sold_count, id_category) VALUES
-- TECNOLOGÍA (USD)
(1, 'MacBook Air M2', 'Laptop ligera con chip M2, pantalla Liquid Retina', 1200.00, 'USD', 15, 1),
(2, 'Dell XPS 13', 'Ultrabook premium con pantalla InfinityEdge', 1100.00, 'USD', 10, 1),
(3, 'Lenovo ThinkPad X1', 'La laptop empresarial por excelencia, fibra de carbono', 1500.00, 'USD', 5, 1),
(4, 'Asus ROG Strix', 'Laptop gamer con RTX 4060 y RGB', 1800.00, 'USD', 8, 1),
(5, 'iPhone 15 Pro', 'Titanio, chip A17 Pro, cámara 48MP', 1300.00, 'USD', 50, 2),
(6, 'Samsung S24 Ultra', 'AI Phone con S-Pen y Zoom Espacial', 1250.00, 'USD', 45, 2),
(7, 'Google Pixel 8', 'La mejor cámara con Android puro y Magic Editor', 800.00, 'USD', 20, 2),
(8, 'Sony WH-1000XM5', 'Los mejores auriculares con cancelación de ruido', 350.00, 'USD', 30, 3),
(9, 'JBL Flip 6', 'Parlante bluetooth resistente al agua IP67', 120.00, 'USD', 60, 3),
(10, 'AirPods Pro 2', 'Auriculares in-ear de Apple con MagSafe', 250.00, 'USD', 100, 3),
(11, 'Logitech MX Master 3S', 'El mejor mouse para productividad, silencioso', 100.00, 'USD', 80, 4),
(12, 'Keychron K2', 'Teclado mecánico inalámbrico 75% switch Brown', 90.00, 'USD', 25, 4),
(13, 'Razer DeathAdder', 'Mouse gamer ergonómico con sensor óptico', 60.00, 'USD', 40, 4),
(14, 'LG UltraGear 27"', 'Monitor 144Hz IPS 1ms compatible G-Sync', 300.00, 'USD', 15, 5),
(15, 'Samsung Odyssey G9', 'Monitor curvo super ultrawide 49 pulgadas', 1200.00, 'USD', 3, 5),
(16, 'Dell Ultrasharp', 'Monitor profesional 4K con colores precisos', 600.00, 'USD', 10, 5),
(17, 'iPad Air', 'Tablet potente y ligera con chip M1', 600.00, 'USD', 20, 2),
(18, 'Kindle Paperwhite', 'Lector de libros electrónicos resistente al agua', 150.00, 'USD', 35, 2),
(19, 'Webcam Logitech C920', 'Cámara HD para streaming y videollamadas', 70.00, 'USD', 50, 4),
(20, 'Blue Yeti', 'Micrófono USB profesional para podcasting', 130.00, 'USD', 12, 3),

-- VEHÍCULOS (USD)
(21, 'Toyota Corolla Hybrid', 'Sedán híbrido automático, modelo 2024, 0km', 28500.00, 'USD', 5, 6),
(22, 'Tesla Model 3 RWD', 'Auto eléctrico autonomía estándar, piloto automático', 42000.00, 'USD', 8, 6),
(23, 'BMW Serie 3 330i', 'Sedán deportivo de lujo, motor turbo', 55000.00, 'USD', 2, 6),
(24, 'Ford F-150 Lariat', 'Camioneta pickup 4x4 doble cabina V8', 62000.00, 'USD', 3, 6),
(25, 'Nissan Sentra Advance', 'Sedán compacto eficiente y seguro', 22000.00, 'USD', 12, 6),
(26, 'Hyundai Tucson GLS', 'SUV familiar espaciosa con tecnología avanzada', 35000.00, 'USD', 7, 6),
(27, 'Yamaha YZF-R3', 'Moto deportiva bicilíndrica 321cc, ideal A2', 7500.00, 'USD', 15, 6),
(28, 'Xiaomi Electric Scooter 4', 'Monopatín eléctrico plegable, 35km autonomía', 650.00, 'USD', 40, 6),
(29, 'Casco Integral LS2', 'Casco de seguridad certificado ECE, visor solar', 120.00, 'USD', 25, 6),
(30, 'Dashcam 4K GPS', 'Cámara para auto con grabación en bucle y sensor G', 150.00, 'USD', 30, 6),

-- JUGUETES (UYU)
(31, 'LEGO Star Wars X-Wing', 'Set de construcción nave de Luke Skywalker, 474 piezas', 4500.00, 'UYU', 50, 7),
(32, 'Barbie Casa de los Sueños', 'Casa de muñecas con luces, sonidos y ascensor', 8900.00, 'UYU', 20, 7),
(33, 'Funko Pop Spider-Man', 'Figura coleccionable de vinilo No Way Home', 1200.00, 'UYU', 100, 7),
(34, 'Juego de Mesa Catan', 'Juego de estrategia y gestión de recursos premiado', 3200.00, 'UYU', 35, 7),
(35, 'Hot Wheels Pista Tiburón', 'Pista de autos con lanzador y obstáculo de tiburón', 2800.00, 'UYU', 40, 7),
(36, 'Nerf Elite 2.0 Commander', 'Lanzador de dardos con tambor giratorio de 6 dardos', 1500.00, 'UYU', 60, 7),
(37, 'Oso de Peluche Gigante', 'Peluche suave de 1 metro de altura color marrón', 2200.00, 'UYU', 15, 7),
(38, 'Pelota Fútbol Adidas Al Rihla', 'Pelota oficial réplica Copa del Mundo Qatar', 1800.00, 'UYU', 80, 7),
(39, 'Dron con Cámara HD Juguete', 'Cuadricóptero para principiantes con control remoto', 3500.00, 'UYU', 25, 7),
(40, 'Play-Doh Set Cocina', 'Kit de masas y moldes para crear comida de juguete', 1100.00, 'UYU', 55, 7),
(41, 'Puzzle 1000 Piezas Paisaje', 'Rompecabezas desafiante de alta calidad', 900.00, 'UYU', 30, 7),
(42, 'Figura Acción Goku SSJ', 'Muñeco articulado de Dragon Ball Z 17cm', 1600.00, 'UYU', 45, 7),
(43, 'Auto a Control Remoto 4x4', 'Vehículo todoterreno rápido con batería recargable', 2500.00, 'UYU', 35, 7),
(44, 'Kit de Magia para Niños', 'Set con 50 trucos fáciles de aprender', 1300.00, 'UYU', 20, 7),
(45, 'Set Juguetes de Playa', 'Balde, pala, rastrillo y moldes de arena', 500.00, 'UYU', 90, 7),
(46, 'Carta Pokémon Charizard VMAX', 'Carta coleccionable rara brillante TCG', 5000.00, 'UYU', 5, 7),
(47, 'Cocinita de Juguete Madera', 'Cocina infantil grande con accesorios', 7500.00, 'UYU', 10, 7),
(48, 'Triciclo Infantil con Guía', 'Triciclo para niños pequeños con barra de empuje', 3200.00, 'UYU', 25, 7);


INSERT INTO Products_Images (id_product, id_image) VALUES
-- P1 a P20 (Tecnología)
(1, 100), (1, 101), (1, 102),
(2, 103), (2, 104), (2, 105),
(3, 106), (3, 107), (3, 108),
(4, 109), (4, 110), (4, 111),
(5, 112), (5, 113), (5, 114),
(6, 115), (6, 116), (6, 117),
(7, 118), (7, 119), (7, 120),
(8, 121), (8, 122), (8, 123),
(9, 124), (9, 125), (9, 126),
(10, 127), (10, 128), (10, 129),
(11, 130), (11, 131), (11, 132),
(12, 133), (12, 134), (12, 135),
(13, 136), (13, 137), (13, 138),
(14, 139), (14, 140), (14, 141),
(15, 142), (15, 143), (15, 144),
(16, 145), (16, 146), (16, 147),
(17, 148), (17, 149), (17, 150),
(18, 151), (18, 152), (18, 153),
(19, 154), (19, 155), (19, 156),
(20, 157), (20, 158), (20, 159),
-- P21 a P30 (Vehículos)
(21, 160), (21, 161), (21, 162),
(22, 163), (22, 164), (22, 165),
(23, 166), (23, 167), (23, 168),
(24, 169), (24, 170), (24, 171),
(25, 172), (25, 173), (25, 174),
(26, 175), (26, 176), (26, 177),
(27, 178), (27, 179), (27, 180),
(28, 181), (28, 182), (28, 183),
(29, 184), (29, 185), (29, 186),
(30, 187), (30, 188), (30, 189),
-- P31 a P48 (Juguetes)
(31, 190), (31, 191), (31, 192),
(32, 193), (32, 194), (32, 195),
(33, 196), (33, 197), (33, 198),
(34, 199), (34, 200), (34, 201),
(35, 202), (35, 203), (35, 204),
(36, 205), (36, 206), (36, 207),
(37, 208), (37, 209), (37, 210),
(38, 211), (38, 212), (38, 213),
(39, 214), (39, 215), (39, 216),
(40, 217), (40, 218), (40, 219),
(41, 220), (41, 221), (41, 222),
(42, 223), (42, 224), (42, 225),
(43, 226), (43, 227), (43, 228),
(44, 229), (44, 230), (44, 231),
(45, 232), (45, 233), (45, 234),
(46, 235), (46, 236), (46, 237),
(47, 238), (47, 239), (47, 240),
(48, 241), (48, 242), (48, 243);

INSERT INTO Carts_Items (id_user, id_product, amount) VALUES
(2, 1, 1), (2, 11, 1),
(3, 5, 1), (3, 33, 2),
(4, 13, 1), (4, 12, 1), (4, 14, 1),
(12, 28, 1), (12, 29, 1),
(13, 32, 1), (13, 40, 1),
(15, 30, 1),
(18, 34, 1), (18, 41, 1);

INSERT INTO Purchases (id_purchase, id_user, address, department, city, postal_code, type_shipment) VALUES
(1, 2, 'Av. 18 de Julio 1234', 'MONTEVIDEO', 'Montevideo', '11100', 'EXPRESS'),
(2, 2, 'Rambla Gandhi 555', 'MONTEVIDEO', 'Montevideo', '11300', 'STANDARD'),
(3, 3, 'Calle Brasil 432', 'RIO_NEGRO', 'Fray Bentos', '65000', 'PREMIUM'),
(4, 4, 'Artigas 888', 'SALTO', 'Salto', '50000', 'STANDARD'),
(5, 5, 'Gorlero 900', 'MALDONADO', 'Punta del Este', '20100', 'EXPRESS'),
(6, 6, 'Rivera 333', 'PAYSANDU', 'Paysandú', '60000', 'STANDARD'),
(7, 7, 'Sarandí 100', 'COLONIA', 'Colonia del Sacramento', '70000', 'STANDARD'),
(8, 8, 'Batlle y Ordóñez 50', 'TACUAREMBO', 'Tacuarembó', '45000', 'PREMIUM'),
(9, 9, 'Leandro Gomez 12', 'MONTEVIDEO', 'Montevideo', '11200', 'EXPRESS'),
(10, 10, 'Bulevar Artigas 2020', 'MONTEVIDEO', 'Montevideo', '11800', 'STANDARD'),
(11, 12, 'Ruta 1 Km 45', 'SAN_JOSE', 'Libertad', '80000', 'PREMIUM'),
(12, 13, 'Calle 60 Nro 5', 'CANELONES', 'Ciudad de la Costa', '15000', 'STANDARD'),
(13, 12, 'Av. Italia 4500', 'MONTEVIDEO', 'Montevideo', '11400', 'EXPRESS'),
(14, 14, 'Oribe 678', 'RIVERA', 'Rivera', '40000', 'STANDARD'),
(15, 15, '18 de Julio 567', 'ARTIGAS', 'Artigas', '55000', 'STANDARD'),
(16, 16, 'Lavalleja 999', 'TREINTA_Y_TRES', 'Treinta y Tres', '33000', 'STANDARD'),
(17, 17, 'Ruta 8 Km 300', 'CERRO_LARGO', 'Melo', '37000', 'PREMIUM'),
(18, 18, 'Calle Principal 1', 'FLORES', 'Trinidad', '85000', 'STANDARD'),
(19, 19, 'Av. del Navío', 'ROCHA', 'La Paloma', '27001', 'EXPRESS'),
(20, 20, 'Zorrilla 123', 'DURAZNO', 'Durazno', '97000', 'STANDARD');

INSERT INTO Purchases_Products (id_purchase, id_product, amount) VALUES
(1, 1, 1), (1, 11, 1),
(2, 8, 1),
(3, 5, 1), (3, 10, 1),
(4, 4, 1), (4, 13, 1), (4, 12, 1),
(5, 17, 2),
(9, 6, 1),
(10, 19, 1),
(11, 24, 1),
(13, 27, 1), (13, 29, 2),
(17, 30, 1), (17, 20, 1),
(6, 31, 1), (6, 33, 3),
(7, 32, 1),
(8, 34, 1), (8, 41, 1),
(12, 45, 2), (12, 38, 1),
(14, 36, 2),
(15, 40, 1), (15, 47, 1),
(16, 43, 1),
(18, 35, 1), (18, 33, 1),
(19, 42, 1),
(20, 37, 1), (20, 44, 1);

INSERT INTO Comments (id_product, id_user, description, score) VALUES
(1, 2, 'Excelente máquina, vuela con el M2. La batería es eterna.', 10),
(1, 6, 'El desempeño es brutal para compilar código.', 9),
(5, 4, 'La cámara es brutal, saca fotos increíbles de noche.', 10),
(5, 3, 'Muy caro para ser un teléfono, pero funciona bien.', 7),
(11, 6, 'El mejor mouse que he probado para trabajar, descanso la mano.', 10),
(13, 4, 'Buen sensor, preciso para shooters, pero el cable molesta.', 8),
(14, 7, 'Colores increíbles, ideal para diseño gráfico y edición.', 9),
(22, 12, 'El piloto automático es de otro planeta. Aceleración increíble.', 10),
(22, 2, 'El interior es muy minimalista, me costó acostumbrarme.', 8),
(24, 17, 'Una bestia la F-150. Potencia de sobra para el campo.', 10),
(28, 16, 'Ideal para ir al trabajo sin transpirar. La batería cumple.', 9),
(29, 12, 'Buen casco, cómodo y buena visibilidad, pero un poco ruidoso a alta velocidad.', 7),
(31, 14, 'A mi hijo le encantó armarlo, las instrucciones son claras. LEGO nunca falla.', 10),
(34, 18, 'Juegazo de estrategia, las partidas siempre son diferentes. Muy recomendado.', 10),
(34, 11, 'Un poco complicado de entender al principio, pero después es adictivo.', 8),
(32, 13, 'Es enorme y tiene muchos detalles, mi hija pasa horas jugando.', 9),
(36, 19, 'Dispara lejos y es fácil de recargar. Diversión garantizada.', 9),
(45, 15, 'Plástico un poco fino, se rompió la pala el primer día de playa.', 4),
(33, 11, 'Buena figura para la colección, llegó en perfecto estado.', 10),
(40, 13, 'Las masitas se secaron un poco rápido, hay que guardarlas bien.', 6);

INSERT INTO Products_Relates (id_product, id_product_related) VALUES
(1, 11), (11, 1),
(5, 10), (10, 5),
(4, 13), (13, 4),
(14, 16), (16, 14),
(27, 29), (29, 27),
(22, 30), (24, 30),
(31, 33),
(34, 41), (41, 34),
(32, 40);

SET FOREIGN_KEY_CHECKS = 1;