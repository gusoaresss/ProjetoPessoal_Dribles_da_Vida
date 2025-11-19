SHOW DATABASES;

USE DRIBLES;
DROP DATABASE DRIBLES;

CREATE TABLE usuario (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(200) NOT NULL,
	email VARCHAR(200) NOT NULL UNIQUE,
	senha_hash VARCHAR(255) NOT NULL,
	cpf VARCHAR(20) UNIQUE
);

CREATE TABLE quiz(
id_quiz INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(200) NOT NULL,
descricao VARCHAR(200)
);

CREATE TABLE perguntas(
id_pergunta INT AUTO_INCREMENT PRIMARY KEY,
id_quiz INT NOT NULL,
texto_pergunta VARCHAR(300) NOT NULL,
FOREIGN KEY (id_quiz) REFERENCES quiz(id_quiz)
);

CREATE TABLE alternativas(
id_alternativa INT AUTO_INCREMENT PRIMARY KEY,
id_pergunta INT NOT NULL,
texto_alternativa VARCHAR(255) NOT NULL,
correta TINYINT (1) NOT NULL DEFAULT 0,
FOREIGN KEY (id_pergunta) REFERENCES perguntas(id_pergunta)
);


CREATE TABLE respostas_usuario(
id_resposta INT AUTO_INCREMENT PRIMARY KEY,
id_tentativa INT NOT NULL,
id_pergunta INT NOT NULL,
id_alternativa INT NULL,
FOREIGN KEY(id_tentativa) REFERENCES usuarios_quiz(id_tentativa),
FOREIGN KEY (id_pergunta) REFERENCES perguntas(id_pergunta),
FOREIGN KEY (id_alternativa) REFERENCES alternativas(id_alternativa)
);

CREATE TABLE usuario_quiz(
id_tentativa INT AUTO_INCREMENT PRIMARY KEY,
id_usuario INT NOT NULL,
id_quiz INT NOT NULL,
pontuacao INT,
data_tentativa DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
FOREIGN KEY (id_quiz) REFERENCES quiz(id_quiz)
);











