CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `side` varchar(15) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `type` varchar(12) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  `inventory` varchar(500) NOT NULL,
  `impound` tinyint(1) NOT NULL DEFAULT '0',
  `impound_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=1816 DEFAULT CHARSET=latin1;

DELIMITER //
DROP PROCEDURE IF EXISTS `impoundVehicles`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `impoundVehicles`()
    COMMENT 'Comprobacion de la fecha de embargo'
BEGIN
	UPDATE vehicles SET impound = 0 AND impound_time = CURRENT_TIMESTAMP WHERE impound = 1 AND impound_time < CURRENT_TIMESTAMP;
END//
DELIMITER ;

