/*1*/
ALTER TABLE usuario ADD CONSTRAINT CK_usuario_correo CHECK (correo LIKE '%@%' AND correo LIKE '%.%');
ALTER TABLE usuario ADD CONSTRAINT CK_usuario_tid CHECK (Tid LIKE 'CC' OR Tid LIKE 'TI');
ALTER TABLE califica ADD CONSTRAINT CK_califica_estrellas CHECK (estrellas > 0 AND estrellas < 6);
ALTER TABLE articulo ADD CONSTRAINT CK_articulo_estado CHECK (estado LIKE 'N' OR estado LIKE 'U');
ALTER TABLE articulo ADD CONSTRAINT CK_articulo_foto CHECK (foto LIKE 'https://%.%/%.pdf');
ALTER TABLE articulo ADD CONSTRAINT CK_articulo_precio CHECK (precio >= 0);
ALTER TABLE Ropa ADD CONSTRAINT CK_ropa_talla CHECK (talla LIKE 'XS' OR talla LIKE 'S' OR talla LIKE 'M' OR talla LIKE 'L' OR talla LIKE 'XL');
ALTER TABLE evaluaciones ADD CONSTRAINT CK_evaluacion_a_omes CHECK (a_omes > 200000 AND a_omes < 200013);
ALTER TABLE evaluaciones ADD CONSTRAINT CK_evaluacion_tid CHECK (tid LIKE 'CC' OR tid LIKE 'TI');
ALTER TABLE evaluaciones ADD CONSTRAINT CK_evaluacion_descripcion CHECK (descripcion LIKE NULL OR descripcion LIKE '%A' OR descripcion LIKE '%M' OR descripcion LIKE '%B');
ALTER TABLE evaluaciones ADD CONSTRAINT CK_evaluacion_reporte CHECK (reporte LIKE 'https://%.%/%.pdf');
ALTER TABLE evaluaciones ADD CONSTRAINT CK_evaluacion_resultado CHECK (resultado LIKE 'AP' OR resultado LIKE 'PE');
ALTER TABLE auditoria ADD CONSTRAINT CK_auditoria_cod CHECK (cod > 0 AND cod < 999999999);
ALTER TABLE auditoria ADD CONSTRAINT CK_auditoria_accion CHECK (accion LIKE 'I' OR accion LIKE 'D' OR accion LIKE 'U');
ALTER TABLE categoria ADD CONSTRAINT CK_categoria_tipo CHECK (tipo LIKE 'A' OR tipo LIKE 'R' OR tipo LIKE 'L' OR tipo LIKE 'T' OR tipo LIKE 'O');
ALTER TABLE categoria ADD CONSTRAINT CK_categoria_minimo CHECK (minimo >= 0);
ALTER TABLE categoria ADD CONSTRAINT CK_categoria_maximo CHECK (maximo >= 0);
--------
ALTER TABLE universidad ADD CONSTRAINT PK_universidad PRIMARY KEY (codigo);
ALTER TABLE usuario ADD CONSTRAINT PK_usuario PRIMARY KEY (codigo);
ALTER TABLE articulo ADD CONSTRAINT PK_articulo PRIMARY KEY (id);
ALTER TABLE ropa ADD CONSTRAINT PK_ropa PRIMARY KEY (cod);
ALTER TABLE perecedero ADD CONSTRAINT PK_perecedero PRIMARY KEY (idArticulo);
ALTER TABLE evaluaciones ADD CONSTRAINT PK_evaluacion PRIMARY KEY (a_omes);
ALTER TABLE auditoria ADD CONSTRAINT PK_auditoria PRIMARY KEY (cod);
ALTER TABLE categoria ADD CONSTRAINT PK_categoria PRIMARY KEY (codigo);
ALTER TABLE califica ADD CONSTRAINT PK_califica PRIMARY KEY (idUsuario, idArticulo);
ALTER TABLE caracteristica ADD CONSTRAINT PK_caracteristica PRIMARY KEY (caracteristicas, articulo);
ALTER TABLE respuesta ADD CONSTRAINT PK_respuesta PRIMARY KEY (respuestas, evaluacion);
--------
ALTER TABLE usuario ADD CONSTRAINT UK_usuarios_tid UNIQUE (tid);
ALTER TABLE usuario ADD CONSTRAINT UK_usuarios_nid UNIQUE (nid);   
ALTER TABLE articulo ADD CONSTRAINT UK_usuarios_foto UNIQUE (foto);
ALTER TABLE evaluaciones ADD CONSTRAINT UK_evaluacion_reporte UNIQUE (reporte);
--------
ALTER TABLE califica ADD CONSTRAINT FK_califica_usuario FOREIGN KEY (idUsuario) REFERENCES usuario(codigo);
ALTER TABLE califica ADD CONSTRAINT FK_califica_articulo FOREIGN KEY (idarticulo) REFERENCES articulo(id);
ALTER TABLE ropa ADD CONSTRAINT FK_ropa_articulo FOREIGN KEY (cod) REFERENCES articulo(id);
ALTER TABLE caracteristica ADD CONSTRAINT FK_caracteristica_articulo FOREIGN KEY (articulo) REFERENCES articulo(id);
ALTER TABLE perecedero ADD CONSTRAINT FK_perecedero_articulo FOREIGN KEY (idArticulo) REFERENCES articulo(id);
ALTER TABLE categoria ADD CONSTRAINT FK_categoria_articulo FOREIGN KEY (idArticulo) REFERENCES articulo(id);
ALTER TABLE categoria ADD CONSTRAINT FK_categoria_auditoria FOREIGN KEY (idAuditoria) REFERENCES auditoria(cod);
ALTER TABLE evaluaciones ADD CONSTRAINT FK_evaluacion_auditoria FOREIGN KEY (idAuditoria) REFERENCES auditoria(cod);
ALTER TABLE respuesta ADD CONSTRAINT FK_respuesta_evaluacion FOREIGN KEY (evaluacion) REFERENCES evaluaciones(a_omes);
----------------



