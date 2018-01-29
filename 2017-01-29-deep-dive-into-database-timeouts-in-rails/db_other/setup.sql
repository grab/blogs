-- Copyright 2018 Grabtaxi Holdings PTE LTE (GRAB), All rights reserved.
-- Use of this source code is governed by an MIT-style license that can be found in the LICENSE file

-- I wrote this by hand to quickly setup a new database instead of
-- trying to figure out how to use Rails migrations for mutliple
-- databases which can be quite complex.

CREATE DATABASE `rails-mysql-timeouts`;

USE rails-mysql-timeouts;

CREATE TABLE `passengers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT into `passengers` VALUES (1, 'test','2017-01-01 00:00:00','2017-01-07 00:00:00');
