-- SQLite
/*
CREATE TABLE mainapp_category(
    name VARCHAR(50) PRIMARY KEY,
    color VARCHAR(10),
    icon VARCHAR(50)
);

CREATE TABLE mainapp_trivia (
    triviaID CHAR(20) PRIMARY KEY,
    questionType CHAR(10) CHECK (questionType IN ('text', 'image', 'audio')),
    questionText VARCHAR(200),
    questionImage VARCHAR(50),
    questionAudio VARCHAR(50),
    categoryID INTEGER REFERENCES Category (name) ON DELETE CASCADE
);

CREATE TABLE mainapp_answer (
    answerID CHAR(20) PRIMARY KEY,
    answerType CHAR(10) CHECK (answerType IN ('text', 'image')),
    answerText VARCHAR(200),
    answerImage VARCHAR(50),
    correctAnswer BOOLEAN,
    triviaID INTEGER REFERENCES Trivia (trivia_id) ON DELETE CASCADE
);

INSERT INTO "main"."mainapp_user" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('1', 'pbkdf2_sha256$720000$EPIBhScIK1uJXsZELmLGiw$i1noGlSLs0YWo5sW581z5bcA7z8/Fh9HJ6nwWUObQio=', 'www.juan201@gmail.com', 'Jupaenriro', 'Venezuela', 'Distrito Capital', 'Av. La Paz, Edificio Simari Piso 6, Apartamento 11', '1', '1', '1', '2024-07-23 02:48:27', '2024-07-23 02:49:46');
*/


-- Inserciones actualizadas de Category

INSERT INTO "main"."" ("name", "color", "icon", "barVector", "questionVector") VALUES ('Arte', '#C0452A', 'Trivias/arte/arteIcon.png', 'Trivias/arte/Arte_Barra.png', 'Trivias/arte/Arte_Pregunta.png');
INSERT INTO "main"."" ("name", "color", "icon", "barVector", "questionVector") VALUES ('Ciencia', '#504673', 'Trivias/ciencia/cienciaIcon.png', 'Trivias/ciencia/Ciencia_Barra.png', 'Trivias/ciencia/Ciencia_Pregunta.png');
INSERT INTO "main"."" ("name", "color", "icon", "barVector", "questionVector") VALUES ('Cultura General', '#60AAEB', 'Trivias/culturaGeneral/culturaGeneralIcon.png', 'Trivias/culturaGeneral/CulturaGeneral_Barra.png', 'Trivias/culturaGeneral/CulturaGeneral_Pregunta.png');
INSERT INTO "main"."" ("name", "color", "icon", "barVector", "questionVector") VALUES ('Deporte', '#922C3F', 'Trivias/deporte/deporteIcon.png', 'Trivias/deporte/Deporte_Barra.png', 'Trivias/deporte/Deporte_Pregunta.png');
INSERT INTO "main"."" ("name", "color", "icon", "barVector", "questionVector") VALUES ('Entretenimiento', '#D76950', 'Trivias/entretenimiento/entretenimientoIcon.png', 'Trivias/entretenimiento/Entretenimiento_Barra.png', 'Trivias/entretenimiento/Entretenimiento_Pregunta.png');
INSERT INTO "main"."" ("name", "color", "icon", "barVector", "questionVector") VALUES ('Geografía', '#4D7EA9', 'Trivias/geografia/geografiaIcon.png', 'Trivias/geografia/Geografia_Barra.png', 'Trivias/geografia/Geografia_Pregunta.png');
INSERT INTO "main"."" ("name", "color", "icon", "barVector", "questionVector") VALUES ('Historia', '#BE5568', 'Trivias/historia/historiaIcon.png', 'Trivias/historia/Historia_Barra.png', 'Trivias/historia/Historia_Pregunta.png');
INSERT INTO "main"."" ("name", "color", "icon", "barVector", "questionVector") VALUES ('Música', '#9388BA', 'Trivias/musica/musicaIcon.png', 'Trivias/musica/Musica_Barra.png', 'Trivias/musica/Musica_Pregunta.png');


-- ARTE

INSERT INTO mainapp_trivia(triviaID, questionType, questionText, questionImage, questionAudio, category_id)
VALUES ('1', 'text', '¿Quién pintó la famosa obra "La Gioconda" o "Mona Lisa"?', NULL, NULL, 'Arte'),
    ('2', 'text', '¿Cuál es el movimiento artístico que se caracterizó por el uso de colores vivos, formas simples y la representación de objetos cotidianos?', NULL, NULL, 'Arte'),
    ('3', 'text', '¿Cuál es la técnica artística que consiste en rayar una superficie para crear una imagen?', NULL, NULL, 'Arte'),
    ('4', 'text', '¿Quién pintó el cuadro "El Grito"?', NULL, NULL, 'Arte'),
    ('5', 'text', '¿Cuál es el movimiento artístico que se caracterizó por la representación del inconsciente y los sueños?', NULL, NULL, 'Arte'),
    ('6', 'text', '¿En qué ciudad se encuentra el famoso museo del Louvre?', NULL, NULL, 'Arte'),
    ('7', 'text', '¿Cuál es la técnica artística que consiste en esculpir en piedra?', NULL, NULL, 'Arte'),
    ('8', 'text', '¿Quién fue uno de los principales exponentes del cubismo junto a Pablo Picasso?', NULL, NULL, 'Arte'),
    ('9', 'text', '¿Cuál es el movimiento artístico que se caracterizó por la representación de la luz y el color al aire libre?', NULL, NULL, 'Arte'),
    ('10', 'image', '¿Quién pintó este cuadro?', 'Trivias/arte/pregunta10/pregunta.png', NULL, 'Arte');

