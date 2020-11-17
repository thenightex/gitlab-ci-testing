USE `elbook`;

CREATE TABLE IF NOT EXISTS `Mandant` (
	`id` INT(10) NOT NULL,
	`name` VARCHAR(200) NOT NULL,
	`telematikKuerzel` VARCHAR(30) NOT NULL,
	`mail` VARCHAR(30) NOT NULL,
	`nutzername` VARCHAR(200) NOT NULL,
	`sektor` VARCHAR(200) NOT NULL,
	`bundesland` VARCHAR(200) NOT NULL,
	`passwort` VARCHAR(200) NOT NULL,
	`vzdResourceUri` VARCHAR(200) NOT NULL,
	`vzdTokenUri` VARCHAR(200) NOT NULL,
	`vzdAuthId` VARCHAR(200) NULL,
	`vzdAuthSecret` VARCHAR(200) NULL,
	`gueltigBis` DATE NOT NULL,
	`angelegtAm` DATETIME NOT NULL,
    `geaendertAm` DATETIME NOT NULL,
    PRIMARY KEY (id)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE IF NOT EXISTS `Tsp` (
	`id` INT(10) NOT NULL,
	`mandantId` INT(10) NOT NULL,
	`tspName` VARCHAR (20) NOT NULL,
	`hbaUri` VARCHAR(100) NOT NULL,
	`smcbUri` VARCHAR(100) NOT NULL,
	`keystorePass` VARCHAR(100) NOT NULL,
	`keystoreType` VARCHAR(100) NOT NULL,
	`keystoreFile` VARCHAR(100) NOT NULL,
	`angelegtAm` DATETIME NOT NULL,
    `geaendertAm` DATETIME NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT `FK_Tsp_Mandant` FOREIGN KEY (`mandantId`) REFERENCES `Mandant`(`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE IF NOT EXISTS `BatchJob` (
	`id` INT(10) NOT NULL,
	`mandantId` INT(10) NOT NULL,
	`batchJobName` VARCHAR (25) NOT NULL,
	`anzahlDatensaetze` INT(10) NOT NULL,
    `anzahlDatensaetzeAbgearbeitet` INT(10) NOT NULL,
	`statusCode` VARCHAR (20) NOT NULL,
	`gestartetAm` DATETIME NOT NULL,
    `beendetAm` DATETIME NULL,
    PRIMARY KEY (id),
    CONSTRAINT `FK_BatchJob_Mandant` FOREIGN KEY (`mandantId`) REFERENCES `Mandant`(`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE IF NOT EXISTS `LogEintrag` (
	`id` INT(10) NOT NULL,
	`mandantId` INT(10) NOT NULL,
	`telematikId` VARCHAR (100) NOT NULL,
	`businessId` VARCHAR (100) NULL,
	`datentyp` VARCHAR (30) NOT NULL,
	`erstelltAm` DATETIME NOT NULL,
	PRIMARY KEY (id),
    CONSTRAINT `FK_LogEintrag_Mandant` FOREIGN KEY (`mandantId`) REFERENCES `Mandant`(`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE IF NOT EXISTS `LogEintragArtikel` (
	`id` INT(10) NOT NULL,
	`logEintragId` INT(10) NOT NULL,
	`vzdUid` VARCHAR (100) NOT NULL,
	`vzdZertUid` VARCHAR (100) NULL,
	`typ` VARCHAR (30) NOT NULL,
	`erstelltAm` DATETIME NOT NULL,
	PRIMARY KEY (id),
    CONSTRAINT `FK_LogEintragArtikel_LogEintrag` FOREIGN KEY (`logEintragId`) REFERENCES `LogEintrag`(`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

