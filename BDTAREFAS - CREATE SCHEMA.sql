CREATE SCHEMA IF NOT EXISTS BDTAREFAS;

USE BDTAREFAS;

CREATE TABLE IF NOT EXISTS USUARIOS (ID INT UNSIGNED NOT NULL,
					   NOME VARCHAR(80) NOT NULL,
                       EMAIL VARCHAR(80) NOT NULL,
                       SENHA VARCHAR(80) NOT NULL,
                       FOTO VARCHAR(40),
                       NIVEL INT(1) NOT NULL,
                       TOKEN CHAR(32),
                       DATA_CADASTRO DATETIME NOT NULL,
                       CPF CHAR(14),
                       CONSTRAINT PK_USUARIOS
                       PRIMARY KEY (ID),
                       CONSTRAINT UNQ_EMAIL_USUARIO unique(EMAIL),
    						  CONSTRAINT UNQ_CPF_USUARIO unique(CPF)
							  );
CREATE TABLE IF NOT EXISTS TAREFAS ( ID INT NOT NULL,
									 TAREFA VARCHAR(200) NOT NULL,
                                     DESCRICAO TEXT,
                                     PRIORIDADE CHAR(10) NOT NULL,
                                     STATUS INT(1) NOT NULL,
                                     USUARIO_ID INT UNSIGNED NOT NULL ,
                                     DATA_CADASTRO DATETIME,
                                     CONSTRAINT PK_TAREFAS
                                     PRIMARY KEY (ID),
                                     CONSTRAINT FK_USUARIOS_TAREFAS
									 FOREIGN KEY (USUARIO_ID)
                                     REFERENCES USUARIOS(ID)
									);