INSERT INTO mainapp_answer(answerID, answerType, answerText, answerImage, correctAnswer, trivia_id)
VALUES ('1', 'text', 'Vincent van Gogh', NULL, False, '1'),
    ('2', 'text', 'Pablo Picasso', NULL, False, '1'),
    ('3', 'text', 'Leonardo da Vinci', NULL, True, '1'),
    ('4', 'text', 'Michelangelo', NULL, False, '1'),
    ('5', 'text', 'Impresionismo', NULL, False, '2'),
    ('6', 'text', 'Cubismo', NULL, False, '2'),
    ('7', 'text', 'Pop Art', NULL, True, '2'),
    ('8', 'text', 'Surrealismo', NULL, False, '2'),
    ('9', 'text', 'Escultura', NULL, False, '3'),
    ('10', 'text', 'Grabado', NULL, True, '3'),
    ('11', 'text', 'Pintura', NULL, False, '3'),
    ('12', 'text', 'Dibujo', NULL, False, '3'),
    ('13', 'text', 'Edvard Munch', NULL, True, '4'),
    ('14', 'text', 'Vincent van Gogh', NULL, False, '4'),
    ('15', 'text', 'Pablo Picasso', NULL, False, '4'),
    ('16', 'text', 'Salvador Dalí', NULL, False, '4'),
    ('17', 'text', 'Impresionismo', NULL, False, '5'),
    ('18', 'text', 'Cubismo', NULL, False, '5'),
    ('19', 'text', 'Surrealismo', NULL, True, '5'),
    ('20', 'text', 'Pop Art', NULL, False, '5'),
    ('21', 'text', 'Roma', NULL, False, '6'),
    ('22', 'text', 'Nueva York', NULL, False, '6'),
    ('23', 'text', 'París', NULL, True, '6'),
    ('24', 'text', 'Londres', NULL, False, '6'),
    ('25', 'text', 'Cerámica', NULL, False, '7'),
    ('26', 'text', 'Escultura', NULL, True, '7'),
    ('27', 'text', 'Pintura', NULL, False, '7'),
    ('28', 'text', 'Dibujo', NULL, False, '7'),
    ('29', 'text', 'Vincent van Gogh', NULL, False, '8'),
    ('30', 'text', 'Georges Braque', NULL, True, '8'),
    ('31', 'text', 'Salvador Dalí', NULL, False, '8'),
    ('32', 'text', 'Claude Monet', NULL, False, '8'),
    ('33', 'text', 'Impresionismo', NULL, True, '9'),
    ('34', 'text', 'Cubismo', NULL, False, '9'),
    ('35', 'text', 'Surrealismo', NULL, False, '9'),
    ('36', 'text', 'Pop Art', NULL, False, '9'),
    ('37', 'text', 'Edvard Munch', NULL, True, '10'),
    ('38', 'text', 'Vincent van Gogh', NULL, False, '10'),
    ('39', 'text', 'Pablo Picasso', NULL, False, '10'),
    ('40', 'text', 'Salvador Dalí', NULL, False, '10');
    

-- Ciencia

INSERT INTO mainapp_trivia(triviaID, questionType, questionText, questionImage, questionAudio, category_id)
VALUES ('11', 'text', '¿Cuál es el planeta más grande del sistema solar?', NULL, NULL,  'Ciencia'),
    ('12', 'text',  '¿Cuál es la unidad básica de la vida?', NULL, NULL,  'Ciencia'),
    ('13', 'text', '¿Quién formuló la teoría de la relatividad?', NULL, NULL,  'Ciencia'),
    ('14', 'text', '¿Cuál es el estado de la materia en el que las partículas tienen mayor energía cinética?', NULL, NULL,  'Ciencia'),
    ('15', 'text', '¿Qué tipo de reacción química libera energía?', NULL, NULL,  'Ciencia'),
    ('16', 'text', '¿Cuál es el órgano más grande del cuerpo humano?', NULL, NULL,  'Ciencia'),
    ('17', 'text', '¿Cuál es la función principal del ADN?', NULL, NULL,  'Ciencia'),
    ('18', 'text', '¿Qué científico es conocido por sus leyes del movimiento?', NULL, NULL,  'Ciencia'),
    ('19', 'text', '¿Cuál es el proceso por el cual las plantas convierten la luz solar en energía?', NULL, NULL,  'Ciencia'),
    ('20', 'image', 'Dada la siguiente imagen, ¿A cuál ley de Newton hace alusión? ', 'Trivias/ciencia/pregunta10/pregunta.png', NULL,  'Ciencia');
    
INSERT INTO mainapp_answer(answerID, answerType, answerText, answerImage, correctAnswer, trivia_id)
VALUES ('41', 'text', 'Marte', NULL, False, '11'),
    ('42', 'text', 'Júpiter', NULL, True, '11'),
    ('43', 'text', 'Saturno', NULL, False, '11'),
    ('44', 'text', 'Neptuno', NULL, False, '11'),
    ('45', 'text', 'El átomo', NULL, False, '12'),
    ('46', 'text', 'La molécula', NULL, False, '12'),
    ('47', 'text', 'La célula', NULL, True, '12'),
    ('48', 'text', 'El tejido', NULL, False, '12'),
    ('49', 'text', 'Isaac Newton', NULL, False, '13'),
    ('50', 'text', 'Albert Einstein', NULL, True, '13'),
    ('51', 'text', 'Galileo Galilei', NULL, False, '13'),
    ('52', 'text', 'Stephen Hawking', NULL, False, '13'),
    ('53', 'text', 'Sólido', NULL, False, '14'),
    ('54', 'text', 'Líquido', NULL, False, '14'),
    ('55', 'text', 'Gaseoso', NULL, False, '14'),
    ('56', 'text', 'Plasma', NULL, True, '14'),
    ('57', 'text', 'Endotérmica', NULL, False, '15'),
    ('58', 'text', 'Exotérmica', NULL, True, '15'),
    ('59', 'text', 'Isotérmica', NULL, False, '15'),
    ('60', 'text', 'Adiabática', NULL, False, '15'),
    ('61', 'text', 'El corazón', NULL, False, '16'),
    ('62', 'text', 'El cerebro', NULL, False, '16'),
    ('63', 'text', 'La piel', NULL, True, '16'),
    ('64', 'text', 'Los pulmones', NULL, False, '16'),
    ('65', 'text', 'Producir energía', NULL, False, '17'),
    ('66', 'text', 'Almacenar información genética', NULL, True, '17'),
    ('67', 'text', 'Transportar oxígeno', NULL, False, '17'),
    ('68', 'text', 'Regular la temperatura corporal', NULL, False, '17'),
    ('69', 'text', 'Charles Darwin', NULL, False, '18'),
    ('70', 'text', 'Marie Curie', NULL, False, '18'),
    ('71', 'text', 'Isaac Newton', NULL, True, '18'),
    ('72', 'text', 'Albert Einstein', NULL, False, '18'),
    ('73', 'text', 'Respiración', NULL, False, '19'),
    ('74', 'text', 'Fotosíntesis', NULL, True, '19'),
    ('75', 'text', 'Fermentación', NULL, False, '19'),
    ('76', 'text', 'Transpiración', NULL, False, '19'),
    ('77', 'text', 'Primera', NULL, False, '20'),
    ('78', 'text', 'Segunda', NULL, False, '20'),
    ('79', 'text', 'Tercera', NULL, True, '20'),
    ('80', 'text', 'Ninguna', NULL, False, '20');
    

