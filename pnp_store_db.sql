-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2018 at 09:07 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pnp_store_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_price` double NOT NULL,
  `cart_quantity` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_img` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category`) VALUES
(1, 'fresh'),
(2, 'cupboard'),
(3, 'frozen'),
(4, 'meals'),
(5, 'beverages'),
(6, 'baby'),
(7, 'health'),
(8, 'office'),
(9, 'outdoor'),
(10, 'household');

-- --------------------------------------------------------

--
-- Table structure for table `checked_orders`
--

CREATE TABLE `checked_orders` (
  `checked_id` int(11) NOT NULL,
  `cart_price` double NOT NULL,
  `cart_quantity` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_img` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `location_address` varchar(255) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `user_location` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `contact_no`, `location_address`, `order_id`, `user_location`, `user_name`) VALUES
(5, '0826541236', '45 Kerk street', 7, 'JHB', 'qwerty'),
(6, '0768974562', '22 Elloff street', 8, 'JHB', 'qwerty'),
(7, '0874567345', '106 west street', 9, 'Santon', 'qwerty');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `payment_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `bank_type` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `cvc_number` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `bank_type`, `card_number`, `card_type`, `cvc_number`, `first_name`, `last_name`, `total`, `user_name`) VALUES
(7, 'Capitec', '2568584142063582', 'Debit', '524', 'qwerty', 'qwerty', '1930.92', 'qwerty'),
(8, 'Capitec', '9876454343245667', 'Debit', '543', 'qwerty', 'qwerty', '48', 'qwerty'),
(9, 'Nedbank', '3245676786585656', 'Maestro', '232', 'qwerty', 'qwerty', '258.97', 'qwerty');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_img` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `product_img`, `product_name`, `product_price`) VALUES
(1, 5, 'assets/products/blacklabel.jpg', 'Carling Black Label 750ml', 16),
(2, 5, 'assets/products/castlelite.jpg', 'Castle Lite 750ml', 17),
(3, 5, 'assets/products/johnniewalkerbluelabel.jpg', 'Johnnie Walker Blue label 750ml', 1199.99),
(4, 5, 'assets/products/castlelager.jpg', 'Castle Lager 750ml', 15),
(5, 1, 'assets/products/pineaples.jpg', 'Pineapple singles', 19.99),
(6, 1, 'assets/products/mushrooms.jpg', 'Mushrooms 500g', 25),
(7, 1, 'assets/products/grapes.jpg', 'Grapes 500g', 20),
(8, 10, 'assets/products/mrmuscle.jpg', 'Mr Muscle cleaner', 14.99),
(9, 10, 'assets/products/omowashingpowder.jpg', 'Omo washing powder', 52.99),
(10, 10, 'assets/products/pledgelemonpolish.jpg', 'Pledge Lemon polish', 18.99),
(11, 10, 'assets/products/toiletduckfreshdisc.jpg', 'Toilet duck fresh disc 12s', 26.99),
(12, 9, 'assets/products/2inchforkSpade.jpg', '2inch Fork spade', 89.99),
(13, 7, 'assets/products/Alpha.jpg', 'Alpha Health Suppliments', 129.99),
(14, 6, 'assets/products/babycarecologne.jpg', 'Baby Care cologne 500ml', 89.99),
(15, 4, 'assets/products/beefmeal.jpg', 'Beef Meal for one', 24.99),
(16, 8, 'assets/products/Biccluchpencils.jpg', 'Bic cluch pencils set', 19.99),
(17, 8, 'assets/products/BIChighlighter.jpg', 'Bic highlighter set', 24.99),
(18, 3, 'assets/products/BirdsEyeburgers.jpg', 'Birds-Eye burgers 12s', 32.99),
(19, 8, 'assets/products/bicpens.jpg', 'Bic pens set', 24.99),
(20, 2, 'assets/products/bullbrandcornedbeef.jpg', 'Bullbrand corned beef', 12.99),
(21, 2, 'assets/products/coffee.jpg', 'Nestle Cocoa 500g', 36.99),
(22, 7, 'assets/products/CoreHealthpack.jpg', 'CoreHealth pack suppliments', 149.99),
(23, 7, 'assets/products/Credecoconutoil.jpg', 'Crede coconut oil', 46.99),
(24, 3, 'assets/products/DiGiornopizza.jpg', 'DiGiorno pizza', 29.99),
(25, 2, 'assets/products/flora.jpg', 'Flora olive oil 750ml', 35.99),
(26, 9, 'assets/products/flowerprunner.jpg', 'flower prunner', 59.99),
(27, 5, 'assets/products/flyingfish.jpg', 'Flying fish 750ml', 17.99),
(28, 2, 'assets/products/frespakrooibos.jpg', 'Frespak rooibos 48s', 37.99),
(29, 10, 'assets/products/handyandy.jpg', 'Handy andy 750ml', 18.99),
(30, 9, 'assets/products/hedgecutter.jpg', 'Hedge cutter', 89.99),
(31, 6, 'assets/products/himalayababyshampoo.jpg', 'Himalaya baby shampoo 500ml', 46.99),
(32, 6, 'assets/products/huggiessnugdry.jpg', 'Huggies snug-dry', 149.99),
(33, 6, 'assets/products/huggies.jpg', 'Huggies snugglers', 159.99),
(34, 10, 'assets/products/jikbleach.jpg', 'Jik bleach 750ml', 20),
(35, 6, 'assets/products/Johnsonsbabylotion.jpg', 'Johnsons baby lotion 350ml', 39.99),
(36, 6, 'assets/products/Johnsonsbabywash.jpg', 'Johnsons baby wash', 49.99),
(37, 9, 'assets/products/leafblower.jpg', 'Leaf blower', 78.99),
(38, 9, 'assets/products/1.jpeg', 'Gardening set', 1599.99),
(39, 2, 'assets/products/luckystarpilchards.jpg', 'Lucky star pilchards', 18.99),
(40, 2, 'assets/products/Maggi2minchickennoodles.jpg', 'Maggi 2min chicken noodles 1s', 4.99),
(41, 2, 'assets/products/macaroni.jpg', ' Fattis and Monnies macaroni', 9.99),
(42, 2, 'assets/products/mayo.jpg', 'Hellmanns mayonnaise', 39.99),
(43, 3, 'assets/products/mccainbrusselsprouts.jpg', 'McCain brussel sprouts', 29.99),
(44, 3, 'assets/products/mccaincarrotspeasbeans.jpg', 'McCain carrots peas beans combo', 29.99),
(45, 3, 'assets/products/McCainchilligarlicpotatobites.jpg', 'McCain chilli garlic potato bites', 29.99),
(46, 4, 'assets/products/meatballveg.jpg', 'Meatballs and veggies meal for one', 32.99),
(47, 3, 'assets/products/McCainfrenchfries.jpg', ' McCain french fries', 29.99),
(48, 5, 'assets/products/milkstout.jpg', 'Castle milk stout 750ml', 18),
(49, 8, 'assets/products/nikonD5300camera.jpg', 'Nikon D5300 camera', 1499.99),
(50, 7, 'assets/products/niveabodycreme.jpg', 'Nivea body creme', 39.99),
(51, 7, 'assets/products/dovemencarelotion.jpg', 'Dove men care lotion', 34.99),
(52, 1, 'assets/products/banana.jpg', '2.5Kg Bananas', 16.9),
(53, 1, 'assets/products/avocardo.jpg', '3Kg Avocados ', 22.9),
(54, 1, 'assets/products/apples.jpg', '3Kg Apples', 21.9),
(55, 1, 'assets/products/apricots.jpeg', '2Kg Apricots', 19.9),
(56, 1, 'assets/products/blackberry.jpg', '1.5Kg Blackberries', 21.9),
(57, 1, 'assets/products/carrots.jpg', '4Kg Carrots', 21.9),
(58, 1, 'assets/products/colliflower.jpg', 'Cauliflower 1s', 16.9),
(59, 1, 'assets/products/cranberry.jpg', '1.5Kg Cranberries', 21.9),
(60, 1, 'assets/products/kiwis.jpg', '2Kg Kiwis', 22.9),
(61, 1, 'assets/products/mangos.jpg', '2Kg Mangos', 23.9),
(62, 1, 'assets/products/mealies.jpg', 'Mealies 10s', 45.9),
(63, 1, 'assets/products/pawpaw.jpg', 'Paw Paw 1s', 14.9),
(64, 1, 'assets/products/peaches.jpg', '2.5Kg Peaches', 24.9),
(65, 1, 'assets/products/pepers.jpeg', 'Assorted Pepers', 10.9),
(66, 1, 'assets/products/potatos.jpg', '2.5Kg Potatoes', 23.9),
(67, 1, 'assets/products/raddish.jpg', '2Kg Raddishes', 25.9),
(68, 1, 'assets/products/spinach.jpg', 'Spinach banch', 14.9),
(69, 1, 'assets/products/strawberry.jpg', '1.5Kg Strawberries', 21.9),
(70, 1, 'assets/products/tomatoes.jpg', '3Kg Tomatoes', 27.9),
(71, 1, 'assets/products/watermelon.jpg', 'Large watermelon 1s', 21.9),
(72, 2, 'assets/products/allGoldOnionTomatoMix.jpg', 'All Gold onion and tomato mix', 9.9),
(73, 2, 'assets/products/bakersChockits.jpg', 'Bakers chockits', 13.9),
(74, 2, 'assets/products/bakerschoiceassorted.jpg', 'Bakers choice assorted', 79.9),
(75, 2, 'assets/products/bakersEatSumMor.jpg', 'Bakers Eat Sum Mor', 11.9),
(76, 2, 'assets/products/bakersMarie.jpg', 'Bakers marie biscuits', 9.9),
(77, 2, 'assets/products/bakersRomanyCreams.jpg', 'Bakers romany creams', 21.9),
(78, 2, 'assets/products/bakersRusks.jpg', 'Bakers rusks', 22.9),
(79, 2, 'assets/products/bakersSalticrax.jpg', 'Bakers salticrax', 18.9),
(80, 2, 'assets/products/bakersTennis.jpg', 'Bakers tennis biscuits', 11.9),
(81, 2, 'assets/products/beaconJellyTots.jpg', 'Beacon jelly tots', 8.9),
(82, 2, 'assets/products/blackCat.jpg', 'Black cat peanut butter', 14.9),
(83, 2, 'assets/products/bokomoProNutro.jpg', 'Bokomo ProNutro', 46.9),
(84, 2, 'assets/products/bokomoWeetbix.jpg', 'Bokomo Weetbix', 32.9),
(85, 2, 'assets/products/diddledaddle.jpg', 'Diddle daddle', 3.9),
(86, 2, 'assets/products/kooBeanSalad.jpg', 'Koo bean salad', 9.9),
(87, 2, 'assets/products/kooChakalaka.jpg', 'Koo chakalaka', 9.9),
(88, 2, 'assets/products/koocreamstylesweetcorn.jpg', 'Koo cream style sweet corn', 10.9),
(89, 2, 'assets/products/kooguava.jpg', 'Koo guava in syrup', 11.9),
(90, 2, 'assets/products/lionsafetymatches.jpg', 'Lion safety matches 12s', 18.9),
(91, 2, 'assets/products/mrsBallsChutney.jpg', 'Mrs Balls assorted chutney', 21.9),
(92, 2, 'assets/products/rajahmildspicy.jpg', 'Rajah mild and spicy', 14.9),
(93, 2, 'assets/products/roycoPotatoBakeCheeseBacon.jpg', 'Royco potato bake cheese and bacon', 13.9),
(94, 3, 'assets/products/frysPrawns.jpg', 'Frys crispy prawns', 31.9),
(95, 3, 'assets/products/idahoSpudshashBrowns.jpg', 'Idaho Spuds hash Browns', 25.9),
(96, 3, 'assets/products/NicenEasyfrozenbeeflasagna.jpg', 'Nice n Easy frozen beef lasagna', 32.9),
(97, 3, 'assets/products/olaRumRaisin.jpg', 'Ola rum and raisin 2l', 36.9),
(98, 3, 'assets/products/olaVanilla.jpg', 'Ola vanilla', 36.9),
(99, 3, 'assets/products/today40MiniChickenRols.jpg', 'Today 40 mini chicken rolls', 42.9),
(100, 4, 'assets/products/bakedHakeMeal.jpg', 'Baked hake meal', 24.9),
(101, 4, 'assets/products/beefStewMeal.jpg', 'Beef stew meal', 25.9),
(102, 4, 'assets/products/cheeseBaconRollChips.jpg', 'Cheese and bacon roll with chips', 19.9),
(103, 4, 'assets/products/chickenBrocolliMeal.jpg', 'Chicken with broccoli meal', 23.9),
(104, 4, 'assets/products/chickenMushroomSoup.jpg', 'Chicken and mushroom soup', 25.9),
(105, 4, 'assets/products/ChickenSalad.jpg', 'Chicken salad', 18.9),
(106, 4, 'assets/products/creamyMushroomMacaroni.jpg', 'Creamy mushroom and macaroni', 27.9),
(107, 4, 'assets/products/eggSalad.jpg', 'Healthy egg salad', 21.9),
(108, 4, 'assets/products/GardenSalad.jpg', 'Healthy garden salad', 16.9),
(109, 4, 'assets/products/GrilledChickenWrapper.jpg', 'Grilled chicken wrapper', 28.9),
(110, 4, 'assets/products/hamCheeseRoll.jpg', 'Juicy ham cheese roll', 24.9),
(111, 4, 'assets/products/MacMinceMeal.jpg', 'Macaroni and mince meal', 25.9),
(112, 4, 'assets/products/meatballsStew.jpg', 'Meatballs stew', 29.9),
(113, 4, 'assets/products/sparghettiSausageMeal.jpg', 'Sparghetti and sausage meal', 28.9),
(114, 4, 'assets/products/steakRiceMeal.jpg', 'Steak and rice meal', 27.9),
(115, 4, 'assets/products/trifonPizza.jpg', 'Trifon pizza', 26.9),
(116, 4, 'assets/products/veggieSalads.jpg', 'Vegitable salads', 21.9),
(117, 5, 'assets/products/busch30Cans.jpeg', 'Busch beer 30 cans', 79.9),
(118, 5, 'assets/products/CeresFruitJuices.jpg', 'Ceres fruit juice 1L', 17.9),
(119, 5, 'assets/products/CeresFruitJuices6pack.jpg', 'Ceres fruit juice 6 pack', 29.9),
(120, 5, 'assets/products/ciroc.jpg', 'Ciroc vodka', 298),
(121, 5, 'assets/products/cocacola123l.jpg', 'Coca Cola 1.25L', 15.99),
(122, 5, 'assets/products/corona6pack.jpg', 'Corona 6 pack', 104.99),
(123, 5, 'assets/products/DanoneDanup.jpg', 'Danone dan up', 12.9),
(124, 5, 'assets/products/grantsSignature.jpg', 'Grants signature 750ml', 369.99),
(125, 5, 'assets/products/jackDaniels.jpg', 'Jack Daniels 750ml', 259.99),
(126, 5, 'assets/products/jagermeisterManifest.jpg', 'Jagermeister manifest', 315),
(127, 5, 'assets/products/jameson.jpg', 'John Jameson and son whiskey 750ml', 595),
(128, 5, 'assets/products/liquifruitjuicecranberry1L.jpg', 'Liqui fruit juice 1l', 19.9),
(129, 5, 'assets/products/OmissionBeer.jpg', 'Omission beer 6 pack', 55),
(130, 5, 'assets/products/patronTequila.jpg', 'Patron tequila 750ml', 300),
(131, 5, 'assets/products/PepsiMaxCherry6330ml.jpg', 'Pepsi max cherry 6x330ml', 42.9),
(132, 5, 'assets/products/peroni12pack.jpg', 'Peroni beer 12 pack', 325),
(133, 5, 'assets/products/russianBearVodka.jpg', 'Russian Bear vodka 750ml', 114.99),
(134, 5, 'assets/products/stellaArtios.jpg', 'Stella Artois', 105),
(135, 6, 'assets/products/huggiesBabyWashHairBody.jpg', 'Huggies baby wash hair and body', 49.9),
(136, 6, 'assets/products/huggiesBabyWipes.jpg', 'Huggies baby wipes', 39.99),
(137, 6, 'assets/products/huggiesNappiesCrawlerBoy136s.jpg', 'Huggies nappies crawler boy 136s', 264.99),
(138, 6, 'assets/products/huggiesNappiesNewBorn.jpg', 'Huggies nappies new born', 268),
(139, 6, 'assets/products/huggiesPullUps.jpg', 'Huggies pull ups', 154.99),
(140, 6, 'assets/products/JohnsonsBabyOilGel.jpg', 'Johnsons baby oil gel', 87.99),
(141, 6, 'assets/products/jonsonsBabyOil.jpg', 'Johnsons baby oil', 78.99),
(142, 6, 'assets/products/johnsonsBedtimepowder.jpg', 'johnsons bedtime poweder', 62.99),
(143, 6, 'assets/products/jonsonsBabyCream.jpg', 'Johnsons baby cream', 58.99),
(144, 6, 'assets/products/jonsonsBabyShampoo.jpg', 'Johnsons baby shampoo', 72.99),
(145, 6, 'assets/products/jonsonsBabySoap.jpg', 'Johnsons baby soap', 18.99),
(146, 6, 'assets/products/jonsonsBabyWipes.jpg', 'Johnsons baby wipes', 46.99),
(147, 6, 'assets/products/purityBabyAqueousCream.jpg', 'Purity baby aqueous cream', 39.99),
(148, 6, 'assets/products/purityBabyFoodToddler.jpg', 'Purity baby food for toddlers', 16),
(149, 6, 'assets/products/PurityElizabethAnnesBabyFabricConditioner.jpg', 'Purity and Elizabeth Annes baby fabric conditioner', 39.99),
(150, 6, 'assets/products/PurityTopLoaderLaundryLiquid4L.jpg', 'Purity top loader laundry liquid 4l', 129),
(151, 7, 'assets/products/blackstoneLabsDustExtreme.jpg', 'Blackstone Labs dust extreme suppliments', 249.9),
(152, 7, 'assets/products/dashashwaCapsule.jpg', 'dashashwa capsule for joint pain', 89.99),
(153, 7, 'assets/products/healthvitFitnessEngyshotInstantEnergyDrink340gmPowder.jpeg', 'Healthvit fitness instant energy drink 340g powder', 69.99),
(154, 7, 'assets/products/herbalhillsPrimeFemohills30Capsule.jpg', 'Herbalhills prime femohills 30 capsule', 129),
(155, 7, 'assets/products/HerbicoughHerbalCoughReliefSyrup.jpg', 'Herbicough herbal cough relief syrup', 42.99),
(156, 7, 'assets/products/himalayaHerbalHealthcare.jpg', 'Himalaya herbal healthcare', 67.99),
(157, 7, 'assets/products/MorphemeComboPackWomenHealthCare2bottles.jpeg', 'Morpheme combo pack for women health care', 126.99),
(158, 7, 'assets/products/niveaMenDeepCleaningFaceWash.jpg', 'Nivea men deep cleaning face wash', 29.99),
(159, 7, 'assets/products/NiveaQ10PlusAntiWrinkleFaceNightCream.jpg', 'Nivea Q10 plus anti wrinkle face night cream', 63.99),
(160, 7, 'assets/products/niveaShowGel.jpg', 'Nivea shower gel', 28.99),
(161, 7, 'assets/products/purePumpNaturalPreWorkoutSupplementforMenWomen.jpg', 'Pure pump natural pre-workout supplement', 264.99),
(162, 7, 'assets/products/vaselineBodyLotions.jpg', 'Vaseline body lotions', 39.99),
(163, 7, 'assets/products/vaselineHairTonicAndScalpConditioner200mL.jpg', 'Vaseline hair tonic and scalp conditioner 200ml', 46.99),
(164, 7, 'assets/products/vaselineIntensiveCareHandCream.jpg', 'Vaseline intensive care hand cream', 39),
(165, 7, 'assets/products/VaselineMenSprayAntiPerspirantDeodorant.jpg', 'Vaseline men spray anti-perspirant deodorant', 49.99),
(166, 8, 'assets/products/ASUSDesktopComputerVivoPCM32CDB09IntelCorei76thGen6700.jpg', 'ASUS desktop computer i7', 3999.99),
(167, 8, 'assets/products/BLuVivo8.jpg', 'BLU Vivo 8', 2852),
(168, 8, 'assets/products/CasioCalculators.jpg', 'Casio calculators', 69.99),
(169, 8, 'assets/products/dellNotebookInspiron153567.jpg', 'Dell notebook inspiron 15 i7', 12999),
(170, 8, 'assets/products/FellowesCosmicA3Laminator.jpg', 'Fellowes cosmic A3 laminator', 2429),
(171, 8, 'assets/products/GalaxyS416GB.jpg', 'Samsung galaxy S4 16GB', 4429),
(172, 8, 'assets/products/GalaxySdEge32GB.jpg', 'Samsung galaxy S6 edge 32GB', 8499),
(173, 8, 'assets/products/GBcCrossCutShredder.jpg', 'GBC cross cut shredder', 1999.99),
(174, 8, 'assets/products/HerlitzA4CutFlushFolder.jpg', 'Herlitz A4 cut flush folder 12s', 79.99),
(175, 8, 'assets/products/HpPrintersLaserJetProMFPM177fw.jpg', 'Hp printer LaserJet pro MFPM177fw', 6999.99),
(176, 8, 'assets/products/Iphone5WithGriffinIdentityProtectiveCaseBlack.jpeg', 'Apple I5 with griffin identity protective case', 4999.99),
(177, 8, 'assets/products/Mark4CarabinerPen.jpg', 'Mark 4 carabiner pen', 89.99),
(178, 8, 'assets/products/officeChairs.jpg', 'Assorted office chairs', 379.99),
(179, 8, 'assets/products/Samsung40.jpg', 'Samsung 40 inch television ', 11999.99),
(180, 8, 'assets/products/SAMSUNG55.jpeg', 'SAMSUNG 55 inch television', 16999.99),
(181, 8, 'assets/products/sonyPlaystationVita2000Slim.jpg', 'Sony Playstation Vita 2000 slim', 2200),
(182, 8, 'assets/products/StripStaplerSilverFreeStapleRemover.jpg', 'Strip stapler silver and staple remover', 59.99),
(183, 8, 'assets/products/Treline1Quire96pg.jpg', 'Treeline 1Quire 96 pages', 10),
(184, 8, 'assets/products/VPACKMagnetDeskOrganizer.jpg', 'VPACK magnet desk organizer', 86.99),
(185, 8, 'assets/products/XeroxPerformerPaperA4White.jpg', 'Xerox performer paper A4 white', 325),
(186, 9, 'assets/products/boltCutter.jpg', 'Bolt cutter', 129.99),
(187, 9, 'assets/products/CharBroilSilverSmokerSintMaarten.jpg', 'Char Broil silver smoker sint maarten', 1852),
(188, 9, 'assets/products/ExceptionalSwedishAxe.jpg', 'Exceptional swedish axe', 79.99),
(189, 9, 'assets/products/forkSpade.jpg', 'Fork spade', 99),
(190, 9, 'assets/products/gardenerGloves.jpg', 'Pink gardener gloves', 79),
(191, 9, 'assets/products/huskyClawHammers.jpg', 'Husky claw hammers', 69),
(192, 9, 'assets/products/Kobalt18PieceDoubleDrivePrecisionScrewdriverSet.jpg', 'Kobalt 18 piece double drive precision screwdriver set', 149.5),
(193, 9, 'assets/products/OregonchainSaw.jpg', 'Oregon chain saw', 1999.99),
(194, 9, 'assets/products/PickAxeWithFibreglassShaft.jpg', 'Pick axe with fibreglass shaft', 279.99),
(195, 9, 'assets/products/Plunger.jpg', 'Toilet plunger', 69.99),
(196, 9, 'assets/products/RotatingSprinkler.jpg', 'Rotating sprinkler', 399.99),
(197, 9, 'assets/products/RoundPatioCoffeeTableBlack.jpg', 'Round patio coffee table', 1899.99),
(198, 9, 'assets/products/sleepingHammockTent.jpg', 'Sleeping hammock tent', 429.99),
(199, 9, 'assets/products/StanleyAdjustablePliers.jpg', 'Samsung 40 inch television ', 11999.99),
(200, 9, 'assets/products/StanleyLongNoise.jpeg', 'Stanley long noise pliers', 49.99),
(201, 9, 'assets/products/StanleyPiecePliersSet.jpg', 'Stanley piece pliers set', 189.99),
(202, 9, 'assets/products/SwingDoorReceptacle.jpg', 'Outdoor swing door receptacle', 399.99),
(203, 9, 'assets/products/SwingHangingChairWithCushionFor2Person.jpg', 'Swing hanging chair with cushion for two', 1499),
(204, 9, 'assets/products/TitaniumBypassPruningShears.jpg', 'Titanium bypass pruning shears', 99.99),
(205, 9, 'assets/products/wheelbarrow.jpg', 'Green wheelbarrow', 399),
(206, 10, 'assets/products/ArielAutoWashingLiquidDetergentBottle15L.jpg', 'Ariel auto washing liquid detergent bottle 1.5l', 47.99),
(207, 10, 'assets/products/CobraActiveLavenderGardenTileCleaner.jpg', 'Cobra active lavender garden tile cleaner', 18.99),
(208, 10, 'assets/products/cobraActiveTileCleaner.jpg', 'Cobra active tile cleaner', 20.99),
(209, 10, 'assets/products/DettolDisinfectantBathroomCleaner.jpg', 'Dettol disinfectant bathroom cleaner', 19.5),
(210, 10, 'assets/products/DettolDisinfectantKitchenCleaner.jpg', 'Dettol disinfectant kitchen cleaner', 21),
(211, 10, 'assets/products/DoomCockroachInsectFogging.jpg', 'Doom cockroach and insect fogging', 59),
(212, 10, 'assets/products/DoomFreshMultiInsectSprayOdourless.jpg', 'Doom fresh multi insect spray odourless', 39),
(213, 10, 'assets/products/FinishDishwashingTablets.jpg', 'Finish dishwashing tablets', 39.99),
(214, 10, 'assets/products/GladeHomeRoomSprayAirFreshner.jpg', 'Glade home room spray air freshner', 11.99),
(215, 10, 'assets/products/HandyAndyRefill750ml.jpg', 'Handy Andy refill 750ml', 14.99),
(216, 10, 'assets/products/JeyesMultiPurposeBleachSprayRefill500ml.jpg', 'Jeyes multi purpose bleach spray refill 500ml', 19.99),
(217, 10, 'assets/products/kiwiShoePolish.jpg', 'kiwi shoe polish', 13.99),
(218, 10, 'assets/products/MrMinMultiSurfaceCleanerLavender.jpg', 'Mr Min multi surface cleaner lavender', 16.99),
(219, 10, 'assets/products/OmoDetergent.jpg', 'Omo detergent', 53.99),
(220, 10, 'assets/products/RaidLiquidElectricMosquitoKiller.jpg', 'Raid liquid electric mosquito killer', 49.99),
(221, 10, 'assets/products/SunlightDishwashingLiquidSoap.jpg', 'Sunlight dishwashing liquid soap', 9.99),
(222, 10, 'assets/products/SunlightGreenBar.jpg', 'Sunlight green bar soap', 7.99),
(223, 10, 'assets/products/SunlightRefillDishwashLiquid750ml.jpg', 'Sunlight refill dishwash liquid 750ml', 10.99),
(224, 10, 'assets/products/VanishHandShampoo.jpg', 'Vanish hand washing shampoo', 69.99),
(225, 10, 'assets/products/VanishPlatinumWhitePowder14kg.jpg', 'Vanish platinum white powder 1.4kg', 49);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `password`, `surname`, `username`) VALUES
(2, 'mr.silimela@gmail.com', 'Lubabalo', 'qwerty', 'Silimela', 'Sbash'),
(3, 'qwerty@qwerty.com', 'qwerty', 'qwerty', 'qwerty', 'qwerty'),
(4, 'cele@corruption.con', 'bheki', '12345', 'Cele', 'corruptionBoss');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `checked_orders`
--
ALTER TABLE `checked_orders`
  ADD PRIMARY KEY (`checked_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `checked_orders`
--
ALTER TABLE `checked_orders`
  MODIFY `checked_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
