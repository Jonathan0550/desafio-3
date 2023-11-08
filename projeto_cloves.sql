CREATE TABLE `clientes` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(255),
  `email` VARCHAR(255),
  `telefone` VARCHAR(20),
  `endereco` VARCHAR(255)
);

CREATE TABLE `produtos` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(255),
  `descricao` TEXT,
  `preco` DECIMAL(10, 2)
);

CREATE TABLE `pedidos` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `cliente_id` INT,
  `data_pedido` DATE
);

CREATE TABLE `itens_pedido` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `pedido_id` INT,
  `produto_id` INT,
  `quantidade` INT
);

CREATE TABLE `socios` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `cliente_id` INT,
  `data_admissao` DATE
);

CREATE TABLE `historico_pedidos_socios` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `socio_id` INT,
  `pedido_id` INT
);

ALTER TABLE `pedidos` ADD FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

ALTER TABLE `itens_pedido` ADD FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`);

ALTER TABLE `itens_pedido` ADD FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

ALTER TABLE `socios` ADD FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

ALTER TABLE `historico_pedidos_socios` ADD FOREIGN KEY (`socio_id`) REFERENCES `socios` (`id`);

ALTER TABLE `historico_pedidos_socios` ADD FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`);