-- Cultura General

INSERT INTO mainapp_trivia(triviaID, questionType, questionText, questionImage, questionAudio, category_id)
VALUES ('21', 'text', '¿Cuál es el país más grande del mundo en extensión territorial?', NULL, NULL,  'Cultura General'),
    ('22', 'text', '¿Quién escribió la obra "Don Quijote de la Mancha"?', NULL, NULL,  'Cultura General'),
    ('23', 'text', '¿Cuál es el océano más grande del mundo?', NULL, NULL,  'Cultura General'),
    ('24', 'text', '¿En qué continente se encuentra la pirámide de Giza?', NULL, NULL,  'Cultura General'),
    ('25', 'text', '¿Cuál es la capital de Australia?', NULL, NULL,  'Cultura General'),
    ('26', 'text', '¿Quién pintó la obra "La noche estrellada"?', NULL, NULL,  'Cultura General'),
    ('27', 'text', '¿Cuál es el metal más abundante en la corteza terrestre?', NULL, NULL,  'Cultura General'),
    ('28', 'text', '¿En qué año ocurrió la Revolución Francesa?', NULL, NULL,  'Cultura General'),
    ('29', 'text', '¿Cuál de las siguientes es una de las 7 maravillas del mundo moderno?', NULL, NULL,  'Cultura General'),
    ('30', 'text', '¿Cuál es el animal terrestre más rápido del mundo?', NULL, NULL,  'Cultura General');

INSERT INTO mainapp_answer(answerID, answerType, answerText, answerImage, correctAnswer, trivia_id)
VALUES ('81', 'text', 'Canadá', NULL, False, '21'),
    ('82', 'text', 'Rusia', NULL, True, '21'),
    ('83', 'text', 'Estados Unidos', NULL, False, '21'),
    ('84', 'text', 'China', NULL, False, '21'),
    ('85', 'text', 'Miguel de Cervantes', NULL, True, '22'),
    ('86', 'text', 'William Shakespeare', NULL, False, '22'),
    ('87', 'text', 'Dante Alighieri', NULL, False, '22'),
    ('88', 'text', 'Johann Wolfgang von Goethe', NULL, False, '22'),
    ('89', 'text', 'Océano Índico', NULL, False, '23'),
    ('90', 'text', 'Océano Atlántico', NULL, False, '23'),
    ('91', 'text', 'Océano Pacífico', NULL, True, '23'),
    ('92', 'text', 'Océano Ártico', NULL, False, '23'),
    ('93', 'text', 'Asia', NULL, False, '24'),
    ('94', 'text', 'América', NULL, False, '24'),
    ('95', 'text', 'África', NULL, True, '24'),
    ('96', 'text', 'Europa', NULL, False, '24'),
    ('97', 'text', 'Sydney', NULL, False, '25'),
    ('98', 'text', 'Melbourne', NULL, False, '25'),
    ('99', 'text', 'Canberra', NULL, True, '25'),
    ('100', 'text', 'Perth', NULL, False, '25'),
    ('101', 'text', 'Pablo Picasso', NULL, False, '26'),
    ('102', 'text', 'Vincent van Gogh', NULL, True, '26'),
    ('103', 'text', 'Claude Monet', NULL, False, '26'),
    ('104', 'text', 'Salvador Dalí', NULL, False, '26'),
    ('105', 'text', 'Oro', NULL, False, '27'),
    ('106', 'text', 'Plata', NULL, False, '27'),
    ('107', 'text', 'Hierro', NULL, True, '27'),
    ('108', 'text', 'Aluminio', NULL, False, '27'),
    ('109', 'text', '1789', NULL, True, '28'),
    ('110', 'text', '1848', NULL, False, '28'),
    ('111', 'text', '1776', NULL, False, '28'),
    ('112', 'text', '1917', NULL, False, '28'),
    ('113', 'text', 'Los Jardines Colgantes de Babilonia', NULL, False, '29'),
    ('114', 'text', 'La Gran Pirámide de Giza', NULL, False, '29'),
    ('115', 'text', 'Machu Picchu', NULL, True, '29'),
    ('116', 'text', 'El Faro de Alejandría', NULL, False, '29'),
    ('117', 'image', NULL, 'Trivias/culturaGeneral/pregunta10/respuestaCorrecta-guepardo.png', True, '30'),
    ('118', 'image', NULL, 'Trivias/culturaGeneral/pregunta10/respuesta-leon.png', False, '30'),
    ('119', 'image', NULL, 'Trivias/culturaGeneral/pregunta10/respuesta-mishiro.png', False, '30'),
    ('120', 'image', NULL, 'Trivias/culturaGeneral/pregunta10/respuesta-caballo.png', False, '30');


-- Deporte

INSERT INTO mainapp_trivia(triviaID, questionType, questionText, questionImage, questionAudio, category_id)
VALUES ('31', 'text', '¿Quién es considerado el mejor jugador de baloncesto de todos los tiempos?', NULL, NULL,  'Deporte'),
    ('32', 'text', '¿En qué deporte se utiliza un balón ovalado y se marcan tries?', NULL, NULL,  'Deporte'),
    ('33', 'text', '¿Cuál es el torneo de tenis más prestigioso del mundo?', NULL, NULL,  'Deporte'),
    ('34', 'text', '¿En qué actividad deportiva se utiliza una espada?', NULL, NULL,  'Deporte'),
    ('35', 'text', '¿Cuántos jugadores tiene un equipo de fútbol en la cancha durante un partido?', NULL, NULL,  'Deporte'),
    ('36', 'text', '¿Cuál es la distancia aproximada de una maratón?', NULL, NULL,  'Deporte'),
    ('37', 'text', '¿En qué deporte se utiliza un tablero y una red?', NULL, NULL,  'Deporte'),
    ('38', 'text', '¿Quién ganó la Copa del Mundo de Fútbol en 2018?', NULL, NULL,  'Deporte'),
    ('39', 'text', '¿En qué deporte se utiliza un guante y una pelota pequeña?', NULL, NULL,  'Deporte'),
    ('40', 'image', '¿Qué deporte es?', 'Trivias/deporte/pregunta10/pregunta.png', NULL,  'Deporte');

