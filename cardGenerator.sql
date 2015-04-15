CREATE DATABASE cardgenerator;

\c cardgenerator  

CREATE TABLE cards (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(100),
  class VARCHAR(50),
  planet VARCHAR(20),
  movement VARCHAR(20),
  artworkurl VARCHAR(500),
  descriptionrules VARCHAR(200),
  descriptionflavor VARCHAR(200),
  damage INTEGER,
  health INTEGER
);


INSERT INTO cards (
  name, 
  class, 
  planet, 
  movement, 
  artworkurl, 
  descriptionrules, 
  descriptionflavor, 
  damage, 
  health
  )
  VALUES (
  'Hoggolo',
  'Animal',
  'Calypso',
  'Slow',
  'http://www.entropedia.info/Image.aspx?Normal=1&id=31&Cache=1', 
  'Hoggolo attacks have a 25% chance to stun for 1 turn', 
  'This enormous bulk is the bulldozer of the Calypsoan fauna. All signs of living movements will drive it into frenzy and the craze will not stop till all is silent.', 
  45, 
  2500 
  );