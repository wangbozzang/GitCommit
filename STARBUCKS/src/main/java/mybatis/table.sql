CREATE TABLE `order_info` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `menu` varchar(45) NOT NULL,
  `amount` varchar(45) NOT NULL,
  `sum` varchar(45) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3