INSERT INTO mainapp_answer(answerID, answerType, answerText, answerImage, correctAnswer, trivia_id)
VALUES ('121', 'text', 'LeBron James', NULL, False, '31'),
    ('122', 'text', 'Michael Jordan', NULL, True, '31'),
    ('123', 'text', 'Kobe Bryant', NULL, False, '31'),
    ('124', 'text', 'Larry Bird', NULL, False, '31'),
    ('125', 'text', 'Rugby', NULL, True, '32'),
    ('126', 'text', 'Fútbol americano', NULL, False, '32'),
    ('127', 'text', 'Básquetbol', NULL, False, '32'),
    ('128', 'text', 'Vóleibol', NULL, False, '32'),
    ('129', 'text', 'Roland Garros', NULL, False, '33'),
    ('130', 'text', 'Wimbledon', NULL, False, '33'),
    ('131', 'text', 'US Open', NULL, False, '33'),
    ('132', 'text', 'Todos los anteriores', NULL, True, '33'),
    ('133', 'text', 'Kendo', NULL, False, '34'),
    ('134', 'text', 'Esgrima', NULL, False, '34'),
    ('135', 'text', 'Pentatlón moderno', NULL, False, '34'),
    ('136', 'text', 'Todas las anteriores', NULL, True, '34'),
    ('137', 'text', '10', NULL, False, '35'),
    ('138', 'text', '11', NULL, True, '35'),
    ('139', 'text', '12', NULL, False, '35'),
    ('140', 'text', '9', NULL, False, '35'),
    ('141', 'text', '21 km', NULL, False, '36'),
    ('142', 'text', '42 km', NULL, True, '36'),
    ('143', 'text', '50 km', NULL, False, '36'),
    ('144', 'text', '30 km', NULL, False, '36'),
    ('145', 'text', 'Bádminton', NULL, False, '37'),
    ('146', 'text', 'Tenis de mesa', NULL, False, '37'),
    ('147', 'text', 'Squash', NULL, False, '37'),
    ('148', 'text', 'Todas las anteriores', NULL, True, '37'),
    ('149', 'text', 'Alemania', NULL, False, '38'),
    ('150', 'text', 'Brasil', NULL, False, '38'),
    ('151', 'text', 'Francia', NULL, True, '38'),
    ('152', 'text', 'Argentina', NULL, False, '38'),
    ('153', 'text', 'Béisbol', NULL, False, '39'),
    ('154', 'text', 'Softbol', NULL, False, '39'),
    ('155', 'text', 'Cricket', NULL, False, '39'),
    ('156', 'text', 'Todas las anteriores', NULL, True, '39'),
    ('157', 'text', 'Judo', NULL, False, '40'),
    ('158', 'text', 'Boxeo', NULL, False, '40'),
    ('159', 'text', 'Karate', NULL, True, '40'),
    ('160', 'text', 'Enfrentamiento Ninja', NULL, False, '40');
    

-- Entretenimiento

INSERT INTO mainapp_trivia(triviaID, questionType, questionText, questionImage, questionAudio, category_id)
VALUES ('41', 'text', '¿Quién interpreta al personaje de Harry Potter en las películas?', NULL, NULL,  'Entretenimiento'),
    ('42', 'text', '¿Cuál de estos artistas es conocido por sus canciones de pop y su estilo excéntrico?', NULL, NULL,  'Entretenimiento'),
    ('43', 'text', '¿En qué saga cinematográfica aparece el personaje de Luke Skywalker?', NULL, NULL,  'Entretenimiento'),
    ('44', 'text', '¿Cuál de estas películas de Disney cuenta la historia de una joven que sueña con ser bailarina?', NULL, NULL,  'Entretenimiento'),
    ('45', 'text', '¿Quién es conocido como el "Rey del Pop"?', NULL, NULL,  'Entretenimiento'),
    ('46', 'text', '¿En qué saga literaria se encuentra el mundo mágico de Hogwarts?', NULL, NULL,  'Entretenimiento'),
    ('47', 'text', '¿Cuál de estas actrices es famosa por interpretar a personajes fuertes y empoderados en películas de acción?', NULL, NULL,  'Entretenimiento'),
    ('48', 'text', '¿Cuál de estos grupos musicales es considerado uno de los pioneros del rock and roll?', NULL, NULL,  'Entretenimiento'),
    ('49', 'text', '¿Cuál es el hechizo que permite a un mago hacer levitar objetos en la saga Harry Potter?', NULL, NULL,  'Entretenimiento'),
    ('50', 'audio', 'Escuche el audio y diga que personaje de Harry Potter dice la frase', NULL, 'Trivias/entretenimiento/pregunta10/pregunta.mp3', 'Entretenimiento');

