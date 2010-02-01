CREATE TABLE `image` (
  `id`       varchar(255),
  `filename` varchar(255),
  `ext`      varchar(255),
  `data`     blob,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
