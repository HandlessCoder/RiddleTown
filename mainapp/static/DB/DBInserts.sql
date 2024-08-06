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
    triviaID INTEGER REFERENCES Trivia (triviaID) ON DELETE CASCADE
);
*/


INSERT INTO mainapp_category(name, color, icon)
VALUES ('Geografia', '#4D7EA9', 'Trivias/geografia/geografiaIcon.png'),
    ('Historia', '#BE5568', 'Trivias/historia/historiaIcon.png'),
    ('Ciencia', '#504673', 'Trivias/ciencia/cienciaIcon.png'),
    ('Entretenimiento', '#D76950', 'Trivias/entretenimiento/entretenimientoIcon.png'),
    ('Música', '#9388BA', 'Trivias/musica/musicaIcon.png'),
    ('Deporte', '#922C3F', 'Trivias/deporte/deporteIcon.png'),
    ('Arte', '#C0452A', 'Trivias/arte/arteIcon.png'),
    ('Cultura General', '#60AAEB', 'Trivias/culturaGeneral/culturaGeneralIcon.png');

