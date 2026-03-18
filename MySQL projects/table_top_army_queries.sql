SELECT army_name AS "Army", faction_name AS "Faction", CONCAT(f_name, " ", l_name) AS "Players", army_id AS "ID"
FROM players pr
	JOIN army a ON pr.player_id = a.player_id
    JOIN faction f ON a.faction_id = f.faction_id;
    
SELECT *
FROM faction;

SELECT *
FROM players;

SELECT *
FROM settings;

SELECT *
FROM army


 