INSERT INTO mainapp_answer(answerID, answerType, answerText, answerImage, correctAnswer, trivia_id)
VALUES ('161', 'text', 'Daniel Radcliffe', NULL, True, '41'),
    ('162', 'text', 'Rupert Grint', NULL, False, '41'),
    ('163', 'text', 'Emma Watson', NULL, False, '41'),
    ('164', 'text', 'Tom Felton', NULL, False, '41'),
    ('165', 'text', 'Bob Dylan', NULL, False, '42'),
    ('166', 'text', 'Lady Gaga', NULL, True, '42'),
    ('167', 'text', 'Freddie Mercury', NULL, False, '42'),
    ('168', 'text', 'John Lennon', NULL, False, '42'),
    ('169', 'text', 'Star Wars', NULL, True, '43'),
    ('170', 'text', 'Star Trek', NULL, False, '43'),
    ('171', 'text', 'El Señor de los Anillos', NULL, False, '43'),
    ('172', 'text', 'Harry Potter', NULL, False, '43'),
    ('173', 'text', 'La Bella y la Bestia', NULL, False, '44'),
    ('174', 'text', 'Cenicienta', NULL, False, '44'),
    ('175', 'text', 'La Sirenita', NULL, False, '44'),
    ('176', 'text', 'El Lago de los Cisnes', NULL, True, '44'),
    ('177', 'text', 'Michael Jackson', NULL, True, '45'),
    ('178', 'text', 'Elvis Presley', NULL, False, '45'),
    ('179', 'text', 'Prince', NULL, False, '45'),
    ('180', 'text', 'Justin Timberlake', NULL, False, '45'),
    ('181', 'text', 'Las Crónicas de Narnia', NULL, False, '46'),
    ('182', 'text', 'Harry Potter', NULL, True, '46'),
    ('183', 'text', 'El Señor de los Anillos', NULL, False, '46'),
    ('184', 'text', 'Percy Jackson', NULL, False, '46'),
    ('185', 'text', 'Scarlett Johansson', NULL, True, '47'),
    ('186', 'text', 'Jennifer Aniston', NULL, False, '47'),
    ('187', 'text', 'Reese Witherspoon', NULL, False, '47'),
    ('188', 'text', 'Julia Roberts', NULL, False, '47'),
    ('189', 'text', 'The Beatles', NULL, True, '48'),
    ('190', 'text', 'Nirvana', NULL, False, '48'),
    ('191', 'text', 'Backstreet Boys', NULL, False, '48'),
    ('192', 'text', 'One Direction', NULL, False, '48'),
    ('193', 'text', 'Wingardium Leviosa', NULL, True, '49'),
    ('194', 'text', 'Accio', NULL, False, '49'),
    ('195', 'text', 'Expecto patronum', NULL, False, '49'),
    ('196', 'text', 'Lumos', NULL, False, '49'),
    ('197', 'text', 'Albus Dumbledore', NULL, False, '50'),
    ('198', 'text', 'Sirius Black', NULL, True, '50'),
    ('199', 'text', 'Severus Snape', NULL, False, '50'),
    ('200', 'text', 'Darth Vader', NULL, False, '50');


-- Geografía

INSERT INTO mainapp_trivia(triviaID, questionType, questionText, questionImage, questionAudio, category_id)
VALUES ('51', 'text', '¿Cuál es el país más grande del mundo en términos de superficie?', NULL, NULL,  'Geografía'),
    ('52', 'text', '¿Qué continente alberga la selva amazónica?', NULL, NULL,  'Geografía'),
    ('53', 'text', '¿Cuál es el océano más grande de la Tierra?', NULL, NULL,  'Geografía'),
    ('54', 'text', '¿Cuál es la montaña más alta del mundo?', NULL, NULL,  'Geografía'),
    ('55', 'text', '¿Cuál es la capital de Australia?', NULL, NULL,  'Geografía'),
    ('56', 'text', '¿En qué continente se encuentra el desierto del Sahara?', NULL, NULL,  'Geografía'),
    ('57', 'text', '¿Cuál es el río más largo del mundo?', NULL, NULL,  'Geografía'),
    ('58', 'text', '¿Cuál es la ciudad más poblada del mundo?', NULL, NULL,  'Geografía'),
    ('59', 'text', '¿Qué país alberga la mayor parte de la selva del Congo?', NULL, NULL,  'Geografía'),
    ('60', 'text', '¿Cuál bandera es de Ecuador? ', NULL, NULL,  'Geografía');

INSERT INTO mainapp_answer(answerID, answerType, answerText, answerImage, correctAnswer, trivia_id)
VALUES ('201', 'text', 'Canadá', NULL, False, '51'),
    ('202', 'text', 'Rusia', NULL, True, '51'),
    ('203', 'text', 'Estados Unidos', NULL, False, '51'),
    ('204', 'text', 'China', NULL, False, '51'),
    ('205', 'text', 'África', NULL, False, '52'),
    ('206', 'text', 'Asia', NULL, False, '52'),
    ('207', 'text', 'Sudamérica', NULL, True, '52'),
    ('208', 'text', 'Oceanía', NULL, False, '52'),
    ('209', 'text', 'Océano Índico', NULL, False, '53'),
    ('210', 'text', 'Océano Atlántico', NULL, False, '53'),
    ('211', 'text', 'Océano Ártico', NULL, False, '53'),
    ('212', 'text', 'Océano Pacífico', NULL, True, '53'),
    ('213', 'text', 'Monte Kilimanjaro', NULL, False, '54'),
    ('214', 'text', 'Monte Everest', NULL, True, '54'),
    ('215', 'text', 'Aconcagua', NULL, False, '54'),
    ('216', 'text', 'Monte McKinley', NULL, False, '54'),
    ('217', 'text', 'Sydney', NULL, False, '55'),
    ('218', 'text', 'Melbourne', NULL, False, '55'),
    ('219', 'text', 'Canberra', NULL, True, '55'),
    ('220', 'text', 'Perth', NULL, False, '55'),
    ('221', 'text', 'Asia', NULL, False, '56'),
    ('222', 'text', 'América del Norte', NULL, False, '56'),
    ('223', 'text', 'África', NULL, True, '56'),
    ('224', 'text', 'Australia', NULL, False, '56'),
    ('225', 'text', 'Río Nilo', NULL, True, '57'),
    ('226', 'text', 'Río Amazonas', NULL, False, '57'),
    ('227', 'text', 'Río Mississippi', NULL, False, '57'),
    ('228', 'text', 'Río Yangtsé', NULL, False, '57'),
    ('229', 'text', 'Tokio', NULL, True, '58'),
    ('230', 'text', 'Nueva York', NULL, False, '58'),
    ('231', 'text', 'Ciudad de México', NULL, False, '58'),
    ('232', 'text', 'Shanghai', NULL, False, '58'),
    ('233', 'text', 'Nigeria', NULL, False, '59'),
    ('234', 'text', 'República Democrática del Congo', NULL, True, '59'),
    ('235', 'text', 'Sudán', NULL, False, '59'),
    ('236', 'text', 'Camerún', NULL, False, '59'),
    ('237', 'image', NULL, 'Trivias/geografia/pregunta10/Respuesta-Colombia.png', False, '60'),
    ('238', 'image', NULL, 'Trivias/geografia/pregunta10/Respuesta-Moldavia.png', False, '60'),
    ('239', 'image', NULL, 'Trivias/geografia/pregunta10/Respuesta-Venezuela.png', False, '60'),
    ('240', 'image', NULL, 'Trivias/geografia/pregunta10/RespuestaCorrecta-Ecuador.png', True, '60');


-- Historia

