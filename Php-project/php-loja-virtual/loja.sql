-- Banco de Dados: Loja

-- Estrutura da tabela admin

CREATE TABLE admin (
	cod_admin int(12) NOT NULL auto_increment,
	login varchar(12) default NULL,
	senha varchar(12) default NULL,
	PRIMARY KEY (cod_admin)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Inserindo dados da tabela admin

INSERT INTO admin VALUES (1,'admin','admin');


----------------------------------------------

-- Estrutura da tabela categorias

CREATE TABLE categorias (
	cod_cat int(11) NOT NULL auto_increment,
	nome_cat varchar(60) default NULL,
	PRIMARY KEY (cod_cat)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Inserindo dados da tabela categorias

INSERT INTO categorias VALUES (1,'DVDs Filmes');
INSERT INTO categorias VALUES (2,'DVDs Shows');


----------------------------------------------

-- Estrutura da tabela compras

CREATE TABLE compras (
	cod_compra int(11) NOT NULL auto_increment,
	nome_prod varchar(120) default NULL,
	valor float,
	quantidade int(10) default NULL,
	id_temp varchar(60) default NULL,
	form_pag varchar(20) default NULL,
	status varchar(10) default 'nao',
	cod_usuario int(11) default NULL,
	valor_compra float,
	total_compra float,
	data_compra varchar(16) default NULL,
	PRIMARY KEY (cod_compra)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;	


----------------------------------------------

-- Estrutura da tabela produtos

CREATE TABLE produtos (
	cod_prod int(11) NOT NULL auto_increment,
	nome_prod varchar(60) default NULL,
	descricao text,
	fot_peq varchar(60) default NULL,
	fot_1 varchar(60) default NULL,
	valor float,
	destaque varchar(60) default NULL,
	cod_cat int(60) default NULL,
	PRIMARY KEY (cod_prod)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


---------------------------------------------

-- Estrutura da tabela usuarios

CREATE TABLE usuarios (
	cod_usuario int(11) NOT NULL auto_increment,
	nome varchar(120) default NULL,
	email varchar(60) default NULL,
	senha varchar(60) default NULL,
	endereco text,
	cidade varchar(60) default NULL,
	cep varchar(10) default NULL,
	estado varchar(10) default NULL,
	pais varchar(60) default NULL,
	autoriza varchar(6) default NULL,
	nome_cartao varchar(120) default NULL,
	cartao varchar(12) default NULL,
	cartao_numero varchar(60) default NULL,
	cartao_cvc varchar(10) default NULL,
	cartao_data varchar(60) default NULL,
	status varchar(4) default 'nao',
	form_pag varchar (60) default NULL,
	data_compra varchar(16) default NULL,
	PRIMARY KEY (cod_usuario)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;