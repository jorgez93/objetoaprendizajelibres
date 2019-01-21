CREATE TABLE `colaborador` (
  `idcolaborador` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(45) DEFAULT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `fechanacimiento` varchar(45) DEFAULT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `dircalle` varchar(45) DEFAULT NULL,
  `dirnumcalle` varchar(45) DEFAULT NULL,
  `dirtransversal` varchar(45) DEFAULT NULL,
  `dirciudad` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `foto` longblob,
  PRIMARY KEY (`idcolaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

alter table profesor add column (
idcolaborador int
);

alter table estudiante add column (
idcolaborador int
);