INSERT INTO mainapp_trivia(triviaID, questionType, questionText, questionImage, questionAudio, category_id)
VALUES ('61', 'text', '¿Quién fue el primer hombre en llegar a la Luna?', NULL, NULL,  'Historia'),
    ('62', 'text', '¿En qué año terminó la Segunda Guerra Mundial?', NULL, NULL,  'Historia'),
    ('63', 'text', '¿Cuál de estas civilizaciones antiguas construyó las pirámides de Egipto?', NULL, NULL,  'Historia'),
    ('64', 'text', '¿Quién pintó la Mona Lisa?', NULL, NULL,  'Historia'),
    ('65', 'text', '¿En qué siglo vivió Cristóbal Colón?', NULL, NULL,  'Historia'),
    ('66', 'text', '¿Cuál fue la causa principal de la Revolución Francesa?', NULL, NULL,  'Historia'),
    ('67', 'text', '¿Quién fue el primer presidente de los Estados Unidos?', NULL, NULL,  'Historia'),
    ('68', 'text', '¿En qué año cayó el Muro de Berlín?', NULL, NULL,  'Historia'),
    ('69', 'text', '¿Cuál de estas civilizaciones mesoamericanas creó un calendario muy preciso?', NULL, NULL,  'Historia'),
    ('70', 'text', '¿Quién de estos fue el primer presidente de los Estados Unidos?', NULL, NULL,  'Historia');
   
INSERT INTO mainapp_answer(answerID, answerType, answerText, answerImage, correctAnswer, trivia_id)
VALUES ('241', 'text', 'Neil Armstrong', NULL, True, '61'),
    ('242', 'text', 'Buzz Aldrin', NULL, False, '61'),
    ('243', 'text', 'Yuri Gagarin', NULL, False, '61'),
    ('244', 'text', 'Alan Shepard', NULL, False, '61'),
    ('245', 'text', '1942', NULL, False, '62'),
    ('246', 'text', '1945', NULL, True, '62'),
    ('247', 'text', '1939', NULL, False, '62'),
    ('248', 'text', '1950', NULL, False, '62'),
    ('249', 'text', 'Sumerios', NULL, False, '63'),
    ('250', 'text', 'Egipcios', NULL, True, '63'),
    ('251', 'text', 'Romanos', NULL, False, '63'),
    ('252', 'text', 'Mayas', NULL, False, '63'),
    ('253', 'text', 'Vincent van Gogh', NULL, False, '64'),
    ('254', 'text', 'Leonardo da Vinci', NULL, True, '64'),
    ('255', 'text', 'Pablo Picasso', NULL, False, '64'),
    ('256', 'text', 'Michelangelo', NULL, False, '64'),
    ('257', 'text', 'Siglo XV', NULL, True, '65'),
    ('258', 'text', 'Siglo XVII', NULL, False, '65'),
    ('259', 'text', 'Siglo XIX', NULL, False, '65'),
    ('260', 'text', 'Siglo XX', NULL, False, '65'),
    ('261', 'text', 'La Guerra de los Treinta Años', NULL, False, '66'),
    ('262', 'text', 'Las desigualdades sociales y económicas', NULL, True, '66'),
    ('263', 'text', 'La invasión de las tropas napoleónicas', NULL, False, '66'),
    ('264', 'text', 'La peste negra', NULL, False, '66'),
    ('267', 'text', 'Thomas Jefferson', NULL, False, '67'),
    ('268', 'text', 'George Washington', NULL, True, '67'),
    ('269', 'text', 'Abraham Lincoln', NULL, False, '67'),
    ('270', 'text', 'John F. Kennedy', NULL, False, '67'),
    ('271', 'text', '1989', NULL, True, '68'),
    ('272', 'text', '1961', NULL, False, '68'),
    ('273', 'text', '1945', NULL, False, '68'),
    ('274', 'text', '1918', NULL, False, '68'),
    ('275', 'text', 'Incas', NULL, False, '69'),
    ('276', 'text', 'Mayas', NULL, True, '69'),
    ('277', 'text', 'Aztecas', NULL, False, '69'),
    ('278', 'text', 'Olmecas', NULL, False, '69'),
    ('279', 'image', NULL, 'Trivias/historia/pregunta10/respuesta-AL.png', False, '70'),
    ('280', 'image', NULL, 'Trivias/historia/pregunta10/respuesta-dumbledore.png', False, '70'),
    ('281', 'image', NULL, 'Trivias/historia/pregunta10/respuestaCorrecta-GW.png', True, '70'),
    ('282', 'image', NULL, 'Trivias/historia/pregunta10/respuesta-JP.png', False, '70');


-- Música

INSERT INTO mainapp_trivia(triviaID, questionType, questionText, questionImage, questionAudio, category_id)
VALUES ('71', 'text', '¿Quién es considerado el "Rey del Rock and Roll"?', NULL, NULL, 'Música'),
    ('72', 'text', '¿Cuál es el instrumento principal de una banda de rock?', NULL, NULL, 'Música'),
    ('73', 'text', '¿A qué grupo pertenece Agust D? ', NULL, NULL, 'Música'),
    ('74', 'text', '¿Qué cantante es conocido por su voz operática y sus extravagantes vestuarios?', NULL, NULL, 'Música'),
    ('75', 'text', '¿En qué década surgió el movimiento punk?', NULL, NULL, 'Música'),
    ('76', 'text', '¿Cuál es el género musical que se caracteriza por sus ritmos rápidos, letras repetitivas y melodías pegadizas?', NULL, NULL, 'Música'),
    ('77', 'text', '¿Cuál de estos grupos de K-pop es conocido por sus coreografías sincronizadas y complejas?', NULL, NULL, 'Música'),
    ('78', 'text', '¿Quién es considerado el "Beatle más inteligente"?', NULL, NULL, 'Música'),
    ('79', 'text', '¿Cuál es el término que se utiliza para describir a los fanáticos más dedicados del K-pop?', NULL, NULL, 'Música'),
    ('80', 'audio', '¿Qué grupo canta la siguiente canción? ', NULL, 'Trivias/musica/pregunta10/pregunta.mp3', 'Música');

