USE banco;

CREATE TABLE tb_usuarios (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(45) NOT NULL,
  senha VARCHAR(8) NOT NULL,
  nome_usuario VARCHAR(45) NOT NULL,
  data_nascimento DATE NOT NULL,
  contato_usuario BIGINT(11) NOT NULL,
  cpf BIGINT(11) NOT NULL,
  ativo CHAR(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (id_usuario),
  CONSTRAINT ck_tb_usuarios_data
    CHECK (data_nascimento >= '1923-01-01')
);

CREATE TABLE tb_cidades (
  id_cidade INT NOT NULL AUTO_INCREMENT,
  nome_cidade VARCHAR(50) NOT NULL,
  estado_ibge INT NOT NULL,
  id_usuario INT NOT NULL,
  PRIMARY KEY (id_cidade),
  CONSTRAINT fk_tb_cidades_id_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES tb_usuarios (id_usuario),
  CONSTRAINT ck_tb_cidades_estadocid
    CHECK (estado_ibge IN (4104808))
);

CREATE TABLE tb_compras (
  id_compra INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  data_compra DATE NOT NULL,
  PRIMARY KEY (id_compra),
  CONSTRAINT fk_tb_compras_id_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES tb_usuarios (id_usuario),
  CONSTRAINT ck_tb_compras_data
    CHECK (data_compra >= '1923-01-01')
);

CREATE TABLE tb_produtos (
  id_produto INT NOT NULL AUTO_INCREMENT,
  nome_produto VARCHAR(45) NOT NULL,
  preco_produto FLOAT NOT NULL,
  descricao_produto VARCHAR(90) NOT NULL,
  info_produto VARCHAR(90) NOT NULL,
  foto_tab_nutricional VARCHAR(100) NOT NULL,
  ativo CHAR(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (id_produto)
);

CREATE TABLE tb_carrinho (
  id_compra INT NOT NULL,
  id_produto INT NOT NULL,
  preco_produto FLOAT NULL,
  qtd INT NULL,
  PRIMARY KEY (id_compra, id_produto),
  CONSTRAINT fk_tb_carrinho_id_compra
    FOREIGN KEY (id_compra)
    REFERENCES tb_compras (id_compra),
  CONSTRAINT fk_tb_carrinho_id_produto
    FOREIGN KEY (id_produto)
    REFERENCES tb_produtos (id_produto)
);

CREATE TABLE tb_categorias (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  id_produto INT NOT NULL,
  nome_categoria VARCHAR(45) NOT NULL,
  ativo CHAR(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (id_categoria),
  CONSTRAINT fk_tb_categorias_id_produto
    FOREIGN KEY (id_produto)
    REFERENCES tb_produtos (id_produto)
);