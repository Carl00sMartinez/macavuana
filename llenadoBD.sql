-- USE macavuana_db;

-- 1. POBLAR TABLA: Cliente (Integrantes del equipo)
INSERT INTO Cliente (id_cliente, nombre, apellido_p, apellido_m, correo, telefono, contrasena, pie) VALUES
(1, 'Italia Zoé', 'Barrón', 'Reyes', 'italia.barron@cua.uam.mx', '5522230285', 'Password123!', 24.5),
(2, 'Carlos Alberto', 'Martínez', 'Arévalo', 'carlos.martinez@cua.uam.mx', '5522230283', 'SecurePass456!', 27.0),
(3, 'Brandon Alexis', 'Duran', 'Zambrano', 'al2173075068@azc.uam.mx', '5521730750', 'AdminPass789!', 28.0);

-- 2. POBLAR TABLA: Direccion (Direcciones asociadas a cada integrante)
INSERT INTO Direccion (id_direccion, calle, numero, colonia, estado, CP, id_cliente) VALUES
(1, 'Av. Vasco de Quiroga', 4871, 'Santa Fe', 'Ciudad de México', '05348', 1),
(2, 'Prolongación Canal de Miramontes', 3855, 'Ex-Hacienda San Juan de Dios', 'Ciudad de México', '14387', 2),
(3, 'Av. San Pablo', 180, 'Reynosa Tamaulipas', 'Ciudad de México', '02200', 3);

-- 3. POBLAR TABLA: Modelo (Catálogo base del calzado Macavuana)
INSERT INTO Modelo (id_modelo, nombre_modelo, descripcion, precio, bajo_pedido, url_foto) VALUES
(1, 'Huarache Artesanal Tejido', 'Zapato tradicional de piel vacuno tejido a mano por artesanos locales.', 1250.00, TRUE, 'https://macavuana.com/img/huarache_tejido.jpg'),
(2, 'Mocasín Confort Macavuana', 'Mocasín ergonómico de piel suave con plantilla adaptativa.', 1450.00, FALSE, 'https://macavuana.com/img/mocasin_confort.jpg');

-- 4. POBLAR TABLA: Variante (Tallas y stock por modelo)
INSERT INTO Variante (id_variante, talla, horma, stock, id_modelo) VALUES
(1, 24.5, 'Estándar', 10, 1),
(2, 27.0, 'Ancha', 5, 1),
(3, 28.0, 'Estándar', 8, 2);

-- 5. POBLAR TABLA: Personalizacion (Opciones de diseño a la medida)
INSERT INTO Personalizacion (id_personalizacion, piel, color, suela, arco, patron, grabado, costo) VALUES
(1, 'Vacuno Curtido', 'Café Mezquite', 'Cuero Legítimo', TRUE, 'Espiga Tradicional', 'IZBR', 250.00),
(2, 'Gamuza', 'Azul Marino', 'Ergonómica', TRUE, 'Tejido Cruzado', 'CAMA', 300.00),
(3, 'Vacuno Suave', 'Negro Mate', 'Goma Antiderrapante', FALSE, 'Liso Clásico', 'BADZ', 150.00);

-- 6. POBLAR TABLA: Pedido (Pedidos realizados por los integrantes)
INSERT INTO Pedido (id_pedido, fecha, entrega_estimada, envio, total, estado_pedido, id_cliente) VALUES
(1, '2026-10-10 10:30:00', '2026-10-25', 150.00, 1650.00, 'En Producción', 1),
(2, '2026-10-12 14:15:00', '2026-10-27', 150.00, 1900.00, 'Pendiente', 2),
(3, '2026-10-14 09:00:00', '2026-10-28', 150.00, 1750.00, 'Enviado', 3);

-- 7. POBLAR TABLA: Detalle_pedido (Relación entre Pedidos, Variantes y Personalizaciones)
INSERT INTO Detalle_pedido (id_detalle, cantidad, id_pedido, id_variante, id_personalizacion) VALUES
(1, 1, 1, 1, 1),
(2, 1, 2, 2, 2),
(3, 1, 3, 3, 3);

-- 8. POBLAR TABLA: Rastreo (Bitácora de producción con artesanos asignados)
INSERT INTO Rastreo (id_rastreo, actualizacion, artesano, id_pedido) VALUES
(1, '2026-10-11 08:00:00', 'Artesano Carlos Martínez', 1),
(2, '2026-10-13 09:30:00', 'Artesana Italia Barrón', 2),
(3, '2026-10-15 11:00:00', 'Artesano Brandon Duran', 3);