INSERT INTO mainapp_answer(answerID, answerType, answerText, answerImage, correctAnswer, trivia_id)
VALUES ('283', 'text', 'Mick Jagger', NULL, False, '71'),
    ('284', 'text', 'Elvis Presley', NULL, True, '71'),
    ('285', 'text', 'Freddie Mercury', NULL, False, '71'),
    ('286', 'text', 'John Lennon', NULL, False, '71'),
    ('287', 'text', 'Violín', NULL, False, '72'),
    ('288', 'text', 'Flauta', NULL, False, '72'),
    ('289', 'text', 'Guitarra eléctrica', NULL, True, '72'),
    ('290', 'text', 'Arpa', NULL, False, '72'),
    ('291', 'text', 'BTS', NULL, False, '73'),
    ('292', 'text', 'Blackpink', NULL, False, '73'),
    ('293', 'text', 'H.O.T', NULL, True, '73'),
    ('294', 'text', 'Twice', NULL, False, '73'),
    ('295', 'text', 'Freddie Mercury', NULL, True, '74'),
    ('296', 'text', 'David Bowie', NULL, False, '74'),
    ('297', 'text', 'Elton John', NULL, False, '74'),
    ('298', 'text', 'Jim Morrison', NULL, False, '74'),
    ('299', 'text', '1950', NULL, False, '75'),
    ('300', 'text', '1960', NULL, False, '75'),
    ('301', 'text', '1970', NULL, True, '75'),
    ('302', 'text', '1980', NULL, False, '75'),
    ('303', 'text', 'Jazz', NULL, False, '76'),
    ('304', 'text', 'Clásica', NULL, False, '76'),
    ('305', 'text', 'Pop', NULL, True, '76'),
    ('306', 'text', 'Blues', NULL, False, '76'),
    ('307', 'text', 'NCT', NULL, False, '77'),
    ('308', 'text', 'EXO', NULL, False, '77'),
    ('309', 'text', 'Seventeen', NULL, False, '77'),
    ('310', 'text', 'Todas las anteriores', NULL, True, '77'),
    ('311', 'text', 'John Lennon', NULL, True, '78'),
    ('312', 'text', 'Paul McCartney', NULL, False, '78'),
    ('313', 'text', 'George Harrison', NULL, False, '78'),
    ('314', 'text', 'Ringo Starr', NULL, False, '78'),
    ('315', 'text', 'Stans', NULL, True, '79'),
    ('316', 'text', 'Fans', NULL, False, '79'),
    ('317', 'text', 'Seguidores', NULL, False, '79'),
    ('318', 'text', 'Oyentes', NULL, False, '79'),
    ('319', 'text', 'BTS', NULL, True, '80'),
    ('320', 'text', 'Chino y Nacho', NULL, False, '80'),
    ('321', 'text', 'Stray Kids', NULL, False, '80'),
    ('322', 'text', 'Seventeen', NULL, False, '80');



-- PREMIOS

INSERT INTO mainapp_prize(prizeCode, prizeName, prizeType, appearFrecuency, quantity, rankingPosition)
VALUES ('PRIZE000', 'Puntaje', 'instant', 0.15, 200, NULL), 
    ('PRIZE001', 'Monitor', 'ranking', NULL, NULL, 1),
    ('PRIZE002', 'Teclado gamer', 'ranking', NULL, NULL, 2),
    ('PRIZE003', 'Mouse gamer', 'ranking', NULL, NULL, 3);


