
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


INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user0', 'Alexander', 'Tia', 38, 'tiaalexander@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user1', 'Callahan', 'Beverly', 40, 'beverlycallahan@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user2', 'Santana', 'Lidia', 37, 'lidiasantana@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user3', 'Bartlett', 'Mccall', 30, 'mccallbartlett@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user4', 'Dudley', 'Gilbert', 24, 'gilbertdudley@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user5', 'Mills', 'Tonia', 22, 'toniamills@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user6', 'Marks', 'Glenda', 30, 'glendamarks@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user7', 'Soto', 'Alisha', 36, 'alishasoto@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user8', 'Gonzales', 'Moreno', 22, 'morenogonzales@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user9', 'Carter', 'Montgomery', 27, 'montgomerycarter@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user10', 'Reid', 'Tasha', 22, 'tashareid@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user11', 'Brewer', 'Kent', 26, 'kentbrewer@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user12', 'Hardin', 'Pickett', 34, 'picketthardin@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user13', 'Sawyer', 'Wendi', 37, 'wendisawyer@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user14', 'Bishop', 'Harrington', 34, 'harringtonbishop@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user15', 'Whitley', 'Meghan', 35, 'meghanwhitley@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user16', 'Perez', 'Martha', 22, 'marthaperez@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user17', 'Kelly', 'Casey', 33, 'caseykelly@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user18', 'Rodgers', 'Hooper', 34, 'hooperrodgers@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user19', 'Fowler', 'Autumn', 30, 'autumnfowler@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user20', 'Landry', 'Laverne', 30, 'lavernelandry@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user21', 'Thomas', 'Vivian', 31, 'vivianthomas@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user22', 'Hays', 'Kelley', 32, 'kelleyhays@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user23', 'Reeves', 'Sandoval', 36, 'sandovalreeves@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user24', 'Camacho', 'Lloyd', 36, 'lloydcamacho@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user25', 'Cote', 'Floyd', 26, 'floydcote@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user26', 'Weaver', 'Hodges', 38, 'hodgesweaver@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user27', 'Zamora', 'Sheree', 34, 'shereezamora@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user28', 'Garrett', 'Alvarez', 39, 'alvarezgarrett@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user29', 'Hahn', 'Davidson', 40, 'davidsonhahn@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user30', 'Bowman', 'Gilliam', 40, 'gilliambowman@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user31', 'Bush', 'Campos', 40, 'camposbush@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user32', 'Jacobs', 'Roach', 22, 'roachjacobs@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user33', 'Salazar', 'Stone', 40, 'stonesalazar@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user34', 'Jordan', 'Zamora', 38, 'zamorajordan@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user35', 'Foley', 'Banks', 23, 'banksfoley@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user36', 'Mclaughlin', 'Reid', 31, 'reidmclaughlin@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user37', 'Hickman', 'Ila', 23, 'ilahickman@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user38', 'Burke', 'Madge', 30, 'madgeburke@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user39', 'Hurst', 'Valerie', 32, 'valeriehurst@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user40', 'Barnett', 'Kari', 29, 'karibarnett@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user41', 'Knapp', 'Darcy', 32, 'darcyknapp@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user42', 'Witt', 'Bonita', 33, 'bonitawitt@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user43', 'Benson', 'Hallie', 28, 'halliebenson@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user44', 'Mccarty', 'Molina', 31, 'molinamccarty@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user45', 'Moss', 'Whitley', 30, 'whitleymoss@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user46', 'Buck', 'Traci', 30, 'tracibuck@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user47', 'Rollins', 'Faulkner', 23, 'faulknerrollins@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user48', 'Villarreal', 'Rasmussen', 27, 'rasmussenvillarreal@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user49', 'Fulton', 'Strong', 25, 'strongfulton@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user50', 'Aguilar', 'Juana', 29, 'juanaaguilar@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user51', 'Oneal', 'Alford', 23, 'alfordoneal@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user52', 'Mckay', 'Shawna', 29, 'shawnamckay@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user53', 'Hayes', 'Jocelyn', 29, 'jocelynhayes@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user54', 'Duncan', 'Marietta', 27, 'mariettaduncan@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user55', 'Robbins', 'Salinas', 36, 'salinasrobbins@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user56', 'Mccarthy', 'Robbins', 22, 'robbinsmccarthy@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user57', 'Wooten', 'Lilly', 37, 'lillywooten@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user58', 'Berry', 'Cornelia', 29, 'corneliaberry@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user59', 'Walter', 'Moss', 32, 'mosswalter@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user60', 'Manning', 'Lynda', 39, 'lyndamanning@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user61', 'Eaton', 'Huff', 38, 'huffeaton@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user62', 'Delaney', 'Mallory', 33, 'mallorydelaney@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user63', 'Joseph', 'Valdez', 23, 'valdezjoseph@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user64', 'Ochoa', 'Pearl', 20, 'pearlochoa@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user65', 'Horton', 'Pamela', 40, 'pamelahorton@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user66', 'Mcpherson', 'Bridget', 35, 'bridgetmcpherson@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user67', 'Sandoval', 'Chandra', 27, 'chandrasandoval@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user68', 'Koch', 'Everett', 30, 'everettkoch@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user69', 'Mcgowan', 'Viola', 38, 'violamcgowan@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user70', 'House', 'Dickson', 32, 'dicksonhouse@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user71', 'Robertson', 'Hughes', 34, 'hughesrobertson@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user72', 'Davidson', 'Mcpherson', 36, 'mcphersondavidson@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user73', 'Guy', 'Lorena', 26, 'lorenaguy@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user74', 'Castillo', 'Johnston', 38, 'johnstoncastillo@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user75', 'Henson', 'Audrey', 29, 'audreyhenson@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user76', 'Powell', 'Barron', 28, 'barronpowell@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user77', 'Vinson', 'Simon', 31, 'simonvinson@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user78', 'Mcfarland', 'Lynn', 20, 'lynnmcfarland@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user79', 'Massey', 'Crosby', 31, 'crosbymassey@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user80', 'Chang', 'Savage', 35, 'savagechang@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user81', 'Mcintyre', 'Madelyn', 22, 'madelynmcintyre@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user82', 'Estes', 'Langley', 30, 'langleyestes@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user83', 'Keith', 'Marcia', 36, 'marciakeith@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user84', 'Mcknight', 'Walker', 24, 'walkermcknight@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user85', 'White', 'Gonzalez', 34, 'gonzalezwhite@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user86', 'Medina', 'Kathy', 40, 'kathymedina@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user87', 'Sweeney', 'Thelma', 33, 'thelmasweeney@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user88', 'Santos', 'Debora', 22, 'deborasantos@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user89', 'Freeman', 'White', 27, 'whitefreeman@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user90', 'Barr', 'Kathie', 32, 'kathiebarr@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user91', 'Best', 'Faith', 25, 'faithbest@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user92', 'Dodson', 'Richard', 35, 'richarddodson@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user93', 'Townsend', 'Hall', 26, 'halltownsend@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user94', 'Cain', 'Doreen', 28, 'doreencain@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user95', 'Hawkins', 'Garrison', 26, 'garrisonhawkins@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user96', 'Nichols', 'Kristie', 36, 'kristienichols@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user97', 'Blankenship', 'Holly', 35, 'hollyblankenship@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user98', 'Russell', 'Brewer', 35, 'brewerrussell@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
INSERT INTO users (username, surname, name, age, email, hashed_password) VALUES ('user99', 'Morris', 'Burks', 20, 'burksmorris@blanet.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW');
