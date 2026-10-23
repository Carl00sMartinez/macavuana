-- Base de Datos para Calzado Artesanal "Macavuana"

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50),
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(18) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    medida_pie_cm DECIMAL(4,1),
    tipo_horma_pref ENUM('Estrecha', 'Estándar', 'Ancha') DEFAULT 'Estándar'
);

CREATE TABLE direccion_envio (
    id_direccion INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    calle_numero VARCHAR(100) NOT NULL,
    colonia VARCHAR(60) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    codigo_postal CHAR(5) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE
);

CREATE TABLE modelo (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_modelo VARCHAR(60) NOT NULL,
    descripcion TEXT,
    precio_base DECIMAL(10,2) NOT NULL,
    es_bajo_pedido BOOLEAN DEFAULT TRUE,
    foto_url VARCHAR(255)
);

CREATE TABLE variante_inventario (
    id_variante INT AUTO_INCREMENT PRIMARY KEY,
    id_modelo INT NOT NULL,
    talla_cm DECIMAL(3,1) NOT NULL,
    tipo_horma ENUM('Estrecha', 'Estándar', 'Ancha') NOT NULL,
    stock_disponible INT DEFAULT 0,
    FOREIGN KEY (id_modelo) REFERENCES modelo(id_modelo) ON DELETE CASCADE
);

CREATE TABLE personalizacion (
    id_personalizacion INT AUTO_INCREMENT PRIMARY KEY,
    tipo_piel VARCHAR(50) NOT NULL,
    color_piel VARCHAR(40) NOT NULL,
    tipo_suela VARCHAR(50) NOT NULL,
    soporte_arco BOOLEAN DEFAULT TRUE,
    tono_hilo VARCHAR(30) NOT NULL,
    grabado_iniciales VARCHAR(4),
    precio_extra DECIMAL(10,2) DEFAULT 0.00
);

CREATE TABLE producto_complementario (
    id_complemento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0
);

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_estimada_entrega DATE NOT NULL,
    costo_envio DECIMAL(8,2) NOT NULL,
    monto_total DECIMAL(10,2) NOT NULL,
    estado_pago VARCHAR(20) DEFAULT 'Pendiente',
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE detalle_pedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_variante INT NULL,
    id_personalizacion INT NULL,
    id_complemento INT NULL,
    cantidad INT NOT NULL CHECK (cantidad >= 1),
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_variante) REFERENCES variante_inventario(id_variante),
    FOREIGN KEY (id_personalizacion) REFERENCES personalizacion(id_personalizacion),
    FOREIGN KEY (id_complemento) REFERENCES producto_complementario(id_complemento)
);

CREATE TABLE etapa_taller (
    id_etapa INT PRIMARY KEY,
    nombre_etapa VARCHAR(50) NOT NULL,
    orden_secuencia INT NOT NULL
);

CREATE TABLE rastreo_pedido (
    id_rastreo INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_etapa INT NOT NULL,
    fecha_hora_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    artesano_responsable VARCHAR(60),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_etapa) REFERENCES etapa_taller(id_etapa)
);