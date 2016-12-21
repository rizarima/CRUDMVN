DROP TABLE IF EXISTS `siswa`;
CREATE TABLE `siswa` (
`id` varchar(255) NOT NULL,
`nama` varchar(255) NOT NULL,
`nis` varchar(255) NOT NULL,
`tempat_lahir` varchar(255) NOT NULL,
`tanggal_lahir` varchar(255) NOT NULL,
`alamat` varchar(255) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `c_security_permission`(
`id` varchar(255) NOT NULL,
`permission_label` varchar(255) NOT NULL,
`permission_value` varchar(255) NOT NULL,
PRIMARY KEY(`id`),
UNIQUE KEY `UK_k4suda9cvcsoikdgquscypmt6` (`permission_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `c_security_role`(
`id` VARCHAR(255) NOT NULL,
`nama` VARCHAR(255) NOT NULL,
`description` VARCHAR(255) NOT NULL,
PRIMARY KEY(`id`),
UNIQUE KEY `UK_hliaoojt6u3a11d8svttju10l` (`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `c_security_role_permission` (
`id_role` varchar(255) NOT NULL,
`id_permission` varchar(255) NOT NULL,
PRIMARY KEY(`id_role`,`id_permission`),
KEY `FK_d89p0a0x87scb5s3830jx7xq0` (`id_permission`),
CONSTRAINT `FK_d89p0a0x87scb5s3830jx7xq0` FOREIGN KEY (`id_permission`) REFERENCES `c_security_permission` (`id`),
CONSTRAINT `FK_fvynt2q4rxk27e0bxuon50tp4` FOREIGN KEY (`id_role`) REFERENCES `c_security_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `c_security_user`(
`id` VARCHAR(255) NOT NULL,
`username` VARCHAR(255) NOT NULL,
`password` VARCHAR(255) NOT NULL,
`active` BOOLEAN NOT NULL,
`id_role` VARCHAR(255) NOT NULL,
PRIMARY KEY(`id`),
UNIQUE KEY `UK_at8if7a9lnl90wxllb9divpdf` (`username`),
KEY `FK_my18sie96bgbncypva3fxboxy` (`id_role`),
CONSTRAINT `FK_my18sie96bgbncypva3fxboxy` FOREIGN KEY (`id_role`)
REFERENCES `c_security_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;