-- QUESTION 1: SELECT all columns from the first 20 rows of stream table.
SELECT * FROM stream
LIMIT 20;

-- QUESTION 2: SELECT all columns from the first 20 rows of chat table.
SELECT * FROM chat 
LIMIT 20; 

-- QUESTION 3: There is something wrong with the chat table. Its 1st row is actually the column names. Delete the first row of the chat table.
delete from chat
where time = 'time';

-- QUESTION 4: What are the DISTINCT game in the stream table?
SELECT DISTINCT game FROM stream;

-- QUESTION 5: What are the DISTINCT channels in the stream table?
SELECT DISTINCT channel FROM stream;

-- QUESTION 6: What are the most popular games in stream? Create a list of games and their number of viewers. ORDER BY from most popular to least popular.
SELECT game, count(game) AS numberOfViewers 
FROM stream
GROUP BY game
ORDER BY numberOfViewers DESC;

-- QUESTION 7: There are some big numbers from the game League of Legends in stream. Where are these League of Legend players located? Hint: Create a list.
SELECT country, game FROM stream
WHERE game = 'League of Legends'
and country is NOT NULL;

-- QUESTION 8: The player column shows the source/device the viewer is using (site, iphone, android, etc). 
-- Create a list of players and their number of streamers.
SELECT channel AS player, 
count(player) AS streamers 
FROM stream
GROUP BY channel;

-- Using a CASE statement, create a new column named genre for each of the games in stream. Group the games into their genres: 
-- Multiplayer Online Battle Arena (MOBA), First Person Shooter (FPS), and Others. Your logic should be: 
-- If it is League of Leagues or Dota 2 or Heroes of the Storm → then it is MOBA. If it is Counter-Strike: Global Offensive → then it is FPS. 
-- Else, it is Others.
-- Hint: Use GROUP BY and ORDER BY to showcase only the unique game titles.

-- Should be League of Legends because there is no game called League of Leagues in MOBA
SELECT *,
CASE game
    WHEN 'League of Legends' then 'MOBA' 
    WHEN 'Dota 2'  then 'MOBA'
    WHEN 'Heroes of the Storm' then 'MOBA'
    WHEN 'Counter-Strike: Global Offensive' then 'FPS'
    ELSE 'Others'
END As genre
FROM STREAM
GROUP BY game
ORDER BY game;

-- The stream table and the chat table share a column: device_id. Do a JOIN of the two tables on that column.
SELECT * FROM stream s
JOIN chat c
ON s.device_id = c.device_id







