CREATE DATABASE cardgenerator;

\c cardgenerator  

CREATE TABLE cards (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(200),
  creatureclass VARCHAR(20),
  planet VARCHAR(20),
  movement VARCHAR(20),
  artworkurl VARCHAR(1000),
  descriptionrules VARCHAR(2000),
  descriptionflavor VARCHAR(2000),
  damage INTEGER,
  health INTEGER,
  user_id INTEGER
);

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  email VARCHAR(100),
  password_digest VARCHAR(400),
  username VARCHAR(100)
);


INSERT INTO cards (
  name, 
  creatureclass, 
  planet, 
  movement, 
  artworkurl, 
  descriptionrules, 
  descriptionflavor, 
  damage, 
  health
  )



  VALUES (
  'Bristlehog',
  'Animal',
  'Calypso',
  'Fast',
  'http://www.entropedia.info/Image.aspx?Normal=1&id=272&Cache=1', 
  'Bristlehog attacks cause it to squeak (aww!)', 
  'This might appear to be a small and harmless critter, but its ability to launch electrical charges over a distance make it more dangerous than it looks. Due to its insignificant status among biological researchers it has not yet been given a proper scientific name.', 
  5, 
  200);