/*2*/

/*a*/ ALTER TABLE usuario ADD CONSTRAINT CK_usuario_correo2 CHECK (correo LIKE '%@hotmail%.%' OR correo LIKE '%@gmail%.%' OR correo LIKE '%@mail%.%');
/*b*/ ALTER TABLE usuario ADD CONSTRAINT CK_usuario_registro CHECK (registro >= TO_DATE('2024-01-01', 'YYYY-MM-DD'));


/*3*/

/*correo mal puesto en usuario*/
INSERT INTO usuario (codigo, tid, nid, nombre, programa, correo, registro, suspension, nSuspensiones) VALUES (1000000001, 'CC', 1000054291, 'Jaime Rodriguez', 'Medicina', 'j@aime1234hotmail.com', TO_DATE('23/05/2022', 'DD/MM/YYYY'), NULL, 0);
/*a*/


/*fecha erronea en articulo perecedero*/
INSERT INTO articulo (id, descripcion, caracteristicas, estado, foto, precio, disponible) VALUES (5689745000, 'Doritos 185g', '26/07/2022', 'N', 'https://dominio1.extension2/doritos185,pdf', 8, 'NO');
/*b*/


/*fecha erronea en evaluaciones*/
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado, respuestas, idAuditoria) VALUES (202405, 'CC', '1245789631', to_date('30/05/2000', 'dd/mm/yyyy'), NULL, 'https://dominio.extension/eva1.pdf', 'AP', 'Cumple correctamente con todos los objetivos', 45658);
/*b*/


/*precio negativo en articulo*/
INSERT INTO articulo (id, descripcion, caracteristicas, estado, foto, precio, disponible) VALUES (1565484000, 'Camiseta Hombre', '(L, lana, Rojo)', 'U', 'https://dominio1.extension1/camisaroja.pdf', -750, 'SI');


/*Fecha erronea en usuario*/
INSERT INTO usuario (codigo, tid, nid, nombre, programa, correo, registro, suspension, nSuspensiones) VALUES (1000000001, 'CC', 1000054291, 'Jaime Rodriguez', 'Medicina', 'jaime1234@hotmail.com', TO_DATE('23/05/2010', 'DD/MM/YYYY'), NULL, 0);
/*b*/













