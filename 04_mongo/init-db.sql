
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    surname VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    patronymic VARCHAR(100),
    age INTEGER,
    email VARCHAR(100) NOT NULL,
    hashed_password VARCHAR(200) NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);
CREATE INDEX IF NOT EXISTS idx_users_surname ON users(surname);
CREATE INDEX IF NOT EXISTS idx_users_name ON users(name);
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);

INSERT INTO users (username, surname, name, email, hashed_password) VALUES ('admin', 'Adminov', 'Admin', 'admin@example.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW') ON CONFLICT (username) DO NOTHING;


INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Robbins', 'Heath', 'Kirby', 29, 'kirbyheath@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Rena', 'Larsen', 'Lula', 30, 'lulalarsen@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Carrie', 'Burt', 'Fernandez', 31, 'fernandezburt@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Misty', 'Wells', 'Meyers', 27, 'meyerswells@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Kim', 'Hull', 'Schneider', 26, 'schneiderhull@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Lacey', 'Craft', 'Tracy', 35, 'tracycraft@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Summers', 'Irwin', 'Russo', 36, 'russoirwin@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Fry', 'Mckinney', 'Bray', 35, 'braymckinney@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Tran', 'Moss', 'Nunez', 24, 'nunezmoss@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Candace', 'Santiago', 'Langley', 21, 'langleysantiago@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Tanisha', 'Lindsey', 'Buckner', 27, 'bucknerlindsey@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Juarez', 'Gilliam', 'Marina', 32, 'marinagilliam@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Heidi', 'Ruiz', 'Crosby', 25, 'crosbyruiz@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Daniel', 'Wong', 'Willie', 31, 'williewong@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Lesa', 'Mercer', 'Medina', 29, 'medinamercer@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Diaz', 'Bean', 'Sophie', 35, 'sophiebean@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Carol', 'Gordon', 'May', 39, 'maygordon@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Petersen', 'Finch', 'Crane', 34, 'cranefinch@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Morgan', 'Cotton', 'Maria', 25, 'mariacotton@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Mercado', 'Norton', 'Emerson', 20, 'emersonnorton@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Henry', 'Dejesus', 'Gray', 26, 'graydejesus@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Coleman', 'Morrow', 'Leanne', 35, 'leannemorrow@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Watkins', 'Riley', 'Melody', 20, 'melodyriley@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Trudy', 'Stark', 'Wyatt', 22, 'wyattstark@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Helga', 'Banks', 'Marcella', 24, 'marcellabanks@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Casey', 'Mendoza', 'Ora', 30, 'oramendoza@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Atkinson', 'Knowles', 'Rhea', 37, 'rheaknowles@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Paige', 'Bullock', 'Blake', 31, 'blakebullock@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('David', 'Sweeney', 'Davidson', 37, 'davidsonsweeney@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Bryan', 'Perez', 'Simpson', 30, 'simpsonperez@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Kaitlin', 'Mccormick', 'Porter', 39, 'portermccormick@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Mclaughlin', 'Maldonado', 'Huffman', 36, 'huffmanmaldonado@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Orr', 'Burns', 'Wilcox', 22, 'wilcoxburns@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Alma', 'Flowers', 'Gwendolyn', 40, 'gwendolynflowers@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Gayle', 'Baxter', 'Powell', 31, 'powellbaxter@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Ayers', 'Flores', 'Ila', 27, 'ilaflores@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Merrill', 'Salazar', 'Ross', 26, 'rosssalazar@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Opal', 'Rollins', 'Beasley', 32, 'beasleyrollins@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Effie', 'Haynes', 'Gena', 30, 'genahaynes@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Jordan', 'Stokes', 'Dora', 36, 'dorastokes@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Kristine', 'Meyers', 'Potts', 26, 'pottsmeyers@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Florine', 'Nicholson', 'Katie', 26, 'katienicholson@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Faye', 'Ray', 'Joanne', 25, 'joanneray@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Linda', 'Hodge', 'Elaine', 39, 'elainehodge@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Booker', 'Chavez', 'Valerie', 25, 'valeriechavez@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Angelita', 'Duran', 'Solis', 30, 'solisduran@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Kristi', 'Kinney', 'Hendricks', 29, 'hendrickskinney@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Cathryn', 'Valdez', 'Jodie', 23, 'jodievaldez@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Mona', 'Peterson', 'Letitia', 22, 'letitiapeterson@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Lewis', 'Johnson', 'Acosta', 33, 'acostajohnson@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Bessie', 'Bush', 'Fox', 20, 'foxbush@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Kimberly', 'Richards', 'Grant', 37, 'grantrichards@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Charity', 'Collins', 'Lavonne', 38, 'lavonnecollins@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Shannon', 'Whitehead', 'Mcbride', 26, 'mcbridewhitehead@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Diann', 'Barnett', 'Schwartz', 34, 'schwartzbarnett@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Park', 'Clayton', 'Morrow', 37, 'morrowclayton@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Kathleen', 'Salas', 'Logan', 32, 'logansalas@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Hardin', 'Travis', 'Blankenship', 27, 'blankenshiptravis@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Glenna', 'Hogan', 'Bird', 36, 'birdhogan@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Yolanda', 'Benjamin', 'Reeves', 20, 'reevesbenjamin@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Robyn', 'Spence', 'Tricia', 26, 'triciaspence@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Love', 'Sanders', 'Gwen', 27, 'gwensanders@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('Watts', 'Craig', 'Abbott', 21, 'abbottcraig@amtas.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