-- USER JUGADOR
-- (creado por interfaz Admin)
/*
INSERT INTO mainapp_user(id, password, email, nickname, country, estate, address, is_active, is_superuser, is_staff, date_joined, last_login)
VALUES ('3', 'alhaithamTarado', 'kaveh@mail.com', 'Kaveh', 'Sumeru', 'Ciudad de Sumeru', 'Calle Alhaja, casa 1', '1', '0', '0', '2024-08-09 23:45:00', '2024-08-10 00:02:29');
*/
-- inserciones hechas mediante Interfaz de Administrador y extraídas gracias a DB Browser for SQLite
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('3', 'alhaithamTarado', 'kaveh@mail.com', 'Kaveh', 'Sumeru', 'Ciudad de Sumeru', 'Calle Alhaja, casa 1', '1', '0', '0', '2024-08-10 14:52:28', '2024-08-11 15:45:49');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('4', 'roseAhorcame_porFabor', 'rafaelcontrerasagudelo@gmail.com', 'Rafax2002', 'Venezuela', 'Distrito Capital', 'El Valle', '1', '0', '0', '2024-08-11 14:46:34', '2024-08-11 15:45:56');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('5', 'TriviaBlaster10', 'triviablaster@gmail.com', 'TriviaBlaster10', 'Estados Unidos', 'Texas', 'Desierto', '1', '0', '0', '2024-08-11 15:01:36', '2024-08-11 15:46:09');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('6', 'tuDesgracia_miIngreso', 'huhutao@teyvat.com', 'HuTaoWalnut', 'Liyue', 'Ciudad de Liyue', 'Funeraria El Camino', '1', '0', '0', '2024-08-11 15:08:39', '2024-08-11 15:46:16');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('7', 'queenBee123', 'theQueen@yahoo.com', 'QuizQueen', 'Francia', 'París', 'rue Caulaincourt', '1', '0', '0', '2024-08-11 15:12:48', '2024-08-11 15:46:22');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('8', 'SoloSeQueNoSeNada', 'serOnoSer@hotmail.com', 'KnowItAll4Life', 'Dinamarca', 'Elsinor', 'Castillo Hamlet', '1', '0', '0', '2024-08-11 15:16:09', '2024-08-11 15:46:34');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('9', 'comemosTrivias', 'triviatriviatrivia@gmail.com', 'TriviaAddict', 'Desconocido', 'Riddletown', 'casa #', '1', '0', '0', '2024-08-11 15:23:54', '2024-08-11 15:46:42');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('10', 'SrZhongliMiPastor', 'callmyname@adeptus.com', 'XiaoYaksha', 'Liyue', 'Pantano Dihua', 'Posada Wangshu', '1', '0', '0', '2024-08-11 15:28:51', '2024-08-11 15:46:49');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('11', 'uhavebrain?', 'brainiac@mail.com', 'Brainiac101', 'Venezuela', 'Mérida', 'Mucubají', '1', '0', '0', '2024-08-11 15:39:54', '2024-08-11 15:46:58');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('12', '123', 'bandaArataki@wujuu.com', 'Itto', 'Inazuma', 'Ciudad de Inazuma', 'Las calles', '1', '0', '0', '2024-08-11 15:41:56', '2024-08-11 15:47:04');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('13', 'PuzzleProdigy__', 'prodigy@puzzle.com', 'PuzzleProdigy', 'Venezuela', 'Delta Amacuro', 'Calle X', '1', '0', '0', '2024-08-11 15:43:45', '2024-08-11 15:45:42');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('14', 'noTime', 'triviatime@mail.com', 'TriviaTime', 'Venezuela', 'Carabobo', 'Valencia', '1', '0', '0', '2024-08-11 15:44:39', '2024-08-11 15:45:35');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('15', 'guruguruguru', 'erGuruuuu@jajaja.com', 'TriviaGuru', 'Venezuela', 'Distrito Capital', 'La Victoria', '1', '0', '0', '2024-08-11 15:47:29', '2024-08-11 15:52:02');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('16', 'KnowBrainer321', 'KnowBrainer@hotmail.com', 'KnowBrainer', 'Venezuela', 'Miranda', 'Chacao', '1', '0', '0', '2024-08-11 15:51:12', '2024-08-11 15:51:56');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('17', 'TriviaChampLalala', 'theChampion.yeah@mail.com', 'TriviaChamp', 'Venezuela', 'Lara', 'Baquisimeto', '1', '0', '0', '2024-08-11 15:52:10', '2024-08-11 15:55:12');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('18', 'chefIncomprendida', 'InazumaEternity@archon.com', 'RaidenShogun', 'Inazuma', 'Ciudad de Inazuma', 'Tenshukaku', '1', '0', '0', '2024-08-11 15:55:17', '2024-08-11 16:00:40');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('19', 'fanDeTrivias1111', 'TriviaFanatic@gmail.com', 'TriviaFanatic', 'Venezuela', 'Monagas', 'Gas', '1', '0', '0', '2024-08-11 16:00:44', '2024-08-11 16:09:01');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('20', 'tsunami', 'BrainWave@gmail.com', 'BrainWave', 'Venezuela', 'Distrito Capital', 'Plaza Venezuela', '1', '0', '0', '2024-08-11 16:09:12', '2024-08-11 16:09:48');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('21', 'HunterXHunterJuasJuas', 'theBestHunter@mail.com', 'TriviaHunter', 'Venezuela', 'Distrito Capital', 'Fuerzas Armadas', '1', '0', '0', '2024-08-11 16:09:54', '2024-08-11 16:57:52');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('22', 'QuizQuest', 'QuizQuest@gmail.com', 'QuizQuest', 'Venezuela', 'Distrito Capital', 'Valles del Tuy', '1', '0', '0', '2024-08-11 16:57:57', '2024-08-11 16:58:31');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('23', 'KnowledgeSeeker', 'KnowledgeSeeker@yahoo.com', 'KnowledgeSeeker', 'Venezuela', 'Bolívar', 'La Llovizna', '1', '0', '0', '2024-08-11 16:58:34', '2024-08-11 16:59:11');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('24', 'Triviaholic', 'Triviaholic@gmail.com', 'Triviaholic', 'Venezuela', 'Miranda', 'Las Mercedes', '1', '0', '0', '2024-08-11 17:07:18', '2024-08-11 17:07:41');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('25', 'traverlerS_AW', 'Aether_Lumine@teyvat.com', 'AetherLumine', 'Teyvat', 'Teyvat', 'Relajatetera', '1', '0', '0', '2024-08-11 17:08:01', '2024-08-11 17:11:51');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('26', 'EheTeNandayo', 'erBardo@archon.com', 'VentiTraveler', 'Mondstadt', 'Ciudad de Mondstadt', 'Obsequio del Ángel', '1', '0', '0', '2024-08-11 17:12:11', '2024-08-11 17:16:55');
INSERT INTO "main"."" ("id", "password", "email", "nickname", "country", "estate", "address", "is_active", "is_superuser", "is_staff", "date_joined", "last_login") VALUES ('27', 'elSeñorDeLaNoooocheee', 'masterDiluc@gmail.com', 'QuizMaster', 'Mondstadt', 'Meseta de la Ventisca', 'Viñedo del Amanecer', '1', '0', '0', '2024-08-11 17:18:22', '2024-08-11 17:22:46');


-- RANKING
INSERT INTO mainapp_ranking(user_id, score, position, last_updated)
VALUES ('3', 9000, 1, '2024-08-10 00:02:29');

-- inserciones hechas mediante Interfaz de Administrador y extraídas gracias a DB Browser for SQLite
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('4', '8900', '2', '2024-08-11 15:20:33.340862');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('5', '6500', '3', '2024-08-11 15:22:01.707172');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('6', '6400', '4', '2024-08-11 15:22:23.123152');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('7', '6300', '5', '2024-08-11 15:22:52.648711');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('8', '6200', '6', '2024-08-11 15:23:43.564171');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('9', '6100', '7', '2024-08-11 17:31:57.252809');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('10', '6000', '8', '2024-08-11 17:32:24.162776');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('11', '5900', '9', '2024-08-11 17:33:16.211708');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('13', '5800', '10', '2024-08-11 17:33:37.587061');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('14', '5700', '11', '2024-08-11 17:34:09.628995');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('15', '5600', '12', '2024-08-11 17:34:36.441468');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('16', '5500', '13', '2024-08-11 17:34:56.411310');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('17', '5400', '14', '2024-08-11 17:37:11.862316');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('18', '5300', '15', '2024-08-11 17:37:40.570842');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('19', '5200', '16', '2024-08-11 17:38:10.817067');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('20', '5100', '17', '2024-08-11 17:38:42.724760');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('21', '5000', '18', '2024-08-11 17:39:07.693839');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('22', '4900', '19', '2024-08-11 17:39:35.711757');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('23', '4800', '20', '2024-08-11 17:40:02.329823');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('24', '4700', '21', '2024-08-11 17:40:32.938743');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('25', '4600', '22', '2024-08-11 17:41:12.201820');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('26', '4500', '23', '2024-08-11 17:41:36.681934');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('27', '4400', '24', '2024-08-11 17:41:57.819313');
INSERT INTO "main"."" ("user_id", "score", "position", "last_updated") VALUES ('12', '4000', '25', '2024-08-11 17:42:20.146174');


-- PREMIO GANADO
INSERT INTO mainapp_prizewon(user_id, prize_id, prizeState, won_at)
VALUES ('3', 'PRIZE001', 'Enviado', '2024-08-09 23:45:00');