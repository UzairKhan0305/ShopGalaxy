-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2025 at 02:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `registration`
--

-- --------------------------------------------------------

--
-- Table structure for table `cartdata`
--

CREATE TABLE `cartdata` (
  `order_id` varchar(1134) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cartdata`
--

INSERT INTO `cartdata` (`order_id`, `name`, `description`, `image`, `price`, `quantity`, `ID`) VALUES
('order_67f0e3f75cbd35.20319682', 'Fabric: Dhanak', '\n        •  Fabric: Dhanak\n•  Pattern: Embroidered\n•  Shirt Front Pattern: Embroidered\n•  Neckline: Embroidered\n•  Daman: Embroidered\n•  Shirt Back Pattern: Plain\n•  Trouser Pattern: Embroidered\n•  Number Of Pieces: 2 Pcs\n•  Package Includes: 1 x Shirt, 1 x Trouser\n•  Shirt Cutting: 2.5 Gazz\n•  Trouser Cutting: 2.5 Gazz\n•  Pack Of 1\n•   Color: Pink\n•  Note: There might be an error of 1-3 cm due to manual measurement, and slight color differences may occur as a result of varying lighting and monitor effects.\n•  Product Code: MZ9100000068KZSE\n        ', 'http://localhost/shop%20galaxy/pic/cl/cl1.jpg', 3500, 1, 265),
('order_67f0e3f75cbd35.20319682', 'Fabric: Dhanak\n    ', '\n        •  Fabric: Dhanak\n•  Pattern: Embroidered\n•  Shirt Front Pattern: Embroidered\n•  Neckline: Embroidered\n•  Daman: Embroidered\n•  Shirt Back Pattern: Plain\n•  Trouser Pattern: Plain\n•  Dupatta Fabric: Dhanak\n•  Dupatta Pattern: Embroidered\n•  Number Of Pieces: 3 Pcs\n•  Package Includes: 1 x Shirt, 1 x Trouser, 1 x Dupatta\n•  Shirt Cutting: 3.25 Yards\n•  Trouser Cutting: 2.5 Yards\n•  Dupatta Cutting: 2.5 Yards\n•   Color: Pink\n•  Note: There might be an error of 1-3 cm due to manual measurement, and slight color differences may occur as a result of varying lighting and monitor effects.\n•  Product Code: MZ89000000028RJFC\n        ', 'http://localhost/shop%20galaxy/pic/cl/cl2.jpg', 4000, 1, 266),
('order_67f0f198be7b18.36027489', 'Fabric: Dhanak', '\n        •  Fabric: Dhanak\n•  Pattern: Embroidered\n•  Shirt Front Pattern: Embroidered\n•  Neckline: Embroidered\n•  Daman: Embroidered\n•  Shirt Back Pattern: Plain\n•  Trouser Pattern: Embroidered\n•  Number Of Pieces: 2 Pcs\n•  Package Includes: 1 x Shirt, 1 x Trouser\n•  Shirt Cutting: 2.5 Gazz\n•  Trouser Cutting: 2.5 Gazz\n•  Pack Of 1\n•   Color: Pink\n•  Note: There might be an error of 1-3 cm due to manual measurement, and slight color differences may occur as a result of varying lighting and monitor effects.\n•  Product Code: MZ9100000068KZSE\n        ', 'http://localhost/shop%20galaxy/pic/cl/cl1.jpg', 3500, 1, 267),
('order_67f0f198be7b18.36027489', 'Fabric: Dhanak\n    ', '\n        •  Fabric: Dhanak\n•  Pattern: Embroidered\n•  Shirt Front Pattern: Embroidered\n•  Neckline: Embroidered\n•  Daman: Embroidered\n•  Shirt Back Pattern: Plain\n•  Trouser Pattern: Plain\n•  Dupatta Fabric: Dhanak\n•  Dupatta Pattern: Embroidered\n•  Number Of Pieces: 3 Pcs\n•  Package Includes: 1 x Shirt, 1 x Trouser, 1 x Dupatta\n•  Shirt Cutting: 3.25 Yards\n•  Trouser Cutting: 2.5 Yards\n•  Dupatta Cutting: 2.5 Yards\n•   Color: Pink\n•  Note: There might be an error of 1-3 cm due to manual measurement, and slight color differences may occur as a result of varying lighting and monitor effects.\n•  Product Code: MZ89000000028RJFC\n        ', 'http://localhost/shop%20galaxy/pic/cl/cl2.jpg', 4000, 1, 268),
('order_67f11718c0d782.53952894', 'Shirt Fabric: Khaddar\n    ', '\n        •  Shirt Fabric: Khaddar\n        •  Pattern: Embroidered\n        •  Shirt Front Pattern: Embroidered\n        •  Neckline: Embroidered\n        •  Sleeves Pattern: Embroidered\n        •  Daman: Embroidered\n        •  Shirt Back Pattern: Embroidered\n        •  Trouser Fabric: Khaddar\n        •  Trouser Pattern: Plain\n        •  Dupatta Fabric: Khaddar\n        •  Dupatta Pattern: Cut Work\n        •  Number Of Pieces: 3 Pcs\n        •  Color: White\n        •  Package Includes: 1 x Shirt, 1 x Trouser, 1 x Dupatta\n        •  Shirt Cutting: 2.5 Gazz\n        •  Trouser Cutting: 2.5 Gazz\n        •  Dupatta Cutting: 2.5 Gazz\n        •  Note: There might be an error of 1-3 cm due to manual measurement, and slight color differences may occur as a result of varying lighting and monitor effects.\n        •  Product Code: MZ64800000217AISDBYADFS\n        ', 'http://localhost/shop%20galaxy/pic/cl/cl10.jpg', 4300, 1, 269),
('order_67f117426c09c1.67182067', 'Smart Wallet', '\n        Businessman Collection\n\n        7-days money back guarantee\n        \n        🔶 Synthetic materials\n        \n        🔶 1x Cash Compartment\n        \n        🔶 3x Card holders\n        \n        🔶 1x ID windows\n        \n        🔶 2 Secret Compartment\n        \n        🔶 Size 4inch x 4.5inch\n        \n        🔶 Fine stitching\n        \n        ', 'http://localhost/shop%20galaxy/pic/home/p6.jpg', 900, 1, 270);

-- --------------------------------------------------------

--
-- Table structure for table `registrationtable`
--

CREATE TABLE `registrationtable` (
  `ID` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` int(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `country` varchar(20) NOT NULL,
  `order_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `registrationtable`
--
DELIMITER $$
CREATE TRIGGER `assign_order_id_to_registration` BEFORE INSERT ON `registrationtable` FOR EACH ROW BEGIN
    DECLARE last_order_id VARCHAR(255);

    -- Fetch the last order_id from the cartdata table
    SELECT order_id INTO last_order_id
    FROM cartdata
    ORDER BY ID DESC
    LIMIT 1;

    -- Assign the last order_id to the new registration record
    SET NEW.order_id = last_order_id;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cartdata`
--
ALTER TABLE `cartdata`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `registrationtable`
--
ALTER TABLE `registrationtable`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cartdata`
--
ALTER TABLE `cartdata`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `registrationtable`
--
ALTER TABLE `registrationtable`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
