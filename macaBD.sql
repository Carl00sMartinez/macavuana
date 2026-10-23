
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido_p VARCHAR(50) NOT NULL,
    apellido_m VARCHAR(50),
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(18) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    pie DECIMAL(4,1)
);

CREATE TABLE Direccion (
    id_direccion INT AUTO_INCREMENT PRIMARY KEY,
    calle VARCHAR(100) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    colonia VARCHAR(60) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    CP CHAR(5) NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON DELETE CASCADE
);

CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    entrega_estimada DATE NOT NULL,
    envio DECIMAL(8,2) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    estado_pedido VARCHAR(20) DEFAULT 'Pendiente',
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Rastreo (
    id_rastreo INT AUTO_INCREMENT PRIMARY KEY,
    actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    artesano VARCHAR(60),
    id_pedido INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

CREATE TABLE Personalizacion (
    id_personalizacion INT AUTO_INCREMENT PRIMARY KEY,
    piel VARCHAR(50) NOT NULL,
    color VARCHAR(40) NOT NULL,
    suela VARCHAR(50) NOT NULL,
    arco BOOLEAN DEFAULT TRUE,
    patron VARCHAR(50) NOT NULL,
    grabado VARCHAR(4),
    costo DECIMAL(10,2) DEFAULT 0.00
);

CREATE TABLE Modelo (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_modelo VARCHAR(60) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    bajo_pedido BOOLEAN DEFAULT TRUE,
    url_foto VARCHAR(255)
);

CREATE TABLE Variante (
    id_variante INT AUTO_INCREMENT PRIMARY KEY,
    talla DECIMAL(3,1) NOT NULL,
    horma VARCHAR(20) NOT NULL,
    stock INT DEFAULT 0,
    id_modelo INT NOT NULL,
    FOREIGN KEY (id_modelo) REFERENCES Modelo(id_modelo) ON DELETE CASCADE
);

CREATE TABLE Detalle_pedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    cantidad INT NOT NULL CHECK (cantidad >= 1),
    id_pedido INT NOT NULL,
    id_variante INT NULL,
    id_personalizacion INT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_variante) REFERENCES Variante(id_variante),
    FOREIGN KEY (id_personalizacion) REFERENCES Personalizacion(id_personalizacion)
);